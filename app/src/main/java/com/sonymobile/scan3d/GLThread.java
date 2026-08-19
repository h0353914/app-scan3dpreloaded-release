package com.sonymobile.scan3d;

import android.graphics.Rect;
import android.graphics.SurfaceTexture;
import android.opengl.GLES20;
import android.opengl.GLES30;
import android.view.Choreographer;
import android.view.Surface;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.recording.VideoRecorder;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class GLThread extends Thread implements Choreographer.FrameCallback {
    private static final int FRAME_SKIP = 1;
    private static final int FULL_HD_HEIGHT = 1080;
    private static final int FULL_HD_WIDTH = 1920;
    private static final boolean LOG_PAUSE_RESUME = true;
    private static final boolean LOG_RENDERER = true;
    private static final boolean LOG_RENDERER_DRAW_FRAME = true;
    private static final boolean LOG_SURFACE = true;
    private static final boolean LOG_THREADS = true;
    private static final String TAG = "com.sonymobile.scan3d.GLThread";
    private boolean mChoreographerRunning;
    private int mDstHeight;
    private int mDstWidth;
    private boolean mExited;
    private long mFrameTimeNanos;
    private long mHandle;
    private long mInputHandle;
    private final Object mLock;
    private boolean mPaused;
    private boolean mRecordingOngoing;
    private long mRefreshPeriodNanos;
    private Renderer mRenderer;
    private boolean mRequestPaused;
    private boolean mShouldExit;
    private Rect mSrcRect;
    private Surface mSurface;
    private TextureMovieEncoder2 mVideoEncoder;
    private long mVirtualTimeNanos;
    private boolean mWaitingForSurface = true;
    private ArrayList<Runnable> mEventQueue = new ArrayList<>();
    private boolean mSizeChanged = true;
    private boolean mVSync = true;
    private long mFrameCounter = 0;
    private final Object mRecordingLock = new Object();
    private int mWidth = 0;
    private int mHeight = 0;
    private boolean mRequestRender = true;
    private boolean mWantRenderNotification = false;
    private Choreographer mChoreographer = Choreographer.getInstance();

    public interface Renderer {
        boolean onDrawFrame(float f);

        void onSurfaceChanged(int i, int i2);

        void onSurfaceCreated();

        void onSurfaceDestroyed();

        default boolean onDrawFrame() {
            return onDrawFrame(-1.0f);
        }
    }

    public GLThread(Object obj, Renderer renderer) {
        this.mLock = obj;
        this.mRenderer = renderer;
    }

    @Override // android.view.Choreographer.FrameCallback
    public void doFrame(long j) {
        synchronized (this.mLock) {
            if (this.mFrameCounter <= 0) {
                this.mVSync = true;
                this.mFrameCounter = 1L;
            } else {
                this.mFrameCounter--;
            }
            this.mFrameTimeNanos = j;
            this.mChoreographerRunning = false;
            if (!this.mPaused && this.mSurface != null && this.mWidth > 0 && this.mHeight > 0 && this.mRequestRender) {
                this.mChoreographer.postFrameCallback(this);
                this.mChoreographerRunning = true;
                this.mLock.notifyAll();
            }
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public void run() {
        setName("GLThread " + getId());
        DebugLog.d(TAG, "starting tid=" + getId());
        try {
            guardedRun();
        } catch (InterruptedException unused) {
        }
        synchronized (this.mLock) {
            DebugLog.d(TAG, "finished tid=" + getId() + " queued_events=" + this.mEventQueue.size());
        }
    }

    private void guardedRun() throws InterruptedException {
        boolean z;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        boolean z5 = false;
        boolean z6 = false;
        int i = 0;
        int i2 = 0;
        Runnable runnableRemove = null;
        while (true) {
            try {
                boolean z7 = z3;
                boolean z8 = z6;
                boolean shouldExit = false;
                synchronized (this.mLock) {
                    while (true) {
                        if (!this.mShouldExit) {
                            if (!this.mEventQueue.isEmpty()) {
                                runnableRemove = this.mEventQueue.remove(z2 ? 1 : 0);
                                z3 = z7;
                                z4 = z4;
                                z6 = z8;
                                break;
                            }
                            if (this.mPaused != this.mRequestPaused) {
                                this.mPaused = this.mRequestPaused;
                                this.mLock.notifyAll();
                                DebugLog.d(TAG, "mPaused is now " + this.mPaused + " tid=" + getId());
                            }
                            if (this.mSurface == null && !this.mWaitingForSurface) {
                                DebugLog.d(TAG, "noticed surface lost tid=" + getId());
                                this.mWaitingForSurface = true;
                                this.mLock.notifyAll();
                            }
                            boolean z9 = z7;
                            if (this.mSurface != null && this.mWaitingForSurface) {
                                DebugLog.d(TAG, "noticed surface acquired tid=" + getId());
                                this.mWaitingForSurface = z2;
                                destroyContext();
                                this.mHandle = NativeEGL.createContext(this.mSurface, true);
                                if (this.mHandle != 0) {
                                    z9 = z7;
                                    z = true;
                                } else {
                                    z9 = z7;
                                    z = z2;
                                }
                                this.mLock.notifyAll();
                                z9 = z;
                            }
                            if (z8) {
                                DebugLog.d(TAG, "sending render notification tid=" + getId());
                                this.mWantRenderNotification = z2;
                                this.mLock.notifyAll();
                                z8 = z2;
                            }
                            if (readyToDraw() && this.mHandle != 0) {
                                boolean z10 = z4;
                                if (this.mSizeChanged) {
                                    i = this.mWidth;
                                    i2 = this.mHeight;
                                    this.mWantRenderNotification = true;
                                    DebugLog.d(TAG, "noticing that we want render notification tid=" + getId());
                                    this.mSizeChanged = z2;
                                    z10 = true;
                                }
                                this.mRequestRender = z2;
                                this.mLock.notifyAll();
                                if (this.mWantRenderNotification) {
                                    z5 = true;
                                }
                                this.mVSync = z2;
                                z3 = z9;
                                z4 = z10;
                                z6 = z8;
                                break;
                            }
                            DebugLog.d(TAG, "waiting tid=" + getId() + " mHandle: " + this.mHandle + " mPaused: " + this.mPaused + " mSurface: " + this.mSurface + " mWaitingForSurface: " + this.mWaitingForSurface + " mWidth: " + this.mWidth + " mHeight: " + this.mHeight + " mRequestRender: " + this.mRequestRender);
                            this.mLock.wait();
                            z2 = false;
                            z7 = z9;
                            z8 = z8;
                        } else {
                            shouldExit = true;
                            break;
                        }
                    }
                }
                if (shouldExit) {
                    synchronized (this.mLock) {
                        destroyContext();
                        this.mExited = true;
                        this.mLock.notifyAll();
                    }
                    return;
                }
                if (runnableRemove != null) {
                    runnableRemove.run();
                    runnableRemove = null;
                } else {
                    if (z3) {
                        DebugLog.w(TAG, "onSurfaceCreated()");
                        this.mRenderer.onSurfaceCreated();
                        z3 = z2;
                    }
                    if (z4) {
                        DebugLog.w(TAG, "onSurfaceChanged(" + i + ", " + i2 + ")");
                        this.mRenderer.onSurfaceChanged(i, i2);
                        z4 = z2;
                    }
                    if (this.mHandle != 0) {
                        DebugLog.w(TAG, "onDrawFrameDelta tid=" + getId() + " timeNanos=" + this.mVirtualTimeNanos);
                        if (this.mRefreshPeriodNanos < 0) {
                            if (this.mRenderer.onDrawFrame(this.mVirtualTimeNanos * 1.0E-9f)) {
                                requestRender();
                            }
                        } else if (this.mRenderer.onDrawFrame()) {
                            requestRender();
                        }
                        synchronized (this.mRecordingLock) {
                            if (this.mRecordingOngoing) {
                                this.mVideoEncoder.frameAvailableSoon();
                                NativeEGL.makeCurrent(this.mInputHandle, this.mHandle);
                                GLES20.glClearColor(0.0f, 0.0f, 0.0f, 1.0f);
                                GLES20.glClear(16384);
                                checkGlError();
                                GLES30.glBlitFramebuffer(this.mSrcRect.left, this.mSrcRect.top, this.mSrcRect.right, this.mSrcRect.bottom, 0, 0, this.mDstWidth, this.mDstHeight, 16384, 9728);
                                int iGlGetError = GLES30.glGetError();
                                if (iGlGetError != 0) {
                                    DebugLog.d(TAG, "ERROR: glBlitFramebuffer failed: 0x" + Integer.toHexString(iGlGetError));
                                }
                                if (this.mRefreshPeriodNanos < 0) {
                                    NativeEGL.setPresentationTime(this.mInputHandle, this.mVirtualTimeNanos);
                                    this.mVirtualTimeNanos += -this.mRefreshPeriodNanos;
                                } else {
                                    NativeEGL.setPresentationTime(this.mInputHandle, this.mFrameTimeNanos);
                                }
                                NativeEGL.swap(this.mInputHandle);
                                NativeEGL.makeCurrent(this.mHandle);
                            }
                        }
                        NativeEGL.swap(this.mHandle);
                    }
                    if (z5) {
                        z6 = true;
                        z2 = false;
                        z5 = false;
                    } else {
                        z2 = false;
                    }
                }
            } catch (Throwable th) {
                synchronized (this.mLock) {
                    destroyContext();
                    this.mExited = true;
                    this.mLock.notifyAll();
                    throw th;
                }
            }
        }
    }

    private void destroyContext() {
        if (this.mHandle != 0) {
            this.mRenderer.onSurfaceDestroyed();
            NativeEGL.destroyContext(this.mHandle);
            this.mHandle = 0L;
            this.mInputHandle = 0L;
        }
    }

    private boolean readyToDraw() {
        return !this.mPaused && this.mSurface != null && this.mWidth > 0 && this.mHeight > 0 && this.mRequestRender && this.mVSync;
    }

    public void requestRender() {
        synchronized (this.mLock) {
            this.mRequestRender = true;
            if (!this.mChoreographerRunning) {
                this.mChoreographer.postFrameCallback(this);
            }
            this.mLock.notifyAll();
        }
    }

    public void surfaceCreated(SurfaceTexture surfaceTexture, int i, int i2) {
        synchronized (this.mLock) {
            this.mWidth = i;
            this.mHeight = i2;
            this.mSizeChanged = true;
            DebugLog.d(TAG, "surfaceCreated tid=" + getId());
            this.mSurface = new Surface(surfaceTexture);
            this.mLock.notifyAll();
        }
    }

    public void surfaceCreated(Surface surface) {
        synchronized (this.mLock) {
            DebugLog.d(TAG, "surfaceCreated tid=" + getId());
            this.mSurface = surface;
            this.mLock.notifyAll();
        }
    }

    public void surfaceDestroyed() {
        synchronized (this.mLock) {
            DebugLog.d(TAG, "surfaceDestroyed tid=" + getId());
            this.mSurface = null;
            this.mLock.notifyAll();
        }
    }

    public void onPause() {
        synchronized (this.mLock) {
            DebugLog.d(TAG, "onPause tid=" + getId());
            this.mRequestPaused = true;
            this.mLock.notifyAll();
        }
    }

    public void onResume() {
        synchronized (this.mLock) {
            DebugLog.d(TAG, "onResume tid=" + getId());
            this.mRequestPaused = false;
            requestRender();
        }
    }

    public void onWindowResize(int i, int i2) {
        synchronized (this.mLock) {
            this.mWidth = i;
            this.mHeight = i2;
            this.mSizeChanged = true;
            this.mRequestRender = true;
            this.mVSync = true;
            if (Thread.currentThread() == this) {
                return;
            }
            this.mLock.notifyAll();
        }
    }

    public void requestExitAndWait() {
        synchronized (this.mLock) {
            DebugLog.d(TAG, "requestExitAndWait tid=" + getId());
            this.mShouldExit = true;
            this.mLock.notifyAll();
            while (!this.mExited) {
                try {
                    this.mLock.wait();
                } catch (InterruptedException unused) {
                    Thread.currentThread().interrupt();
                }
            }
        }
    }

    public void queueEvent(Runnable runnable) {
        if (runnable == null) {
            throw new IllegalArgumentException("r must not be null");
        }
        synchronized (this.mLock) {
            this.mEventQueue.add(runnable);
            this.mLock.notifyAll();
        }
    }

    public void startEncoder(File file, TextureMovieEncoder2.EncoderListener encoderListener, long j, int i, int i2, int i3, int i4, boolean z) {
        DebugLog.d(TAG, "startEncoder()");
        this.mRefreshPeriodNanos = j;
        this.mVirtualTimeNanos = 0L;
        if (i == 0 && i2 == 0 && i3 == 0 && i4 == 0) {
            this.mDstWidth = NativeEGL.querySurface(this.mHandle, 12375);
            this.mDstHeight = NativeEGL.querySurface(this.mHandle, 12374);
            i3 = this.mDstWidth;
            i4 = this.mDstHeight;
        } else {
            this.mDstWidth = (i3 - i) + 1;
            this.mDstHeight = (i4 - i2) + 1;
        }
        int i5 = this.mHeight;
        this.mSrcRect = new Rect(i, i5 - i4, i3, i5 - i2);
        boolean z2 = this.mDstWidth >= this.mDstHeight;
        int i6 = FULL_HD_WIDTH;
        int i7 = z2 ? FULL_HD_WIDTH : FULL_HD_HEIGHT;
        if (z2) {
            i6 = FULL_HD_HEIGHT;
        }
        if (this.mDstWidth > i7 || this.mDstHeight > i6) {
            float f = i7 / (float) this.mDstWidth;
            float f2 = this.mDstHeight * f;
            float f3 = i6;
            if (f2 > f3) {
                f *= f3 / f2;
            }
            this.mDstWidth = (int) (this.mDstWidth * f);
            this.mDstHeight = (int) (this.mDstHeight * f);
        }
        this.mDstWidth &= -2;
        this.mDstHeight &= -2;
        try {
            VideoRecorder videoRecorder = new VideoRecorder(this.mDstWidth, this.mDstHeight, file, z);
            this.mInputHandle = NativeEGL.createContext(videoRecorder.getOutputSurface(), false);
            this.mVideoEncoder = new TextureMovieEncoder2(videoRecorder, encoderListener);
            this.mVideoEncoder.startEncoder();
            this.mRecordingOngoing = true;
        } catch (IOException e) {
            DebugLog.e(TAG, "IOException when creating Video Encoder.", e);
            throw new RuntimeException(e);
        }
    }

    public void stopEncoder() {
        DebugLog.d(TAG, "stopEncoder()");
        synchronized (this.mRecordingLock) {
            this.mRecordingOngoing = false;
            if (this.mVideoEncoder != null) {
                this.mVideoEncoder.stopRecording();
                this.mVideoEncoder = null;
            }
        }
        long j = this.mInputHandle;
        if (j != 0) {
            NativeEGL.destroyContext(j);
            this.mInputHandle = 0L;
            NativeEGL.makeCurrent(this.mHandle);
        }
    }

    private static void checkGlError() {
        int iGlGetError = GLES20.glGetError();
        if (iGlGetError == 0) {
            return;
        }
        String str = "before glBlitFramebuffer: glError 0x" + Integer.toHexString(iGlGetError);
        DebugLog.e(TAG, str);
        throw new RuntimeException(str);
    }
}
