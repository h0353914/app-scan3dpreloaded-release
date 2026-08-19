package com.sonymobile.scan3d.storageservice.provider;

import android.content.ContentUris;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;

public final class Improvement implements Parcelable {
    public static final Parcelable.Creator<Improvement> CREATOR = new Parcelable.Creator<Improvement>() {
        @Override
        public Improvement createFromParcel(Parcel in) {
            return new Improvement(in);
        }

        @Override
        public Improvement[] newArray(int size) {
            return new Improvement[size];
        }
    };

    private int mFailState;
    private long mFileSetId;
    private long mId;
    private String mImprovementType;
    private String mMessageId;
    private String mName;
    private long mParentId;
    private String mS3Path;
    private int mScanType;

    Improvement() {
    }

    private Improvement(Parcel in) {
        mParentId = in.readLong();
        mName = in.readString();
        mS3Path = in.readString();
        mImprovementType = in.readString();
        mId = in.readLong();
        mFileSetId = in.readLong();
        mMessageId = in.readString();
        mScanType = in.readInt();
        mFailState = in.readInt();
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public int getFailState() {
        return mFailState;
    }

    public long getFileSetId() {
        return mFileSetId;
    }

    public Uri getFileSetUri() {
        return ContentUris.withAppendedId(Contract.FileRecord.CONTENT_URI, mFileSetId);
    }

    public long getId() {
        return mId;
    }

    public String getName() {
        return mName;
    }

    public Uri getParentUri() {
        return ContentUris.withAppendedId(Contract.FileRecord.CONTENT_URI, mParentId);
    }

    public String getS3Path() {
        return mS3Path;
    }

    public int getScanType() {
        return mScanType;
    }

    public Uri getUri() {
        return ContentUris.withAppendedId(Contract.ImprovementRecord.CONTENT_URI, mId);
    }

    public boolean isDownloadable() {
        return mFileSetId <= 0 && mS3Path != null && mFailState == Contract.ImprovementRecord.NO_FAILURE;
    }

    public boolean isFailed() {
        return mFailState != Contract.ImprovementRecord.NO_FAILURE;
    }

    public boolean isImproved() {
        return mFailState == Contract.ImprovementRecord.NO_FAILURE && mFileSetId > 0;
    }

    public boolean isWaiting() {
        return mFileSetId <= 0 && mS3Path == null && mFailState == Contract.ImprovementRecord.NO_FAILURE;
    }

    void setFailState(int failState) {
        mFailState = failState;
    }

    void setFileSetId(long fileSetId) {
        mFileSetId = fileSetId;
    }

    void setId(long id) {
        mId = id;
    }

    void setMessageId(String messageId) {
        mMessageId = messageId;
    }

    void setName(String name) {
        mName = name;
    }

    void setParentId(long parentId) {
        mParentId = parentId;
    }

    void setS3Path(String s3Path) {
        mS3Path = s3Path;
    }

    void setScanType(int scanType) {
        mScanType = scanType;
    }

    void setType(String type) {
        mImprovementType = type;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeLong(mParentId);
        dest.writeString(mName);
        dest.writeString(mS3Path);
        dest.writeString(mImprovementType);
        dest.writeLong(mId);
        dest.writeLong(mFileSetId);
        dest.writeString(mMessageId);
        dest.writeInt(mScanType);
        dest.writeInt(mFailState);
    }
}
