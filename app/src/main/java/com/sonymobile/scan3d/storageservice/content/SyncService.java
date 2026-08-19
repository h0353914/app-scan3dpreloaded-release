package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import androidx.annotation.VisibleForTesting;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public final class SyncService extends AwsTaskService {
    private static volatile boolean sIsSyncActive;
    private static List<SyncObserver> sObservers = new ArrayList();

    @VisibleForTesting
    private static volatile boolean sSyncDisabled;

    public interface SyncObserver {
        void onSync(boolean z);
    }

    public static synchronized void registerObserver(SyncObserver syncObserver) {
        if (!sObservers.contains(syncObserver)) {
            sObservers.add(syncObserver);
        }
    }

    public static synchronized void unregisterObserver(SyncObserver syncObserver) {
        sObservers.remove(syncObserver);
    }

    public static void allowSync(boolean z) {
        sSyncDisabled = !z;
    }

    public static boolean isSyncActive() {
        return sIsSyncActive;
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTaskService
    Task newTask(JobParameters jobParameters, boolean z, AwsSession awsSession) {
        if (!z) {
            return null;
        }
        notifyObservers(true);
        return new SyncAdapter(this, jobParameters, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService
    void scheduleTask(Task task) {
        ExecutorService executorServiceNewSingleThreadExecutor = Executors.newSingleThreadExecutor();
        task.executeOnExecutor(executorServiceNewSingleThreadExecutor, new Void[0]);
        executorServiceNewSingleThreadExecutor.shutdown();
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService, android.app.job.JobService
    public boolean onStartJob(JobParameters jobParameters) {
        if (sSyncDisabled) {
            return false;
        }
        return super.onStartJob(jobParameters);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService, android.app.job.JobService
    public boolean onStopJob(JobParameters jobParameters) {
        notifyObservers(false);
        return super.onStopJob(jobParameters);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.TaskService
    void onTaskFinished(JobParameters jobParameters, boolean z, boolean z2) {
        notifyObservers(false);
        super.onTaskFinished(jobParameters, z, z2);
    }

    private static synchronized void notifyObservers(boolean z) {
        sIsSyncActive = z;
        Iterator<SyncObserver> it = sObservers.iterator();
        while (it.hasNext()) {
            it.next().onSync(z);
        }
    }
}
