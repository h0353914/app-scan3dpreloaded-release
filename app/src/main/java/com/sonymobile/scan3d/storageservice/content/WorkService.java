package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
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
        jobParameters.getJobId();
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
