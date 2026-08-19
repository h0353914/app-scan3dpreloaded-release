package com.sonymobile.scan3d.storageservice.authentication;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public abstract class DriveAction<T> {
    private ExecutorService mExecutor;

    abstract Task<T> getRunningTask();

    public Task<T> execute() {
        this.mExecutor = Executors.newSingleThreadExecutor();
        return getRunningTask().addOnCompleteListener(task -> this.mExecutor.shutdown());
    }

    Executor getExecutor() {
        return this.mExecutor;
    }

    public final T executeWait() throws ExecutionException, InterruptedException {
        return (T) Tasks.await(execute());
    }
}
