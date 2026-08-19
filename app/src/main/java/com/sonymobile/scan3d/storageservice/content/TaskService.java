package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.util.SparseArray;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;

/* JADX INFO: loaded from: classes.dex */
abstract class TaskService extends JobService {
    private SparseArray<Task> mActiveTasks;

    abstract Task newTask(JobParameters jobParameters, boolean z);

    abstract void scheduleTask(Task task);

    TaskService() {
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mActiveTasks = new SparseArray<>();
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        this.mActiveTasks.clear();
    }

    @Override // android.app.job.JobService
    public boolean onStartJob(JobParameters jobParameters) {
        Task taskNewTask = newTask(jobParameters, AccountUtils.isSignedIn(this));
        if (taskNewTask == null) {
            return false;
        }
        scheduleTask(taskNewTask);
        this.mActiveTasks.put(jobParameters.getJobId(), taskNewTask);
        return true;
    }

    @Override // android.app.job.JobService
    public boolean onStopJob(JobParameters jobParameters) {
        int jobId = jobParameters.getJobId();
        Task task = this.mActiveTasks.get(jobId, null);
        if (task != null) {
            task.cancel();
        }
        this.mActiveTasks.remove(jobId);
        return true;
    }

    void onTaskFinished(JobParameters jobParameters, boolean z, boolean z2) {
        if (!z) {
            jobFinished(jobParameters, z2);
        }
        this.mActiveTasks.remove(jobParameters.getJobId());
    }
}
