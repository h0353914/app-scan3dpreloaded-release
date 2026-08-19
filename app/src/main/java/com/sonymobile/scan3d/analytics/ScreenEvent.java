package com.sonymobile.scan3d.analytics;

import android.content.Context;

public enum ScreenEvent {
    ONBOARDING("Onboarding screen"),
    WALLPAPER_SCREEN("Wallpaper screen"),
    WEBVIEWER_SCREEN("Scan3d web viewer screen"),
    VIEWER_SCREEN("Viewer screen"),
    GALLERY_SCREEN("Gallery screen"),
    AUTH_SCREEN("Auth screen"),
    SCREEN_EVENT_FROM_REFERENS_ID;

    public static final boolean ENTERING_SCREEN = true;

    private final String mName;

    ScreenEvent() {
        this("");
    }

    ScreenEvent(String name) {
        mName = name;
    }

    public void send(Context context) {
        send(context, true);
    }

    public void send(Context context, int resId) {
        SBDPUtil sbdpUtil = SBDPUtil.getInstance(context);
        String name = context.getResources().getString(resId);
        sbdpUtil.pushAppView(name, true);
    }

    public void send(Context context, boolean entering) {
        SBDPUtil.getInstance(context).pushAppView(mName, entering);
    }
}
