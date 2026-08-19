package com.sonymobile.scan3d.sfmc;

import androidx.annotation.AnyThread;
import androidx.annotation.NonNull;

import com.sonymobile.scan3d.CameraImageProvider;

class Sfmc implements MimickingEngine {
    private static final StateListener.State[] STATES = StateListener.State.values();

    private long mNativeHandle;
    private StateListener mStateListener;

    @AnyThread
    public Sfmc() {
        mNativeHandle = nativeConstructor();
    }

    private void checkHandle() {
        if (mNativeHandle == 0) {
            throw new IllegalStateException("Not initialized / Already released!");
        }
    }

    private static native long nativeConstructor();

    private native void nativeDestructor();

    private native void nativeDone();

    private native void nativeInit();

    private native boolean nativeLoadTargetFromMemory(byte[] target, byte[] mask);

    private native void nativeRender();

    private native void nativeRunOneIteration();

    private native void nativeSetDisplaySize(int width, int height);

    private native void nativeSetImageProvider(long handle);

    private native void nativeSetProperty(String name, float value);

    private void nativeStateChangedCb(int index) {
        StateListener.State[] states = STATES;
        if (index < states.length && mStateListener != null) {
            mStateListener.onStateChanged(states[index]);
        }
    }

    @Override
    @GlThread
    public void done() {
        checkHandle();
        nativeDone();
    }

    @Override
    @GlThread
    public void init(StateListener listener) {
        checkHandle();
        mStateListener = listener;
        nativeInit();
        nativeStateChangedCb(0);
    }

    @Override
    @GlThread
    public boolean loadTarget(byte[] target, byte[] mask) {
        checkHandle();
        return nativeLoadTargetFromMemory(target, mask);
    }

    @Override
    @AnyThread
    public void release() {
        checkHandle();
        nativeDestructor();
        mNativeHandle = 0;
    }

    @Override
    @GlThread
    public void render() {
        checkHandle();
        nativeRender();
    }

    @Override
    @GlThread
    public void runOneIteration() {
        checkHandle();
        nativeRunOneIteration();
    }

    @Override
    @GlThread
    public void setDisplaySize(int width, int height) {
        checkHandle();
        nativeSetDisplaySize(width, height);
    }

    @Override
    @GlThread
    public void setImageProvider(CameraImageProvider provider) {
        checkHandle();
        long handle = provider != null ? provider.getNativeHandle() : 0;
        nativeSetImageProvider(handle);
    }

    @Override
    @AnyThread
    public void setProperty(@NonNull String name, float value) {
        if (name == null) {
            throw new IllegalArgumentException("key cannot be null");
        }
        nativeSetProperty(name, value);
    }
}
