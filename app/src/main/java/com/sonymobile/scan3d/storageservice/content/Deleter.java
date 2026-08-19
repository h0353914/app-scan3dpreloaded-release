package com.sonymobile.scan3d.storageservice.content;

import android.content.Context;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;

/* JADX INFO: loaded from: classes.dex */
final class Deleter implements SyncTransfer {
    private final Context mContext;
    private final IFileSet mFileSet;

    Deleter(Context context, IFileSet iFileSet) {
        this.mContext = context;
        this.mFileSet = iFileSet;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean transfer() throws Exception {
        String authToken = AccountUtils.getAuthToken(this.mContext, false);
        return authToken != null && SyncHubApi.deleteModel(this.mContext, this.mFileSet.getIdentifier(), authToken).execute().booleanValue() && this.mContext.getContentResolver().delete(this.mFileSet.getUri(), null, null) > 0 && this.mFileSet.deleteAllFiles(this.mContext);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncTransfer
    public boolean isValid() {
        return this.mFileSet.getSyncState() == 7;
    }
}
