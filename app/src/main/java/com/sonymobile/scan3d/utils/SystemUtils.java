package com.sonymobile.scan3d.utils;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.preference.PreferenceManager;
import android.view.Display;
import android.view.WindowManager;

import com.google.android.gms.common.GoogleApiAvailability;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.sonymobile.scan3d.R;

public class SystemUtils {
    private static final String ALBUM_VIEW = "com.sonymobile.album.action.VIEW";
    private static final String CTA_PACKAGE_NAME = "com.sonymobile.cta";

    private static boolean sAllowData;

    public static long getDisplayRefreshNsec(Activity activity) {
        WindowManager windowManager = (WindowManager) activity.getSystemService("window");
        Display display = windowManager.getDefaultDisplay();
        float refreshRate = display.getRefreshRate();
        return Math.round(1.0E9 / refreshRate);
    }

    public static void initFirebase(Context context) {
        FirebaseOptions options = FirebaseOptions.fromResource(context);
        FirebaseApp.initializeApp(context, options);
    }

    public static synchronized boolean isDataAllowed(Context context) {
        if (!sAllowData) {
            boolean installed = isPackageInstalled(context, CTA_PACKAGE_NAME);
            boolean allow = true;
            if (installed) {
                SharedPreferences preferences = PreferenceManager.getDefaultSharedPreferences(context);
                String key = context.getString(R.string.pref_key_show_cta_notification);
                if (preferences.getBoolean(key, true)) {
                    allow = false;
                }
            }
            sAllowData = allow;
        }
        return sAllowData;
    }

    public static boolean isGooglePlayServicesAvailable(Context context) {
        return GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context) == 0;
    }

    public static boolean isPackageInstalled(Context context, String str) {
        try {
            context.getPackageManager().getPackageInfo(str, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    public static void setCurrentOrientation(Activity activity, boolean z) {
        if (z) {
            int rotation = activity.getWindowManager().getDefaultDisplay().getRotation();
            int orientation;
            switch (rotation) {
                case 1:
                    orientation = 0;
                    break;
                case 2:
                    orientation = 9;
                    break;
                case 3:
                    orientation = 8;
                    break;
                default:
                    orientation = 1;
                    break;
            }
            activity.setRequestedOrientation(orientation);
        } else {
            activity.setRequestedOrientation(-1);
        }
    }

    public static boolean showCtaNotification(Context context) {
        return !isDataAllowed(context);
    }
}
