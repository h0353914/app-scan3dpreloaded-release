package com.google.android.vending.expansion.downloader.impl;

import android.R;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.os.Messenger;
import androidx.core.app.NotificationCompat;
import com.google.android.vending.expansion.downloader.DownloadProgressInfo;
import com.google.android.vending.expansion.downloader.DownloaderClientMarshaller;
import com.google.android.vending.expansion.downloader.Helpers;
import com.google.android.vending.expansion.downloader.IDownloaderClient;

/* JADX INFO: loaded from: classes.dex */
public class DownloadNotification implements IDownloaderClient {
    static final String LOGTAG = "DownloadNotification";
    static final int NOTIFICATION_ID = LOGTAG.hashCode();
    private NotificationCompat.Builder mActiveDownloadBuilder;
    private NotificationCompat.Builder mBuilder;
    private IDownloaderClient mClientProxy;
    private PendingIntent mContentIntent;
    private final Context mContext;
    private NotificationCompat.Builder mCurrentBuilder;
    private String mCurrentText;
    private CharSequence mCurrentTitle;
    private CharSequence mLabel;
    private final NotificationManager mNotificationManager;
    private DownloadProgressInfo mProgressInfo;
    private int mState = -1;

    @Override // com.google.android.vending.expansion.downloader.IDownloaderClient
    public void onServiceConnected(Messenger messenger) {
    }

    public PendingIntent getClientIntent() {
        return this.mContentIntent;
    }

    public void setClientIntent(PendingIntent pendingIntent) {
        this.mBuilder.setContentIntent(pendingIntent);
        this.mActiveDownloadBuilder.setContentIntent(pendingIntent);
        this.mContentIntent = pendingIntent;
    }

    public void resendState() {
        IDownloaderClient iDownloaderClient = this.mClientProxy;
        if (iDownloaderClient != null) {
            iDownloaderClient.onDownloadStateChanged(this.mState);
        }
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderClient
    public void onDownloadStateChanged(int i) {
        int downloaderStringResourceIDFromState;
        boolean z;
        IDownloaderClient iDownloaderClient = this.mClientProxy;
        if (iDownloaderClient != null) {
            iDownloaderClient.onDownloadStateChanged(i);
        }
        if (i != this.mState) {
            this.mState = i;
            if (i == 1 || this.mContentIntent == null) {
                return;
            }
            int i2 = R.drawable.stat_sys_download_done;
            if (i == 0) {
                downloaderStringResourceIDFromState = com.android.vending.expansion.downloader.R.string.state_unknown;
                i2 = 17301642;
                z = false;
            } else if (i != 7) {
                switch (i) {
                    case 2:
                    case 3:
                        downloaderStringResourceIDFromState = Helpers.getDownloaderStringResourceIDFromState(i);
                        z = true;
                        break;
                    case 4:
                        i2 = R.drawable.stat_sys_download;
                        downloaderStringResourceIDFromState = Helpers.getDownloaderStringResourceIDFromState(i);
                        z = true;
                        break;
                    case 5:
                        this.mNotificationManager.cancel(NOTIFICATION_ID);
                        downloaderStringResourceIDFromState = Helpers.getDownloaderStringResourceIDFromState(i);
                        z = false;
                        break;
                    default:
                        switch (i) {
                            case 15:
                            case 16:
                            case 17:
                            case 18:
                            case 19:
                                downloaderStringResourceIDFromState = Helpers.getDownloaderStringResourceIDFromState(i);
                                i2 = 17301642;
                                z = false;
                                break;
                            default:
                                downloaderStringResourceIDFromState = Helpers.getDownloaderStringResourceIDFromState(i);
                                i2 = 17301642;
                                z = true;
                                break;
                        }
                        break;
                }
            } else {
                downloaderStringResourceIDFromState = Helpers.getDownloaderStringResourceIDFromState(i);
                z = false;
            }
            this.mCurrentText = this.mContext.getString(downloaderStringResourceIDFromState);
            this.mCurrentTitle = this.mLabel;
            this.mCurrentBuilder.setTicker(((Object) this.mLabel) + ": " + this.mCurrentText);
            this.mCurrentBuilder.setSmallIcon(i2);
            this.mCurrentBuilder.setContentTitle(this.mCurrentTitle);
            this.mCurrentBuilder.setContentText(this.mCurrentText);
            if (z) {
                this.mCurrentBuilder.setOngoing(true);
            } else {
                this.mCurrentBuilder.setOngoing(false);
                this.mCurrentBuilder.setAutoCancel(true);
            }
            this.mNotificationManager.notify(NOTIFICATION_ID, this.mCurrentBuilder.build());
        }
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderClient
    public void onDownloadProgress(DownloadProgressInfo downloadProgressInfo) {
        this.mProgressInfo = downloadProgressInfo;
        IDownloaderClient iDownloaderClient = this.mClientProxy;
        if (iDownloaderClient != null) {
            iDownloaderClient.onDownloadProgress(downloadProgressInfo);
        }
        if (downloadProgressInfo.mOverallTotal <= 0) {
            this.mBuilder.setTicker(this.mCurrentTitle);
            this.mBuilder.setSmallIcon(R.drawable.stat_sys_download);
            this.mBuilder.setContentTitle(this.mCurrentTitle);
            this.mBuilder.setContentText(this.mCurrentText);
            this.mCurrentBuilder = this.mBuilder;
        } else {
            this.mActiveDownloadBuilder.setProgress((int) downloadProgressInfo.mOverallTotal, (int) downloadProgressInfo.mOverallProgress, false);
            this.mActiveDownloadBuilder.setContentText(Helpers.getDownloadProgressString(downloadProgressInfo.mOverallProgress, downloadProgressInfo.mOverallTotal));
            this.mActiveDownloadBuilder.setSmallIcon(R.drawable.stat_sys_download);
            this.mActiveDownloadBuilder.setTicker(((Object) this.mLabel) + ": " + this.mCurrentText);
            this.mActiveDownloadBuilder.setContentTitle(this.mLabel);
            this.mActiveDownloadBuilder.setContentInfo(this.mContext.getString(com.android.vending.expansion.downloader.R.string.time_remaining_notification, Helpers.getTimeRemaining(downloadProgressInfo.mTimeRemaining)));
            this.mCurrentBuilder = this.mActiveDownloadBuilder;
        }
        this.mNotificationManager.notify(NOTIFICATION_ID, this.mCurrentBuilder.build());
    }

    public void setMessenger(Messenger messenger) {
        this.mClientProxy = DownloaderClientMarshaller.CreateProxy(messenger);
        DownloadProgressInfo downloadProgressInfo = this.mProgressInfo;
        if (downloadProgressInfo != null) {
            this.mClientProxy.onDownloadProgress(downloadProgressInfo);
        }
        int i = this.mState;
        if (i != -1) {
            this.mClientProxy.onDownloadStateChanged(i);
        }
    }

    DownloadNotification(Context context, CharSequence charSequence) {
        this.mContext = context;
        this.mLabel = charSequence;
        this.mNotificationManager = (NotificationManager) this.mContext.getSystemService("notification");
        this.mActiveDownloadBuilder = new NotificationCompat.Builder(context, "status_channel");
        this.mBuilder = new NotificationCompat.Builder(context, "status_channel");
        this.mActiveDownloadBuilder.setPriority(-1);
        this.mActiveDownloadBuilder.setCategory("progress");
        this.mBuilder.setPriority(-1);
        this.mBuilder.setCategory("progress");
        this.mCurrentBuilder = this.mBuilder;
    }
}
