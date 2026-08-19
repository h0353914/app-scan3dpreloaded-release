package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import java.io.IOException;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ContentUpdateUtil {
    public static JSONObject getJSON(String str, String str2, String str3, String str4, boolean z, boolean z2, boolean z3) throws IOException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(SyncHubConstants.REQUEST_TYPE, RequestType.REQUEST_PUT_UPDATE_CONTENT.getId()).put(SyncHubConstants.SPHINX_CONTENT_ID, str).put(SyncHubConstants.CLIENT_TYPE, 1).put(SyncHubConstants.SPHINX_CONTENT_DATA, new JSONObject().put(SyncHubConstants.SPHINX_CONTENT_NAME, str3).put(SyncHubConstants.SPHINX_CONTENT_DISPLAY_NAME, str4).put(SyncHubConstants.SPHINX_CONTENT_DOWNLOADABLE, z).put(SyncHubConstants.SPHINX_CONTENT_FAVORITE, z2).put(SyncHubConstants.SPHINX_CONTENT_IS_IMPROVEMENT, z3)).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCESS_TOKEN, str2);
            return jSONObject;
        } catch (JSONException unused) {
            throw new IOException();
        }
    }
}
