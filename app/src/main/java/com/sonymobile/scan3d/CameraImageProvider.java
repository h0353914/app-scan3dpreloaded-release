package com.sonymobile.scan3d;

import android.content.Context;
import android.graphics.SurfaceTexture;
import android.view.Surface;

public class CameraImageProvider {
    private static final int PREVIEW_HEIGHT = 720;
    private static final int PREVIEW_WIDTH = 1280;
    private long mNativeHandle;
    private OnCameraStatusListener mOnStatusListener;
    private SurfaceTexture mSurfaceTexture;
    private long mGlThreadId = Thread.currentThread().getId();
    private volatile boolean mStreaming = false;

    public interface OnCameraStatusListener {
        void onClose(CameraImageProvider cameraImageProvider);

        void onOpen(CameraImageProvider cameraImageProvider);
    }

    private static native void classInit();

    private native long create(int i, boolean z);

    private native int createTexture(int i, int i2);

    private native void destroy();

    private native void setCameraSetting(int i, int i2);

    private native void setSurface(Surface surface);

    private native void start();

    private native void stop();

    static {
        classInit();
    }

    public CameraImageProvider(Context context, OnCameraStatusListener onCameraStatusListener, SphinxFocusType sphinxFocusType, boolean z) {
        this.mNativeHandle = create(sphinxFocusType.ordinal(), z);
        this.mOnStatusListener = onCameraStatusListener;
    }

    public void openCamera() {
        this.mSurfaceTexture = new SurfaceTexture(createTexture(PREVIEW_WIDTH, PREVIEW_HEIGHT));
        this.mSurfaceTexture.setDefaultBufferSize(PREVIEW_WIDTH, PREVIEW_HEIGHT);
        setSurface(new Surface(this.mSurfaceTexture));
        this.mOnStatusListener.onOpen(this);
        start();
        this.mStreaming = true;
    }

    public void closeCamera() {
        this.mStreaming = false;
        stop();
        SurfaceTexture surfaceTexture = this.mSurfaceTexture;
        if (surfaceTexture != null) {
            surfaceTexture.release();
            this.mSurfaceTexture = null;
        }
        this.mOnStatusListener.onClose(this);
    }

    public boolean isStreaming() {
        return this.mStreaming;
    }

    public void setEdgeEnhancement(boolean z) {
        threadCheck();
        setCameraSetting(CameraSettingType.kSettingEdgeEnhancement.ordinal(), z ? 1 : 0);
    }

    public void setNoiseReduction(boolean z) {
        threadCheck();
        setCameraSetting(CameraSettingType.kSettingNoiseReduction.ordinal(), z ? 1 : 0);
    }

    public void setAWBLock(boolean z) {
        threadCheck();
        setCameraSetting(CameraSettingType.kSettingAWBLock.ordinal(), z ? 1 : 0);
    }

    public void setLamp(boolean z) {
        threadCheck();
        setCameraSetting(CameraSettingType.kSettingLamp.ordinal(), z ? 1 : 0);
    }

    public void setFocusPosition(int i) {
        threadCheck();
        setCameraSetting(CameraSettingType.kSettingManualFocusPosition.ordinal(), i);
    }

    public long getNativeHandle() {
        threadCheck();
        return this.mNativeHandle;
    }

    private long onUpdateTexImage() {
        this.mSurfaceTexture.updateTexImage();
        return this.mSurfaceTexture.getTimestamp();
    }

    private void threadCheck() {
        if (this.mGlThreadId != Thread.currentThread().getId()) {
            throw new RuntimeException("Must be called from GL thread!");
        }
    }
}
