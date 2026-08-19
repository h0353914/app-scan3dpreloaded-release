package com.sonymobile.scan3d;

import android.graphics.Bitmap;

/* JADX INFO: loaded from: classes.dex */
public class EnvironmentError {
    public boolean critical;
    public Bitmap primaryImage;
    public Bitmap secondaryImage;
    public ErrorType type;

    public enum ErrorType {
        TYPE_TOO_DARK,
        TYPE_TOO_BRIGHT,
        TYPE_UNEVEN_LIGHT,
        TYPE_LOW_TEXTURE_AREA,
        TYPE_BAD_LOOP_CLOSURE
    }
}
