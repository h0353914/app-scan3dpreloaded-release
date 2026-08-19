package com.sonymobile.scan3d.viewer;

import android.graphics.Bitmap;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class ModelContainer implements Parcelable {
    public static final Parcelable.Creator<ModelContainer> CREATOR;
    private static final String TAG = "ModelContainer";
    private static Set<Long> sValidHandles = new HashSet();
    private long mNativeHandle;
    private Exception mTemporaryReleaseStackException;

    private static native void classInit();

    private native void copyFrom(long j);

    private native void copyMetadataFrom(long j);

    private static native long create();

    private native void destroy();

    private native int nativeGetFaceCount();

    private native int nativeGetScanPolicyMode();

    private native int nativeGetScanType();

    private native int nativeGetVertexCount();

    public native void clear();

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public native boolean exportGlb(String str, float[] fArr, int i);

    public native boolean exportZip(String str, String str2);

    public native Bitmap generatePreview(int i);

    public native float[] getTransform();

    public native boolean importZip(String str, String str2);

    public native boolean isEmpty();

    public native void setTransform(float[] fArr);

    public native boolean tessellate(int i);

    static {
        classInit();
        CREATOR = new Parcelable.Creator<ModelContainer>() { // from class: com.sonymobile.scan3d.viewer.ModelContainer.1
            @Override // android.os.Parcelable.Creator
            public ModelContainer createFromParcel(Parcel parcel) {
                return new ModelContainer(parcel);
            }
            @Override // android.os.Parcelable.Creator
            public ModelContainer[] newArray(int i) {
                return new ModelContainer[i];
            }
        };
    }

    protected ModelContainer(Parcel parcel) {
        this.mNativeHandle = parcel.readLong();
        if (sValidHandles.contains(Long.valueOf(this.mNativeHandle))) {
            return;
        }
        Log.e(TAG, "invalid handle from parcel: " + this.mNativeHandle);
        this.mNativeHandle = 0L;
    }

    public ModelContainer() {
        this.mNativeHandle = create();
        sValidHandles.add(Long.valueOf(this.mNativeHandle));
    }

    public synchronized void release() {
        destroy();
        sValidHandles.remove(Long.valueOf(this.mNativeHandle));
        this.mNativeHandle = 0L;
        this.mTemporaryReleaseStackException = new Exception();
    }

    public synchronized ModelContainer copy() {
        ModelContainer modelContainer;
        if (this.mNativeHandle == 0) {
            Log.e(TAG, "copy() is called on a released ModelContainer. It was previously released here:");
            this.mTemporaryReleaseStackException.printStackTrace();
            throw new RuntimeException("NativeHandler is null!");
        }
        modelContainer = new ModelContainer();
        modelContainer.copyFrom(this.mNativeHandle);
        return modelContainer;
    }

    public void copyMetadataFrom(ModelContainer modelContainer) {
        copyMetadataFrom(modelContainer.getNativeHandle());
    }

    public int getScanType() {
        return nativeGetScanType();
    }

    public int getScanPolicyMode() {
        return nativeGetScanPolicyMode();
    }

    public int getVertexCount() {
        return nativeGetVertexCount();
    }

    public int getFaceCount() {
        return nativeGetFaceCount();
    }

    public synchronized long getNativeHandle() {
        return this.mNativeHandle;
    }

    @Override // android.os.Parcelable
    public synchronized void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.mNativeHandle);
    }

    public boolean is180Scan() {
        int scanType = getScanType();
        return scanType == 256 || scanType == 1;
    }
}
