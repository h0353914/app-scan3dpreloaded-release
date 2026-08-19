package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.Service;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.IBinder;
import android.os.Looper;
import android.os.Message;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Upload;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import com.sonymobile.scan3d.utils.notification.Notifier;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public final class ActionService extends Service implements Handler.Callback {
    private static final String ACTION_INIT = "com.sonymobile.scan3d.action.INIT";
    private static final int MESSAGE_INIT = 0;
    private static final int MESSAGE_TRANSFER = 1;
    private static final String SELECTION = "state=? OR state=?";
    private static final String[] SELECTION_ARGS = {String.valueOf(0), String.valueOf(1)};
    private static final String WORKER_THREAD_NAME = "UploadService#WorkerThread";
    private ExecutorService mExecutor;
    private Handler mHandler;
    private Looper mLooper;
    private Notifier mNotifier;

    @Override // android.app.Service
    @Nullable
    public IBinder onBind(Intent intent) {
        return null;
    }

    private static class InitTask extends AsyncTask<Void, Void, Void> {
        private final WeakReference<ActionService> mServiceRef;
        private final int mStartId;

        @Override // android.os.AsyncTask
        protected Void doInBackground(Void... voidArr) {
            return null;
        }

        private InitTask(ActionService actionService, int i) {
            this.mServiceRef = new WeakReference<>(actionService);
            this.mStartId = i;
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Void r2) {
            super.onPostExecute(r2);
            ActionService actionService = this.mServiceRef.get();
            if (actionService != null) {
                actionService.onRunInit(this.mStartId);
            }
        }
    }

    private static class SetupTask extends AsyncTask<Intent, Void, ActionTask> {
        private final WeakReference<ActionService> mServiceRef;
        private final int mStartId;

        private SetupTask(ActionService actionService, int i) {
            this.mServiceRef = new WeakReference<>(actionService);
            this.mStartId = i;
        }

        @Override // android.os.AsyncTask
        protected ActionTask doInBackground(Intent... intentArr) {
            Uri uriWithAppendedId;
            Intent intent = intentArr[0];
            Bundle extras = intent.getExtras();
            ActionService actionService = this.mServiceRef.get();
            if (actionService == null || extras == null) {
                return null;
            }
            Uri data = intent.getData();
            ServiceProvider serviceProviderValueOf = ServiceProvider.valueOf(extras.getString(ActionActivity.EXTRA_SERVICE_PROVIDER));
            Credentials credentials = (Credentials) extras.getParcelable(ActionActivity.EXTRA_CREDENTIALS);
            Action action = Action.getAction(intent.getAction());
            Upload upload = Factory.getUpload(actionService, data, serviceProviderValueOf);
            IFileSet iFileSetCreate = Factory.create(actionService, data);
            if (iFileSetCreate == null) {
                return null;
            }
            ContentValues contentValues = new ContentValues(3);
            contentValues.put("state", (Integer) 0);
            if (upload == null) {
                contentValues.put(Contract.UploadRecord.COLUMN_PROVIDER, serviceProviderValueOf.name());
                contentValues.put("parent_id", Long.valueOf(iFileSetCreate.getId()));
                uriWithAppendedId = actionService.getContentResolver().insert(Contract.UploadRecord.CONTENT_URI, contentValues);
            } else {
                uriWithAppendedId = ContentUris.withAppendedId(Contract.UploadRecord.CONTENT_URI, upload.getId());
                actionService.getContentResolver().update(uriWithAppendedId, contentValues, null, null);
            }
            return serviceProviderValueOf.create(iFileSetCreate, credentials, action, uriWithAppendedId, extras);
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(ActionTask actionTask) {
            super.onPostExecute(actionTask);
            ActionService actionService = this.mServiceRef.get();
            if (actionService != null) {
                actionService.onRunUploadTask(actionTask, this.mStartId);
            }
        }
    }

    public static void init(Context context) {
        Intent intent = new Intent(context, (Class<?>) ActionService.class);
        intent.setAction(ACTION_INIT);
        context.startService(intent);
    }

    static void executeTask(Context context, Intent intent, Credentials credentials) {
        Uri data = intent.getData();
        Bundle extras = intent.getExtras();
        if (extras != null) {
            extras.putParcelable(ActionActivity.EXTRA_CREDENTIALS, credentials);
            Intent intent2 = new Intent(context, (Class<?>) ActionService.class);
            intent2.setData(data);
            intent2.setAction(intent.getAction());
            intent2.putExtras(extras);
            context.startService(intent2);
        }
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        this.mExecutor = Executors.newSingleThreadExecutor();
        HandlerThread handlerThread = new HandlerThread(WORKER_THREAD_NAME);
        handlerThread.start();
        this.mLooper = handlerThread.getLooper();
        this.mHandler = new Handler(this.mLooper, this);
        this.mNotifier = NotificationUtil.newNotifier(this, "upload");
    }

    @Override // android.app.Service
    public void onDestroy() {
        super.onDestroy();
        this.mExecutor.shutdownNow();
        this.mLooper.quit();
    }

    @Override // android.app.Service
    public int onStartCommand(Intent intent, int i, int i2) {
        if (intent == null) {
            return 3;
        }
        if (ACTION_INIT.equals(intent.getAction())) {
            new InitTask(this, i2).executeOnExecutor(this.mExecutor, new Void[0]);
            return 3;
        }
        new SetupTask(this, i2).executeOnExecutor(this.mExecutor, intent);
        return 3;
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        ActionTask actionTask;
        if (message.what == 1 && (actionTask = (ActionTask) message.obj) != null) {
            actionTask.execute(this, this.mNotifier);
        }
        if (stopSelfResult(message.arg1)) {
            getContentResolver().delete(Contract.UploadRecord.CONTENT_URI, SELECTION, SELECTION_ARGS);
        }
        return true;
    }

    private void onRunUploadTask(ActionTask actionTask, int i) {
        if (actionTask != null) {
            this.mNotifier.notify(actionTask.getId(), actionTask.getStartNotification(this, this.mNotifier, false, true));
        }
        Message messageObtain = Message.obtain(this.mHandler, 1);
        messageObtain.arg1 = i;
        messageObtain.obj = actionTask;
        messageObtain.sendToTarget();
    }

    private void onRunInit(int i) {
        Message messageObtain = Message.obtain(this.mHandler, 0);
        messageObtain.arg1 = i;
        messageObtain.sendToTarget();
    }
}
