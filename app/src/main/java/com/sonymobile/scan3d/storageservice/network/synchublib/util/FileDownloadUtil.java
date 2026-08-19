package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class FileDownloadUtil {
    public static JSONObject getJSON(String str, String str2, String str3) throws IOException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(SyncHubConstants.SPHINX_CONTENT, str).put(SyncHubConstants.REQUEST_TYPE, RequestType.REQUEST_GET_FILE.getId()).put(SyncHubConstants.SPHINX_CONTENT_ID, str2).put(SyncHubConstants.CLIENT_TYPE, 1).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCESS_TOKEN, str3);
            return jSONObject;
        } catch (JSONException unused) {
            throw new IOException();
        }
    }
}
