package com.sonymobile.scan3d.storageservice.content;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.job.JobParameters;
import android.content.Context;
import android.net.Uri;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import com.sonymobile.scan3d.utils.notification.Notifier;
import com.sonymobile.scan3d.viewer.ProxyReceiver;
import com.sonymobile.scan3d.viewer.ViewerActivity;

/* JADX INFO: loaded from: classes.dex */
class NotificationTask extends Task {
    private static final int NOTIFICATION_ID = -2;

    NotificationTask(TaskService taskService, JobParameters jobParameters) {
        super(taskService, jobParameters, false, true);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void doWork(Context context, JobParameters jobParameters) {
        Notifier notifierNewNotifier = NotificationUtil.newNotifier(context, Notifier.TYPE_POST_PROCESS);
        int i = 0;
        for (Improvement improvement : Factory.getImprovements(context)) {
            if (improvement.isFailed()) {
                Uri parentUri = improvement.getParentUri();
                IFileSet iFileSetCreate = Factory.create(context, parentUri);
                Notification.Builder builderNewBuilder = notifierNewNotifier.newBuilder(context, 1);
                builderNewBuilder.setContentTitle(context.getString(R.string.notification_improve_failed_title));
                builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
                if (iFileSetCreate != null) {
                    builderNewBuilder.setAutoCancel(true);
                    builderNewBuilder.setContentIntent(getViewIntent(context, parentUri));
                    builderNewBuilder.setContentText(context.getString(R.string.notification_improve_retry));
                }
                notifierNewNotifier.notify((int) improvement.getId(), builderNewBuilder.build());
            } else if (improvement.isImproved()) {
                i++;
            }
        }
        if (i > 0) {
            PendingIntent broadcast = PendingIntent.getBroadcast(context, 0, ProxyReceiver.getImprovementIntent(context), 134217728);
            Notification.Builder builderNewBuilder2 = notifierNewNotifier.newBuilder(context, 1);
            builderNewBuilder2.setContentIntent(broadcast);
            builderNewBuilder2.setSmallIcon(R.drawable.notification_icon_small);
            builderNewBuilder2.setContentTitle(context.getString(R.string.notification_improve_completed_title));
            builderNewBuilder2.setContentText(context.getString(R.string.notification_improve_completed_subtitle));
            builderNewBuilder2.setOngoing(true);
            builderNewBuilder2.setAutoCancel(false);
            notifierNewNotifier.notify(-2, builderNewBuilder2.build());
        } else {
            notifierNewNotifier.cancel(-2);
        }
        setReschedule(false);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.Task
    void onFinished(Context context) {
        Jobs.scheduleNotificationUpdate(context);
    }

    private PendingIntent getViewIntent(Context context, Uri uri) {
        return PendingIntent.getActivity(context, 0, ViewerActivity.getViewerModeIntent(context, uri), DriveFile.MODE_READ_ONLY);
    }
}
