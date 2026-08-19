package com.sonymobile.scan3d.viewer.fragments.utils;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.WindowManager;

/* JADX INFO: loaded from: classes2.dex */
public class ViewerUtils {
    public static int getAdjustedPickerItemMargin(Context context, float f, int i) {
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        if (windowManager == null) {
            return 0;
        }
        DisplayMetrics displayMetrics = new DisplayMetrics();
        windowManager.getDefaultDisplay().getMetrics(displayMetrics);
        int iMin = Math.min((int) (displayMetrics.widthPixels / f), i);
        int i2 = displayMetrics.widthPixels % ((int) f);
        float f2 = f / 2.0f;
        float f3 = i2;
        return (int) (((f3 < f2 ? f3 + f2 : f3 - f2) / iMin) / 2.0f);
    }
}
