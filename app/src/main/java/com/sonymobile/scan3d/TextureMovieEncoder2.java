package com.sonymobile.scan3d;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.recording.VideoRecorder;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class TextureMovieEncoder2 implements Runnable {
    private static final int MSG_FRAME_AVAILABLE = 2;
    private static final int MSG_STOP_RECORDING = 1;
    private static final String TAG = "com.sonymobile.scan3d.TextureMovieEncoder2";
    private static final boolean VERBOSE = false;
    private EncoderListener mEncoderListener;
    private volatile EncoderHandler mHandler;
    private boolean mReady;
    private final Object mReadyFence = new Object();
    private boolean mRunning;
    private VideoRecorder mVideoRecorder;

    public interface EncoderListener {
        void onEncoderFinished();
    }

    public TextureMovieEncoder2(VideoRecorder videoRecorder, EncoderListener encoderListener) {
        this.mVideoRecorder = videoRecorder;
        this.mEncoderListener = encoderListener;
    }

    public void startEncoder() {
        synchronized (this.mReadyFence) {
            if (this.mRunning) {
                return;
            }
            this.mRunning = true;
            new Thread(this, "TextureMovieEncoder").start();
            while (!this.mReady) {
                try {
                    this.mReadyFence.wait();
                } catch (InterruptedException unused) {
                }
            }
        }
    }

    public void stopRecording() {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(1));
    }

    public boolean isRecording() {
        boolean z;
        synchronized (this.mReadyFence) {
            z = this.mRunning;
        }
        return z;
    }

    public void frameAvailableSoon() {
        synchronized (this.mReadyFence) {
            if (this.mReady) {
                this.mHandler.sendMessage(this.mHandler.obtainMessage(2));
            }
        }
    }

    @Override // java.lang.Runnable
    public void run() {
        Looper.prepare();
        synchronized (this.mReadyFence) {
            this.mHandler = new EncoderHandler(this, this.mEncoderListener);
            this.mReady = true;
            this.mReadyFence.notify();
        }
        Looper.loop();
        synchronized (this.mReadyFence) {
            this.mReady = false;
            this.mRunning = false;
            this.mHandler = null;
        }
    }

    private static class EncoderHandler extends Handler {
        private WeakReference<EncoderListener> mEncoderListener;
        private WeakReference<TextureMovieEncoder2> mWeakEncoder;

        public EncoderHandler(TextureMovieEncoder2 textureMovieEncoder2, EncoderListener encoderListener) {
            this.mWeakEncoder = new WeakReference<>(textureMovieEncoder2);
            this.mEncoderListener = new WeakReference<>(encoderListener);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            int i = message.what;
            Object obj = message.obj;
            TextureMovieEncoder2 textureMovieEncoder2 = this.mWeakEncoder.get();
            if (textureMovieEncoder2 == null) {
                DebugLog.w(TextureMovieEncoder2.TAG, "EncoderHandler.handleMessage: encoder is null");
                return;
            }
            switch (i) {
                case 1:
                    textureMovieEncoder2.handleStopRecording();
                    Looper.myLooper().quit();
                    final EncoderListener encoderListener = this.mEncoderListener.get();
                    if (encoderListener != null) {
                        new Handler(Looper.getMainLooper()).post(() -> encoderListener.onEncoderFinished());
                        return;
                    }
                    return;
                case 2:
                    textureMovieEncoder2.handleFrameAvailable();
                    return;
                default:
                    throw new RuntimeException("Unhandled msg what=" + i);
            }
        }
    }

    private void handleFrameAvailable() {
        this.mVideoRecorder.onFrameAvailable(false);
    }

    private void handleStopRecording() {
        DebugLog.d(TAG, "handleStopRecording");
        this.mVideoRecorder.onFrameAvailable(true);
        this.mVideoRecorder.release();
    }
}
