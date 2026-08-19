package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.app.job.JobWorkItem;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.DriveActions;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import java.security.GeneralSecurityException;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
final class ExecuteImprovementTask extends AwsTask {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.ExecuteImprovementTask";

    ExecuteImprovementTask(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, true, false, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) throws AwsSessionException {
        try {
            KeyPair keyPairExecuteWait = DriveActions.getKeys(context).executeWait();
            JobWorkItem jobWorkItemDequeueWork = jobParameters.dequeueWork();
            while (!isCancelled() && jobWorkItemDequeueWork != null) {
                if (handleWorkItem(context, jobWorkItemDequeueWork, keyPairExecuteWait, awsSession)) {
                    jobParameters.completeWork(jobWorkItemDequeueWork);
                }
                jobWorkItemDequeueWork = jobParameters.dequeueWork();
            }
        } catch (InterruptedException | ExecutionException e) {
            DebugLog.d(TAG, "doWork(): failure.", e);
        }
    }

    private boolean handleWorkItem(Context context, JobWorkItem jobWorkItem, KeyPair keyPair, AwsSession awsSession) throws AwsSessionException {
        ContentResolver contentResolver = context.getContentResolver();
        Bundle extras = jobWorkItem.getIntent().getExtras();
        Uri uriWithAppendedId = ContentUris.withAppendedId(Contract.ImprovementRecord.CONTENT_URI, extras.getLong("com.sonymobile.scan3d.extra.improvement_id"));
        String string = extras.getString("com.sonymobile.scan3d.extra.improvement_type");
        String string2 = extras.getString("com.sonymobile.scan3d.extra.server_key");
        String string3 = extras.getString("com.sonymobile.scan3d.extra.session_id");
        int i = extras.getInt("com.sonymobile.scan3d.extra.protocol_version", 0);
        Improvement improvement = Factory.getImprovement(context, uriWithAppendedId);
        if (improvement == null) {
            return true;
        }
        IFileSet iFileSetCreate = Factory.create(context, improvement.getParentUri());
        if (iFileSetCreate != null) {
            String aESEncrypted = getAESEncrypted(string2, keyPair.getEncryptionKey());
            if (aESEncrypted == null) {
                return true;
            }
            String strPostExecuteImprovementJob = awsSession.postExecuteImprovementJob(string, iFileSetCreate, string3, aESEncrypted, i);
            if (strPostExecuteImprovementJob == null) {
                return false;
            }
            updateImprovementRecord(contentResolver, uriWithAppendedId, strPostExecuteImprovementJob);
            return true;
        }
        contentResolver.delete(uriWithAppendedId, null, null);
        return true;
    }

    private void updateImprovementRecord(ContentResolver contentResolver, Uri uri, String str) {
        ContentValues contentValues = new ContentValues(1);
        contentValues.put(Contract.ImprovementRecord.COLUMN_SQS_MESSAGE_ID, str);
        contentResolver.update(uri, contentValues, null, null);
    }

    private static String getAESEncrypted(String str, String str2) {
        try {
            return Vault.encryptWithServerKey(str, str2);
        } catch (GeneralSecurityException unused) {
            DebugLog.d(TAG, "Could not encrypt.");
            return null;
        }
    }
}
