package com.sonymobile.scan3d;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ShortcutInfo;
import android.content.pm.ShortcutManager;
import android.graphics.drawable.Icon;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.storageservice.ui.gallery.GalleryFragment;
import java.util.Collections;

/* JADX INFO: loaded from: classes.dex */
public class AppShortcutsManager {
    public static final String INTENT_EXTRA_SHORTCUT_POLICY_MODE = "com.sonymobile.scan3d.INTENT_EXTRA_SHORTCUT_POLICY_MODE";
    private static final String LAST_SCAN_SHORTCUT_ID = "last_scan_shortcut_id";

    public enum Shortcut {
        FACE_SCAN(R.string.dialog_scan_mode_face_scan_title, R.string.scan_mode_face_scan_long_desc, R.drawable.new_scan, 0),
        FOOD_SCAN(R.string.dialog_scan_mode_food_scan_title, R.string.scan_mode_food_scan_long_desc, R.drawable.new_scan, 3),
        SELFIE_SCAN(R.string.dialog_scan_mode_selfie_scan_title, R.string.scan_mode_selfie_scan_long_desc, R.drawable.new_scan, 4),
        HEAD_SCAN(R.string.dialog_scan_mode_head_scan_title, R.string.scan_mode_head_scan_long_desc, R.drawable.new_scan, 1),
        FREEFORM_SCAN(R.string.dialog_scan_mode_adv_scan_title, R.string.scan_mode_freeform_scan_long_desc, R.drawable.new_scan, 2);

        private final int mIcon;
        private final int mLongDesc;
        private final int mPolicyMode;
        private final int mShortDesc;

        Shortcut(int i, int i2, int i3, int i4) {
            this.mShortDesc = i;
            this.mLongDesc = i2;
            this.mIcon = i3;
            this.mPolicyMode = i4;
        }
    }

    protected static void updateShortcut(@NonNull Context context, int i) {
        ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(ShortcutManager.class);
        Shortcut shortcut = getShortcut(i);
        if (shortcutManager == null || shortcut == null) {
            return;
        }
        Intent intent = new Intent(GalleryFragment.INTENT_ACTION_SHORTCUT);
        intent.putExtra(INTENT_EXTRA_SHORTCUT_POLICY_MODE, shortcut.mPolicyMode);
        intent.setFlags(268468224);
        shortcutManager.setDynamicShortcuts(Collections.singletonList(new ShortcutInfo.Builder(context, LAST_SCAN_SHORTCUT_ID).setShortLabel(context.getString(shortcut.mShortDesc)).setLongLabel(context.getString(shortcut.mLongDesc)).setIcon(Icon.createWithResource(context, shortcut.mIcon)).setIntent(intent).build()));
    }

    static void refreshShortcut(Context context) {
        ShortcutManager shortcutManager = (ShortcutManager) context.getSystemService(ShortcutManager.class);
        if (shortcutManager != null) {
            for (ShortcutInfo shortcutInfo : shortcutManager.getDynamicShortcuts()) {
                if (shortcutInfo.getId().equals(LAST_SCAN_SHORTCUT_ID)) {
                    Intent intent = shortcutInfo.getIntent();
                    if (intent != null) {
                        updateShortcut(context, intent.getIntExtra(INTENT_EXTRA_SHORTCUT_POLICY_MODE, -1));
                        return;
                    }
                    return;
                }
            }
        }
    }

    @Nullable
    private static Shortcut getShortcut(int i) {
        switch (i) {
            case 0:
            case 10:
                return Shortcut.FACE_SCAN;
            case 1:
            case 11:
                return Shortcut.HEAD_SCAN;
            case 2:
                return Shortcut.FREEFORM_SCAN;
            case 3:
            case 13:
                return Shortcut.FOOD_SCAN;
            case 4:
            case 14:
                return Shortcut.SELFIE_SCAN;
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 12:
            default:
                return null;
        }
    }
}
