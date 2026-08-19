package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.Context;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;

/* JADX INFO: loaded from: classes.dex */
final class InitKeyTask extends AwsTask {
    InitKeyTask(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, false, true, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) throws AwsSessionException {
        setReschedule(awsSession.postInitKeyJob(jobParameters.getExtras().getString("com.sonymobile.scan3d.extra.receiving_request")) == null);
    }
}
