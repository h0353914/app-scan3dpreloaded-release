package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import androidx.annotation.StringRes;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import com.sonymobile.scan3d.storageservice.ui.tips.TipParser;

/* JADX INFO: loaded from: classes.dex */
public enum ScanTutorial {
    FACE(1),
    HEAD(2),
    FOOD(3),
    ADVANCE(4),
    SELFIE(0);

    private final int mTutorialIndex;

    ScanTutorial(int i) {
        this.mTutorialIndex = i;
    }

    public TipCategory getTipCategory(Context context) {
        return TipParser.getFirstTimeTutorial(context, this.mTutorialIndex);
    }

    public boolean isTutorialCompleted(Context context) {
        return isSlideshowCompleted(context) && isTrainingModeCompleted(context);
    }

    public boolean isSlideshowCompleted(Context context) {
        return isCompleted(context, R.string.pref_key_first_time_tutorial);
    }

    public boolean isTrainingModeCompleted(Context context) {
        return isCompleted(context, R.string.pref_key_first_time_training_mode);
    }

    public boolean setSlideshowCompleted(Context context) {
        return setCompleted(context, R.string.pref_key_first_time_tutorial);
    }

    public boolean setTrainingModeCompleted(Context context) {
        return setCompleted(context, R.string.pref_key_first_time_training_mode);
    }

    private boolean isCompleted(Context context, @StringRes int i) {
        return (PreferenceManager.getDefaultSharedPreferences(context).getInt(context.getString(i), 0) & getTutorialFlag()) != 0;
    }

    private boolean setCompleted(Context context, @StringRes int i) {
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        String string = context.getString(i);
        int i2 = defaultSharedPreferences.getInt(string, 0);
        boolean z = (defaultSharedPreferences.getInt(string, 0) & getTutorialFlag()) == 0;
        defaultSharedPreferences.edit().putInt(string, i2 | getTutorialFlag()).apply();
        return z;
    }

    private int getTutorialFlag() {
        return 1 << ordinal();
    }
}
