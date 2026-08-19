package com.sonymobile.scan3d;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.util.Log;
import androidx.annotation.VisibleForTesting;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.ScanTutorial;
import java.lang.reflect.Field;
import java.util.HashSet;
import java.util.Set;

public class PreferenceUtils {
    private static final String KEY_SHARED_PREFERENCES_VERSION = "shared_prefs_version";

    @VisibleForTesting
    static final int SHARED_PREFERENCES_VERSION = 13;
    private static final String TAG = "PreferenceUtils";

    public static void updatePreferences(Context context) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        int i = defaultSharedPreferences.getInt(KEY_SHARED_PREFERENCES_VERSION, 0);
        if (i != 13) {
            SharedPreferences.Editor editorEdit = defaultSharedPreferences.edit();
            while (i < 13) {
                upgrade(i, context, defaultSharedPreferences, editorEdit);
                i++;
            }
            editorEdit.putInt(KEY_SHARED_PREFERENCES_VERSION, 13);
            editorEdit.apply();
        }
    }

    @VisibleForTesting
    static void upgrade(int i, Context context, SharedPreferences sharedPreferences, SharedPreferences.Editor editor) {
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 4:
            case 5:
            case 7:
                break;
            case 3:
                upgradeToVersion_4(context, editor);
                break;
            case 6:
                upgradeToVersion_7(context, editor);
                break;
            case 8:
                upgradeToVersion_9(context, editor);
                break;
            case 9:
                upgradeToVersion_10(context, sharedPreferences, editor);
                break;
            case 10:
                upgradeToVersion_11(context, sharedPreferences, editor);
                break;
            case 11:
                upgradeToVersion_12(context, sharedPreferences, editor);
                break;
            case 12:
                upgradeToVersion_13(context, sharedPreferences, editor);
                break;
            default:
                Log.e(TAG, "Unsupported shared preferences version " + i);
                break;
        }
    }

    private static void upgradeToVersion_4(Context context, SharedPreferences.Editor editor) {
        editor.remove(context.getString(R.string.pref_key_gallery_span_count));
    }

    private static void upgradeToVersion_7(Context context, SharedPreferences.Editor editor) {
        editor.putString(context.getString(R.string.pref_key_focus_type), context.getString(R.string.focus_type_auto));
    }

    private static void upgradeToVersion_9(Context context, SharedPreferences.Editor editor) {
        editor.putBoolean(context.getString(R.string.pref_key_noise_reduction), true);
    }

    private static void upgradeToVersion_10(Context context, SharedPreferences sharedPreferences, SharedPreferences.Editor editor) {
        editor.putInt(context.getString(R.string.pref_key_first_time_training_mode), sharedPreferences.getInt(context.getString(R.string.pref_key_first_time_tutorial), 0));
    }

    private static void upgradeToVersion_11(Context context, SharedPreferences sharedPreferences, SharedPreferences.Editor editor) {
        String string = context.getString(R.string.pref_key_excluded_tips);
        Set<String> stringSet = sharedPreferences.getStringSet(string, null);
        if (stringSet != null) {
            HashSet hashSet = new HashSet(0);
            for (Field field : R.string.class.getFields()) {
                int identifier = context.getResources().getIdentifier(field.getName(), "string", context.getPackageName());
                if (identifier != 0 && stringSet.contains(context.getString(identifier))) {
                    hashSet.add(field.getName());
                }
            }
            editor.putStringSet(string, hashSet);
        }
    }

    private static void upgradeToVersion_12(Context context, SharedPreferences sharedPreferences, SharedPreferences.Editor editor) {
        editor.remove(context.getString(R.string.pref_live_wallpaper_background));
        editor.remove("pref_gallery_show_wizard");
        String string = context.getString(R.string.pref_key_scan_coach_mark_remaining_displays_counter);
        if (!sharedPreferences.contains(string)) {
            int i = 0;
            boolean z = false;
            for (ScanTutorial scanTutorial : ScanTutorial.values()) {
                z |= scanTutorial.isSlideshowCompleted(context) || scanTutorial.isTutorialCompleted(context);
            }
            boolean z2 = sharedPreferences.getBoolean("key_show_scan_coach_mark", false);
            if (!z && !z2) {
                i = 3;
            }
            editor.putInt(string, i);
        }
        editor.remove("key_show_scan_coach_mark");
        editor.remove("pref_key_skip_tutorials");
    }

    private static void upgradeToVersion_13(Context context, SharedPreferences sharedPreferences, SharedPreferences.Editor editor) {
        editor.remove("pref_gallery_show_promotions");
    }
}
