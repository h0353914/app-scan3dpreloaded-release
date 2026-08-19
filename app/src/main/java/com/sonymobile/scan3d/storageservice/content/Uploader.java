package com.sonymobile.scan3d.storageservice.content;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;

/* JADX INFO: loaded from: classes.dex */
class Uploader implements SyncTransfer {
    private final Context mContext;
    private final IFileSet mFileSet;
    private final KeyPair mKeys;

    Uploader(Context context, IFileSet iFileSet, KeyPair keyPair) {
        this.mContext = context;
        this.mFileSet = iFileSet;
        this.mKeys = keyPair;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean transfer() throws Exception {
        String authToken = AccountUtils.getAuthToken(this.mContext, false);
        if (authToken == null) {
            return false;
        }
        Uri uri = this.mFileSet.getUri();
        try {
            ContentValues contentValues = new ContentValues(1);
            contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 3);
            this.mContext.getContentResolver().update(uri, contentValues, null, null);
            boolean zUpload = upload(authToken);
            ContentValues contentValues2 = new ContentValues(1);
            if (zUpload) {
                contentValues2.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 2);
            } else {
                contentValues2.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
            }
            this.mContext.getContentResolver().update(uri, contentValues2, null, null);
            return zUpload;
        } catch (Throwable th) {
            ContentValues contentValues3 = new ContentValues(1);
            contentValues3.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
            this.mContext.getContentResolver().update(uri, contentValues3, null, null);
            throw th;
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean isValid() {
        int syncState = this.mFileSet.getSyncState();
        return syncState == 0 || syncState == 3 || syncState == 6;
    }

    private boolean upload(String str) throws Exception {
        int transferFlags = this.mFileSet.getTransferFlags();
        for (SyncHubApi.Uploadable uploadable : SyncHubApi.getUploadableContent(this.mContext)) {
            if (!uploadable.isTransferred(transferFlags)) {
                if (!uploadable.upload(this.mFileSet, this.mKeys, str)) {
                    return false;
                }
                transferFlags |= uploadable.getTransferFlag();
                ContentValues contentValues = new ContentValues(1);
                contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(transferFlags));
                this.mContext.getContentResolver().update(this.mFileSet.getUri(), contentValues, null, null);
            }
        }
        return true;
    }
}
