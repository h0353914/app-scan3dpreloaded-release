package com.sonymobile.scan3d.utils.notification;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;

import com.sonymobile.scan3d.R;

public class NotificationUtil {
    public static Notifier newNotifier(Context context, String str) {
        NotificationManager manager = (NotificationManager) context.getSystemService("notification");
        return new Notifier(manager, str);
    }

    public static void setup(Context context) {
        NotificationManager manager = (NotificationManager) context.getSystemService("notification");
        if (manager.getNotificationChannel("upload_channel") == null) {
            String name = context.getString(R.string.channel_name_upload);
            String description = context.getString(R.string.channel_description_upload);
            NotificationChannel channel = new NotificationChannel("upload_channel", name,
                    NotificationManager.IMPORTANCE_HIGH);
            channel.setDescription(description);
            channel.enableVibration(false);
            manager.createNotificationChannel(channel);
        }
        if (manager.getNotificationChannel("status_channel") == null) {
            String name = context.getString(R.string.channel_name_status);
            String description = context.getString(R.string.channel_description_status);
            NotificationChannel channel = new NotificationChannel("status_channel", name,
                    NotificationManager.IMPORTANCE_LOW);
            channel.setDescription(description);
            channel.enableVibration(true);
            manager.createNotificationChannel(channel);
        }
        if (manager.getNotificationChannel("error_channel") == null) {
            String name = context.getString(R.string.channel_name_error);
            String description = context.getString(R.string.channel_description_error);
            NotificationChannel channel = new NotificationChannel("error_channel", name,
                    NotificationManager.IMPORTANCE_HIGH);
            channel.setDescription(description);
            channel.enableVibration(true);
            manager.createNotificationChannel(channel);
        }
    }
}
