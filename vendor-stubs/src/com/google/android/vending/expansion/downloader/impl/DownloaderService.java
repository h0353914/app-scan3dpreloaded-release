package com.google.android.vending.expansion.downloader.impl;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiManager;
import android.os.Handler;
import android.os.IBinder;
import android.os.Messenger;
import android.os.SystemClock;
import android.provider.Settings;
import android.util.Log;
import androidx.core.app.NotificationCompat;
import com.google.android.vending.expansion.downloader.Constants;
import com.google.android.vending.expansion.downloader.DownloadProgressInfo;
import com.google.android.vending.expansion.downloader.DownloaderServiceMarshaller;
import com.google.android.vending.expansion.downloader.Helpers;
import com.google.android.vending.expansion.downloader.IDownloaderService;
import com.google.android.vending.expansion.downloader.IStub;
import com.google.android.vending.licensing.AESObfuscator;
import com.google.android.vending.licensing.APKExpansionPolicy;
import com.google.android.vending.licensing.LicenseChecker;
import com.google.android.vending.licensing.LicenseCheckerCallback;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public abstract class DownloaderService extends CustomIntentService implements IDownloaderService {
    public static final String ACTION_DOWNLOADS_CHANGED = "downloadsChanged";
    public static final String ACTION_DOWNLOAD_COMPLETE = "lvldownloader.intent.action.DOWNLOAD_COMPLETE";
    public static final String ACTION_DOWNLOAD_STATUS = "lvldownloader.intent.action.DOWNLOAD_STATUS";
    public static final int CONTROL_PAUSED = 1;
    public static final int CONTROL_RUN = 0;
    public static final int DOWNLOAD_REQUIRED = 2;
    public static final String EXTRA_FILE_NAME = "downloadId";
    public static final String EXTRA_IS_WIFI_REQUIRED = "isWifiRequired";
    public static final String EXTRA_MESSAGE_HANDLER = "EMH";
    public static final String EXTRA_PACKAGE_NAME = "EPN";
    public static final String EXTRA_PENDING_INTENT = "EPI";
    public static final String EXTRA_STATUS_CURRENT_FILE_SIZE = "CFS";
    public static final String EXTRA_STATUS_CURRENT_PROGRESS = "CFP";
    public static final String EXTRA_STATUS_STATE = "ESS";
    public static final String EXTRA_STATUS_TOTAL_PROGRESS = "TFP";
    public static final String EXTRA_STATUS_TOTAL_SIZE = "ETS";
    private static final String LOG_TAG = "LVLDL";
    public static final int LVL_CHECK_REQUIRED = 1;
    public static final int NETWORK_CANNOT_USE_ROAMING = 5;
    public static final int NETWORK_MOBILE = 1;
    public static final int NETWORK_NO_CONNECTION = 2;
    public static final int NETWORK_OK = 1;
    public static final int NETWORK_RECOMMENDED_UNUSABLE_DUE_TO_SIZE = 4;
    public static final int NETWORK_TYPE_DISALLOWED_BY_REQUESTOR = 6;
    public static final int NETWORK_UNUSABLE_DUE_TO_SIZE = 3;
    public static final int NETWORK_WIFI = 2;
    public static final int NO_DOWNLOAD_REQUIRED = 0;
    private static final float SMOOTHING_FACTOR = 0.005f;
    public static final int STATUS_CANCELED = 490;
    public static final int STATUS_CANNOT_RESUME = 489;
    public static final int STATUS_DEVICE_NOT_FOUND_ERROR = 499;
    public static final int STATUS_FILE_ALREADY_EXISTS_ERROR = 488;
    public static final int STATUS_FILE_DELIVERED_INCORRECTLY = 487;
    public static final int STATUS_FILE_ERROR = 492;
    public static final int STATUS_FORBIDDEN = 403;
    public static final int STATUS_HTTP_DATA_ERROR = 495;
    public static final int STATUS_HTTP_EXCEPTION = 496;
    public static final int STATUS_INSUFFICIENT_SPACE_ERROR = 498;
    public static final int STATUS_PAUSED_BY_APP = 193;
    public static final int STATUS_PENDING = 190;
    public static final int STATUS_QUEUED_FOR_WIFI = 197;
    public static final int STATUS_QUEUED_FOR_WIFI_OR_CELLULAR_PERMISSION = 196;
    public static final int STATUS_RUNNING = 192;
    public static final int STATUS_SUCCESS = 200;
    public static final int STATUS_TOO_MANY_REDIRECTS = 497;
    public static final int STATUS_UNHANDLED_HTTP_CODE = 494;
    public static final int STATUS_UNHANDLED_REDIRECT = 493;
    public static final int STATUS_UNKNOWN_ERROR = 491;
    public static final int STATUS_WAITING_FOR_NETWORK = 195;
    public static final int STATUS_WAITING_TO_RETRY = 194;
    private static final String TEMP_EXT = ".tmp";
    public static final int VISIBILITY_HIDDEN = 2;
    public static final int VISIBILITY_VISIBLE = 0;
    public static final int VISIBILITY_VISIBLE_NOTIFY_COMPLETED = 1;
    private static boolean sIsRunning;
    private PendingIntent mAlarmIntent;
    float mAverageDownloadSpeed;
    long mBytesAtSample;
    long mBytesSoFar;
    private Messenger mClientMessenger;
    private BroadcastReceiver mConnReceiver;
    private ConnectivityManager mConnectivityManager;
    private int mControl;
    int mFileCount;
    private boolean mIsAtLeast3G;
    private boolean mIsAtLeast4G;
    private boolean mIsCellularConnection;
    private boolean mIsConnected;
    private boolean mIsFailover;
    private boolean mIsRoaming;
    long mMillisecondsAtSample;
    private DownloadNotification mNotification;
    private PackageInfo mPackageInfo;
    private PendingIntent mPendingIntent;
    private final Messenger mServiceMessenger;
    private final IStub mServiceStub;
    private boolean mStateChanged;
    private int mStatus;
    long mTotalLength;
    private WifiManager mWifiManager;

    public static boolean isStatusClientError(int i) {
        return i >= 400 && i < 500;
    }

    public static boolean isStatusCompleted(int i) {
        return (i >= 200 && i < 300) || (i >= 400 && i < 600);
    }

    public static boolean isStatusError(int i) {
        return i >= 400 && i < 600;
    }

    public static boolean isStatusInformational(int i) {
        return i >= 100 && i < 200;
    }

    public static boolean isStatusServerError(int i) {
        return i >= 500 && i < 600;
    }

    public static boolean isStatusSuccess(int i) {
        return i >= 200 && i < 300;
    }

    public abstract String getAlarmReceiverClassName();

    public String getLogMessageForNetworkError(int i) {
        switch (i) {
            case 2:
                return "no network connection available";
            case 3:
                return "download size exceeds limit for mobile network";
            case 4:
                return "download size exceeds recommended limit for mobile network";
            case 5:
                return "download cannot use the current network connection because it is roaming";
            case 6:
                return "download was requested to not use the current network type";
            default:
                return "unknown error with network connectivity";
        }
    }

    public abstract String getPublicKey();

    public abstract byte[] getSALT();

    public DownloaderService() {
        super("LVLDownloadService");
        this.mServiceStub = DownloaderServiceMarshaller.CreateStub(this);
        this.mServiceMessenger = this.mServiceStub.getMessenger();
    }

    @Override // com.google.android.vending.expansion.downloader.impl.CustomIntentService, android.app.Service
    public IBinder onBind(Intent intent) {
        Log.d("LVLDL", "Service Bound");
        return this.mServiceMessenger.getBinder();
    }

    public boolean isWiFi() {
        return this.mIsConnected && !this.mIsCellularConnection;
    }

    private void updateNetworkType(int i, int i2) {
        switch (i) {
            case 0:
                this.mIsCellularConnection = true;
                switch (i2) {
                    case 1:
                    case 2:
                    case 4:
                    case 7:
                    case 11:
                        this.mIsAtLeast3G = false;
                        this.mIsAtLeast4G = false;
                        break;
                    case 3:
                    case 5:
                    case 6:
                    case 8:
                    case 9:
                    case 10:
                        this.mIsAtLeast3G = true;
                        this.mIsAtLeast4G = false;
                        break;
                    case 12:
                    default:
                        this.mIsCellularConnection = false;
                        this.mIsAtLeast3G = false;
                        this.mIsAtLeast4G = false;
                        break;
                    case 13:
                    case 14:
                    case 15:
                        this.mIsAtLeast3G = true;
                        this.mIsAtLeast4G = true;
                        break;
                }
                break;
            case 1:
            case 7:
            case 9:
                this.mIsCellularConnection = false;
                this.mIsAtLeast3G = false;
                this.mIsAtLeast4G = false;
                break;
            case 6:
                this.mIsCellularConnection = true;
                this.mIsAtLeast3G = true;
                this.mIsAtLeast4G = true;
                break;
        }
    }

    private void updateNetworkState(NetworkInfo networkInfo) {
        boolean z = this.mIsConnected;
        boolean z2 = this.mIsFailover;
        boolean z3 = this.mIsCellularConnection;
        boolean z4 = this.mIsRoaming;
        boolean z5 = this.mIsAtLeast3G;
        if (networkInfo != null) {
            this.mIsRoaming = networkInfo.isRoaming();
            this.mIsFailover = networkInfo.isFailover();
            this.mIsConnected = networkInfo.isConnected();
            updateNetworkType(networkInfo.getType(), networkInfo.getSubtype());
        } else {
            this.mIsRoaming = false;
            this.mIsFailover = false;
            this.mIsConnected = false;
            updateNetworkType(-1, -1);
        }
        this.mStateChanged = (!this.mStateChanged && z == this.mIsConnected && z2 == this.mIsFailover && z3 == this.mIsCellularConnection && z4 == this.mIsRoaming && z5 == this.mIsAtLeast3G) ? false : true;
    }

    void pollNetworkState() {
        if (this.mConnectivityManager == null) {
            this.mConnectivityManager = (ConnectivityManager) getSystemService("connectivity");
        }
        if (this.mWifiManager == null) {
            this.mWifiManager = (WifiManager) getApplicationContext().getSystemService("wifi");
        }
        ConnectivityManager connectivityManager = this.mConnectivityManager;
        if (connectivityManager == null) {
            Log.w("LVLDL", "couldn't get connectivity manager to poll network state");
        } else {
            updateNetworkState(connectivityManager.getActiveNetworkInfo());
        }
    }

    private static boolean isLVLCheckRequired(DownloadsDB downloadsDB, PackageInfo packageInfo) {
        return downloadsDB.mVersionCode != packageInfo.versionCode;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static synchronized boolean isServiceRunning() {
        return sIsRunning;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static synchronized void setServiceRunning(boolean z) {
        sIsRunning = z;
    }

    public static int startDownloadServiceIfRequired(Context context, Intent intent, Class<?> cls) throws PackageManager.NameNotFoundException {
        return startDownloadServiceIfRequired(context, (PendingIntent) intent.getParcelableExtra(EXTRA_PENDING_INTENT), cls);
    }

    public static int startDownloadServiceIfRequired(Context context, PendingIntent pendingIntent, Class<?> cls) throws PackageManager.NameNotFoundException {
        return startDownloadServiceIfRequired(context, pendingIntent, context.getPackageName(), cls.getName());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v0 */
    /* JADX WARN: Type inference failed for: r4v1, types: [int] */
    /* JADX WARN: Type inference failed for: r4v2 */
    /* JADX WARN: Type inference failed for: r4v3 */
    public static int startDownloadServiceIfRequired(Context context, PendingIntent pendingIntent, String str, String str2) throws PackageManager.NameNotFoundException {
        int i = 0;
        PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        DownloadsDB db = DownloadsDB.getDB(context);
        boolean zIsLVLCheckRequired = isLVLCheckRequired(db, packageInfo);
        int r4 = 2;
        if (db.mStatus == 0) {
            DownloadInfo[] downloads = db.getDownloads();
            if (downloads == null) {
                r4 = zIsLVLCheckRequired ? 1 : 0;
            } else {
                int length = downloads.length;
                while (true) {
                    if (i >= length) {
                        r4 = zIsLVLCheckRequired ? 1 : 0;
                        break;
                    }
                    DownloadInfo downloadInfo = downloads[i];
                    if (!Helpers.doesFileExist(context, downloadInfo.mFileName, downloadInfo.mTotalBytes, true)) {
                        db.updateStatus(-1);
                        break;
                    }
                    i++;
                }
            }
        }
        switch (r4) {
            case 1:
            case 2:
                Intent intent = new Intent();
                intent.setClassName(str, str2);
                intent.putExtra(EXTRA_PENDING_INTENT, pendingIntent);
                context.startService(intent);
            default:
                return r4;
        }
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderService
    public void requestAbortDownload() {
        this.mControl = 1;
        this.mStatus = 490;
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderService
    public void requestPauseDownload() {
        this.mControl = 1;
        this.mStatus = STATUS_PAUSED_BY_APP;
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderService
    public void setDownloadFlags(int i) {
        DownloadsDB.getDB(this).updateFlags(i);
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderService
    public void requestContinueDownload() {
        if (this.mControl == 1) {
            this.mControl = 0;
        }
        Intent intent = new Intent(this, getClass());
        intent.putExtra(EXTRA_PENDING_INTENT, this.mPendingIntent);
        startService(intent);
    }

    private class LVLRunnable implements Runnable {
        final Context mContext;

        LVLRunnable(Context context, PendingIntent pendingIntent) {
            this.mContext = context;
            DownloaderService.this.mPendingIntent = pendingIntent;
        }

        @Override // java.lang.Runnable
        public void run() {
            DownloaderService.setServiceRunning(true);
            DownloaderService.this.mNotification.onDownloadStateChanged(2);
            final APKExpansionPolicy aPKExpansionPolicy = new APKExpansionPolicy(this.mContext, new AESObfuscator(DownloaderService.this.getSALT(), this.mContext.getPackageName(), Settings.Secure.getString(this.mContext.getContentResolver(), "android_id")));
            aPKExpansionPolicy.resetPolicy();
            new LicenseChecker(this.mContext, aPKExpansionPolicy, DownloaderService.this.getPublicKey()).checkAccess(new LicenseCheckerCallback() { // from class: com.google.android.vending.expansion.downloader.impl.DownloaderService.LVLRunnable.1
                @Override // com.google.android.vending.licensing.LicenseCheckerCallback
                public void allow(int i) {
                    int i2;
                    try {
                        int expansionURLCount = aPKExpansionPolicy.getExpansionURLCount();
                        DownloadsDB db = DownloadsDB.getDB(LVLRunnable.this.mContext);
                        if (expansionURLCount != 0) {
                            i2 = 0;
                            for (int i3 = 0; i3 < expansionURLCount; i3++) {
                                String expansionFileName = aPKExpansionPolicy.getExpansionFileName(i3);
                                if (expansionFileName != null) {
                                    DownloadInfo downloadInfo = new DownloadInfo(i3, expansionFileName, LVLRunnable.this.mContext.getPackageName());
                                    long expansionFileSize = aPKExpansionPolicy.getExpansionFileSize(i3);
                                    if (DownloaderService.this.handleFileUpdated(db, i3, expansionFileName, expansionFileSize)) {
                                        int i4 = i2 | (-1);
                                        downloadInfo.resetDownload();
                                        downloadInfo.mUri = aPKExpansionPolicy.getExpansionURL(i3);
                                        downloadInfo.mTotalBytes = expansionFileSize;
                                        downloadInfo.mStatus = i4;
                                        db.updateDownload(downloadInfo);
                                        i2 = i4;
                                    } else {
                                        DownloadInfo downloadInfoByFileName = db.getDownloadInfoByFileName(downloadInfo.mFileName);
                                        if (downloadInfoByFileName == null) {
                                            Log.d("LVLDL", "file " + downloadInfo.mFileName + " found. Not downloading.");
                                            downloadInfo.mStatus = 200;
                                            downloadInfo.mTotalBytes = expansionFileSize;
                                            downloadInfo.mCurrentBytes = expansionFileSize;
                                            downloadInfo.mUri = aPKExpansionPolicy.getExpansionURL(i3);
                                            db.updateDownload(downloadInfo);
                                        } else if (downloadInfoByFileName.mStatus != 200) {
                                            downloadInfoByFileName.mUri = aPKExpansionPolicy.getExpansionURL(i3);
                                            db.updateDownload(downloadInfoByFileName);
                                            i2 |= -1;
                                        }
                                    }
                                }
                            }
                        } else {
                            i2 = 0;
                        }
                        try {
                            db.updateMetadata(LVLRunnable.this.mContext.getPackageManager().getPackageInfo(LVLRunnable.this.mContext.getPackageName(), 0).versionCode, i2);
                            switch (DownloaderService.startDownloadServiceIfRequired(LVLRunnable.this.mContext, DownloaderService.this.mPendingIntent, DownloaderService.this.getClass())) {
                                case 0:
                                    DownloaderService.this.mNotification.onDownloadStateChanged(5);
                                    break;
                                case 1:
                                    Log.e("LVLDL", "In LVL checking loop!");
                                    DownloaderService.this.mNotification.onDownloadStateChanged(15);
                                    throw new RuntimeException("Error with LVL checking and database integrity");
                            }
                            DownloaderService.setServiceRunning(false);
                        } catch (PackageManager.NameNotFoundException e) {
                            e.printStackTrace();
                            throw new RuntimeException("Error with getting information from package name");
                        }
                    } catch (Throwable th) {
                        DownloaderService.setServiceRunning(false);
                        throw th;
                    }
                }

                @Override // com.google.android.vending.licensing.LicenseCheckerCallback
                public void dontAllow(int i) {
                    try {
                        if (i != 291) {
                            if (i == 561) {
                                DownloaderService.this.mNotification.onDownloadStateChanged(15);
                            }
                            DownloaderService.setServiceRunning(false);
                        }
                        DownloaderService.this.mNotification.onDownloadStateChanged(16);
                        DownloaderService.setServiceRunning(false);
                    } catch (Throwable th) {
                        DownloaderService.setServiceRunning(false);
                        throw th;
                    }
                }

                @Override // com.google.android.vending.licensing.LicenseCheckerCallback
                public void applicationError(int i) {
                    try {
                        DownloaderService.this.mNotification.onDownloadStateChanged(16);
                    } finally {
                        DownloaderService.setServiceRunning(false);
                    }
                }
            });
        }
    }

    public void updateLVL(Context context) {
        Context applicationContext = context.getApplicationContext();
        new Handler(applicationContext.getMainLooper()).post(new LVLRunnable(applicationContext, this.mPendingIntent));
    }

    public boolean handleFileUpdated(DownloadsDB downloadsDB, int i, String str, long j) {
        String str2;
        DownloadInfo downloadInfoByFileName = downloadsDB.getDownloadInfoByFileName(str);
        if (downloadInfoByFileName != null && (str2 = downloadInfoByFileName.mFileName) != null) {
            if (str.equals(str2)) {
                return false;
            }
            File file = new File(Helpers.generateSaveFileName(this, str2));
            if (file.exists()) {
                file.delete();
            }
        }
        return true ^ Helpers.doesFileExist(this, str, j, true);
    }

    private void scheduleAlarm(long j) {
        AlarmManager alarmManager = (AlarmManager) getSystemService(NotificationCompat.CATEGORY_ALARM);
        if (alarmManager == null) {
            Log.e("LVLDL", "couldn't get alarm manager");
            return;
        }
        String alarmReceiverClassName = getAlarmReceiverClassName();
        Intent intent = new Intent(Constants.ACTION_RETRY);
        intent.putExtra(EXTRA_PENDING_INTENT, this.mPendingIntent);
        intent.setClassName(getPackageName(), alarmReceiverClassName);
        this.mAlarmIntent = PendingIntent.getBroadcast(this, 0, intent, 1073741824);
        alarmManager.set(0, System.currentTimeMillis() + j, this.mAlarmIntent);
    }

    private void cancelAlarms() {
        if (this.mAlarmIntent != null) {
            AlarmManager alarmManager = (AlarmManager) getSystemService(NotificationCompat.CATEGORY_ALARM);
            if (alarmManager == null) {
                Log.e("LVLDL", "couldn't get alarm manager");
            } else {
                alarmManager.cancel(this.mAlarmIntent);
                this.mAlarmIntent = null;
            }
        }
    }

    private class InnerBroadcastReceiver extends BroadcastReceiver {
        final Service mService;

        InnerBroadcastReceiver(Service service) {
            this.mService = service;
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            DownloaderService.this.pollNetworkState();
            if (!DownloaderService.this.mStateChanged || DownloaderService.isServiceRunning()) {
                return;
            }
            Log.d("LVLDL", "InnerBroadcastReceiver Called");
            Intent intent2 = new Intent(context, this.mService.getClass());
            intent2.putExtra(DownloaderService.EXTRA_PENDING_INTENT, DownloaderService.this.mPendingIntent);
            context.startService(intent2);
        }
    }

    @Override // com.google.android.vending.expansion.downloader.impl.CustomIntentService
    protected void onHandleIntent(Intent intent) {
        int i;
        boolean z = true;
        setServiceRunning(true);
        try {
            DownloadsDB db = DownloadsDB.getDB(this);
            PendingIntent pendingIntent = (PendingIntent) intent.getParcelableExtra(EXTRA_PENDING_INTENT);
            if (pendingIntent != null) {
                this.mNotification.setClientIntent(pendingIntent);
                this.mPendingIntent = pendingIntent;
            } else {
                if (this.mPendingIntent == null) {
                    Log.e("LVLDL", "Downloader started in bad state without notification intent.");
                    return;
                }
                this.mNotification.setClientIntent(this.mPendingIntent);
            }
            if (isLVLCheckRequired(db, this.mPackageInfo)) {
                updateLVL(this);
                return;
            }
            DownloadInfo[] downloads = db.getDownloads();
            long j = 0;
            this.mBytesSoFar = 0L;
            this.mTotalLength = 0L;
            this.mFileCount = downloads.length;
            for (DownloadInfo downloadInfo : downloads) {
                if (downloadInfo.mStatus == 200 && !Helpers.doesFileExist(this, downloadInfo.mFileName, downloadInfo.mTotalBytes, true)) {
                    downloadInfo.mStatus = 0;
                    downloadInfo.mCurrentBytes = 0L;
                }
                this.mTotalLength += downloadInfo.mTotalBytes;
                this.mBytesSoFar += downloadInfo.mCurrentBytes;
            }
            pollNetworkState();
            if (this.mConnReceiver == null) {
                this.mConnReceiver = new InnerBroadcastReceiver(this);
                IntentFilter intentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
                intentFilter.addAction("android.net.wifi.WIFI_STATE_CHANGED");
                registerReceiver(this.mConnReceiver, intentFilter);
            }
            int length = downloads.length;
            int i2 = 0;
            while (i2 < length) {
                DownloadInfo downloadInfo2 = downloads[i2];
                long j2 = downloadInfo2.mCurrentBytes;
                if (downloadInfo2.mStatus != 200) {
                    DownloadThread downloadThread = new DownloadThread(downloadInfo2, this, this.mNotification);
                    cancelAlarms();
                    scheduleAlarm(Constants.ACTIVE_THREAD_WATCHDOG);
                    downloadThread.run();
                    cancelAlarms();
                }
                db.updateFromDb(downloadInfo2);
                int i3 = downloadInfo2.mStatus;
                if (i3 != 200) {
                    if (i3 == 403) {
                        updateLVL(this);
                        return;
                    }
                    if (i3 == 487) {
                        downloadInfo2.mCurrentBytes = j;
                        db.updateDownload(downloadInfo2);
                        i = 13;
                    } else if (i3 != 490) {
                        switch (i3) {
                            case STATUS_PAUSED_BY_APP /* 193 */:
                                i = 7;
                                z = false;
                                break;
                            case STATUS_WAITING_TO_RETRY /* 194 */:
                            case STATUS_WAITING_FOR_NETWORK /* 195 */:
                                i = 6;
                                break;
                            case STATUS_QUEUED_FOR_WIFI_OR_CELLULAR_PERMISSION /* 196 */:
                            case STATUS_QUEUED_FOR_WIFI /* 197 */:
                                i = (this.mWifiManager != null && !this.mWifiManager.isWifiEnabled()) ? 8 : 9;
                                break;
                            default:
                                switch (i3) {
                                    case 498:
                                        i = 17;
                                        break;
                                    case 499:
                                        i = 14;
                                        break;
                                    default:
                                        i = 19;
                                        z = false;
                                        break;
                                }
                                break;
                        }
                    } else {
                        i = 18;
                    }
                    if (z) {
                        scheduleAlarm(60000L);
                    } else {
                        cancelAlarms();
                    }
                    this.mNotification.onDownloadStateChanged(i);
                    return;
                }
                this.mBytesSoFar += downloadInfo2.mCurrentBytes - j2;
                db.updateMetadata(this.mPackageInfo.versionCode, 0);
                i2++;
                j = 0;
            }
            this.mNotification.onDownloadStateChanged(5);
        } finally {
            setServiceRunning(false);
        }
    }

    @Override // com.google.android.vending.expansion.downloader.impl.CustomIntentService, android.app.Service
    public void onDestroy() {
        BroadcastReceiver broadcastReceiver = this.mConnReceiver;
        if (broadcastReceiver != null) {
            unregisterReceiver(broadcastReceiver);
            this.mConnReceiver = null;
        }
        this.mServiceStub.disconnect(this);
        super.onDestroy();
    }

    public int getNetworkAvailabilityState(DownloadsDB downloadsDB) {
        if (!this.mIsConnected) {
            return 2;
        }
        if (!this.mIsCellularConnection) {
            return 1;
        }
        int i = downloadsDB.mFlags;
        if (this.mIsRoaming) {
            return 5;
        }
        return (i & 1) != 0 ? 1 : 6;
    }

    @Override // com.google.android.vending.expansion.downloader.impl.CustomIntentService, android.app.Service
    public void onCreate() {
        super.onCreate();
        try {
            this.mPackageInfo = getPackageManager().getPackageInfo(getPackageName(), 0);
            this.mNotification = new DownloadNotification(this, getPackageManager().getApplicationLabel(getApplicationInfo()));
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static class GenerateSaveFileError extends Exception {
        private static final long serialVersionUID = 3465966015408936540L;
        String mMessage;
        int mStatus;

        public GenerateSaveFileError(int i, String str) {
            this.mStatus = i;
            this.mMessage = str;
        }
    }

    public String generateTempSaveFileName(String str) {
        return Helpers.getSaveFilePath(this) + File.separator + str + ".tmp";
    }

    public String generateSaveFile(String str, long j) throws GenerateSaveFileError {
        String strGenerateTempSaveFileName = generateTempSaveFileName(str);
        File file = new File(strGenerateTempSaveFileName);
        if (!Helpers.isExternalMediaMounted()) {
            Log.d("LVLDL", "External media not mounted: " + strGenerateTempSaveFileName);
            throw new GenerateSaveFileError(499, "external media is not yet mounted");
        }
        if (!file.exists()) {
            if (Helpers.getAvailableBytes(Helpers.getFilesystemRoot(strGenerateTempSaveFileName)) >= j) {
                return strGenerateTempSaveFileName;
            }
            throw new GenerateSaveFileError(498, "insufficient space on external storage");
        }
        Log.d("LVLDL", "File already exists: " + strGenerateTempSaveFileName);
        throw new GenerateSaveFileError(488, "requested destination file already exists");
    }

    public int getControl() {
        return this.mControl;
    }

    public int getStatus() {
        return this.mStatus;
    }

    public void notifyUpdateBytes(long j) {
        long j2;
        long jUptimeMillis = SystemClock.uptimeMillis();
        long j3 = this.mMillisecondsAtSample;
        if (0 != j3) {
            float f = (j - this.mBytesAtSample) / (jUptimeMillis - j3);
            float f2 = this.mAverageDownloadSpeed;
            if (0.0f != f2) {
                this.mAverageDownloadSpeed = (f * SMOOTHING_FACTOR) + (f2 * 0.995f);
            } else {
                this.mAverageDownloadSpeed = f;
            }
            j2 = (long) ((this.mTotalLength - j) / this.mAverageDownloadSpeed);
        } else {
            j2 = -1;
        }
        this.mMillisecondsAtSample = jUptimeMillis;
        this.mBytesAtSample = j;
        this.mNotification.onDownloadProgress(new DownloadProgressInfo(this.mTotalLength, j, j2, this.mAverageDownloadSpeed));
    }

    @Override // com.google.android.vending.expansion.downloader.impl.CustomIntentService
    protected boolean shouldStop() {
        return DownloadsDB.getDB(this).mStatus == 0;
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderService
    public void requestDownloadStatus() {
        this.mNotification.resendState();
    }

    @Override // com.google.android.vending.expansion.downloader.IDownloaderService
    public void onClientUpdated(Messenger messenger) {
        this.mClientMessenger = messenger;
        this.mNotification.setMessenger(this.mClientMessenger);
    }
}
