package com.sonymobile.scan3d;

import android.content.Context;
import android.content.res.AssetManager;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public class Sphan {
    public static final int BG_COUNT = 4;
    public static final int BG_DEFAULT = 1;
    public static final int BG_OUTDOORS = 2;
    public static final int BG_SIMPLE = 0;
    public static final int BG_STUDIO_SMALL = 3;
    private NativeAnimationListener mAnimationListener;
    private long mNativeHandle;
    private long mRefCounter;

    public interface NativeAnimationListener {
        void animationStopped(int i);
    }

    private static native void classInit();

    private static native void initAssets(AssetManager assetManager);

    private native long nativeConstructor();

    private native void nativeDestructor();

    public native void enableAnimationListener(boolean z);

    public native boolean exportGlb(String str);

    public native boolean exportGlbZip(String str, String str2);

    public native float getAnimationDuration(int i, int i2);

    public native String getAnimationName(int i, int i2);

    public native int getMeshCount();

    public native int getNumAnimations(int i);

    public native float[] getViewMatrix();

    public native boolean isEffectActive();

    public native boolean isMeshVisible(int i);

    public native boolean load(String str, String str2);

    public native int loadContent(String str, String str2, boolean z);

    public native int loadZippedContent(String str, String str2, String str3, boolean z);

    public native boolean lookAt(int i, float f, float f2);

    public native boolean onDown();

    public native boolean onFling(float f, float f2);

    public native void onGLContextCreated();

    public native void onGLContextDestroyed();

    public native void removeMeshes();

    public native boolean render(float f);

    public native void resetCamera();

    public native void resetView();

    public native void setBackground(int i);

    public native boolean setCamera(int i, String str);

    public native boolean setMeshVisible(int i, boolean z);

    public native void setPlainShading(boolean z);

    public native void setPostProcShading(boolean z);

    public native void setProgress(float f);

    public native void setUntexturedShading(boolean z);

    public native void setViewMatrix(float[] fArr, int i);

    public native boolean startAnimation(int i, int i2, boolean z);

    public native boolean startMeshAnimation(int i, int i2, boolean z);

    public native boolean startNamedAnimation(int i, String str, boolean z);

    public native void startProgressEffect();

    public native boolean stopAnimation(int i);

    public native void stopEffect();

    public native void stopFling();

    public native void surfaceChanged(int i, int i2);

    public native void touchDrag(float f, float f2);

    public native void transform(float f, float f2, float f3, float f4, float f5, float f6, float f7);

    public native boolean unload(int i);

    public native boolean unloadDownTo(int i);

    static {
        classInit();
    }

    public Sphan(Context context) {
        initAssets(context.getApplicationContext().getAssets());
        this.mNativeHandle = nativeConstructor();
        this.mRefCounter = 1L;
    }

    public synchronized void acquire() {
        this.mRefCounter++;
    }

    public synchronized void release() {
        long j = this.mRefCounter - 1;
        this.mRefCounter = j;
        if (j <= 0) {
            nativeDestructor();
            this.mNativeHandle = 0L;
        }
    }

    public int getNumAnimations() {
        return getNumAnimations(getMeshCount() - 1);
    }

    public String getAnimationName(int i) {
        return getAnimationName(getMeshCount() - 1, i);
    }

    public boolean startAnimation(int i) {
        return startMeshAnimation(getMeshCount() - 1, i, true);
    }

    public boolean startAnimation(int i, int i2) {
        return startAnimation(i, i2, true);
    }

    public boolean startAnimationNoWarmup(int i, int i2) {
        return startAnimation(i, i2, false);
    }

    public void stopIdleAnimation() {
        if (getMeshCount() <= 1 || stopAnimation(1)) {
            return;
        }
        Log.e(Sphan.class.getName(), "Animation was not stopped");
    }

    public void showStaticMesh() {
        setMeshVisible(0, true);
        setMeshVisible(1, false);
    }

    public void showRiggedMesh() {
        setMeshVisible(1, true);
        setMeshVisible(0, false);
    }

    public boolean hasLoadedMeshes() {
        return getMeshCount() > 0;
    }

    public synchronized void setNativeAnimationListener(NativeAnimationListener nativeAnimationListener) {
        this.mAnimationListener = nativeAnimationListener;
        enableAnimationListener(nativeAnimationListener != null);
    }

    private synchronized void onAnimationStopped(int i) {
        if (this.mAnimationListener != null) {
            this.mAnimationListener.animationStopped(i);
        }
    }
}
