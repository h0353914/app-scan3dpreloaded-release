package com.sonymobile.scan3d.storageservice.ui.upload;

import android.os.Parcel;
import android.os.Parcelable;
import com.sonymobile.scan3d.storageservice.provider.Upload;

/* JADX INFO: loaded from: classes.dex */
class UploadData implements Parcelable {
    public static final Parcelable.Creator<UploadData> CREATOR = new Parcelable.Creator<UploadData>() { // from class: com.sonymobile.scan3d.storageservice.ui.upload.UploadData.1
        @Override // android.os.Parcelable.Creator
        public UploadData createFromParcel(Parcel parcel) {
            return new UploadData(parcel);
        }

        @Override // android.os.Parcelable.Creator
        public UploadData[] newArray(int i) {
            return new UploadData[i];
        }
    };
    private final Action mAction;
    private final boolean mIsValid;
    private final Upload mUpload;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    UploadData(Upload upload, boolean z, Action action) {
        this.mUpload = upload;
        this.mIsValid = z;
        this.mAction = action;
    }

    private UploadData(Parcel parcel) {
        this.mUpload = (Upload) parcel.readParcelable(Upload.class.getClassLoader());
        this.mAction = Action.valueOf(parcel.readString());
        this.mIsValid = parcel.readInt() > 0;
    }

    Upload getUpload() {
        return this.mUpload;
    }

    Action getAction() {
        return this.mAction;
    }

    boolean isValid() {
        return this.mIsValid;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeParcelable(this.mUpload, 0);
        parcel.writeString(this.mAction.name());
        parcel.writeInt(this.mIsValid ? 1 : 0);
    }
}
