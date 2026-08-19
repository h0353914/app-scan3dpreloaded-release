package com.sonymobile.scan3d.storageservice.content;

import android.app.Notification;
import android.app.job.JobParameters;
import android.app.job.JobWorkItem;
import android.content.ContentResolver;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.DriveActions;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.content.aws.GeneralAwsException;
import com.sonymobile.scan3d.storageservice.content.aws.TransferControl;
import com.sonymobile.scan3d.storageservice.network.PostProcessApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import java.io.File;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
final class InitImprovementTask extends AwsTask {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.InitImprovementTask";

    private boolean isTransferred(int i) {
        return (i & 8) != 0;
    }

    InitImprovementTask(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, true, false, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    Notification getForegroundNotification(Context context) {
        Notification.Builder builderNewBuilder = NotificationUtil.newNotifier(context, null).newBuilder(context, 1);
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setContentTitle(context.getString(R.string.quality_improvement_title));
        builderNewBuilder.setContentText(context.getString(R.string.quality_improvement_started_description));
        return builderNewBuilder.build();
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) throws AwsSessionException {
        String strPostInitKeyJob;
        ContentResolver contentResolver = context.getContentResolver();
        try {
            KeyPair keyPairExecuteWait = DriveActions.getKeys(context).executeWait();
            JobWorkItem jobWorkItemDequeueWork = jobParameters.dequeueWork();
            while (!isCancelled() && jobWorkItemDequeueWork != null) {
                Uri uriWithAppendedId = ContentUris.withAppendedId(Contract.ImprovementRecord.CONTENT_URI, jobWorkItemDequeueWork.getIntent().getExtras().getLong("com.sonymobile.scan3d.extra.improvement_id"));
                Improvement improvement = Factory.getImprovement(context, uriWithAppendedId);
                if (improvement != null) {
                    IFileSet iFileSetCreate = Factory.create(context, improvement.getParentUri());
                    if (iFileSetCreate != null) {
                        if ((isTransferred(iFileSetCreate.getTransferFlags()) || upload(context, awsSession, iFileSetCreate, keyPairExecuteWait)) && (strPostInitKeyJob = awsSession.postInitKeyJob(AwsSession.REQUEST_TYPE_EXECUTE)) != null) {
                            ContentValues contentValues = new ContentValues(1);
                            contentValues.put(Contract.ImprovementRecord.COLUMN_SQS_MESSAGE_ID, strPostInitKeyJob);
                            contentResolver.update(uriWithAppendedId, contentValues, null, null);
                            HitEvent.IMPROVEMENT_STARTED.send(context, 1L);
                            jobParameters.completeWork(jobWorkItemDequeueWork);
                        }
                    } else {
                        contentResolver.delete(uriWithAppendedId, null, null);
                        jobParameters.completeWork(jobWorkItemDequeueWork);
                    }
                } else {
                    jobParameters.completeWork(jobWorkItemDequeueWork);
                }
                jobWorkItemDequeueWork = jobParameters.dequeueWork();
            }
        } catch (GeneralAwsException | InterruptedException | ExecutionException e) {
            DebugLog.d(TAG, "Work failed ", e);
        }
    }

    private boolean upload(Context context, AwsSession awsSession, IFileSet iFileSet, KeyPair keyPair) throws AwsSessionException, GeneralAwsException {
        File file = new File(iFileSet.getLogUrl());
        File tempDirectory = FsUtils.getTempDirectory(context);
        try {
            return uploadTarget(context, getFiles(context, file, tempDirectory, keyPair), file, iFileSet, awsSession);
        } finally {
            FsUtils.deleteFiles(tempDirectory, true);
        }
    }

    private boolean uploadTarget(Context context, File file, File file2, IFileSet iFileSet, AwsSession awsSession) throws AwsSessionException, GeneralAwsException {
        if (file == null) {
            return false;
        }
        int transferId = iFileSet.getTransferId();
        String postProcessLogBucket = Config.getPostProcessLogBucket(context);
        String postProcessLogKey = PostProcessApi.getPostProcessLogKey(awsSession.getIdentityId(), iFileSet.getIdentifier());
        TransferControl transferControlResume = awsSession.resume(transferId);
        if (transferControlResume == null) {
            transferControlResume = awsSession.upload(postProcessLogBucket, postProcessLogKey, file);
        }
        boolean zMonitor = transferControlResume.monitor(this);
        ContentValues contentValues = new ContentValues(3);
        if (zMonitor) {
            contentValues.put(Contract.FileRecord.COLUMN_LOG_URL, (String) null);
            contentValues.put(Contract.FileRecord.COLUMN_LOG_TRANSFER_ID, (Integer) (-1));
            contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(iFileSet.getTransferFlags() | 8));
            zMonitor = file2.delete();
        } else {
            contentValues.put(Contract.FileRecord.COLUMN_LOG_TRANSFER_ID, Integer.valueOf(transferControlResume.pause()));
        }
        context.getContentResolver().update(iFileSet.getUri(), contentValues, null, null);
        return zMonitor;
    }

    private File getFiles(Context context, File file, File file2, KeyPair keyPair) {
        try {
            if (!Config.encrypt(context)) {
                return file;
            }
            byte[] encryptionKeyDecoded = keyPair.getEncryptionKeyDecoded();
            File file3 = new File(file2, file.getName());
            Vault.encryptForCloud(context, file, file3, encryptionKeyDecoded);
            return file3;
        } catch (IOException | GeneralSecurityException e) {
            DebugLog.d(TAG, "Could not get file", e);
            return null;
        }
    }
}
