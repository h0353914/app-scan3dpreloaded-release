package com.sonymobile.scan3d.viewer;

import com.sonymobile.scan3d.GLThread;
import com.sonymobile.scan3d.MeshType;
import com.sonymobile.scan3d.MeshVariant;
import com.sonymobile.scan3d.ScenoID;

/* JADX INFO: loaded from: classes.dex */
public class MeshRenderer implements GLThread.Renderer, GestureHandler.GestureListener {
    private static final boolean DEBUG = false;
    private static final String TAG = "MeshRenderer";
    private long mNativeHandle = create();
    private OnDrawFrameListener mOnDrawFrameListener;
    private OnStopFlingListener mOnFlingStopListener;
    private long mTimeStamp;

    public interface OnDrawFrameListener {
        void onDrawFrameDelta(long j);
    }

    public interface OnStopFlingListener {
        void onStopFling();
    }

    private native void addMesh(long j, int i, int i2);

    private static native void classInit();

    private native long create();

    private native void destroy();

    private native void enableOnFlingListener(boolean z);

    private native void onSurfaceChangedImpl(int i, int i2);

    private native void onSurfaceCreatedImpl();

    private native void onSurfaceDestroyedImpl();

    private native void removeNativeMeshes();

    private native boolean renderImpl();

    private native synchronized void setScenography(int i);

    public native synchronized void adjustViewToMesh(float f, boolean z);

    public native synchronized float getSeekDefault();

    public native synchronized float[] getViewM();

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public native synchronized boolean onDoubleTap();

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public native synchronized boolean onDown();

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public native synchronized boolean onFling(float f, float f2);

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public native synchronized boolean onMoveSingleTap(float f, float f2);

    public native synchronized boolean onSeek(float f);

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public native synchronized boolean onSingleTap();

    @Override // com.sonymobile.scan3d.viewer.GestureHandler.GestureListener
    public native synchronized boolean onTransform(float f, float f2, float f3, float f4, float f5, float f6, float f7);

    public native synchronized void reset();

    public native synchronized void resetInitView();

    public native synchronized void set180Mode(boolean z);

    public native synchronized void setEditMode(boolean z);

    public native synchronized void setIgnoreApectRatioScaling(boolean z);

    public native synchronized void setViewM(float[] fArr, int i);

    public native synchronized void stopFling();

    public native synchronized void translateView(float f, float f2, float f3);

    static {
        classInit();
    }

    public synchronized void release() {
        removeMeshes();
        destroy();
        this.mNativeHandle = 0L;
    }

    public synchronized long getNativeHandle() {
        return this.mNativeHandle;
    }

    public synchronized void removeMeshes() {
        removeNativeMeshes();
    }

    public void addMesh(ModelContainer modelContainer, MeshVariant meshVariant, MeshType meshType) {
        addMesh(modelContainer.getNativeHandle(), meshVariant.ordinal(), meshType.ordinal());
    }

    public synchronized void setScenography(ScenoID scenoID) {
        setScenography(scenoID.ordinal());
    }

    public synchronized void rotate(float f, float f2, float f3) {
        onTransform(0.0f, 0.0f, 0.0f, f, f2, f3, 1.0f);
    }

    public synchronized void setOnFlingStopListener(OnStopFlingListener onStopFlingListener) {
        this.mOnFlingStopListener = onStopFlingListener;
        enableOnFlingListener(this.mOnFlingStopListener != null);
    }

    public synchronized void setOnDrawFrameListener(OnDrawFrameListener onDrawFrameListener) {
        this.mOnDrawFrameListener = onDrawFrameListener;
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public synchronized void onSurfaceCreated() {
        onSurfaceCreatedImpl();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public synchronized void onSurfaceDestroyed() {
        onSurfaceDestroyedImpl();
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public synchronized void onSurfaceChanged(int i, int i2) {
        onSurfaceChangedImpl(i, i2);
    }

    @Override // com.sonymobile.scan3d.GLThread.Renderer
    public synchronized boolean onDrawFrame(float f) {
        try {
            long jCurrentTimeMillis = f < 0.0f ? System.currentTimeMillis() : (long) (f * 1000.0f);
            long j = jCurrentTimeMillis - this.mTimeStamp;
            if (this.mOnDrawFrameListener != null) {
                OnDrawFrameListener onDrawFrameListener = this.mOnDrawFrameListener;
                if (this.mTimeStamp == 0) {
                    j = 0;
                }
                onDrawFrameListener.onDrawFrameDelta(j);
            }
            this.mTimeStamp = jCurrentTimeMillis;
        } catch (Throwable th) {
            throw th;
        }
        return renderImpl();
    }

    private synchronized void onStopFling() {
        if (this.mOnFlingStopListener != null) {
            this.mOnFlingStopListener.onStopFling();
        }
    }
}
