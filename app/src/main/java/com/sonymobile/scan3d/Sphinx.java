package com.sonymobile.scan3d;

import android.content.res.AssetManager;

/* JADX INFO: loaded from: classes.dex */
public class Sphinx {
    private long mGlThreadId = Thread.currentThread().getId();
    private long mNativeHandle;

    private native Object[] getEnvironmentErrors();

    public static native void initAssets(AssetManager assetManager);

    private static native long nativeConstructor(int i, int i2);

    private native void nativeDestructor();

    private native void nativeDone();

    private native String nativeGetLastBasename();

    private native int nativeGetScanType();

    private native int nativeGetSculpt3DInputController();

    private native int nativeGetState();

    private native void nativeInit();

    private native SphinxHint nativePopHint();

    private native void nativeRender();

    private native void nativeRunOneIteration();

    private native void nativeSetBlobScaleZoom(float f);

    private native boolean nativeSetCameraTemperature(int i);

    private native void nativeSetDisplaySize(int i, int i2);

    private native void nativeSetEnvCondition(int i, float f);

    private native void nativeSetImageProvider(long j);

    private native void nativeSetNextDebugMode(int i);

    private native boolean nativeSetNextState(boolean z);

    public static native void resetCameraCalibration();

    public static native int setupEnvironment(String str, String str2, String str3, String str4);

    public native void clearEnvironmentErrors();

    public native void setLocaleIsRTL(boolean z);

    public native void setPassword(String str);

    public Sphinx(int i, int i2) {
        this.mNativeHandle = nativeConstructor(i, i2);
    }

    public void release() {
        threadCheck();
        checkHandle();
        nativeDestructor();
        this.mNativeHandle = 0L;
    }

    public SphinxState getState() {
        threadCheck();
        checkHandle();
        return SphinxState.values()[nativeGetState()];
    }

    public boolean isDone() {
        threadCheck();
        checkHandle();
        int iNativeGetState = nativeGetState();
        return iNativeGetState == SphinxState.kStateDone.ordinal() || iNativeGetState == SphinxState.kStateDestroyed.ordinal();
    }

    public void init() {
        threadCheck();
        checkHandle();
        nativeInit();
    }

    public void done() {
        threadCheck();
        checkHandle();
        nativeDone();
    }

    public void render() {
        threadCheck();
        checkHandle();
        nativeRender();
    }

    public void runOneIteration() {
        threadCheck();
        checkHandle();
        nativeRunOneIteration();
    }

    public EnvironmentError[] getErrors() {
        return (EnvironmentError[]) getEnvironmentErrors();
    }

    public void setDisplaySize(int i, int i2) {
        threadCheck();
        checkHandle();
        nativeSetDisplaySize(i, i2);
    }

    public void setImageProvider(long j) {
        threadCheck();
        checkHandle();
        nativeSetImageProvider(j);
    }

    public void setNextDebugMode(int i) {
        threadCheck();
        checkHandle();
        nativeSetNextDebugMode(i);
    }

    public void setEnvCondition(SphinxEnvCondition sphinxEnvCondition, float f) {
        threadCheck();
        checkHandle();
        nativeSetEnvCondition(sphinxEnvCondition.ordinal(), f);
    }

    public boolean setNextState(boolean z) {
        threadCheck();
        checkHandle();
        return nativeSetNextState(z);
    }

    public SphinxHint popHint() {
        checkHandle();
        return nativePopHint();
    }

    public void setBlobScaleZoom(float f) {
        threadCheck();
        checkHandle();
        nativeSetBlobScaleZoom(f);
    }

    public boolean setCameraTemperature(SphinxCameraTemperatureState sphinxCameraTemperatureState) {
        threadCheck();
        checkHandle();
        return nativeSetCameraTemperature(sphinxCameraTemperatureState.ordinal());
    }

    public String getLastLogFile() {
        threadCheck();
        return nativeGetLastBasename() + ".log.zip";
    }

    public String getLastResultFile() {
        threadCheck();
        return nativeGetLastBasename() + ".obj.zip";
    }

    public int getScanType() {
        threadCheck();
        return nativeGetScanType();
    }

    private void checkHandle() {
        if (this.mNativeHandle == 0) {
            throw new IllegalStateException("Not initialized / Already released!");
        }
    }

    private void threadCheck() {
        if (this.mGlThreadId != Thread.currentThread().getId()) {
            throw new RuntimeException("Must be called from GL thread!");
        }
    }
}
