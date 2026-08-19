package com.sonymobile.scan3d.storageservice.provider;

import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
class FileSet implements IFileSet {
    public static final Parcelable.Creator<FileSet> CREATOR = new Parcelable.Creator<FileSet>() { // from class: com.sonymobile.scan3d.storageservice.provider.FileSet.1
        @Override // android.os.Parcelable.Creator
        public FileSet createFromParcel(Parcel parcel) {
            return new FileSet(parcel);
        }
        @Override // android.os.Parcelable.Creator
        public FileSet[] newArray(int i) {
            return new FileSet[i];
        }
    };
    private static final String PATTERN = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
    private Date mCreated;
    private boolean mDownloadable;
    private String mEtag;
    private long mId;
    private String mIdentifier;
    private boolean mIsImprovement;
    private boolean mIsRiggable;
    private int mLogTransferId;
    private String mLogUrl;
    private String mName;
    private String mPreviewUrl;
    private String mPropFileUrl;
    private String mRiggedFileUrl;
    private String mRiggedPreviewUrl;
    private int mScanType;
    private String mShareHash;
    private int mSharedMeshes;
    private int mSyncState;
    private int mTransferFlags;
    private boolean mVisible;
    private String mZipFileUrl;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    FileSet() {
        this.mScanType = 0;
        this.mIsRiggable = true;
    }

    private FileSet(Parcel parcel) {
        this.mScanType = 0;
        this.mIsRiggable = true;
        this.mId = parcel.readLong();
        this.mZipFileUrl = parcel.readString();
        this.mPreviewUrl = parcel.readString();
        this.mRiggedFileUrl = parcel.readString();
        this.mRiggedPreviewUrl = parcel.readString();
        this.mPropFileUrl = parcel.readString();
        this.mName = parcel.readString();
        this.mSyncState = parcel.readInt();
        this.mEtag = parcel.readString();
        this.mIdentifier = parcel.readString();
        this.mCreated = parse(parcel.readString());
        this.mLogUrl = parcel.readString();
        this.mShareHash = parcel.readString();
        this.mVisible = parcel.readInt() > 0;
        this.mDownloadable = parcel.readInt() > 0;
        this.mTransferFlags = parcel.readInt();
        this.mScanType = parcel.readInt();
        this.mLogTransferId = parcel.readInt();
        this.mIsImprovement = parcel.readInt() > 0;
        this.mIsRiggable = parcel.readInt() > 0;
        this.mSharedMeshes = parcel.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.mId);
        parcel.writeString(this.mZipFileUrl);
        parcel.writeString(this.mPreviewUrl);
        parcel.writeString(this.mRiggedFileUrl);
        parcel.writeString(this.mRiggedPreviewUrl);
        parcel.writeString(this.mPropFileUrl);
        parcel.writeString(this.mName);
        parcel.writeInt(this.mSyncState);
        parcel.writeString(this.mEtag);
        parcel.writeString(this.mIdentifier);
        parcel.writeString(getCreatedString());
        parcel.writeString(this.mLogUrl);
        parcel.writeString(this.mShareHash);
        parcel.writeInt(this.mVisible ? 1 : 0);
        parcel.writeInt(this.mDownloadable ? 1 : 0);
        parcel.writeInt(this.mTransferFlags);
        parcel.writeInt(this.mScanType);
        parcel.writeInt(this.mLogTransferId);
        parcel.writeInt(this.mIsImprovement ? 1 : 0);
        parcel.writeInt(this.mIsRiggable ? 1 : 0);
        parcel.writeInt(this.mSharedMeshes);
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.IFileSet
    public Uri getUri() {
        return ContentUris.withAppendedId(Contract.FileRecord.CONTENT_URI, this.mId);
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.IFileSet
    public long getId() {
        return this.mId;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getName() {
        return this.mName;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getIdentifier() {
        return this.mIdentifier;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getZipFileUrl() {
        return this.mZipFileUrl;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isRemote() {
        int i = this.mSyncState;
        return i == 1 || i == 4;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public int getSyncState() {
        return this.mSyncState;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isSynced() {
        int i = this.mSyncState;
        return i == 2 || i == 6;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getPreviewUrl() {
        return this.mPreviewUrl;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getRiggedFileUrl() {
        return this.mRiggedFileUrl;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getRiggedPreviewUrl() {
        return this.mRiggedPreviewUrl;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getPropFileUrl() {
        return this.mPropFileUrl;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isValid() {
        if (isRemote()) {
            return true;
        }
        return new File(this.mZipFileUrl).exists() && new File(this.mPreviewUrl).exists();
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.IFileSet
    public int getTransferFlags() {
        return this.mTransferFlags;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public Date getCreated() {
        return this.mCreated;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getLogUrl() {
        return this.mLogUrl;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public List<File> getFiles() {
        ArrayList arrayList = new ArrayList();
        if (!isRemote()) {
            arrayList.add(new File(this.mZipFileUrl));
            arrayList.add(new File(this.mPreviewUrl));
            if (!TextUtils.isEmpty(this.mRiggedFileUrl)) {
                arrayList.add(new File(this.mRiggedFileUrl));
            }
            if (!TextUtils.isEmpty(this.mRiggedPreviewUrl)) {
                arrayList.add(new File(this.mRiggedPreviewUrl));
            }
            if (!TextUtils.isEmpty(this.mPropFileUrl)) {
                arrayList.add(new File(this.mPropFileUrl));
            }
            String str = this.mLogUrl;
            if (str != null) {
                arrayList.add(new File(str));
            }
        }
        return arrayList;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public int getScanType() {
        return this.mScanType;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isVisible() {
        return this.mVisible;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isDownloadable() {
        return this.mDownloadable;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public String getShareHash() {
        return this.mShareHash;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.IFileSet
    public int getTransferId() {
        return this.mLogTransferId;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isImprovement() {
        return this.mIsImprovement;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.IFileSet
    public boolean isImprovable(Context context) {
        return !(this.mLogUrl == null && (this.mTransferFlags & 8) == 0) && Config.isPostProcessEnabled(context);
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isRiggable() {
        return this.mIsRiggable;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean isRigged() {
        return !TextUtils.isEmpty(this.mRiggedFileUrl);
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public int getSharedMeshes() {
        return this.mSharedMeshes;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public ContentValues toContentValues() {
        ContentValues contentValues = new ContentValues(15);
        contentValues.put("name", this.mName);
        contentValues.put(Contract.FileRecord.COLUMN_IDENTIFIER, this.mIdentifier);
        contentValues.put("created", getCreatedString());
        contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, Integer.valueOf(this.mSyncState));
        contentValues.put(Contract.FileRecord.COLUMN_ETAG, this.mEtag);
        contentValues.put(Contract.FileRecord.COLUMN_THUMBNAIL_URL, this.mPreviewUrl);
        contentValues.put("url", this.mZipFileUrl);
        contentValues.put(Contract.FileRecord.COLUMN_LOG_URL, this.mLogUrl);
        contentValues.put(Contract.FileRecord.COLUMN_SHARE_HASH, this.mShareHash);
        contentValues.put(Contract.FileRecord.COLUMN_DOWNLOADABLE, Boolean.valueOf(this.mDownloadable));
        contentValues.put(Contract.FileRecord.COLUMN_VISIBLE, Boolean.valueOf(this.mVisible));
        contentValues.put("scan_type", Integer.valueOf(this.mScanType));
        contentValues.put(Contract.FileRecord.COLUMN_LOG_TRANSFER_ID, Integer.valueOf(this.mLogTransferId));
        contentValues.put(Contract.FileRecord.COLUMN_IMPROVEMENT, Boolean.valueOf(this.mIsImprovement));
        contentValues.put(Contract.FileRecord.COLUMN_IS_RIGGABLE, Boolean.valueOf(this.mIsRiggable));
        contentValues.put(Contract.FileRecord.COLUMN_SHARED_MESHES, Integer.valueOf(this.mSharedMeshes));
        return contentValues;
    }

    @Override // com.sonymobile.scan3d.storageservice.provider.ITransientFileSet
    public boolean deleteAllFiles(Context context) {
        if (isRemote()) {
            return false;
        }
        File resultsDirectory = FsUtils.getResultsDirectory(context, this.mIdentifier);
        return resultsDirectory.exists() && FsUtils.deleteFiles(resultsDirectory, true);
    }

    private String getCreatedString() {
        return format(this.mCreated);
    }

    void setTransferFlags(int i) {
        this.mTransferFlags = i;
    }

    void setShareHash(String str) {
        this.mShareHash = str;
    }

    void setVisible(boolean z) {
        this.mVisible = z;
    }

    void setDownloadable(boolean z) {
        this.mDownloadable = z;
    }

    void setLogUrl(String str) {
        this.mLogUrl = str;
    }

    void setId(long j) {
        this.mId = j;
    }

    void setIdentifier(String str) {
        this.mIdentifier = str;
    }

    void setSyncState(int i) {
        this.mSyncState = i;
    }

    void setName(String str) {
        this.mName = str;
    }

    void setZipFileUrl(String str) {
        this.mZipFileUrl = str;
    }

    void setPreviewUrl(String str) {
        this.mPreviewUrl = str;
    }

    void setRiggedFileUrl(String str) {
        this.mRiggedFileUrl = str;
    }

    void setRiggedPreviewUrl(String str) {
        this.mRiggedPreviewUrl = str;
    }

    void setPropFileUrl(String str) {
        this.mPropFileUrl = str;
    }

    void setEtag(String str) {
        this.mEtag = str;
    }

    void setCreated(String str) {
        this.mCreated = parse(str);
    }

    void setCreated(Date date) {
        this.mCreated = date;
    }

    void setScanType(int i) {
        this.mScanType = i;
        int i2 = this.mScanType;
        if (i2 == 257 || i2 == 256) {
            return;
        }
        this.mIsRiggable = false;
    }

    void setLogTransferId(int i) {
        this.mLogTransferId = i;
    }

    void setIsImprovement(boolean z) {
        this.mIsImprovement = z;
    }

    void setIsRiggable(boolean z) {
        this.mIsRiggable = z;
    }

    void setSharedMeshes(int i) {
        this.mSharedMeshes = i;
    }

    private Date parse(String str) {
        try {
            return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US).parse(str);
        } catch (ParseException unused) {
            return new Date();
        }
    }

    private String format(Date date) {
        if (date != null) {
            return new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", Locale.US).format(date);
        }
        return null;
    }
}
