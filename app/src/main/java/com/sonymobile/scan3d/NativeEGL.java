package com.sonymobile.scan3d;

import android.view.Surface;

/* JADX INFO: loaded from: classes.dex */
public class NativeEGL {
    public static native long createContext(Surface surface, boolean z);

    public static native void destroyContext(long j);

    public static native void makeCurrent(long j, long j2);

    public static native int querySurface(long j, int i);

    public static native void setPresentationTime(long j, long j2);

    public static native void swap(long j);

    public static void makeCurrent(long j) {
        makeCurrent(j, j);
    }
}
