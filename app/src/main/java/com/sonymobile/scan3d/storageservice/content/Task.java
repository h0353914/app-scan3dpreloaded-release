package com.sonymobile.scan3d.storageservice.content;

import android.app.Notification;
import android.app.job.JobParameters;
import android.content.Context;
import android.os.AsyncTask;
import com.sonymobile.scan3d.storageservice.Cancellable;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
abstract class Task extends AsyncTask<Void, Void, Void> implements Cancellable {
    private static final int NUM_UNIQUE_IDS = 1000;
    private static int sIdCounter;
    private final boolean mEnqueuesWork;
    private final boolean mIsConcurrent;
    private final int mNotificationId = newId();
    private final JobParameters mParams;
    private volatile boolean mReschedule;
    private final WeakReference<TaskService> mService;

    abstract void doWork(Context context, JobParameters jobParameters);

    Notification getForegroundNotification(Context context) {
        return null;
    }

    void onFailed(Context context) {
    }

    void onFinished(Context context) {
    }

    public Task(TaskService taskService, JobParameters jobParameters, boolean z, boolean z2) {
        this.mService = new WeakReference<>(taskService);
        this.mParams = jobParameters;
        this.mEnqueuesWork = z;
        this.mIsConcurrent = z2;
    }

    @Override // android.os.AsyncTask
    protected final Void doInBackground(Void... voidArr) {
        TaskService taskService = this.mService.get();
        if (taskService == null) {
            return null;
        }
        Notification foregroundNotification = getForegroundNotification(taskService);
        if (foregroundNotification != null) {
            taskService.startForeground(this.mNotificationId, foregroundNotification);
        }
        if (!isCancelled()) {
            doWork(taskService, this.mParams);
        }
        if (foregroundNotification == null) {
            return null;
        }
        taskService.stopForeground(true);
        return null;
    }

    @Override // android.os.AsyncTask
    protected final void onPostExecute(Void r4) {
        TaskService taskService = this.mService.get();
        if (taskService != null) {
            onFinished(taskService);
            taskService.onTaskFinished(this.mParams, this.mEnqueuesWork, this.mReschedule);
        }
    }

    public final boolean isConcurrent() {
        return this.mIsConcurrent;
    }

    @Override // com.sonymobile.scan3d.storageservice.Cancellable
    public void cancel() {
        cancel(true);
    }

    void setReschedule(boolean z) {
        this.mReschedule = z;
    }

    boolean isForeground(Context context) {
        return getForegroundNotification(context) != null;
    }

    private static int newId() {
        int i = sIdCounter + 1;
        sIdCounter = i;
        return -((i % 1000) + 1);
    }
}
