package com.sonymobile.scan3d.recording;

import android.media.AudioFormat;
import android.media.AudioRecord;
import android.media.MediaRecorder;

import java.nio.ByteBuffer;
import java.util.concurrent.atomic.AtomicLong;

public class MicAudioSource implements AudioSource {
    private static final int AUDIO_FORMAT = AudioFormat.ENCODING_PCM_16BIT;
    private static final int CHANNEL_CONFIG = AudioFormat.CHANNEL_IN_MONO;
    private static final int FRAME_SIZE = 2;
    private static final int POLLING_RATE = 1;
    private static final int SAMPLE_RATE = 44100;

    private final int mBufferSize;
    private long mFirstPts;
    private final AudioRecord mRecorder;
    private final Muxer.VideoEncoder mVideoEncoder;

    public MicAudioSource(Muxer.VideoEncoder videoEncoder) {
        mVideoEncoder = videoEncoder;
        int minBufferSize = AudioRecord.getMinBufferSize(SAMPLE_RATE, CHANNEL_CONFIG, AUDIO_FORMAT);
        mBufferSize = Math.max(minBufferSize, 0x15888);
        mRecorder = new AudioRecord(MediaRecorder.AudioSource.VOICE_COMMUNICATION, SAMPLE_RATE, CHANNEL_CONFIG, AUDIO_FORMAT, mBufferSize);
    }

    @Override
    public void done() {
        mRecorder.stop();
    }

    @Override
    public void init() {
        mFirstPts = System.nanoTime() / 1000;
        mRecorder.startRecording();
    }

    @Override
    public int write(ByteBuffer buffer, AtomicLong presentationTimeUs) {
        if (mVideoEncoder.getFirstPts() == -1) {
            return 0;
        }
        long pts = System.nanoTime() / 1000 - mFirstPts;
        int result = mRecorder.read(buffer, mBufferSize);
        pts += mVideoEncoder.getFirstPts();
        presentationTimeUs.set(pts);
        return result;
    }
}
