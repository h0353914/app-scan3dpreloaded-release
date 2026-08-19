package com.sonymobile.scan3d.analytics;

import android.content.Context;

import com.sonymobile.scan3d.logging.DebugLog;

import org.json.JSONException;
import org.json.JSONObject;

public enum EngineTimeEvent {
    ENGINE;

    private static final String TAG = EngineTimeEvent.class.getName();

    private void pushEngineTiming(Context context, long scaleTime, long sculptTime, long blobTime, long sprayPaintingTime, int scanMode) {
        JSONObject json = new JSONObject();
        try {
            json.put("scale_time", scaleTime);
            json.put("sculpt_time", sculptTime);
            json.put("blob_time", blobTime);
            json.put("spray_painting_time", sprayPaintingTime);
            json.put("ScanMode", scanMode);
            ScanEvent.addScanIdToPayload(context, json, false);
            SBDPUtil.getInstance(context).pushEngineTiming(json);
        } catch (JSONException e) {
            DebugLog.e(TAG, e.getMessage(), e);
        }
    }

    public void send(Context context, long scaleTime, long sculptTime, long blobTime, long sprayPaintingTime, int scanMode) {
        pushEngineTiming(context, scaleTime, sculptTime, blobTime, sprayPaintingTime, scanMode);
    }
}
