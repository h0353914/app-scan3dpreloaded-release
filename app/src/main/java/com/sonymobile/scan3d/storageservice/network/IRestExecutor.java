package com.sonymobile.scan3d.storageservice.network;

import com.sonymobile.scan3d.storageservice.Cancellable;

/* JADX INFO: loaded from: classes.dex */
public interface IRestExecutor<Output> {

    public interface IRestExecutorListener<Output> extends IRestExecutorProgressListener<Output> {
        void onExecutionCancelled(IRestExecutor<Output> iRestExecutor);

        void onExecutionDone(IRestExecutor<Output> iRestExecutor, Output output);

        void onPreExecution(IRestExecutor<Output> iRestExecutor);
    }

    public interface IRestExecutorProgressListener<Output> {
        void onExecutionProgress(IRestExecutor<Output> iRestExecutor, TransferProgress transferProgress);
    }

    Output execute() throws NetworkException;

    Output execute(IRestExecutorProgressListener<Output> iRestExecutorProgressListener) throws NetworkException;

    Cancellable executeAsync(IRestExecutorListener<Output> iRestExecutorListener);

    IHttpResponse getResponse();
}
