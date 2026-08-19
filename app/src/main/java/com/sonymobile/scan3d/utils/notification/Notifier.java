package com.sonymobile.scan3d.utils.notification;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;

import com.sonymobile.scan3d.R;

public class Notifier {
    static final String CHANNEL_ID_ERROR = "error_channel";
    static final String CHANNEL_ID_STATUS = "status_channel";
    static final String CHANNEL_ID_UPLOAD = "upload_channel";
    public static final int SEVERITY_ERROR = -1;
    public static final int SEVERITY_STATUS = 1;
    public static final int SEVERITY_UPLOAD = 0;
    public static final String TYPE_GPDR = "gdpr";
    public static final String TYPE_POST_PROCESS = "post_process";
    public static final String TYPE_UPLOAD = "upload";
    public static final String TYPE_WALLPAPER = "wall_paper";

    private NotificationManager mManager;
    private String mTag;

    Notifier(NotificationManager notificationManager, String str) {
        mManager = notificationManager;
        mTag = str;
    }

    public void cancel(int i) {
        mManager.cancel(mTag, i);
    }

    public Notification.Builder newBuilder(Context context, int severity) {
        String channelId;
        switch (severity) {
            case 0:
                channelId = CHANNEL_ID_UPLOAD;
                break;
            case 1:
                channelId = CHANNEL_ID_STATUS;
                break;
            default:
                channelId = CHANNEL_ID_ERROR;
                break;
        }
        Notification.Builder builder = new Notification.Builder(context, channelId);
        builder.setColor(context.getColor(R.color.primary_color_light));
        return builder;
    }

    public void notify(int i, Notification notification) {
        mManager.notify(mTag, i, notification);
    }
}
