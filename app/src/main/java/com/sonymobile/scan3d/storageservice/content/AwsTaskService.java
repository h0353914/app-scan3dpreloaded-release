package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import com.sonymobile.scan3d.storageservice.content.aws.Aws;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;

/* JADX INFO: loaded from: classes.dex */
abstract class AwsTaskService extends TaskService {
    private AwsSession mSession;

    abstract Task newTask(JobParameters jobParameters, boolean z, AwsSession awsSession);

    AwsTaskService() {
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService, android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mSession = Aws.INSTANCE.startSession(this);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService, android.app.Service
    public void onDestroy() {
        super.onDestroy();
        Aws.INSTANCE.endSession(this.mSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService
    final Task newTask(JobParameters jobParameters, boolean z) {
        return newTask(jobParameters, z, this.mSession);
    }
}
