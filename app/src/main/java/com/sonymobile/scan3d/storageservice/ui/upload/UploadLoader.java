package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import androidx.loader.content.AsyncTaskLoader;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.Upload;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

/* JADX INFO: loaded from: classes.dex */
class UploadLoader extends AsyncTaskLoader<UploadData> {
    private final Action mAction;
    private UploadData mData;
    private final boolean mIsShared;
    private final ServiceProvider mServiceProvider;
    private final Uri mUri;

    UploadLoader(Context context, Intent intent, ServiceProvider serviceProvider) {
        super(context);
        this.mUri = intent.getData();
        this.mServiceProvider = serviceProvider;
        this.mAction = Action.getAction(intent.getAction());
        Shareable shareable = new Shareable(intent.getBundleExtra(ActionActivity.EXTRA_SHAREABLE));
        switch (this.mAction) {
            case SHARE:
                this.mIsShared = shareable.isShared() && shareable.getShareType() != Shareable.Type.PROPS;
                break;
            case UNSHARE:
                this.mIsShared = true;
                break;
            default:
                this.mIsShared = shareable.isShared();
                break;
        }
    }

    @Override // androidx.loader.content.AsyncTaskLoader
    public UploadData loadInBackground() {
        Context context = getContext();
        Upload upload = Factory.getUpload(context, this.mUri, this.mServiceProvider);
        boolean z = upload != null && this.mServiceProvider.isValid(context, upload, this.mAction) && this.mIsShared;
        if (upload != null && upload.isFinished() && !z) {
            Uri uploadUri = getUploadUri(upload.getId());
            ContentValues contentValues = new ContentValues(1);
            contentValues.put("state", (Integer) (-1));
            context.getContentResolver().update(uploadUri, contentValues, null, null);
            upload = Factory.getUpload(context, this.mUri, this.mServiceProvider);
        }
        return new UploadData(upload, z, this.mAction);
    }

    @Override // androidx.loader.content.Loader
    protected void onStartLoading() {
        super.onStartLoading();
        UploadData uploadData = this.mData;
        if (uploadData != null) {
            deliverResult(uploadData);
        } else {
            forceLoad();
        }
    }

    @Override // androidx.loader.content.Loader
    protected void onStopLoading() {
        cancelLoad();
    }

    @Override // androidx.loader.content.Loader
    public void deliverResult(UploadData uploadData) {
        if (isReset()) {
            return;
        }
        this.mData = uploadData;
        if (isStarted()) {
            super.deliverResult(this.mData);
        }
    }

    private Uri getUploadUri(long j) {
        return this.mUri.buildUpon().appendPath("upload").appendPath(String.valueOf(j)).build();
    }
}
