package com.sonymobile.scan3d.sharing;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.content.res.Resources;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;

import androidx.palette.graphics.Palette;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.security.TrustedCertificates;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Objects;

public class Plugin3rdParty implements NamedPlugin {
    private static final Integer MAX_IMAGE_HEIGHT;
    private static final Integer MAX_IMAGE_WIDTH;
    private static final Integer MAX_TITLE_LENGTH;
    private static final String TAG;

    private final Drawable mAppIcon;
    private final String mAppLabel;
    private final int mBackgroundColor;
    private final SharingConstants.Category mCategory;
    private final PackageManager mPackageManager;
    private final String mPreferredMimeType;
    private final boolean mPrivileged;
    private final int mReducedTextureSize;
    private final ResolveInfo mResolveInfo;
    private final int mScanType;
    private final ArrayList<String> mSupportedMimeTypes;

    static {
        TAG = Plugin.class.getSimpleName();
        MAX_TITLE_LENGTH = Integer.valueOf(0x50);
        MAX_IMAGE_WIDTH = Integer.valueOf(0x1194);
        MAX_IMAGE_HEIGHT = Integer.valueOf(0xc00);
    }

    public Plugin3rdParty(Context context, PackageManager packageManager, ResolveInfo resolveInfo, SharingConstants.Category category, int scanType) {
        mPackageManager = packageManager;
        mResolveInfo = resolveInfo;

        Drawable icon = null;
        String label = null;
        try {
            icon = packageManager.getApplicationIcon(mResolveInfo.activityInfo.packageName);
            label = packageManager.getApplicationLabel(mResolveInfo.activityInfo.applicationInfo).toString();
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }
        mAppIcon = validateImageSize(icon);
        mAppLabel = validateTitleLength(label);
        mCategory = category;
        mScanType = scanType;

        mSupportedMimeTypes = new ArrayList<>();
        Iterator<String> typesIterator = mResolveInfo.filter.typesIterator();
        if (typesIterator != null) {
            typesIterator.forEachRemaining(mSupportedMimeTypes::add);
        }

        mBackgroundColor = getPaletteColor(context, getImage());

        mPreferredMimeType = mResolveInfo.activityInfo.metaData.getString(SharingConstants.Meta.PREFERRED_MIMETYPE, SharingConstants.NO_MIME_TYPE_PREFERRED);

        mReducedTextureSize = mResolveInfo.activityInfo.metaData.getInt(SharingConstants.Meta.REDUCED_TEXTURE, 0);

        boolean privileged = false;
        for (String pkg : SharingConstants.PRIVILEGED_PLUGINS) {
            if (pkg.equals(mResolveInfo.activityInfo.packageName)) {
                StringBuilder sb = new StringBuilder();
                privileged = TrustedCertificates.isPackageTrusted(context, mResolveInfo.activityInfo.packageName, sb);
                if (!TextUtils.isEmpty(sb.toString())) {
                    DebugLog.d(TAG, sb.toString());
                }
                break;
            }
        }
        mPrivileged = privileged;
    }

    private int getPaletteColor(Context context, Drawable drawable) {
        if (drawable == null) {
            return context.getColor(R.color.primary_color_light);
        }

        Palette palette;
        if (drawable instanceof BitmapDrawable) {
            Bitmap bitmap = ((BitmapDrawable) drawable).getBitmap();
            palette = Palette.from(bitmap).generate();
        } else {
            Bitmap bitmap = Bitmap.createBitmap(drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bitmap);
            drawable.setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            drawable.draw(canvas);
            palette = Palette.from(bitmap).generate();
            bitmap.recycle();
        }
        return palette.getVibrantColor(context.getColor(R.color.primary_color_light));
    }

    private Drawable validateImageSize(Drawable drawable) {
        if (drawable == null) {
            return null;
        }
        if (drawable.getIntrinsicWidth() <= MAX_IMAGE_WIDTH.intValue()
                && drawable.getIntrinsicHeight() <= MAX_IMAGE_HEIGHT.intValue()) {
            return drawable;
        }
        return null;
    }

    private String validateTitleLength(String title) {
        if (title == null) {
            return null;
        }
        if (title.length() > MAX_TITLE_LENGTH.intValue()) {
            return null;
        }
        return title;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null) {
            return false;
        }
        if (getClass() != o.getClass()) {
            return false;
        }
        Plugin3rdParty other = (Plugin3rdParty) o;
        return mCategory.equals(other.mCategory)
                && mScanType == other.mScanType
                && mResolveInfo.equals(other.mResolveInfo);
    }

    @Override
    public Drawable getAppIcon() {
        return mAppIcon;
    }

    @Override
    public String getAppName() {
        return mAppLabel;
    }

    @Override
    public int getBackgroundColor() {
        return mBackgroundColor;
    }

    public ComponentName getComponentName() {
        return new ComponentName(mResolveInfo.activityInfo.packageName, mResolveInfo.activityInfo.name);
    }

    @Override
    public Drawable getImage() {
        int imageResId = mResolveInfo.activityInfo.metaData.getInt(SharingConstants.Meta.IMAGE, -1);
        if (imageResId != -1) {
            try {
                Resources resources = mPackageManager.getResourcesForApplication(mResolveInfo.activityInfo.packageName);
                Drawable drawable = resources.getDrawable(imageResId, null);
                return validateImageSize(drawable);
            } catch (PackageManager.NameNotFoundException e) {
                Log.e(TAG, "Failed to get an icon for " + mResolveInfo.activityInfo.packageName + " with exception " + e.getMessage());
            }
        }
        return null;
    }

    @Override
    public String getPreferredMimeType() {
        return mPreferredMimeType;
    }

    @Override
    public ArrayList<String> getSupportedMimeTypes() {
        return mSupportedMimeTypes;
    }

    @Override
    public int getTextureSize() {
        return mReducedTextureSize;
    }

    @Override
    public String getTitle() {
        Bundle metaData = mResolveInfo.activityInfo.metaData;
        int labelResId = metaData.getInt(SharingConstants.Meta.LABEL, -1);
        if (labelResId == -1) {
            String label = metaData.getString(SharingConstants.Meta.LABEL, null);
            return validateTitleLength(label);
        }
        try {
            Resources resources = mPackageManager.getResourcesForApplication(mResolveInfo.activityInfo.packageName);
            String label = resources.getString(labelResId);
            return validateTitleLength(label);
        } catch (PackageManager.NameNotFoundException e) {
            Log.e(TAG, "Failed to get a title for " + mResolveInfo.activityInfo.packageName + " with exception " + e.getMessage());
            return null;
        }
    }

    @Override
    public int hashCode() {
        return Objects.hash(0x101002d, mScanType, mResolveInfo);
    }

    @Override
    public boolean isEnabled(Shareable.Type type, Context context, int scanType) {
        boolean prefersScan3d = SharingConstants.SCAN_3D_MIME_TYPE.equals(getPreferredMimeType());
        boolean canScan3d = supportsMime(SharingConstants.SCAN_3D_MIME_TYPE) || prefersScan3d;
        boolean prefersGltf = SharingConstants.GLTF_MIME_TYPE.equals(getPreferredMimeType());
        boolean canGltf = supportsMime(SharingConstants.GLTF_MIME_TYPE) || prefersGltf;

        boolean enabled;
        switch (type) {
            case ANIMATION:
                enabled = canGltf;
                break;
            case DEFAULT:
                switch (scanType) {
                    case 0x100:
                    case 0x101:
                        enabled = canGltf || canScan3d;
                        break;
                    default:
                        enabled = canScan3d;
                        break;
                }
                break;
            default:
                enabled = false;
                break;
        }

        boolean scanTypeMatches = (scanType == mScanType) || (mScanType == Integer.MAX_VALUE);
        return enabled && scanTypeMatches;
    }

    @Override
    public boolean isPrivileged() {
        return mPrivileged;
    }

    boolean isValid() {
        return mAppIcon != null && getImage() != null && mAppLabel != null && getTitle() != null;
    }

    @Override
    public void shareMesh(Context context, IFileSet fileSet) {
        FileTasks.shareMesh(context, fileSet, getComponentName());
    }

    public boolean supportsMime(String mimeType) {
        return mSupportedMimeTypes.contains(mimeType);
    }
}
