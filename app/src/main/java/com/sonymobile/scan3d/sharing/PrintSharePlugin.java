package com.sonymobile.scan3d.sharing;

import android.content.Context;
import android.graphics.drawable.Drawable;

import androidx.annotation.ColorInt;
import androidx.fragment.app.Fragment;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

public class PrintSharePlugin extends LocalPlugin implements NamedPlugin {
    public static final String KEY_DONT_SHOW_AGAIN = "FileSharePlugin_dontShowAgain";
    private static final String SHARE_PRINT_AS_FILE_NAME = "SharePrintAsFile";
    private static final String TAG = "PrintSharePlugin";

    public PrintSharePlugin(Fragment fragment) {
        super(fragment.getContext(), R.drawable.share_as_file, R.string.share_as_zip_file_title, SHARE_PRINT_AS_FILE_NAME);
    }

    @Override
    public Drawable getAppIcon() {
        return mContext.getDrawable(R.drawable.ic_share_24dp);
    }

    @Override
    public String getAppName() {
        return mContext.getString(R.string.share_as_zip_file_title);
    }

    @ColorInt
    @Override
    public int getBackgroundColor() {
        return 0;
    }

    @Override
    public boolean isEnabled(Shareable.Type type, Context context, int scanType) {
        return true;
    }

    @Override
    public void shareMesh(Context context, IFileSet fileSet) {
        DebugLog.e(TAG, "shareMesh() called unexpectedly");
    }
}
