package com.sonymobile.scan3d.analytics;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

import org.json.JSONException;
import org.json.JSONObject;

public enum ScanEvent {
    SCAN_STARTED("ScanStarted", true),
    SCAN_SAVED("ScanSaved"),
    SCAN_DISCARDED("ScanDiscarded"),
    SCAN_CANCELED_BY_USER("ScanCanceledByUser"),
    WARNING_TOO_CLOSE("WarningTooClose"),
    WARNING_TOO_HOT("WarningTooHot"),
    WARNING_LOW_BATTERY("WarningLowBattery"),
    WARNING_LOW_STORAGE("WarningLowStorage"),
    WARNING_TOO_FAST("WarningTooFast"),
    WARNING_TOO_DARK("WarningTooDark"),
    WARNING_TOO_BRIGHT("WarningTooBright"),
    WARNING_UNEVEN_LIGHT("WarningUnevenLight"),
    WARNING_LOW_TEXTURE_AREA("WarningLowTextureArea"),
    WARNING_BAD_LOOP_CLOSURE("WarningBadLoopClosure"),
    CRITICAL_TOO_DARK("CriticalTooDark"),
    CRITICAL_TOO_BRIGHT("CriticalTooBright"),
    CRITICAL_UNEVEN_LIGHT("CriticalUnevenLight"),
    CRITICAL_LOW_TEXTURE_AREA("CriticalLowTextureArea"),
    CRITICAL_BAD_LOOP_CLOSURE("CriticalBadLoopClosure"),
    CRITICAL_ERROR_DISPLAYED("CriticalErrorDisplayed"),
    SCAN_RESTARTED_AFTER_WARNING("ScanRestartedAfterWarning"),
    SCULPTING_LOST_TRACK("SculptingLostTrack"),
    LOST_TRACK_DURING_CALIBRATION("LostTrackDuringCalibration"),
    REGAINED_TRACK_DURING_CALIBRATION("RegainedTrackDuringTracking"),
    REGAINED_TRACK_DURING_SCULPTING("SculptingRegainedTrack"),
    CALIBRATION_STARTED("CalibrationStarted"),
    START_SCULPTING("SculptingStarted"),
    STOP_SCULPTING("StopSculpting"),
    CALIBRATION_ENDED("CalibrationEnded"),
    SPRAY_PAINTING_STARTED("PaintingStarted"),
    SPRAY_PAINTING_ENDED("PaintingEnded"),
    SETTING_FOCUS_TYPE_FIXED("SettingFocusTypeFixed"),
    SETTING_FOCUS_TYPE_AUTO("SettingFocusTypeAuto"),
    SETTING_FOCUS_TYPE_MANUAL("SettingFocusTypeManual"),
    SETTING_FOCUS_TYPE_TOF("SettingFocusTypeTof"),
    RESTART("Restart"),
    RESTART_CLICKED("RestartClicked"),
    CAMERA_BUTTON_PRESSED("CameraButtonPressed"),
    VOLUME_DOWN("VolumeDown"),
    SOUND_HEARD("SoundHeard");

    private final String mAction;
    private final boolean mUpdateScanId;

    ScanEvent(String action) {
        this(action, false);
    }

    ScanEvent(String action, boolean updateScanId) {
        mAction = action;
        mUpdateScanId = updateScanId;
    }

    public static void addScanIdToPayload(Context context, JSONObject payload, boolean updateScanId) throws JSONException {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        int scanId = prefs.getInt("ScanId", 0);
        if (updateScanId) {
            scanId++;
            prefs.edit().putInt("ScanId", scanId).apply();
        }
        payload.put("ScanId", scanId);
    }

    private void pushScanEvent(Context context, String action, boolean updateScanId, int scanMode) {
        JSONObject payload = new JSONObject();
        try {
            payload.put("action", action);
            addScanIdToPayload(context, payload, updateScanId);
            payload.put("ScanMode", scanMode);
            SBDPUtil.getInstance(context).pushScanEvent(payload);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void send(Context context, int scanMode) {
        pushScanEvent(context, mAction, mUpdateScanId, scanMode);
    }
}
