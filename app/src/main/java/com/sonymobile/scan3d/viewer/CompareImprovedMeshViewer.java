package com.sonymobile.scan3d.viewer;

/* JADX INFO: loaded from: classes.dex */
public class CompareImprovedMeshViewer {
    private long mNativeHandle;

    private static native void classInit();

    private static native long create(long j, long j2, long j3);

    private native void destroy();

    public native void setSplitRatio(float f);

    public native void setTextured(float f);

    static {
        classInit();
    }

    public CompareImprovedMeshViewer(ModelContainer modelContainer, ModelContainer modelContainer2, MeshRenderer meshRenderer) {
        this.mNativeHandle = create(getHandle(modelContainer), getHandle(modelContainer2), meshRenderer.getNativeHandle());
    }

    private long getHandle(ModelContainer modelContainer) {
        if (modelContainer == null) {
            return 0L;
        }
        return modelContainer.getNativeHandle();
    }

    public void release() {
        destroy();
        this.mNativeHandle = 0L;
    }
}
