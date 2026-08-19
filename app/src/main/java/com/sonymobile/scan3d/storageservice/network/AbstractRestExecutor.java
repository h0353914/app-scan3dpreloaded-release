package com.sonymobile.scan3d.storageservice.network;

import android.content.Context;
import android.os.AsyncTask;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Cancellable;
import java.lang.ref.WeakReference;
import java.util.Random;

/* JADX INFO: loaded from: classes.dex */
abstract class AbstractRestExecutor<Input, Output, Token> implements IRestExecutor<Output>, NetworkRequest.INetworkProgressListener {
    private static final int BACKOFF_TIME = 500;
    private static final int DEFAULT_RETRIES = 5;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor";
    private static Random sRandom = new Random();
    private WeakReference<Context> mContext;
    private IHttpResponse mHttpResponse;
    private Input[] mInput;
    private IRestExecutor.IRestExecutorProgressListener<Output> mProgressListener;
    private NetworkRequest mRequest;
    private Token mToken;
    private String mUrl;

    public abstract NetworkRequest getNetworkRequest(String str, Token token, Input[] inputArr) throws Exception;

    public abstract Output getOutput(IHttpResponse iHttpResponse) throws Exception;

    AbstractRestExecutor() {
    }

    private static class NetworkTask<Output> extends AsyncTask<Void, TransferProgress, Output> implements IRestExecutor.IRestExecutorProgressListener<Output>, Cancellable {
        private IRestExecutor<Output> mExecutor;
        private WeakReference<IRestExecutor.IRestExecutorListener<Output>> mListener;

        private NetworkTask(IRestExecutor<Output> iRestExecutor, IRestExecutor.IRestExecutorListener<Output> iRestExecutorListener) {
            this.mExecutor = iRestExecutor;
            this.mListener = new WeakReference<>(iRestExecutorListener);
        }

        @Override // android.os.AsyncTask
        protected void onPreExecute() {
            IRestExecutor.IRestExecutorListener<Output> iRestExecutorListener = this.mListener.get();
            if (iRestExecutorListener != null) {
                iRestExecutorListener.onPreExecution(this.mExecutor);
            }
        }

        @Override // android.os.AsyncTask
        protected Output doInBackground(Void... voidArr) {
            try {
                return this.mExecutor.execute(this);
            } catch (NetworkException e) {
                DebugLog.d(AbstractRestExecutor.TAG, "doInBackground(): ", e);
                return null;
            }
        }

        @Override // android.os.AsyncTask
        protected void onProgressUpdate(TransferProgress... transferProgressArr) {
            IRestExecutor.IRestExecutorListener<Output> iRestExecutorListener = this.mListener.get();
            if (iRestExecutorListener == null || transferProgressArr.length <= 0) {
                return;
            }
            iRestExecutorListener.onExecutionProgress(this.mExecutor, transferProgressArr[0]);
        }

        @Override // android.os.AsyncTask
        protected void onCancelled(Output output) {
            super.onCancelled(output);
            IRestExecutor.IRestExecutorListener<Output> iRestExecutorListener = this.mListener.get();
            if (iRestExecutorListener != null) {
                iRestExecutorListener.onExecutionCancelled(this.mExecutor);
            }
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Output output) {
            IRestExecutor.IRestExecutorListener<Output> iRestExecutorListener = this.mListener.get();
            if (iRestExecutorListener != null) {
                iRestExecutorListener.onExecutionDone(this.mExecutor, output);
            }
        }

        @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorProgressListener
        public void onExecutionProgress(IRestExecutor<Output> iRestExecutor, TransferProgress transferProgress) {
            if (isCancelled()) {
                return;
            }
            publishProgress(transferProgress);
        }

        @Override // com.sonymobile.scan3d.storageservice.Cancellable
        public void cancel() {
            cancel(true);
        }
    }

    protected final Context getContext() {
        return this.mContext.get();
    }

    protected Input[] getInput() {
        return this.mInput;
    }

    @SafeVarargs
    public final IRestExecutor<Output> init(Context context, String str, Token token, Input... inputArr) {
        this.mContext = new WeakReference<>(context);
        this.mUrl = str;
        this.mInput = inputArr;
        this.mToken = token;
        return this;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor
    public final IHttpResponse getResponse() {
        return this.mHttpResponse;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor
    public final Output execute(IRestExecutor.IRestExecutorProgressListener<Output> iRestExecutorProgressListener) throws NetworkException {
        this.mProgressListener = iRestExecutorProgressListener;
        return execute();
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor
    public final Output execute() throws NetworkException {
        try {
            try {
                this.mRequest = getNetworkRequest(this.mUrl, this.mToken, this.mInput);
                this.mRequest.setProgressListener(this);
                this.mHttpResponse = onExecute();
                Output output = this.mHttpResponse != null ? getOutput(this.mHttpResponse) : null;
                StreamUtils.close(this.mHttpResponse);
                return output;
            } catch (Exception e) {
                throw new NetworkException(e);
            }
        } catch (Throwable th) {
            StreamUtils.close(this.mHttpResponse);
            throw th;
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor
    public final Cancellable executeAsync(IRestExecutor.IRestExecutorListener<Output> iRestExecutorListener) {
        NetworkTask networkTask = new NetworkTask(this, iRestExecutorListener);
        networkTask.execute(new Void[0]);
        return networkTask;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.NetworkRequest.INetworkProgressListener
    public void onNetworkProgress(NetworkRequest networkRequest, TransferProgress transferProgress) {
        IRestExecutor.IRestExecutorProgressListener<Output> iRestExecutorProgressListener = this.mProgressListener;
        if (iRestExecutorProgressListener != null) {
            iRestExecutorProgressListener.onExecutionProgress(this, transferProgress);
        }
    }

    private IHttpResponse onExecute() throws Exception {
        IHttpResponse iHttpResponseExecute = null;
        int i = 0;
        while (true) {
            if (i > 0) {
                if (iHttpResponseExecute != null) {
                    iHttpResponseExecute.close();
                }
                Thread.sleep(sRandom.nextInt(1000) + 500);
            }
            iHttpResponseExecute = this.mRequest.execute(this.mContext.get());
            int i2 = i + 1;
            if (!retry(i, iHttpResponseExecute)) {
                return iHttpResponseExecute;
            }
            i = i2;
        }
    }

    private static boolean retry(int i, IHttpResponse iHttpResponse) {
        return i < 5 && (iHttpResponse == null || !iHttpResponse.isResponseReceived());
    }
}
