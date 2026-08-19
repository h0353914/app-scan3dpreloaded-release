package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.Context;
import android.os.Handler;
import android.widget.Toast;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;

/* JADX INFO: loaded from: classes.dex */
final class DeleteAccountTask extends AwsTask {
    DeleteAccountTask(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, false, true, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) throws AwsSessionException {
        setReschedule(awsSession.postDeleteAccountJob() == null);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    protected void onFailed(final Context context) {
        AccountUtils.setDeleteOngoing(context, false);
        new Handler(context.getMainLooper()).post(new Runnable() { // from class: com.sonymobile.scan3d.storageservice.content.-$$Lambda$DeleteAccountTask$GySwQsjpyVmdBuLe0fJne9Q7pFM
            @Override // java.lang.Runnable
            public final void run() {
                Toast.makeText(context, R.string.notification_gdpr_delete_account_failed_title, 1).show();
            }
        });
    }
}
