package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.Context;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.content.aws.GeneralAwsException;

/* JADX INFO: loaded from: classes.dex */
abstract class AwsTask extends Task {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.AwsTask";
    private AwsSession mSession;

    abstract void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) throws AwsSessionException;

    AwsTask(TaskService taskService, JobParameters jobParameters, boolean z, boolean z2, AwsSession awsSession) {
        super(taskService, jobParameters, z, z2);
        this.mSession = awsSession;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    final void doWork(Context context, JobParameters jobParameters) {
        try {
            if (this.mSession.refreshCredentials()) {
                doWork(context, jobParameters, this.mSession);
                if (isForeground(context)) {
                    this.mSession.removeAllFinishedTransfers();
                }
            } else {
                onFailed(context);
            }
        } catch (GeneralAwsException unused) {
            onFailed(context);
            DebugLog.d(TAG, "Task failed when refreshing credentials.");
        } catch (AwsSessionException unused2) {
            onFailed(context);
            DebugLog.d(TAG, "Task failed since session is closed.");
        } finally {
            this.mSession = null;
        }
    }
}
