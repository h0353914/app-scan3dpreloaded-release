package com.sonymobile.scan3d.expansionfile;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;

import com.google.android.vending.expansion.downloader.DownloaderClientMarshaller;
import com.sonymobile.scan3d.logging.DebugLog;

public class RemoteAlarmReceiver extends BroadcastReceiver {
    @Override
    public void onReceive(Context context, Intent intent) {
        try {
            DownloaderClientMarshaller.startDownloadServiceIfRequired(context, intent, RemoteDownloadService.class);
        } catch (PackageManager.NameNotFoundException e) {
            DebugLog.e(RemoteAlarmReceiver.class.getName(), "Unexpected exception", e);
        }
    }
}
