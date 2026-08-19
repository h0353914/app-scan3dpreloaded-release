package com.sonymobile.scan3d.sharing;

import android.content.Context;
import android.graphics.drawable.Drawable;

import androidx.fragment.app.Fragment;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

public class PrintShareStlPlugin extends LocalPlugin implements NamedPlugin {
    private static final String PRINT_SHARE_STL_NAME = "StlPrint";
    private static final String TAG = "PrintShareStlPlugin";

    public PrintShareStlPlugin(Fragment fragment) {
        super(fragment.getContext(), R.drawable.share_as_file, R.string.share_as_stl_file_title, PRINT_SHARE_STL_NAME);
    }

    @Override
    public Drawable getAppIcon() {
        return mContext.getDrawable(R.drawable.ic_share_24dp);
    }

    @Override
    public String getAppName() {
        return mContext.getString(R.string.share_as_stl_file_title);
    }

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
