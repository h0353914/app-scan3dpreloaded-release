package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Context;
import androidx.annotation.StringRes;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public enum Action {
    NONE("", 0),
    SHARE("com.sonymobile.scan3d.action.SHARE", R.string.upload_action_share_text),
    UNSHARE("com.sonymobile.scan3d.action.UNSHARE", R.string.viewer_overflow_unshare),
    VIEW("com.sonymobile.scan3d.action.VIEW", R.string.upload_action_view_text),
    PRINT("com.sonymobile.scan3d.action.PRINT", R.string.upload_action_print_text),
    PRINT_CUSTOM("com.sonymobile.scan3d.action.PRINT_CUSTOM", R.string.upload_action_print_text);

    private final String mIntentAction;

    @StringRes
    private final int mNameResource;

    Action(String str, int i) {
        this.mIntentAction = str;
        this.mNameResource = i;
    }

    String getIntentAction() {
        return this.mIntentAction;
    }

    String getName(Context context) {
        int i = this.mNameResource;
        if (i != 0) {
            return context.getString(i);
        }
        return null;
    }

    static Action getAction(String str) {
        for (Action action : values()) {
            if (action.mIntentAction.equals(str)) {
                return action;
            }
        }
        return NONE;
    }
}
