package com.sonymobile.scan3d;

import android.content.Context;
import androidx.annotation.AnyRes;
import androidx.annotation.IdRes;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.sonymobile.scan3d.logging.DebugLog;
import java.io.IOException;

public enum PropResources {
    CYBORG("props_content_cyborg", "prop_cyborg", "cyborg"),
    GLASSES_PARIS("props_content_paris_glasses", "prop_glasses_paris", "parisGlasses"),
    GLASSES_TOKYO("props_content_tokyo_glasses", "prop_glasses_tokyo", "tokyoGlasses"),
    GLASSES_NEW_YORK("props_content_new_york_glasses", "prop_glasses_newyork", "newyorkGlasses"),
    GLASSES_DUBAI("props_content_dubai_glasses", "prop_glasses_dubai", "dubaiGlasses"),
    CROWN("props_content_crown", "prop_crown", "crown"),
    ANIME_HAIR("props_content_anime_hair", "prop_anime_hair", "animeHair"),
    CAT_HAT("props_content_cat_hat", "prop_cat_hat", "catHat"),
    PANDA_HAT("props_content_panda_hat", "prop_panda_hat", "pandaHat"),
    BUNNY_EARS("props_content_bunny_ears", "prop_bunny_ears", "bunnyEars"),
    CAT_EARS("props_content_cat_ears", "prop_cat_ears", "catEars"),
    COWBOY_HAT("props_content_cowboy_hat", "prop_cowboy_hat", "cowboyHat"),
    BOW("props_content_bow", "prop_bow", "hairBowRed");

    private static final String TAG = PropResources.class.getName();
    public static final String TYPE_DRAWABLE = "drawable";
    public static final String TYPE_STRING = "string";
    private final String mContentName;
    private final String mImageName;
    private final String mResourcePath;

    public static PropResources fromInt(Context context, int i) {
        PropResources propResources;
        try {
            propResources = values()[i];
        } catch (IllegalArgumentException | IndexOutOfBoundsException | NullPointerException unused) {
            DebugLog.d(TAG, "Invalid content id " + i);
            propResources = null;
        }
        if (propResources != null) {
            if (propResources.getNameId(context) == 0) {
                DebugLog.d(TAG, "Unable to get name for resource " + i);
                return null;
            }
            if (propResources.getDrawable(context) == 0) {
                DebugLog.d(TAG, "Unable to get drawable for resource " + i);
                return null;
            }
            try {
                ZipResourceFile zipResourceFile = ZipResourceManager.getZipResourceFile();
                if (zipResourceFile != null) {
                    if (zipResourceFile.getInputStream(propResources.mResourcePath + ".glb") == null) {
                        DebugLog.d(TAG, "No asset " + propResources.mResourcePath + ".glb");
                        return null;
                    }
                }
            } catch (IOException unused2) {
                DebugLog.d(TAG, "No props assets available.");
                return null;
            }
        }
        return propResources;
    }

    PropResources(String str, String str2, String str3) {
        this.mContentName = str;
        this.mImageName = str2;
        this.mResourcePath = str3;
    }

    @AnyRes
    public int getNameId(Context context) {
        return getResource(context, "string", this.mContentName);
    }

    @AnyRes
    public int getDrawable(Context context) {
        return getResource(context, "drawable", this.mImageName);
    }

    public String getContentPath() {
        return this.mResourcePath + ".glb";
    }

    @IdRes
    private int getResource(Context context, String str, String str2) {
        return context.getResources().getIdentifier(str2, str, context.getPackageName());
    }
}
