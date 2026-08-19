package com.sonymobile.scan3d;

import android.os.Build;
import java.util.HashSet;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class PlatformTypeDetector {
    private static final Set<String> sPlatformsLowEnd = new HashSet();

    static {
        sPlatformsLowEnd.add("sdm660");
    }

    public static int detectPlatform() {
        return sPlatformsLowEnd.contains(Build.BOARD) ? 1 : 0;
    }
}
