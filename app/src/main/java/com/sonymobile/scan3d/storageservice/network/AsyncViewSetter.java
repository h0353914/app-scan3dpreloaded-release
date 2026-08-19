package com.sonymobile.scan3d.storageservice.network;

import android.view.View;
import com.sonymobile.scan3d.logging.DebugLog;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public abstract class AsyncViewSetter<V extends View, R> implements IRestExecutor.IRestExecutorListener<R> {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.AsyncViewSetter";
    private final WeakReference<V> mViewRef;

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorProgressListener
    public void onExecutionProgress(IRestExecutor<R> iRestExecutor, TransferProgress transferProgress) {
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorListener
    public void onPreExecution(IRestExecutor<R> iRestExecutor) {
    }

    public abstract void onSetResource(V v, R r);

    public AsyncViewSetter(V v) {
        this.mViewRef = new WeakReference<>(v);
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorListener
    public void onExecutionDone(IRestExecutor<R> iRestExecutor, R r) {
        V v = this.mViewRef.get();
        if (v != null) {
            onSetResource(v, r);
        } else {
            DebugLog.d(TAG, "onResultReceived(): View reference is gc:ed.");
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorListener
    public void onExecutionCancelled(IRestExecutor<R> iRestExecutor) {
        onExecutionDone(iRestExecutor, null);
    }
}
