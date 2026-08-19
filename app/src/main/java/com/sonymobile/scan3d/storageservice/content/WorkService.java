package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import androidx.core.provider.FontsContractCompat;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public final class WorkService extends AwsTaskService {
    private ExecutorService mConcurrentService;
    private ExecutorService mQueuedService;

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTaskService, com.sonymobile.scan3d.storageservice.content.TaskService, android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mConcurrentService = Executors.newCachedThreadPool();
        this.mQueuedService = Executors.newSingleThreadExecutor();
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTaskService, com.sonymobile.scan3d.storageservice.content.TaskService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        this.mConcurrentService.shutdownNow();
        this.mQueuedService.shutdownNow();
    }
    @Override // com.sonymobile.scan3d.storageservice.content.AwsTaskService
    Task newTask(JobParameters jobParameters, boolean z, AwsSession awsSession) {
        int jobId = jobParameters.getJobId();
        if (jobId != 1) {
            switch (jobId) {
                case -10:
                    if (z) {
                        return new RescheduleGDPRTask(this, jobParameters);
                    }
                    break;
                case -9:
                    if (z) {
                        return new DeleteAllContentTask(this, jobParameters);
                    }
                    break;
                case -8:
                    if (z) {
                        return new InitKeyTask(this, jobParameters, awsSession);
                    }
                    break;
                case -7:
                    if (z) {
                        return new ExtractDataTask(this, jobParameters, awsSession);
                    }
                    break;
                case -6:
                    if (z) {
                        return new DeleteAccountTask(this, jobParameters, awsSession);
                    }
                    break;
                case -5:
                    return new NotificationTask(this, jobParameters);
                case FontsContractCompat.FontRequestCallback.FAIL_REASON_SECURITY_VIOLATION /* -4 */:
                    return new CleanUpTask(this, jobParameters);
                case -3:
                    if (z) {
                        return new ReceiveImprovementTask(this, jobParameters, awsSession);
                    }
                    break;
                case -2:
                    if (z) {
                        return new ExecuteImprovementTask(this, jobParameters, awsSession);
                    }
                    break;
                case -1:
                    if (z) {
                        return new InitImprovementTask(this, jobParameters, awsSession);
                    }
                    break;
            }
        } else if (z) {
            return new TransferTask(this, jobParameters);
        }
        return null;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService
    void scheduleTask(Task task) {
        if (task.isConcurrent()) {
            task.executeOnExecutor(this.mConcurrentService, new Void[0]);
        } else {
            task.executeOnExecutor(this.mQueuedService, new Void[0]);
        }
    }
}
