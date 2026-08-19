package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.ContentProviderOperation;
import android.content.Context;
import android.content.OperationApplicationException;
import android.os.RemoteException;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import java.util.ArrayList;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
final class DeleteAllContentTask extends Task {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.DeleteAllContentTask";

    DeleteAllContentTask(TaskService taskService, JobParameters jobParameters) {
        super(taskService, jobParameters, false, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void doWork(Context context, JobParameters jobParameters) {
        String str;
        StringBuilder sb;
        boolean z = false;
        String authToken = AccountUtils.getAuthToken(context, false);
        if (authToken == null || !AccountUtils.isDeleteOngoing(context)) {
            return;
        }
        try {
            try {
                try {
                    Map<String, ITransientFileSet> mapExecute = SyncHubApi.listMetadata(context, authToken).execute();
                    if ((mapExecute != null && mapExecute.size() == 0) || SyncHubApi.deleteAllModels(context, authToken).execute().booleanValue()) {
                        ArrayList<ContentProviderOperation> arrayList = new ArrayList<>();
                        for (IFileSet iFileSet : Factory.create(context, null, null)) {
                            switch (iFileSet.getSyncState()) {
                                case 1:
                                case 4:
                                    arrayList.add(ContentProviderOperation.newDelete(iFileSet.getUri()).build());
                                    break;
                                case 2:
                                case 3:
                                case 6:
                                    arrayList.add(ContentProviderOperation.newUpdate(iFileSet.getUri()).withValue(Contract.FileRecord.COLUMN_SYNC_STATE, 0).withValue(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, 0).withValue(Contract.FileRecord.COLUMN_VISIBLE, false).withValue(Contract.FileRecord.COLUMN_IDENTIFIER, Vault.getSha1UniqueIdentifier()).build());
                                    break;
                                case 7:
                                case 10:
                                    if (iFileSet.deleteAllFiles(context)) {
                                        arrayList.add(ContentProviderOperation.newDelete(iFileSet.getUri()).build());
                                    }
                                    break;
                            }
                        }
                        arrayList.add(ContentProviderOperation.newDelete(Contract.ImprovementRecord.CONTENT_URI).build());
                        arrayList.add(ContentProviderOperation.newDelete(Contract.UploadRecord.CONTENT_URI).withSelection("provider=?", new String[]{ServiceProvider.WEBVIEWER.name()}).build());
                        context.getContentResolver().applyBatch("com.sonymobile.scan3d.storageprovider", arrayList);
                        z = true;
                    }
                    DebugLog.d(TAG, "doWork(): finished=" + z);
                    if (z) {
                        AccountUtils.removeAccount(context);
                        return;
                    }
                } catch (OperationApplicationException | RemoteException unused) {
                    DebugLog.d(TAG, "Failed updating the database.");
                    str = TAG;
                    sb = new StringBuilder();
                    sb.append("doWork(): finished=");
                    sb.append(false);
                    DebugLog.d(str, sb.toString());
                }
            } catch (NetworkException unused2) {
                DebugLog.d(TAG, "Failed to delete");
                str = TAG;
                sb = new StringBuilder();
                sb.append("doWork(): finished=");
                sb.append(false);
                DebugLog.d(str, sb.toString());
            }
            setReschedule(true);
        } catch (Throwable th) {
            DebugLog.d(TAG, "doWork(): finished=false");
            setReschedule(true);
            throw th;
        }
    }
}
