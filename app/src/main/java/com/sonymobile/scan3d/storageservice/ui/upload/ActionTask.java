package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.Service;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.Bundle;
import androidx.annotation.StringRes;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.network.IRestExecutor;
import com.sonymobile.scan3d.storageservice.network.TransferProgress;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.utils.notification.Notifier;

/* JADX INFO: loaded from: classes.dex */
public abstract class ActionTask implements IRestExecutor.IRestExecutorProgressListener<String> {
    private static final long MIN_TIME_BETWEEN_NOTIFY = 150;
    private final Action mAction;
    private Context mContext;
    private Credentials mCredentials;
    private final Bundle mExtras;
    private IFileSet mFileSet;
    private long mLastNotifyTime;
    private Notifier mNotifier;
    private ServiceProvider mServiceProvider;
    private Uri mUploadRecordUri;

    public abstract ActionResult execute(Context context, Action action, IFileSet iFileSet, Credentials credentials, Bundle bundle);

    @StringRes
    public int getCompletedText(Action action) {
        return R.string.upload_complete_text;
    }

    @StringRes
    public int getFailedText(Action action) {
        return R.string.upload_failed_txt;
    }

    @StringRes
    public int getFailedTitle(Action action) {
        return R.string.print_select_service_upload_failed_title;
    }

    @StringRes
    public int getNoFurtherActionText(Action action) {
        return R.string.upload_no_action_txt;
    }

    @StringRes
    public int getOngoingText(Action action) {
        return R.string.uploading_model_txt;
    }

    public static class ActionResult {
        private boolean mResult;
        private String mUid;

        public ActionResult(boolean z, String str) {
            this.mResult = z;
            this.mUid = str;
        }

        public boolean success() {
            return this.mResult;
        }

        public String getUid() {
            return this.mUid;
        }
    }

    protected ActionTask(ServiceProvider serviceProvider, IFileSet iFileSet, Credentials credentials, Action action, Uri uri, Bundle bundle) {
        this.mServiceProvider = serviceProvider;
        this.mFileSet = iFileSet;
        this.mAction = action;
        this.mUploadRecordUri = uri;
        this.mCredentials = credentials;
        this.mExtras = bundle;
    }

    final int getId() {
        return (int) ContentUris.parseId(this.mUploadRecordUri);
    }

    private String getGroupKey() {
        return "group_upload_" + getId();
    }

    final void execute(Service service, Notifier notifier) {
        this.mContext = service;
        this.mNotifier = notifier;
        service.startForeground(getId(), getStartNotification(this.mContext, this.mNotifier, true, false));
        ActionResult actionResultExecute = execute(this.mContext, this.mAction, this.mFileSet, this.mCredentials, this.mExtras);
        service.stopForeground(true);
        finish(this.mAction, actionResultExecute);
    }

    final Notification getStartNotification(Context context, Notifier notifier, boolean z, boolean z2) {
        Notification.Builder builderNewBuilder = notifier.newBuilder(context, !z2 ? 1 : 0);
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setContentTitle(getNotificationTitle(context, false));
        builderNewBuilder.setProgress(100, 0, true);
        builderNewBuilder.setGroup(getGroupKey());
        if (z) {
            builderNewBuilder.setGroupSummary(true);
        }
        builderNewBuilder.setOngoing(true);
        return builderNewBuilder.build();
    }

    final ServiceProvider getServiceProvider() {
        return this.mServiceProvider;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorProgressListener
    public void onExecutionProgress(IRestExecutor<String> iRestExecutor, TransferProgress transferProgress) {
        long bytesTransferred = transferProgress.getBytesTransferred();
        long totalBytes = transferProgress.getTotalBytes();
        int percent = transferProgress.getPercent();
        if (percent < 100) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (jCurrentTimeMillis - this.mLastNotifyTime > 150) {
                Notification.Builder builderNewBuilder = this.mNotifier.newBuilder(this.mContext, 1);
                builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
                builderNewBuilder.setContentTitle(getNotificationTitle(this.mContext, false));
                builderNewBuilder.setOngoing(true);
                builderNewBuilder.setGroup(getGroupKey());
                builderNewBuilder.setProgress((int) totalBytes, (int) bytesTransferred, false);
                builderNewBuilder.setContentText(this.mContext.getString(R.string.percent_progress, Integer.valueOf(percent)));
                this.mNotifier.notify(getId(), builderNewBuilder.build());
                this.mLastNotifyTime = jCurrentTimeMillis;
            }
            updateState(1);
            return;
        }
        showProcessingNotification();
    }

    private String getFinalActionText(Context context, Action action, String str) {
        switch (action) {
            case SHARE:
                return context.getString(R.string.upload_share_txt, str);
            case UNSHARE:
                return context.getString(R.string.upload_unshare_txt, str);
            case VIEW:
                return context.getString(R.string.upload_view_txt, str);
            case PRINT:
            case PRINT_CUSTOM:
                return context.getString(R.string.upload_print_txt);
            default:
                return context.getString(R.string.upload_no_action_txt, str);
        }
    }

    private void finish(Action action, ActionResult actionResult) {
        if (action == Action.UNSHARE) {
            if (actionResult.success()) {
                this.mContext.getContentResolver().delete(this.mUploadRecordUri, null, null);
            } else {
                ContentValues contentValues = new ContentValues(1);
                contentValues.put("state", (Integer) 3);
                this.mContext.getContentResolver().update(this.mUploadRecordUri, contentValues, null, null);
            }
        } else if (actionResult.success()) {
            ContentValues contentValues2 = new ContentValues(2);
            contentValues2.put(Contract.UploadRecord.COLUMN_UID, actionResult.getUid());
            contentValues2.put("state", (Integer) 2);
            this.mContext.getContentResolver().update(this.mUploadRecordUri, contentValues2, null, null);
        } else {
            this.mContext.getContentResolver().delete(this.mUploadRecordUri, null, null);
        }
        this.mNotifier.notify(getId(), getResultingNotification(actionResult.success(), actionResult.getUid()));
    }

    private void showProcessingNotification() {
        Notification.Builder builderNewBuilder = this.mNotifier.newBuilder(this.mContext, 1);
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setContentTitle(getNotificationTitle(this.mContext, false));
        builderNewBuilder.setOngoing(true);
        builderNewBuilder.setGroup(getGroupKey());
        builderNewBuilder.setProgress(0, 0, true);
        this.mNotifier.notify(getId(), builderNewBuilder.build());
    }

    private String getNotificationTitle(Context context, boolean z) {
        String serviceProviderName = this.mServiceProvider.getServiceProviderName(context);
        return z ? context.getString(getCompletedText(this.mAction), serviceProviderName) : context.getString(getOngoingText(this.mAction), this.mFileSet.getName(), serviceProviderName);
    }

    private void updateState(int i) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("state", Integer.valueOf(i));
        this.mContext.getContentResolver().update(this.mUploadRecordUri, contentValues, null, null);
    }

    private Notification getResultingNotification(boolean z, String str) {
        String name = this.mFileSet.getName();
        Notification.Builder builderNewBuilder = this.mNotifier.newBuilder(this.mContext, 1);
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setGroup(getGroupKey());
        builderNewBuilder.setAutoCancel(true);
        if (z) {
            Intent intent = this.mServiceProvider.getIntent(this.mContext, this.mAction, str, this.mCredentials, this.mExtras);
            builderNewBuilder.setContentTitle(getNotificationTitle(this.mContext, true));
            if (intent != null) {
                builderNewBuilder.setContentIntent(PendingIntent.getActivity(this.mContext, 0, intent, 134217728));
                builderNewBuilder.setContentText(getFinalActionText(this.mContext, this.mAction, name));
                addActions(builderNewBuilder, str);
            } else {
                builderNewBuilder.setContentText(this.mContext.getString(getNoFurtherActionText(this.mAction), name));
            }
        } else {
            builderNewBuilder.setContentTitle(this.mContext.getString(getFailedTitle(this.mAction)));
            builderNewBuilder.setContentText(this.mContext.getString(getFailedText(this.mAction), name, this.mServiceProvider.getServiceProviderName(this.mContext)));
        }
        return builderNewBuilder.build();
    }

    private void addActions(Notification.Builder builder, String str) {
        Intent intent;
        for (Action action : this.mServiceProvider.getSupportedActions()) {
            if (!this.mAction.equals(action) && (intent = this.mServiceProvider.getIntent(this.mContext, action, str, this.mCredentials, this.mExtras)) != null) {
                builder.addAction(new Notification.Action.Builder((Icon) null, action.getName(this.mContext), PendingIntent.getActivity(this.mContext, 0, intent, 134217728)).build());
            }
        }
    }
}
