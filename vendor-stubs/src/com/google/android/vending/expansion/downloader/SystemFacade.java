package com.google.android.vending.expansion.downloader;

import android.app.Notification;
import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.support.v4.media.session.PlaybackStateCompat;
import android.telephony.TelephonyManager;
import android.util.Log;

/* JADX INFO: loaded from: classes.dex */
class SystemFacade {
    private Context mContext;
    private NotificationManager mNotificationManager;

    public SystemFacade(Context context) {
        this.mContext = context;
        this.mNotificationManager = (NotificationManager) this.mContext.getSystemService("notification");
    }

    public long currentTimeMillis() {
        return System.currentTimeMillis();
    }

    public Integer getActiveNetworkType() {
        ConnectivityManager connectivityManager = (ConnectivityManager) this.mContext.getSystemService("connectivity");
        if (connectivityManager == null) {
            Log.w(Constants.TAG, "couldn't get connectivity manager");
            return null;
        }
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            return null;
        }
        return Integer.valueOf(activeNetworkInfo.getType());
    }

    public boolean isNetworkRoaming() {
        ConnectivityManager connectivityManager = (ConnectivityManager) this.mContext.getSystemService("connectivity");
        if (connectivityManager == null) {
            Log.w(Constants.TAG, "couldn't get connectivity manager");
            return false;
        }
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        boolean z = activeNetworkInfo != null && activeNetworkInfo.getType() == 0;
        TelephonyManager telephonyManager = (TelephonyManager) this.mContext.getSystemService("phone");
        if (telephonyManager != null) {
            return z && telephonyManager.isNetworkRoaming();
        }
        Log.w(Constants.TAG, "couldn't get telephony manager");
        return false;
    }

    public Long getMaxBytesOverMobile() {
        return 2147483647L;
    }

    public Long getRecommendedMaxBytesOverMobile() {
        return Long.valueOf(PlaybackStateCompat.ACTION_SET_SHUFFLE_MODE);
    }

    public void sendBroadcast(Intent intent) {
        this.mContext.sendBroadcast(intent);
    }

    public boolean userOwnsPackage(int i, String str) throws PackageManager.NameNotFoundException {
        return this.mContext.getPackageManager().getApplicationInfo(str, 0).uid == i;
    }

    public void postNotification(long j, Notification notification) {
        this.mNotificationManager.notify((int) j, notification);
    }

    public void cancelNotification(long j) {
        this.mNotificationManager.cancel((int) j);
    }

    public void cancelAllNotifications() {
        this.mNotificationManager.cancelAll();
    }

    public void startThread(Thread thread) {
        thread.start();
    }
}
