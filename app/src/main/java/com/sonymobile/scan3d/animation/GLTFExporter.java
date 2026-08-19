package com.sonymobile.scan3d.animation;

public class GLTFExporter {
    private long mNativeHandle;

    public GLTFExporter() {
        mNativeHandle = nativeConstructor();
    }

    private static native long nativeConstructor();

    private native long nativeDestructor();

    public native boolean isReduceImpossible(int reduceLevel);

    public boolean load(String path) {
        return load(path, null);
    }

    public native boolean load(String path, String texturePath);

    public boolean reduceSize(int reduceLevel) {
        return reduceSize(reduceLevel, 4);
    }

    public native boolean reduceSize(int reduceLevel, int quality);

    public native void reduceTextureSize(int width, int height);

    public void release() {
        nativeDestructor();
        mNativeHandle = 0;
    }

    public boolean save(String path) {
        return save(path, false);
    }

    public native boolean save(String path, boolean binary);

    public native boolean saveToZip(String path, String zipPath);
}
