package com.sonymobile.scan3d.storageservice.content;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;

/* JADX INFO: loaded from: classes.dex */
class Modifier implements SyncTransfer {
    private final Context mContext;
    private final IFileSet mFileSet;

    Modifier(Context context, IFileSet iFileSet) {
        this.mContext = context;
        this.mFileSet = iFileSet;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean transfer() throws Exception {
        String authToken = AccountUtils.getAuthToken(this.mContext, false);
        if (authToken == null) {
            return false;
        }
        boolean zBooleanValue = SyncHubApi.updateMetadata(this.mContext, authToken, this.mFileSet).execute().booleanValue();
        if (!zBooleanValue) {
            return zBooleanValue;
        }
        Uri uri = this.mFileSet.getUri();
        ContentValues contentValues = new ContentValues(1);
        contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 2);
        return this.mContext.getContentResolver().update(uri, contentValues, null, null) > 0;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean isValid() {
        return this.mFileSet.getSyncState() == 6;
    }
}
