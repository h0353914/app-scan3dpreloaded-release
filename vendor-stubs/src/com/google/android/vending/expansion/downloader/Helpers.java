package com.google.android.vending.expansion.downloader;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.os.SystemClock;
import android.util.Log;
import com.amazonaws.services.s3.model.InstructionFileId;
import com.android.vending.expansion.downloader.R;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Random;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/* JADX INFO: loaded from: classes.dex */
public class Helpers {
    public static final int FS_CANNOT_READ = 2;
    public static final int FS_DOES_NOT_EXIST = 1;
    public static final int FS_READABLE = 0;
    public static Random sRandom = new Random(SystemClock.uptimeMillis());
    private static final Pattern CONTENT_DISPOSITION_PATTERN = Pattern.compile("attachment;\\s*filename\\s*=\\s*\"([^\"]*)\"");

    private Helpers() {
    }

    static String parseContentDisposition(String str) {
        try {
            Matcher matcher = CONTENT_DISPOSITION_PATTERN.matcher(str);
            if (matcher.find()) {
                return matcher.group(1);
            }
            return null;
        } catch (IllegalStateException unused) {
            return null;
        }
    }

    public static File getFilesystemRoot(String str) {
        File downloadCacheDirectory = Environment.getDownloadCacheDirectory();
        if (str.startsWith(downloadCacheDirectory.getPath())) {
            return downloadCacheDirectory;
        }
        File externalStorageDirectory = Environment.getExternalStorageDirectory();
        if (str.startsWith(externalStorageDirectory.getPath())) {
            return externalStorageDirectory;
        }
        throw new IllegalArgumentException("Cannot determine filesystem root for " + str);
    }

    public static boolean isExternalMediaMounted() {
        return Environment.getExternalStorageState().equals("mounted");
    }

    public static long getAvailableBytes(File file) {
        StatFs statFs = new StatFs(file.getPath());
        return ((long) statFs.getBlockSize()) * (((long) statFs.getAvailableBlocks()) - 4);
    }

    public static boolean isFilenameValid(String str) {
        String strReplaceFirst = str.replaceFirst("/+", "/");
        return strReplaceFirst.startsWith(Environment.getDownloadCacheDirectory().toString()) || strReplaceFirst.startsWith(Environment.getExternalStorageDirectory().toString());
    }

    static void deleteFile(String str) {
        try {
            new File(str).delete();
        } catch (Exception e) {
            Log.w(Constants.TAG, "file: '" + str + "' couldn't be deleted", e);
        }
    }

    public static String getDownloadProgressString(long j, long j2) {
        if (j2 == 0) {
            return "";
        }
        return String.format("%.2f", Float.valueOf(j / 1048576.0f)) + "MB /" + String.format("%.2f", Float.valueOf(j2 / 1048576.0f)) + "MB";
    }

    public static String getDownloadProgressStringNotification(long j, long j2) {
        if (j2 == 0) {
            return "";
        }
        return getDownloadProgressString(j, j2) + " (" + getDownloadProgressPercent(j, j2) + ")";
    }

    public static String getDownloadProgressPercent(long j, long j2) {
        if (j2 == 0) {
            return "";
        }
        return Long.toString((j * 100) / j2) + "%";
    }

    public static String getSpeedString(float f) {
        return String.format("%.2f", Float.valueOf((f * 1000.0f) / 1024.0f));
    }

    public static String getTimeRemaining(long j) {
        SimpleDateFormat simpleDateFormat;
        if (j > 3600000) {
            simpleDateFormat = new SimpleDateFormat("HH:mm", Locale.getDefault());
        } else {
            simpleDateFormat = new SimpleDateFormat("mm:ss", Locale.getDefault());
        }
        return simpleDateFormat.format(new Date(j - ((long) TimeZone.getDefault().getRawOffset())));
    }

    public static String getExpansionAPKFileName(Context context, boolean z, int i) {
        StringBuilder sb = new StringBuilder();
        sb.append(z ? "main." : "patch.");
        sb.append(i);
        sb.append(InstructionFileId.DOT);
        sb.append(context.getPackageName());
        sb.append(".obb");
        return sb.toString();
    }

    public static String generateSaveFileName(Context context, String str) {
        return getSaveFilePath(context) + File.separator + str;
    }

    @TargetApi(11)
    public static String getSaveFilePath(Context context) {
        if (Build.VERSION.SDK_INT >= 19) {
            return context.getObbDir().toString();
        }
        return Environment.getExternalStorageDirectory().toString() + Constants.EXP_PATH + context.getPackageName();
    }

    public static boolean doesFileExist(Context context, String str, long j, boolean z) {
        File file = new File(generateSaveFileName(context, str));
        if (!file.exists()) {
            return false;
        }
        if (file.length() == j) {
            return true;
        }
        if (!z) {
            return false;
        }
        file.delete();
        return false;
    }

    public static int getFileStatus(Context context, String str) {
        File file = new File(generateSaveFileName(context, str));
        if (file.exists()) {
            return file.canRead() ? 0 : 2;
        }
        return 1;
    }

    public static boolean canWriteOBBFile(Context context) {
        File file = new File(getSaveFilePath(context));
        if (file.exists()) {
            return file.isDirectory() && file.canWrite();
        }
        return file.mkdirs();
    }

    public static int getDownloaderStringResourceIDFromState(int i) {
        switch (i) {
            case 1:
                return R.string.state_idle;
            case 2:
                return R.string.state_fetching_url;
            case 3:
                return R.string.state_connecting;
            case 4:
                return R.string.state_downloading;
            case 5:
                return R.string.state_completed;
            case 6:
                return R.string.state_paused_network_unavailable;
            case 7:
                return R.string.state_paused_by_request;
            case 8:
                return R.string.state_paused_wifi_disabled;
            case 9:
                return R.string.state_paused_wifi_unavailable;
            case 10:
                return R.string.state_paused_wifi_disabled;
            case 11:
                return R.string.state_paused_wifi_unavailable;
            case 12:
                return R.string.state_paused_roaming;
            case 13:
                return R.string.state_paused_network_setup_failure;
            case 14:
                return R.string.state_paused_sdcard_unavailable;
            case 15:
                return R.string.state_failed_unlicensed;
            case 16:
                return R.string.state_failed_fetching_url;
            case 17:
                return R.string.state_failed_sdcard_full;
            case 18:
                return R.string.state_failed_cancelled;
            default:
                return R.string.state_unknown;
        }
    }
}
