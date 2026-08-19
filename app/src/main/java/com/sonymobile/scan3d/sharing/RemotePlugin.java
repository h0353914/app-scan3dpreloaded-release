package com.sonymobile.scan3d.sharing;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

import java.util.List;

class RemotePlugin implements Plugin {
    private int mColor;
    private Context mContext;
    private int mDrawable;
    private String mPkgName;
    private int mTitle;

    RemotePlugin(Context context, String pkgName, int title, int drawable, int color) {
        mContext = context;
        mPkgName = pkgName;
        mTitle = title;
        mDrawable = drawable;
        mColor = color;
    }

    private Drawable createLayerDrawable(Drawable drawable) {
        Drawable[] layers = new Drawable[2];
        layers[0] = drawable;
        layers[1] = mContext.getDrawable(R.drawable.remote_overlay);
        return new LayerDrawable(layers);
    }

    @Override
    public int getBackgroundColor() {
        return mColor;
    }

    @Override
    public Drawable getImage() {
        Drawable drawable = mContext.getDrawable(mDrawable);
        return createLayerDrawable(drawable);
    }

    @Override
    public List<String> getSupportedMimeTypes() {
        return null;
    }

    @Override
    public String getTitle() {
        return mContext.getString(mTitle);
    }

    @Override
    public boolean isEnabled(Shareable.Type type, Context context, int scanType) {
        return type == Shareable.Type.DEFAULT;
    }

    @Override
    public void shareMesh(Context context, IFileSet fileSet) {
        try {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setPackage("com.android.vending");
            intent.setData(Uri.parse("market://details?id=" + mPkgName));
            context.startActivity(intent);
        } catch (ActivityNotFoundException e) {
        }
    }
}
