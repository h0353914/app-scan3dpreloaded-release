package com.sonymobile.scan3d.analytics;

import android.content.Context;

import com.sonymobile.scan3d.logging.DebugLog;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import fr.arnaudguyon.xmltojsonlib.XmlToJson;

import org.json.JSONException;
import org.json.JSONObject;

public enum CalibrationEvent {
    VALUES;

    private static final String TAG = CalibrationEvent.class.getName();

    public void send(Context context, int scanMode) throws JSONException {
        String path = context.getFilesDir().getAbsolutePath() + "/results/calib_auto.xml";
        File file = new File(path);
        if (file.exists()) {
            StringBuilder builder = new StringBuilder();
            try {
                BufferedReader reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), StandardCharsets.UTF_8));
                try {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        builder.append(line.trim());
                    }
                } finally {
                    reader.close();
                }
            } catch (IOException e) {
                DebugLog.e(TAG, e.getMessage());
            }
            if (builder.length() > 0) {
                JSONObject json = new XmlToJson.Builder(builder.toString()).build().toJson();
                json.put("ScanMode", scanMode);
                ScanEvent.addScanIdToPayload(context, json, false);
                SBDPUtil.getInstance(context).pushConfigValues(json);
            }
        }
    }
}
