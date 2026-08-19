package com.sonymobile.scan3d.storageservice.content;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
final class Downloader implements SyncTransfer {
    private final Context mContext;
    private final IFileSet mFileSet;
    private final KeyPair mKeys;

    Downloader(Context context, IFileSet iFileSet, KeyPair keyPair) {
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
            contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 4);
            this.mContext.getContentResolver().update(uri, contentValues, null, null);
            boolean zDownload = download(authToken);
            ContentValues contentValues2 = new ContentValues(1);
            if (zDownload) {
                contentValues2.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 2);
            } else {
                contentValues2.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 1);
            }
            this.mContext.getContentResolver().update(uri, contentValues2, null, null);
            return zDownload;
        } catch (Throwable th) {
            ContentValues contentValues3 = new ContentValues(1);
            contentValues3.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 1);
            this.mContext.getContentResolver().update(uri, contentValues3, null, null);
            throw th;
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean isValid() {
        int syncState = this.mFileSet.getSyncState();
        return syncState == 1 || syncState == 4;
    }

    private boolean download(String str) throws NetworkException {
        int transferFlags = this.mFileSet.getTransferFlags();
        boolean zNotifyProvider = true;
        for (SyncHubApi.Downloadable downloadable : SyncHubApi.getDownloadableContent(this.mContext)) {
            if (!downloadable.isTransferred(transferFlags)) {
                File fileDownload = downloadable.download(this.mFileSet, this.mKeys, str);
                transferFlags |= downloadable.getTransferFlag();
                zNotifyProvider = notifyProvider(this.mFileSet.getUri(), downloadable, fileDownload, transferFlags);
                if (!zNotifyProvider) {
                    break;
                }
            }
        }
        return zNotifyProvider;
    }

    private boolean notifyProvider(Uri uri, SyncHubApi.Downloadable downloadable, File file, int i) {
        boolean z = file != null && file.exists();
        if (!z) {
            return z;
        }
        ContentValues contentValues = new ContentValues(2);
        contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(i));
        switch (downloadable.getType()) {
            case 0:
                contentValues.put(Contract.FileRecord.COLUMN_THUMBNAIL_URL, file.getAbsolutePath());
                break;
            case 1:
                contentValues.put("url", file.getAbsolutePath());
                break;
            default:
                throw new IllegalArgumentException("Unsupported content " + downloadable);
        }
        return this.mContext.getContentResolver().update(uri, contentValues, null, null) > 0;
    }
}
