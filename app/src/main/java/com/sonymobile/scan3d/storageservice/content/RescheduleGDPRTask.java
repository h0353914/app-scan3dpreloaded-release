package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.Context;
import android.content.SharedPreferences;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
final class RescheduleGDPRTask extends Task {
    private static final String KEY_DELETE_RETENTION = "delete_retention";
    private static final String KEY_EXTRACT_RETENTION = "extract_retention";
    private static final long RETENTION_PERIOD = TimeUnit.DAYS.toMillis(1);
    private static final String RETENTION_PREFERENCES = "retention_preferences";

    RescheduleGDPRTask(TaskService taskService, JobParameters jobParameters) {
        super(taskService, jobParameters, false, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void doWork(Context context, JobParameters jobParameters) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(RETENTION_PREFERENCES, 0);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        if (AccountUtils.isDeleteOngoing(context) && checkRetention(sharedPreferences, KEY_DELETE_RETENTION, editorEdit)) {
            Jobs.requestDeleteAccountJob(context);
        }
        if (AccountUtils.isExtractDataOngoing(context) && checkRetention(sharedPreferences, KEY_EXTRACT_RETENTION, editorEdit)) {
            Jobs.requestKeyInitJob(context, AwsSession.REQUEST_TYPE_EXTRACT_DATA);
        }
        editorEdit.apply();
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void onFinished(Context context) {
        Jobs.scheduleGDPRRetention(context);
    }

    private boolean checkRetention(SharedPreferences sharedPreferences, String str, SharedPreferences.Editor editor) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (!sharedPreferences.contains(str)) {
            editor.putLong(str, jCurrentTimeMillis);
            return false;
        }
        if (jCurrentTimeMillis - sharedPreferences.getLong(str, jCurrentTimeMillis) > RETENTION_PERIOD) {
            editor.remove(str);
            return true;
        }
        editor.putLong(str, jCurrentTimeMillis);
        return false;
    }
}
