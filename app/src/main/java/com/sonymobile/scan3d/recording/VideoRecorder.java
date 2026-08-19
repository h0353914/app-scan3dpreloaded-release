package com.sonymobile.scan3d.recording;

import android.media.MediaCodecInfo;
import android.media.MediaFormat;
import android.media.MediaMuxer;
import android.util.Log;
import android.view.Surface;

import java.io.File;
import java.io.IOException;

public class VideoRecorder {
    private static final int AUDIO_BIT_RATE = 128000;
    private static final String AUDIO_MIME_TYPE = "audio/mp4a-latm";
    private static final int FRAME_RATE = 30;
    private static final int IFRAME_INTERVAL = 1;
    private static final String MIME_TYPE = "video/avc";
    private static final int SAMPLE_RATE = 44100;
    private static final String TAG = "com.sonymobile.scan3d.recording.VideoRecorder";
    private static final int VIDEO_BIT_RATE = 4000000;

    private final Muxer mMuxer;
    private final Muxer.VideoEncoder mVideoEncoder;

    public VideoRecorder(int width, int height, File outputFile, boolean recordAudio) throws IOException {
        mMuxer = new Muxer(outputFile.getPath(), MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4);

        MediaFormat videoFormat = MediaFormat.createVideoFormat(MIME_TYPE, width, height);
        videoFormat.setInteger("color-format", MediaCodecInfo.CodecCapabilities.COLOR_FormatSurface);
        videoFormat.setInteger("bitrate", VIDEO_BIT_RATE);
        videoFormat.setInteger("frame-rate", FRAME_RATE);
        videoFormat.setInteger("i-frame-interval", IFRAME_INTERVAL);
        mVideoEncoder = mMuxer.addVideoEncoder(videoFormat);

        if (recordAudio) {
            MediaFormat audioFormat = MediaFormat.createAudioFormat(AUDIO_MIME_TYPE, SAMPLE_RATE, 1);
            audioFormat.setInteger("aac-profile", MediaCodecInfo.CodecProfileLevel.AACObjectLC);
            audioFormat.setInteger("bitrate", AUDIO_BIT_RATE);
            audioFormat.setInteger("max-input-size", 0x4000);
            mMuxer.addAudioEncoder(audioFormat, new MicAudioSource(mVideoEncoder));
        }

        mMuxer.init();
    }

    public Surface getOutputSurface() {
        return mVideoEncoder.getInputSurface();
    }

    public void onFrameAvailable(boolean endOfStream) {
        try {
            mMuxer.drain(endOfStream);
        } catch (IOException e) {
            Log.e(TAG, "Failed to drain encoders", e);
        }
    }

    public void release() {
        try {
            mMuxer.done();
        } catch (IllegalStateException e) {
            Log.e(TAG, "Muxer did not receive any frames", e);
        }
    }
}
