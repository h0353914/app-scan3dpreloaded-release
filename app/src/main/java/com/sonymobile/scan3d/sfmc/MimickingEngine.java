package com.sonymobile.scan3d.sfmc;

import androidx.annotation.AnyThread;
import androidx.annotation.NonNull;

import com.sonymobile.scan3d.CameraImageProvider;

interface MimickingEngine {
    @GlThread
    void done();

    @GlThread
    void init(StateListener listener);

    @GlThread
    boolean loadTarget(byte[] target, byte[] mask);

    @AnyThread
    void release();

    @GlThread
    void render();

    @GlThread
    void runOneIteration();

    @GlThread
    void setDisplaySize(int width, int height);

    @GlThread
    void setImageProvider(CameraImageProvider provider);

    @AnyThread
    void setProperty(@NonNull String name, float value);

    interface StateListener {
        @AnyThread
        void onStateChanged(State state);

        enum State {
            IDLE,
            TRACKING,
            LOST,
            SEARCHING
        }
    }
}
