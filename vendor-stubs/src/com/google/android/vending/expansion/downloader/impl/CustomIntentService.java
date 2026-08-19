package com.google.android.vending.expansion.downloader.impl;

import android.app.Service;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
public abstract class CustomIntentService extends Service {
    private static final String LOG_TAG = "CustomIntentService";
    private static final int WHAT_MESSAGE = -10;
    private String mName;
    private boolean mRedelivery;
    private volatile ServiceHandler mServiceHandler;
    private volatile Looper mServiceLooper;

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    protected abstract void onHandleIntent(Intent intent);

    protected abstract boolean shouldStop();

    public CustomIntentService(String str) {
        this.mName = str;
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        HandlerThread handlerThread = new HandlerThread("IntentService[" + this.mName + "]");
        handlerThread.start();
        this.mServiceLooper = handlerThread.getLooper();
        this.mServiceHandler = new ServiceHandler(this.mServiceLooper);
    }

    @Override // android.app.Service
    public void onDestroy() {
        Thread thread = this.mServiceLooper.getThread();
        if (thread != null && thread.isAlive()) {
            thread.interrupt();
        }
        this.mServiceLooper.quit();
        Log.d(LOG_TAG, "onDestroy");
    }

    @Override // android.app.Service
    public void onStart(Intent intent, int i) {
        if (this.mServiceHandler.hasMessages(WHAT_MESSAGE)) {
            return;
        }
        Message messageObtainMessage = this.mServiceHandler.obtainMessage();
        messageObtainMessage.arg1 = i;
        messageObtainMessage.obj = intent;
        messageObtainMessage.what = WHAT_MESSAGE;
        this.mServiceHandler.sendMessage(messageObtainMessage);
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        onStart(intent, i2);
        return this.mRedelivery ? 3 : 2;
    }

    public void setIntentRedelivery(boolean z) {
        this.mRedelivery = z;
    }

    private final class ServiceHandler extends Handler {
        public ServiceHandler(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message message) {
            CustomIntentService.this.onHandleIntent((Intent) message.obj);
            if (CustomIntentService.this.shouldStop()) {
                Log.d(CustomIntentService.LOG_TAG, "stopSelf");
                CustomIntentService.this.stopSelf(message.arg1);
                Log.d(CustomIntentService.LOG_TAG, "afterStopSelf");
            }
        }
    }
}
