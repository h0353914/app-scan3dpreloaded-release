package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sonymobile.scan3d.storageservice.network.synchublib.SphinxContent;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class ContentListUtil {
    public static JSONObject getJSON(String str) throws IOException {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(SyncHubConstants.REQUEST_TYPE, RequestType.REQUEST_GET_CONTENT_LIST.getId()).put(SyncHubConstants.CLIENT_TYPE, 1).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCESS_TOKEN, str);
            return jSONObject;
        } catch (JSONException unused) {
            throw new IOException();
        }
    }

    public static List<SphinxContent> handleServerResponse(String str) throws IOException {
        if (str == null || str.isEmpty()) {
            throw new IOException("response is null or empty");
        }
        return (List) new Gson().fromJson(str, new TypeToken<ArrayList<SphinxContent>>() { // from class: com.sonymobile.scan3d.storageservice.network.synchublib.util.ContentListUtil.1
        }.getType());
    }
}
