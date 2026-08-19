package com.sonymobile.scan3d;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.TextureView;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.logging.DebugLog;
import java.io.File;

public class NativeGLTextureView extends TextureView implements TextureView.SurfaceTextureListener {
    private static final boolean LOG_ATTACH_DETACH = true;
    private static final String TAG = "com.sonymobile.scan3d.NativeGLTextureView";
    private Runnable mCharon;
    private boolean mDetached;
    private GLThread mGLThread;
    private final Object mLock;
    private GLThread.Renderer mRenderer;

    public interface TouchListener {
        boolean allowMotion(MotionEvent motionEvent);

        void onSingleTouch();
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureUpdated(SurfaceTexture surfaceTexture) {
    }

    public NativeGLTextureView(Context context) {
        super(context);
        this.mLock = new Object();
        init();
    }

    public NativeGLTextureView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.mLock = new Object();
        init();
    }

    private void init() {
        setSurfaceTextureListener(this);
    }

    public void setRenderer(GLThread.Renderer renderer, @Nullable Runnable runnable) {
        if (this.mGLThread != null) {
            throw new IllegalStateException("setRenderer has already been called for this instance.");
        }
        this.mRenderer = renderer;
        this.mCharon = runnable;
        this.mGLThread = new GLThread(this.mLock, renderer);
        this.mGLThread.start();
    }

    public GLThread getGLThread() {
        return this.mGLThread;
    }

    public void stop() {
        this.mGLThread.requestExitAndWait();
        Runnable runnable = this.mCharon;
        if (runnable != null) {
            runnable.run();
        }
    }

    public void requestRender() {
        this.mGLThread.requestRender();
    }

    public void onPause() {
        this.mGLThread.onPause();
    }

    public void onResume() {
        this.mGLThread.onResume();
    }

    public void queueEvent(Runnable runnable) {
        this.mGLThread.queueEvent(runnable);
    }

    @Override // android.view.TextureView, android.view.View
    protected void onAttachedToWindow() {
        GLThread.Renderer renderer;
        super.onAttachedToWindow();
        DebugLog.d(TAG, "onAttachedToWindow reattach =" + this.mDetached);
        if (this.mDetached && (renderer = this.mRenderer) != null) {
            this.mGLThread = new GLThread(this.mLock, renderer);
            this.mGLThread.start();
        }
        this.mDetached = false;
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        DebugLog.d(TAG, "onDetachedFromWindow");
        GLThread gLThread = this.mGLThread;
        if (gLThread != null) {
            gLThread.requestExitAndWait();
        }
        this.mDetached = true;
        Runnable runnable = this.mCharon;
        if (runnable != null) {
            runnable.run();
        }
        super.onDetachedFromWindow();
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureAvailable(SurfaceTexture surfaceTexture, int i, int i2) {
        GLThread gLThread = this.mGLThread;
        if (gLThread != null) {
            gLThread.surfaceCreated(surfaceTexture, i, i2);
        }
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public void onSurfaceTextureSizeChanged(SurfaceTexture surfaceTexture, int i, int i2) {
        this.mGLThread.onWindowResize(i, i2);
    }

    @Override // android.view.TextureView.SurfaceTextureListener
    public boolean onSurfaceTextureDestroyed(SurfaceTexture surfaceTexture) {
        this.mGLThread.surfaceDestroyed();
        return true;
    }

    public void startEncoder(File file, TextureMovieEncoder2.EncoderListener encoderListener, long j) {
        startEncoder(file, encoderListener, j, 0, 0, 0, 0, false);
    }

    public void startEncoder(File file, TextureMovieEncoder2.EncoderListener encoderListener, long j, int i, int i2, int i3, int i4, boolean z) {
        this.mGLThread.startEncoder(file, encoderListener, j, i, i2, i3, i4, z);
    }

    public void stopEncoder() {
        this.mGLThread.queueEvent(() -> this.mGLThread.stopEncoder());
    }
}
