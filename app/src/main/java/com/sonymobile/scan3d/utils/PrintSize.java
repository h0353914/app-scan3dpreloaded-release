package com.sonymobile.scan3d.utils;

import com.sonymobile.scan3d.R;

public enum PrintSize {
    X_SMALL(40.0f, R.string.print_customization_height_xtra_small),
    SMALL(50.0f, R.string.print_customization_height_small),
    MEDIUM(70.0f, R.string.print_customization_height_medium),
    LARGE(100.0f, R.string.print_customization_height_large),
    X_LARGE(150.0f, R.string.print_3rd_party_plugins_height_large),
    ALT_LARGE(90.0f, R.string.print_customization_height_large_alt);

    private final float mSize;
    private final int mText;

    PrintSize(float size, int text) {
        mSize = size;
        mText = text;
    }

    public float getSize() {
        return mSize;
    }

    public int getText() {
        return mText;
    }
}
