package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess.AccessToken;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class AccessTokenUtil {
    public static JSONObject getJSON(String str, boolean z) throws JSONException {
        return new JSONObject().put(SyncHubConstants.CODE, str).put(SyncHubConstants.IS_REFRESH_TOKEN, z).put(SyncHubConstants.CLIENT_TYPE, 1).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCOUNT_TYPE, SyncHubConstants.ACCOUNT_TYPE_GOOGLE);
    }

    public static AccessToken handleServerResponse(String str, Map<String, List<String>> map) {
        return new AccessToken(str, map.get(SyncHubConstants.REFRESH_TOKEN_HEADER).get(0), Long.parseLong(map.get(SyncHubConstants.EXPIRATION_TIME_HEADER).get(0)));
    }
}
