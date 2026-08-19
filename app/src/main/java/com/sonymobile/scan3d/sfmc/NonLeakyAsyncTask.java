package com.sonymobile.scan3d.sfmc;

import android.app.Activity;
import android.os.AsyncTask;

import androidx.annotation.AnyThread;
import androidx.annotation.MainThread;

import java.util.concurrent.atomic.AtomicReference;

abstract class NonLeakyAsyncTask<Clazz extends Activity, Params, Progress, Result>
        extends AsyncTask<Params, Progress, Result> {
    private final AtomicReference<Clazz> mThis;

    public NonLeakyAsyncTask(AtomicReference<Clazz> reference) {
        mThis = reference;
    }

    @AnyThread
    protected abstract Result doInBackground(Clazz activity, Params[] params);

    @Override
    @AnyThread
    protected Result doInBackground(Params... params) {
        Clazz activity = mThis.get();
        if (activity != null) {
            return doInBackground(activity, params);
        }
        return null;
    }

    @MainThread
    protected abstract void onPostExecute(Clazz activity, Result result);

    @Override
    @MainThread
    protected void onPostExecute(Result result) {
        Clazz activity = mThis.get();
        if (activity != null) {
            onPostExecute(activity, result);
        }
    }
}
