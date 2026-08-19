package com.sonymobile.scan3d.storageservice.content;

import android.app.Notification;
import android.app.job.JobParameters;
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
import com.sonymobile.scan3d.storageservice.network.synchublib.Encryption;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Iterator;
import java.util.concurrent.ExecutionException;
import javax.crypto.CipherInputStream;

final class ReceiveImprovementTask extends AwsTask {
    private static final String FILE_NAME = "improved_scan.zip";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.ReceiveImprovementTask";
    private static final String TEMP_FILE_NAME = "improved_cloud_scan.zip";

    ReceiveImprovementTask(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, false, false, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    Notification getForegroundNotification(Context context) {
        Notification.Builder builderNewBuilder = NotificationUtil.newNotifier(context, null).newBuilder(context, 1);
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setContentTitle(context.getString(R.string.quality_improvement_title));
        builderNewBuilder.setContentText(context.getString(R.string.quality_improvement_receiving_description));
        return builderNewBuilder.build();
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) throws AwsSessionException {
        String postProcessLogBucket;
        KeyPair keyPairExecuteWait;
        Iterator<Improvement> it;
        try {
            postProcessLogBucket = Config.getPostProcessLogBucket(context);
            keyPairExecuteWait = DriveActions.getKeys(context).executeWait();
            it = Factory.getImprovements(context).iterator();
        } catch (InterruptedException | ExecutionException e) {
            DebugLog.d(TAG, "Work failed ", e);
            setReschedule(true);
            return;
        } catch (Throwable th) {
            setReschedule(true);
            throw th;
        }

        boolean zAnySucceeded = false;
        while (true) {
            try {
                if (!it.hasNext()) {
                    break;
                }
                Improvement next = it.next();
                if (next.isDownloadable()) {
                    File tempDirectory = FsUtils.getTempDirectory(context);
                    try {
                        Uri uriCreateFileRecord = createFileRecord(context, next, download(context, postProcessLogBucket, awsSession, next, keyPairExecuteWait, tempDirectory));
                        FsUtils.deleteFiles(tempDirectory, true);
                        if (uriCreateFileRecord != null) {
                            long id = ContentUris.parseId(uriCreateFileRecord);
                            ContentValues contentValues = new ContentValues(1);
                            contentValues.put(Contract.ImprovementRecord.COLUMN_FILE_SET_ID, Long.valueOf(id));
                            context.getContentResolver().update(next.getUri(), contentValues, null, null);
                            HitEvent.IMPROVEMENT_RECEIVED.send(context, 1L);
                        } else {
                            ContentValues contentValues2 = new ContentValues(1);
                            contentValues2.put(Contract.ImprovementRecord.COLUMN_FAIL_STATE, (Integer) 1);
                            context.getContentResolver().update(next.getUri(), contentValues2, null, null);
                        }
                        awsSession.delete(postProcessLogBucket, next.getS3Path());
                    } catch (Throwable thCleanup) {
                        FsUtils.deleteFiles(tempDirectory, true);
                        throw thCleanup;
                    }
                }
                zAnySucceeded = true;
            } catch (GeneralAwsException e) {
                DebugLog.d(TAG, "Work failed ", e);
                setReschedule(!zAnySucceeded);
                return;
            } catch (Throwable th) {
                setReschedule(!zAnySucceeded);
                throw th;
            }
        }
        setReschedule(!zAnySucceeded);
    }

    private File download(Context context, String str, AwsSession awsSession, Improvement improvement, KeyPair keyPair, File file) throws AwsSessionException {
        File file2 = new File(file, TEMP_FILE_NAME);
        File file3 = new File(file, FILE_NAME);
        String s3Path = improvement.getS3Path();
        TransferControl transferControlDownload = null;
        try {
            if (awsSession.doesContentExist(str, s3Path)) {
                transferControlDownload = awsSession.download(str, s3Path, file2);
                if (transferControlDownload.monitor(this)) {
                    if (Config.encrypt(context)) {
                        byte[] encryptionKeyDecoded = keyPair.getEncryptionKeyDecoded();
                        try (FileInputStream fileInputStream = new FileInputStream(file2)) {
                            try (CipherInputStream cipherInputStream = Encryption.cipherInputStream(fileInputStream, encryptionKeyDecoded)) {
                                Vault.saveToDiskEncrypted(context, cipherInputStream, file3);
                            }
                            if (!file2.delete()) {
                                DebugLog.d(TAG, "Could not delete src file.");
                            }
                        }
                    } else {
                        file3 = file2;
                    }
                }
            }
        } catch (GeneralAwsException | IOException | GeneralSecurityException e) {
            DebugLog.d(TAG, "Exception caught", e);
            if (transferControlDownload != null && transferControlDownload.isRunning()) {
                transferControlDownload.cancel();
            }
            return file3.exists() ? file3 : null;
        } catch (Throwable th) {
            if (transferControlDownload != null && transferControlDownload.isRunning()) {
                transferControlDownload.cancel();
            }
            throw th;
        }
        if (transferControlDownload != null && transferControlDownload.isRunning()) {
            transferControlDownload.cancel();
        }
        return file3.exists() ? file3 : null;
    }

    private Uri createFileRecord(Context context, Improvement improvement, File file) {
        ContentResolver contentResolver = context.getContentResolver();
        ITransientFileSet iTransientFileSetCreate = Factory.create(context, improvement.getName(), file, null, 10, improvement.getScanType());
        if (iTransientFileSetCreate != null) {
            return contentResolver.insert(Contract.FileRecord.CONTENT_URI, iTransientFileSetCreate.toContentValues());
        }
        if (file == null || !file.delete()) {
            return null;
        }
        DebugLog.d(TAG, "Deleted improvement file after failing to create record");
        return null;
    }
}
