package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.ContentProviderClient;
import android.content.ContentProviderOperation;
import android.content.ContentValues;
import android.content.Context;
import android.content.OperationApplicationException;
import android.net.Uri;
import android.os.RemoteException;
import android.text.TextUtils;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.content.aws.GeneralAwsException;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import com.sonymobile.scan3d.storageservice.network.PostProcessApi;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
final class SyncAdapter extends AbstractAuthenticatedSyncAdapter {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.SyncAdapter";

    private static boolean isLogUploaded(int i) {
        return (i & 8) != 0;
    }

    SyncAdapter(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AbstractAuthenticatedSyncAdapter
    public boolean onAuthenticatedSync(Context context, AwsSession awsSession, ContentProviderClient contentProviderClient, String str) throws NetworkException, AwsSessionException, InterruptedException, RemoteException, GeneralAwsException, OperationApplicationException, ExecutionException {
        Iterator<IFileSet> it;
        DebugLog.d(TAG, "onAuthenticatedSync(): Start");
        SyncTransaction syncTransaction = new SyncTransaction();
        Map<String, IFileSet> mapCreateMap = Factory.createMap(contentProviderClient);
        Map<String, ITransientFileSet> mapExecute = SyncHubApi.listMetadata(context, str).execute();
        List<String> listListLogs = PostProcessApi.listLogs(context, awsSession);
        if (mapExecute != null) {
            Iterator<IFileSet> it2 = mapCreateMap.values().iterator();
            while (it2.hasNext()) {
                IFileSet next = it2.next();
                Uri uri = next.getUri();
                String identifier = next.getIdentifier();
                int syncState = next.getSyncState();
                int transferFlags = next.getTransferFlags();
                ITransientFileSet iTransientFileSet = mapExecute.get(identifier);
                if (iTransientFileSet != null) {
                    if (!isLogUploaded(transferFlags) && listListLogs.contains(identifier)) {
                        syncTransaction.addContentProviderOperation(ContentProviderOperation.newUpdate(uri).withValue(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(transferFlags | 8)).build());
                    } else if (isLogUploaded(transferFlags) && !listListLogs.contains(identifier)) {
                        syncTransaction.addContentProviderOperation(ContentProviderOperation.newUpdate(uri).withValue(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(transferFlags & (-9))).build());
                    }
                    switch (syncState) {
                        case 0:
                            it = it2;
                            DebugLog.d(TAG, "onAuthenticatedSync(): Found local file.");
                            syncTransaction.addContentProviderOperation(ContentProviderOperation.newUpdate(uri).withValue(Contract.FileRecord.COLUMN_SYNC_STATE, 0).build());
                            break;
                        case 1:
                            it = it2;
                            DebugLog.d(TAG, "onAuthenticatedSync(): Found server file.");
                            syncTransaction.addDownloadOperation(next);
                            break;
                        case 2:
                            DebugLog.d(TAG, "onAuthenticatedSync(): Found synced file.");
                            if (next.isValid()) {
                                String name = next.getName();
                                String name2 = iTransientFileSet.getName();
                                boolean zIsVisible = next.isVisible();
                                boolean zIsVisible2 = iTransientFileSet.isVisible();
                                String shareHash = iTransientFileSet.getShareHash();
                                int sharedMeshes = next.getSharedMeshes();
                                int sharedMeshes2 = iTransientFileSet.getSharedMeshes();
                                it = it2;
                                ContentValues contentValues = new ContentValues(4);
                                if (!TextUtils.equals(name, name2)) {
                                    contentValues.put("name", name2);
                                }
                                if (zIsVisible2 && sharedMeshes2 != sharedMeshes) {
                                    contentValues.put(Contract.FileRecord.COLUMN_SHARED_MESHES, Integer.valueOf(sharedMeshes2));
                                }
                                if (zIsVisible != zIsVisible2) {
                                    contentValues.put(Contract.FileRecord.COLUMN_VISIBLE, Boolean.valueOf(zIsVisible2));
                                    contentValues.put(Contract.FileRecord.COLUMN_SHARE_HASH, shareHash);
                                    contentValues.put(Contract.FileRecord.COLUMN_SHARED_MESHES, Integer.valueOf(sharedMeshes2));
                                    Uri uriWithAppendedPath = Uri.withAppendedPath(uri, "upload");
                                    if (zIsVisible2) {
                                        ContentValues contentValues2 = new ContentValues(3);
                                        contentValues2.put(Contract.UploadRecord.COLUMN_PROVIDER, ServiceProvider.WEBVIEWER.name());
                                        contentValues2.put(Contract.UploadRecord.COLUMN_UID, shareHash);
                                        contentValues2.put("state", (Integer) 2);
                                        syncTransaction.addContentProviderOperation(ContentProviderOperation.newInsert(uriWithAppendedPath).withValues(contentValues2).build());
                                    } else {
                                        syncTransaction.addContentProviderOperation(ContentProviderOperation.newDelete(uriWithAppendedPath).withSelection("provider=?", new String[]{ServiceProvider.WEBVIEWER.name()}).build());
                                    }
                                }
                                if (contentValues.size() > 0) {
                                    syncTransaction.addContentProviderOperation(ContentProviderOperation.newUpdate(uri).withValues(contentValues).build());
                                }
                            } else {
                                it = it2;
                                next.deleteAllFiles(context);
                                ContentValues contentValues3 = new ContentValues(2);
                                contentValues3.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 1);
                                contentValues3.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, (Integer) (-1));
                                syncTransaction.addContentProviderOperation(ContentProviderOperation.newUpdate(uri).withValues(contentValues3).build());
                                syncTransaction.addDownloadOperation(next);
                            }
                            break;
                        case 3:
                        case 5:
                        default:
                            it = it2;
                            DebugLog.d(TAG, "onAuthenticatedSync(): Nothing to do for " + identifier);
                            break;
                        case 4:
                            syncTransaction.addDownloadOperation(next);
                            it = it2;
                            break;
                        case 6:
                            syncTransaction.addModifyOperation(next);
                            it = it2;
                            break;
                        case 7:
                            syncTransaction.addDeleteOperation(next);
                            PostProcessApi.deleteLog(context, awsSession, next);
                            it = it2;
                            break;
                    }
                    mapExecute.remove(identifier);
                } else {
                    it = it2;
                    switch (syncState) {
                        case 0:
                        case 6:
                            syncTransaction.addUploadOperation(next);
                            break;
                        case 1:
                        case 2:
                        case 4:
                        case 7:
                            DebugLog.d(TAG, "onAuthenticatedSync(): Found server file for " + identifier + ", removing it.");
                            next.deleteAllFiles(context);
                            syncTransaction.addContentProviderOperation(ContentProviderOperation.newDelete(uri).build());
                            PostProcessApi.deleteLog(context, awsSession, next);
                            break;
                        case 3:
                            syncTransaction.addUploadOperation(next);
                            break;
                        case 5:
                        default:
                            DebugLog.d(TAG, "onAuthenticatedSync(): Nothing to do for local file " + identifier + " with sync state " + syncState);
                            break;
                    }
                }
                it2 = it;
            }
            for (ITransientFileSet iTransientFileSet2 : mapExecute.values()) {
                String identifier2 = iTransientFileSet2.getIdentifier();
                ContentValues contentValues4 = iTransientFileSet2.toContentValues();
                contentValues4.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 1);
                if (listListLogs.contains(identifier2)) {
                    contentValues4.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, (Integer) 8);
                }
                int iAddContentProviderOperation = syncTransaction.addContentProviderOperation(ContentProviderOperation.newInsert(Contract.FileRecord.CONTENT_URI).withValues(contentValues4).build());
                if (iTransientFileSet2.isVisible()) {
                    ContentValues contentValues5 = new ContentValues(3);
                    contentValues5.put(Contract.UploadRecord.COLUMN_PROVIDER, ServiceProvider.WEBVIEWER.name());
                    contentValues5.put(Contract.UploadRecord.COLUMN_UID, iTransientFileSet2.getShareHash());
                    contentValues5.put("state", (Integer) 2);
                    syncTransaction.addContentProviderOperation(ContentProviderOperation.newInsert(Contract.UploadRecord.CONTENT_URI).withValueBackReference("parent_id", iAddContentProviderOperation).withValues(contentValues5).build());
                }
            }
        }
        DebugLog.d(TAG, "onAuthenticatedSync(): End");
        return syncTransaction.apply(context, contentProviderClient);
    }
}
