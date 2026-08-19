package com.sonymobile.scan3d.storageservice.ui.upload.webviewer;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.DriveActionsUtil;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.network.IRestExecutor;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import com.sonymobile.scan3d.storageservice.ui.upload.Action;
import com.sonymobile.scan3d.storageservice.ui.upload.ActionActivity;
import com.sonymobile.scan3d.storageservice.ui.upload.ActionTask;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public class WebViewerActionTask extends ActionTask {
    private static final int MAX_RETRIES = 3;
    private static final long POLL_TIME = TimeUnit.SECONDS.toMillis(5);
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.upload.webviewer.WebViewerActionTask";
    private String mShareUid;
    private int mSharedMeshes;

    public WebViewerActionTask(ServiceProvider serviceProvider, IFileSet iFileSet, Credentials credentials, Action action, Uri uri, Bundle bundle) {
        super(serviceProvider, iFileSet, credentials, action, uri, bundle);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public int getOngoingText(Action action) {
        return action == Action.UNSHARE ? R.string.unsharing_model_txt : super.getOngoingText(action);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public int getCompletedText(Action action) {
        return action == Action.UNSHARE ? R.string.unshare_complete_txt : super.getCompletedText(action);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public int getFailedText(Action action) {
        return action == Action.UNSHARE ? R.string.unshare_failed_txt : super.getFailedText(action);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public int getFailedTitle(Action action) {
        return action == Action.UNSHARE ? R.string.service_unshare_failed_title : super.getFailedTitle(action);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public int getNoFurtherActionText(Action action) {
        return action == Action.UNSHARE ? R.string.upload_unshare_txt : super.getNoFurtherActionText(action);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public ActionTask.ActionResult execute(Context context, Action action, IFileSet iFileSet, Credentials credentials, Bundle bundle) {
        Shareable shareable = new Shareable(bundle.getBundle(ActionActivity.EXTRA_SHAREABLE));
        switch (action) {
            case SHARE:
                return share(context, iFileSet, credentials, shareable);
            case UNSHARE:
                return unshare(context, iFileSet, credentials);
            default:
                return new ActionTask.ActionResult(false, null);
        }
    }

    private ActionTask.ActionResult share(Context context, IFileSet iFileSet, Credentials credentials, Shareable shareable) {
        boolean zUploadPublicly;
        String token = credentials.getToken();
        try {
            if (iFileSet.isSynced()) {
                zUploadPublicly = uploadPublicly(context, iFileSet, token, shareable);
            } else if (uploadPrivately(context, iFileSet, token)) {
                ContentValues contentValues = new ContentValues(1);
                contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 2);
                context.getContentResolver().update(iFileSet.getUri(), contentValues, null, null);
                zUploadPublicly = uploadPublicly(context, iFileSet, token, shareable);
            } else {
                zUploadPublicly = false;
            }
            if (zUploadPublicly) {
                ContentValues contentValues2 = new ContentValues(3);
                contentValues2.put(Contract.FileRecord.COLUMN_VISIBLE, (Boolean) true);
                contentValues2.put(Contract.FileRecord.COLUMN_SHARE_HASH, this.mShareUid);
                contentValues2.put(Contract.FileRecord.COLUMN_SHARED_MESHES, Integer.valueOf(this.mSharedMeshes));
                context.getContentResolver().update(iFileSet.getUri(), contentValues2, null, null);
            }
        } catch (Exception e) {
            DebugLog.e(TAG, "share(): Sharing failed", e);
            zUploadPublicly = false;
        }
        return new ActionTask.ActionResult(zUploadPublicly, this.mShareUid);
    }

    private ActionTask.ActionResult unshare(Context context, IFileSet iFileSet, Credentials credentials) {
        boolean zBooleanValue;
        Exception e;
        try {
            zBooleanValue = SyncHubApi.unshareModel(context, iFileSet.getIdentifier(), credentials.getToken()).execute().booleanValue();
            if (zBooleanValue) {
                try {
                    ContentValues contentValues = new ContentValues(2);
                    contentValues.put(Contract.FileRecord.COLUMN_VISIBLE, (Boolean) false);
                    contentValues.put(Contract.FileRecord.COLUMN_SHARED_MESHES, (Integer) 0);
                    context.getContentResolver().update(iFileSet.getUri(), contentValues, null, null);
                } catch (Exception eCaught) {
                    e = eCaught;
                    DebugLog.e(TAG, "unshare(): Unsharing failed", e);
                }
            }
        } catch (Exception e2) {
            e = e2;
            zBooleanValue = false;
            DebugLog.e(TAG, "unshare(): Unsharing failed", e);
        }
        return new ActionTask.ActionResult(zBooleanValue, null);
    }

    private static boolean uploadPrivately(Context context, IFileSet iFileSet, String str) throws Exception {
        int transferFlags = iFileSet.getTransferFlags();
        Uri uri = iFileSet.getUri();
        KeyPair keysExecuteWait = DriveActionsUtil.getKeysExecuteWait(context);
        for (SyncHubApi.Uploadable uploadable : SyncHubApi.getUploadableContent(context)) {
            if (!uploadable.isTransferred(transferFlags)) {
                if (!uploadable.upload(iFileSet, keysExecuteWait, str)) {
                    return false;
                }
                transferFlags |= uploadable.getTransferFlag();
                ContentValues contentValues = new ContentValues(1);
                contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(transferFlags));
                context.getContentResolver().update(uri, contentValues, null, null);
            }
        }
        return true;
    }

    private boolean uploadPublicly(Context context, IFileSet iFileSet, String str, Shareable shareable) throws Exception {
        this.mSharedMeshes = iFileSet.getSharedMeshes();
        if (!waitUntilAvailablePrivately(context, iFileSet, str)) {
            return false;
        }
        boolean z = false;
        for (SyncHubApi.PublicUploadable publicUploadable : SyncHubApi.getPublicUploads(context, shareable)) {
            if (!publicUploadable.upload(iFileSet, str)) {
                return false;
            }
            int type = publicUploadable.getType();
            if (type != 1) {
                switch (type) {
                    case 4:
                    case 5:
                        this.mSharedMeshes = (1 << type) | this.mSharedMeshes;
                        break;
                }
            } else {
                this.mSharedMeshes = (1 << type) | this.mSharedMeshes;
            }
            String shareUid = publicUploadable.getShareUid();
            if (shareUid != null) {
                this.mShareUid = shareUid;
            }
            z = true;
        }
        return z;
    }

    private static boolean waitUntilAvailablePrivately(Context context, IFileSet iFileSet, String str) throws NetworkException, InterruptedException {
        boolean z;
        IRestExecutor<Map<String, ITransientFileSet>> iRestExecutorListMetadata = SyncHubApi.listMetadata(context, str);
        int i = 0;
        do {
            Thread.sleep(POLL_TIME);
            Map<String, ITransientFileSet> mapExecute = iRestExecutorListMetadata.execute();
            z = mapExecute != null && mapExecute.containsKey(iFileSet.getIdentifier());
            if (z) {
                break;
            }
            i++;
        } while (i < 3);
        return z;
    }
}
