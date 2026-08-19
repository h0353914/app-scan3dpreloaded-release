package com.sonymobile.scan3d.storageservice.provider;

import android.os.Parcel;
import android.os.Parcelable;

public final class Upload implements Parcelable {
    public static final Parcelable.Creator<Upload> CREATOR = new Parcelable.Creator<Upload>() {
        @Override
        public Upload createFromParcel(Parcel in) {
            return new Upload(in);
        }

        @Override
        public Upload[] newArray(int size) {
            return new Upload[size];
        }
    };

    private long mId;
    private int mState;
    private String mUid;

    Upload() {
    }

    private Upload(Parcel in) {
        mId = in.readLong();
        mState = in.readInt();
        mUid = in.readString();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public long getId() {
        return mId;
    }

    public String getUid() {
        return mUid;
    }

    public boolean isActive() {
        return isRunning() || isPending();
    }

    public boolean isFailed() {
        return mState == Contract.UploadRecord.STATE_FAILED;
    }

    public boolean isFinished() {
        return isFailed() || isUploaded();
    }

    public boolean isPending() {
        return mState == Contract.UploadRecord.STATE_PENDING;
    }

    public boolean isRunning() {
        return mState == Contract.UploadRecord.STATE_RUNNING;
    }

    public boolean isUploaded() {
        return mState == Contract.UploadRecord.STATE_SUCCESS;
    }

    void setId(long id) {
        mId = id;
    }

    void setState(int state) {
        mState = state;
    }

    void setUid(String uid) {
        mUid = uid;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeLong(mId);
        dest.writeInt(mState);
        dest.writeString(mUid);
    }
}
