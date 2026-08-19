package com.sonymobile.scan3d.recording;

import android.media.MediaCodec;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.util.Log;
import android.view.Surface;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicLong;

class Muxer {
    private static final int TIMEOUT_US = 10000;

    private ArrayList<Encoder> mEncoders;
    private final MediaMuxer mMuxer;
    private boolean mStarted;
    private int mTacksCount;

    public Muxer(String path, int format) throws IOException {
        mEncoders = new ArrayList<>();
        mMuxer = new MediaMuxer(path, format);
    }

    public AudioEncoder addAudioEncoder(MediaFormat format, AudioSource source) throws IOException {
        AudioEncoder encoder = new AudioEncoder(format, source);
        mEncoders.add(encoder);
        return encoder;
    }

    public VideoEncoder addVideoEncoder(MediaFormat format) throws IOException {
        VideoEncoder encoder = new VideoEncoder(format);
        mEncoders.add(encoder);
        return encoder;
    }

    public void done() {
        for (Encoder encoder : mEncoders) {
            encoder.done();
        }
        mMuxer.stop();
        mMuxer.release();
    }

    public void drain(boolean endOfStream) throws IOException {
        for (Encoder encoder : mEncoders) {
            encoder.drain(endOfStream);
        }
    }

    public void init() {
        for (Encoder encoder : mEncoders) {
            encoder.init();
        }
    }

    private abstract class Encoder {
        private final MediaCodec.BufferInfo mBufferInfo;
        protected final MediaCodec mEncoder;
        private long mInitialPts;
        private long mLastTime;
        private int mTrack;

        protected Encoder(MediaFormat format) throws IOException {
            mBufferInfo = new MediaCodec.BufferInfo();
            mTrack = -1;
            mInitialPts = -1;
            mLastTime = 0;
            mEncoder = MediaCodec.createEncoderByType(format.getString("mime"));
            mEncoder.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE);
        }

        protected abstract void done();

        public void drain(boolean endOfStream) throws IOException {
            if (endOfStream) {
                mEncoder.signalEndOfInputStream();
            }
            while (true) {
                int status = mEncoder.dequeueOutputBuffer(mBufferInfo, TIMEOUT_US);
                if (status == MediaCodec.INFO_TRY_AGAIN_LATER) {
                    if (!endOfStream) {
                        return;
                    }
                    continue;
                } else if (status == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    if (mTrack == -1) {
                        MediaFormat newFormat = mEncoder.getOutputFormat();
                        mTrack = mMuxer.addTrack(newFormat);
                        mTacksCount++;
                        if (mTacksCount == mEncoders.size()) {
                            mMuxer.start();
                            mStarted = true;
                        }
                    }
                    continue;
                }
                if (status <= 0) {
                    continue;
                }
                ByteBuffer outputBuffer = mEncoder.getOutputBuffer(status);
                boolean isData = (mBufferInfo.flags & MediaCodec.BUFFER_FLAG_CODEC_CONFIG) == 0;
                if (isData && mStarted && outputBuffer != null && mBufferInfo.size > 0) {
                    outputBuffer.position(mBufferInfo.offset);
                    outputBuffer.limit(mBufferInfo.offset + mBufferInfo.size);
                    if (mInitialPts == -1) {
                        mInitialPts = mBufferInfo.presentationTimeUs;
                    }
                    if (mBufferInfo.presentationTimeUs > mLastTime) {
                        mMuxer.writeSampleData(mTrack, outputBuffer, mBufferInfo);
                        mLastTime = mBufferInfo.presentationTimeUs;
                    } else {
                        Log.d("Muxer", "Out of order frame. Prev=" + mLastTime + " This=" + mBufferInfo.presentationTimeUs);
                    }
                }
                mEncoder.releaseOutputBuffer(status, false);
                if ((mBufferInfo.flags & MediaCodec.BUFFER_FLAG_END_OF_STREAM) != 0) {
                    return;
                }
            }
        }

        public long getFirstPts() {
            return mInitialPts;
        }

        protected abstract void init();
    }

    public final class AudioEncoder extends Encoder {
        private final AtomicLong mPts;
        private volatile boolean mRecording;
        private final AudioSource mSource;

        private AudioEncoder(MediaFormat format, AudioSource source) throws IOException {
            super(format);
            mPts = new AtomicLong();
            mSource = source;
        }

        private void recordLoop() {
            try {
                mSource.init();
                while (mRecording) {
                    int index = mEncoder.dequeueInputBuffer(-1);
                    ByteBuffer buffer = mEncoder.getInputBuffer(index);
                    int size = mSource.write(buffer, mPts);
                    mEncoder.queueInputBuffer(index, 0, size, mPts.get(), 0);
                }
            } finally {
                mSource.done();
                mEncoder.stop();
                mEncoder.release();
            }
        }

        @Override
        protected void done() {
            mRecording = false;
        }

        @Override
        public void drain(boolean endOfStream) throws IOException {
            if (endOfStream) {
                mRecording = false;
            }
            super.drain(false);
        }

        @Override
        protected void init() {
            mEncoder.start();
            mRecording = true;
            new Thread(this::recordLoop).start();
        }
    }

    public final class VideoEncoder extends Encoder {
        private final Surface mSurface;

        private VideoEncoder(MediaFormat format) throws IOException {
            super(format);
            mSurface = mEncoder.createInputSurface();
        }

        @Override
        protected void done() {
            mEncoder.stop();
            mEncoder.release();
        }

        public Surface getInputSurface() {
            return mSurface;
        }

        @Override
        protected void init() {
            mEncoder.start();
        }
    }
}
