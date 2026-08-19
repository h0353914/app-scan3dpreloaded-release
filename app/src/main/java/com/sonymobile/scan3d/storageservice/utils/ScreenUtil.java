package com.sonymobile.scan3d.storageservice.utils;

import android.view.View;
import android.view.ViewGroup;

public class ScreenUtil {
    public static void setAspectRatio(View view) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (view.getWidth() > view.getHeight()) {
            params.width = (int) (view.getHeight() * 1.7777778f);
        } else {
            params.height = (int) (view.getWidth() * 1.7777778f);
        }
        view.setLayoutParams(params);
    }
}
