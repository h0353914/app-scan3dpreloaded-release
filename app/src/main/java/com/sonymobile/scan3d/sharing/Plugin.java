package com.sonymobile.scan3d.sharing;

import android.content.Context;
import android.graphics.drawable.Drawable;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

import java.util.List;

public interface Plugin {
    int getBackgroundColor();

    Drawable getImage();

    default String getPreferredMimeType() {
        return "application/vnd.sony.scan3d";
    }

    List<String> getSupportedMimeTypes();

    default int getTextColor(Context context) {
        return context.getColor(R.color.card_title_overlay);
    }

    default int getTextureSize() {
        return 0;
    }

    String getTitle();

    boolean isEnabled(Shareable.Type type, Context context, int scanType);

    void shareMesh(Context context, IFileSet fileSet);

    default void shareMesh(Context context, IFileSet fileSet, int scanType) {
        shareMesh(context, fileSet);
    }
}
