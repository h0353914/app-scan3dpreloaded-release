package com.sonymobile.scan3d.sharing;

import android.content.Context;
import android.graphics.drawable.Drawable;

import androidx.annotation.DrawableRes;
import androidx.annotation.StringRes;

import java.util.List;

public abstract class LocalPlugin implements Plugin {
    protected final Context mContext;
    private final String mDescriptor;
    private final int mDrawableId;
    private final int mTitleId;

    public LocalPlugin(Context context, @DrawableRes int drawableId, @StringRes int titleId, String descriptor) {
        mDrawableId = drawableId;
        mTitleId = titleId;
        mContext = context;
        mDescriptor = descriptor;
    }

    public String getDescriptor() {
        return mDescriptor;
    }

    @Override
    public Drawable getImage() {
        return mContext.getDrawable(mDrawableId);
    }

    @Override
    public List<String> getSupportedMimeTypes() {
        return null;
    }

    @Override
    public String getTitle() {
        return mContext.getString(mTitleId);
    }
}
