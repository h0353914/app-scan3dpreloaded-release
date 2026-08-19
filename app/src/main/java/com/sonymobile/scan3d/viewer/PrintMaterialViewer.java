package com.sonymobile.scan3d.viewer;

import com.sonymobile.scan3d.PrintMaterialType;

/* JADX INFO: loaded from: classes.dex */
public class PrintMaterialViewer {
    private long mNativeHandle;

    private static native void classInit();

    private static native long create(long j, long j2, long j3);

    private native void destroy();

    private native void setMaterialImpl(int i);

    public native void setShadowRemoval(float f);

    static {
        classInit();
    }

    public PrintMaterialViewer(ModelContainer modelContainer, ModelContainer modelContainer2, MeshRenderer meshRenderer) {
        this.mNativeHandle = create(modelContainer.getNativeHandle(), modelContainer2.getNativeHandle(), meshRenderer.getNativeHandle());
    }

    public void release() {
        destroy();
        this.mNativeHandle = 0L;
    }

    public void setMaterial(PrintMaterialType printMaterialType) {
        setMaterialImpl(printMaterialType.ordinal());
    }
}
