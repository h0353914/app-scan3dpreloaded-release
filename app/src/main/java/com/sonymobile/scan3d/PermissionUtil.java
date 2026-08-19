package com.sonymobile.scan3d;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.view.View;
import android.view.animation.TranslateAnimation;
import android.widget.Toast;
import androidx.annotation.NonNull;
import com.google.android.gms.auth.api.credentials.CredentialsApi;
import com.google.android.gms.drive.DriveFile;
import java.util.ArrayList;

public class PermissionUtil {
    private static final int SNACKBAR_ANIMATION_TIME = 400;
    public static final long SNACKBAR_SHOW_TIMEOUT = 8000;

    public enum Permissions {
        STORAGE(new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, null, 1000),
        CAMERA(new String[]{"android.permission.CAMERA"}, null, CredentialsApi.CREDENTIAL_PICKER_REQUEST_CODE),
        AUDIO(new String[]{"android.permission.RECORD_AUDIO"}, null, 3000),
        VIDEO_RECORDING(new String[]{"android.permission.WRITE_EXTERNAL_STORAGE", "android.permission.CAMERA", "android.permission.RECORD_AUDIO"}, new String[]{"android.permission.RECORD_AUDIO"}, 4000);

        private final String[] mOptionalPermissions;
        private final String[] mPermission;
        private final int mRequestCode;

        Permissions(String[] strArr, String[] strArr2, int i) {
            this.mPermission = strArr;
            this.mRequestCode = i;
            this.mOptionalPermissions = strArr2;
        }

        public String[] getPermissions() {
            return (String[]) this.mPermission.clone();
        }

        public String[] getOptionalPermissions() {
            String[] strArr = this.mOptionalPermissions;
            return strArr != null ? (String[]) strArr.clone() : new String[0];
        }

        public int getRequestCode() {
            return this.mRequestCode;
        }
    }

    public static boolean hasPermission(Context context, String str) {
        return context.checkSelfPermission(str) == 0;
    }

    public static boolean hasPermissions(Context context, String[] strArr) {
        for (String str : strArr) {
            if (!hasPermission(context, str)) {
                return false;
            }
        }
        return true;
    }

    public static String[] getMissingPermissions(Context context, String[] strArr) {
        ArrayList arrayList = new ArrayList();
        for (String str : strArr) {
            if (!hasPermission(context, str)) {
                arrayList.add(str);
            }
        }
        return (String[]) arrayList.toArray(new String[arrayList.size()]);
    }

    public static void startAppSettings(Context context) {
        Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
        intent.setPackage("com.android.settings");
        intent.setData(Uri.parse("package:" + context.getPackageName()));
        intent.setFlags(DriveFile.MODE_READ_ONLY);
        context.startActivity(intent);
        Toast.makeText(context, R.string.permissions_settings_toast, 0).show();
    }

    public static boolean shouldShowRequestPermissionRationale(Activity activity, String[] strArr) {
        boolean zShouldShowRequestPermissionRationale = true;
        for (String str : strArr) {
            zShouldShowRequestPermissionRationale &= activity.shouldShowRequestPermissionRationale(str);
        }
        return zShouldShowRequestPermissionRationale;
    }

    public static void showPermissionsSnackbar(@NonNull Handler handler, @NonNull View view) {
        TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, view.getHeight(), 0.0f);
        translateAnimation.setDuration(400L);
        view.startAnimation(translateAnimation);
        view.setVisibility(0);
        handler.postDelayed(removePermissionsContainer(view), SNACKBAR_SHOW_TIMEOUT);
    }

    public static Runnable removePermissionsContainer(View view) {
        return () -> {
            if (view.getVisibility() == 0) {
                TranslateAnimation translateAnimation = new TranslateAnimation(0.0f, 0.0f, 0.0f, view.getHeight());
                translateAnimation.setDuration(400L);
                view.startAnimation(translateAnimation);
                view.setVisibility(4);
            }
        };
    }
}
