package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class FileDeleteUtil {
    public static JSONObject getJSON(String str, String str2, boolean z) throws JSONException {
        int id;
        JSONObject jSONObject = new JSONObject();
        if (z) {
            id = RequestType.REQUEST_DELETE_PUBLIC_CONTENT.getId();
        } else {
            id = RequestType.REQUEST_DELETE_CONTENT.getId();
        }
        return jSONObject.put(SyncHubConstants.REQUEST_TYPE, id).put(SyncHubConstants.CLIENT_TYPE, 1).put(SyncHubConstants.SPHINX_CONTENT_ID, str).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCESS_TOKEN, str2);
    }

    public static JSONObject getJSON(String str) throws JSONException {
        return new JSONObject().put(SyncHubConstants.REQUEST_TYPE, RequestType.REQUEST_DELETE_CONTENT.getId()).put(SyncHubConstants.CLIENT_TYPE, 1).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCESS_TOKEN, str);
    }
}
