package com.sonymobile.scan3d.sharing;

import android.graphics.drawable.Drawable;

public interface NamedPlugin extends Plugin {
    Drawable getAppIcon();

    String getAppName();

    default boolean isPrivileged() {
        return false;
    }
}
