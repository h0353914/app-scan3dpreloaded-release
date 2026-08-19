package com.sonymobile.scan3d.viewer.fragments.component;

import androidx.annotation.DrawableRes;
import androidx.annotation.StringRes;

/* JADX INFO: loaded from: classes2.dex */
public class Pickable {

    @StringRes
    private final int mDescriptionResourceId;
    private final Object mIdentifier;

    @DrawableRes
    private final int mImageResourceId;

    @StringRes
    private final int mNameResourceId;
    private int mWhichPicker;

    public Pickable(Object obj, @DrawableRes int i, @StringRes int i2, @StringRes int i3) {
        this.mIdentifier = obj;
        this.mImageResourceId = i;
        this.mDescriptionResourceId = i3;
        this.mNameResourceId = i2;
    }

    public Pickable(Object obj, @DrawableRes int i, @StringRes int i2) {
        this(obj, i, 0, i2);
    }

    @StringRes
    public int getName() {
        return this.mNameResourceId;
    }

    public <T> T getIdentifier() {
        return (T) this.mIdentifier;
    }

    @DrawableRes
    public int getImageResource() {
        return this.mImageResourceId;
    }

    @StringRes
    public int getDescriptionResourceId() {
        return this.mDescriptionResourceId;
    }

    public int getWhichPicker() {
        return this.mWhichPicker;
    }

    void setWhichPicker(int i) {
        this.mWhichPicker = i;
    }

    boolean hasName() {
        return this.mNameResourceId != 0;
    }
}
