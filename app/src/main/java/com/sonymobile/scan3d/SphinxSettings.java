package com.sonymobile.scan3d;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.preference.PreferenceManager;

/* JADX INFO: loaded from: classes.dex */
public class SphinxSettings {
    private String mFocusType;
    private boolean mUseAutoWhiteBalanceLock;
    private boolean mUseEdgeEnhancement;
    private boolean mUseLamp;
    private boolean mUseNoiseReduction;
    private boolean mUseSound;

    public SphinxSettings(Context context) {
        Resources resources = context.getResources();
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        this.mFocusType = defaultSharedPreferences.getString(context.getString(R.string.pref_key_focus_type), context.getString(R.string.focus_type_setting));
        this.mUseLamp = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_use_lamp), false);
        this.mUseSound = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_scanning_sound), true);
        this.mUseEdgeEnhancement = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_edge_enhancement), resources.getBoolean(R.bool.edge_enhancement_setting));
        this.mUseNoiseReduction = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_noise_reduction), resources.getBoolean(R.bool.noise_reduction_setting));
        this.mUseAutoWhiteBalanceLock = defaultSharedPreferences.getBoolean(context.getString(R.string.pref_key_awb_lock), resources.getBoolean(R.bool.awb_lock_setting));
    }

    public String getFocusType() {
        return this.mFocusType;
    }

    public boolean useLamp() {
        return this.mUseLamp;
    }

    public boolean useSound() {
        return this.mUseSound;
    }

    public boolean useEdgeEnhancement() {
        return this.mUseEdgeEnhancement;
    }

    public boolean useAutoWhiteBalanceLock() {
        return this.mUseAutoWhiteBalanceLock;
    }

    public boolean useNoiseReduction() {
        return this.mUseNoiseReduction;
    }
}
