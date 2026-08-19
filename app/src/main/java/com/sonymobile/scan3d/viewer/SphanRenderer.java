package com.sonymobile.scan3d.viewer;

import android.content.Context;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.SimpleLifecycle;
import com.sonymobile.scan3d.Sphan;

/* JADX INFO: loaded from: classes.dex */
public class SphanRenderer extends Sphan implements GLThread.Renderer, SimpleLifecycle.SimpleLifecycleOwner {
    private boolean mGLInitialized;
    private boolean mHasOpenGLContext;
    private boolean mIsLoaded;
    private long mLastRender;
    private OnDrawFrameListener mListener;
    private SimpleLifecycle mSimpleLifeCycle;

    public interface OnDrawFrameListener {
        void onDrawFrameDelta(long j);
    }

    public SphanRenderer(Context context) {
        super(context);
        this.mLastRender = 0L;
        this.mIsLoaded = false;
        this.mHasOpenGLContext = false;
        this.mGLInitialized = false;
        this.mSimpleLifeCycle = new SimpleLifecycle();
    }

    @Override // com.sonymobile.scan3d.Sphan
    public boolean load(String str, String str2) {
        if (!super.load(str, str2)) {
            return false;
        }
        this.mIsLoaded = true;
        return true;
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceCreated() {
        if (this.mIsLoaded) {
            super.onGLContextCreated();
            this.mGLInitialized = true;
        }
        this.mHasOpenGLContext = true;
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceChanged(int i, int i2) {
        surfaceChanged(i, i2);
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public boolean onDrawFrame(float f) {
        if (!this.mIsLoaded || !this.mHasOpenGLContext) {
            return false;
        }
        if (!this.mGLInitialized) {
            super.onGLContextCreated();
            this.mGLInitialized = true;
        }
        long jCurrentTimeMillis = f < 0.0f ? System.currentTimeMillis() : (long) (1000.0f * f);
        long j = this.mLastRender;
        long j2 = j != 0 ? jCurrentTimeMillis - j : 0L;
        this.mLastRender = jCurrentTimeMillis;
        boolean zRender = super.render(f);
        OnDrawFrameListener onDrawFrameListener = this.mListener;
        if (onDrawFrameListener != null) {
            onDrawFrameListener.onDrawFrameDelta(j2);
        }
        return zRender;
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public boolean onDrawFrame() {
        return onDrawFrame(-1.0f);
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public void onSurfaceDestroyed() {
        if (this.mGLInitialized) {
            super.onGLContextDestroyed();
            this.mGLInitialized = false;
        }
        this.mHasOpenGLContext = false;
    }

    public void setOnDrawFrameListener(OnDrawFrameListener onDrawFrameListener) {
        this.mListener = onDrawFrameListener;
    }

    @Override // com.sonymobile.scan3d.SimpleLifecycle.SimpleLifecycleOwner
    public SimpleLifecycle getLifecycle() {
        return this.mSimpleLifeCycle;
    }
}
