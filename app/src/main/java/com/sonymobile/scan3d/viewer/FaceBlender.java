package com.sonymobile.scan3d.viewer;

import androidx.annotation.AnyThread;
import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.sfmc.GlThread;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class FaceBlender implements GLThread.Renderer {
    private static final boolean DEBUG = true;
    private static final String TAG = "FaceBlender";
    private MeshRenderer.OnStopFlingListener mOnFlingStopListener;
    private final ArrayList<Runnable> mRenderEventQueue = new ArrayList<>();
    private long mNativeHandle = create();

    private static native void classInit();

    private native long create();

    private native void onSurfaceChangedImpl(int i, int i2);

    private native void onSurfaceCreatedImpl();

    private native void onSurfaceDestroyedImpl();

    private native boolean renderImpl();

    @AnyThread
    public native synchronized void destroy();

    @GlThread
    public native synchronized boolean load(String str, String str2, String str3);

    @AnyThread
    public native synchronized boolean onDown();

    @AnyThread
    public native synchronized boolean onFling(float f, float f2);

    @AnyThread
    public native synchronized boolean reset();

    @AnyThread
    public native synchronized boolean resetView();

    @AnyThread
    public native synchronized void setMeshSlider(float f);

    @AnyThread
    public native synchronized void setTextureSlider(float f);

    @AnyThread
    public native synchronized boolean touchDrag(float f, float f2);

    @AnyThread
    public native synchronized boolean transform(float f, float f2, float f3, float f4, float f5, float f6, float f7);

    static {
        classInit();
    }

    @AnyThread
    public FaceBlender() {
    }

    @AnyThread
    public synchronized void release() {
        DebugLog.v(TAG, "release()");
        destroy();
        this.mNativeHandle = 0L;
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    @GlThread
    public synchronized void onSurfaceCreated() {
        DebugLog.v(TAG, "onSurfaceCreated()");
        onSurfaceCreatedImpl();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    @GlThread
    public synchronized void onSurfaceDestroyed() {
        DebugLog.v(TAG, "onSurfaceDestroyed()");
        executeRenderEvents();
        onSurfaceDestroyedImpl();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    @GlThread
    public synchronized void onSurfaceChanged(int i, int i2) {
        DebugLog.v(TAG, "onSurfaceChanged(" + i + "," + i2 + ")");
        onSurfaceChangedImpl(i, i2);
    }

    public void queueOnRender(Runnable runnable) {
        synchronized (this.mRenderEventQueue) {
            this.mRenderEventQueue.add(runnable);
        }
    }

    @GlThread
    private void executeRenderEvents() {
        Runnable runnableRemove;
        do {
            synchronized (this.mRenderEventQueue) {
                runnableRemove = this.mRenderEventQueue.isEmpty() ? null : this.mRenderEventQueue.remove(0);
            }
            if (runnableRemove != null) {
                runnableRemove.run();
            }
        } while (runnableRemove != null);
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    @GlThread
    public synchronized boolean onDrawFrame() {
        executeRenderEvents();
        return renderImpl();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public synchronized boolean onDrawFrame(float f) {
        executeRenderEvents();
        return renderImpl();
    }

    public synchronized void onStopFling() {
        if (this.mOnFlingStopListener != null) {
            this.mOnFlingStopListener.onStopFling();
        }
    }
}
