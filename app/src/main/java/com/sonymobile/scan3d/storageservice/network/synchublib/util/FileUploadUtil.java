package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import com.sonymobile.scan3d.storageservice.network.synchublib.InvalidAccessTokenException;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;
import org.apache.http.HttpEntity;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class FileUploadUtil {
    private static final String FILE_NAME = "fileName";
    private static final String FILE_TYPE = "fileType";
    private static final String INVALID_TICKET_DATA = "Invalid ticket data";
    private static final String INVALID_TOKEN = "Invalid token";
    private static final String TOKEN_EXPIRED = "Token has expired";
    private static final String UPDATE_CACHE_METADATA = "updateCacheMetadata";

    public static JSONObject getJSONForPrivateSignedUriRequest(String str, String str2, String str3, String str4, String str5, String str6, String str7) throws IOException {
        return getJSONForSignedUriRequest(str, str2, str3, str4, str5, str6, str7, false, false);
    }

    public static JSONObject getJSONForPublicSignedUriRequest(String str, String str2, String str3, String str4, String str5, String str6, boolean z) throws IOException {
        return getJSONForSignedUriRequest(str, str2, str3, str4, null, str5, str6, true, z);
    }

    private static JSONObject getJSONForSignedUriRequest(String str, String str2, String str3, String str4, String str5, String str6, String str7, boolean z, boolean z2) throws IOException {
        int id;
        JSONObject jSONObject = new JSONObject();
        try {
            JSONObject jSONObjectPut = jSONObject.put(SyncHubConstants.SPHINX_CONTENT, str);
            if (z) {
                id = RequestType.REQUEST_POST_PUBLIC_CONTENT.getId();
            } else {
                id = RequestType.REQUEST_POST_CONTENT.getId();
            }
            jSONObjectPut.put(SyncHubConstants.REQUEST_TYPE, id).put(SyncHubConstants.SPHINX_CONTENT_ID, str4).put(SyncHubConstants.CLIENT_TYPE, 1).put("apiKey", PropertiesUtil.getInstance().getProperty(PropertiesUtil.isProductionReady() ? PropertiesUtil.PROPERTY_1 : PropertiesUtil.PROPERTY_5)).put(SyncHubConstants.ACCESS_TOKEN, str6).put(SyncHubConstants.CHECKSUM, str7).put(FILE_NAME, str2).put(FILE_TYPE, str3);
            if (!z) {
                jSONObject.put("signature", str5);
            } else {
                jSONObject.put(UPDATE_CACHE_METADATA, z2);
            }
            return jSONObject;
        } catch (JSONException unused) {
            throw new IOException();
        }
    }

    public static String getUrlFromServerResponse(String str) throws JSONException, UnsupportedEncodingException {
        return new JSONObject(URLDecoder.decode(str, "UTF-8")).getString("url");
    }

    private static HttpEntity getHttpEntityFromResponse(String str, String str2, String str3, String str4, String str5, String str6, File file, boolean z, boolean z2) throws JSONException, InvalidAccessTokenException, IOException {
        return getMultipartBuilderFromResponse(str, str2, str3, str4, str5, str6, file, z, z2).build();
    }

    public static HttpEntity getPublicHttpEntityFromResponse(String str, String str2, String str3, String str4, String str5, File file, boolean z) throws JSONException, InvalidAccessTokenException, IOException {
        return getHttpEntityFromResponse(str, str2, str3, str4, null, str5, file, true, z);
    }

    public static HttpEntity getPrivateHttpEntityFromResponse(String str, String str2, String str3, String str4, String str5, String str6, File file) throws JSONException, InvalidAccessTokenException, IOException {
        return getHttpEntityFromResponse(str, str2, str3, str4, str5, str6, file, false, false);
    }

    private static MultipartEntityBuilder getMultipartBuilderFromResponse(String str, String str2, String str3, String str4, String str5, String str6, File file, boolean z, boolean z2) throws JSONException, InvalidAccessTokenException, IOException {
        if (str == null) {
            throw new IOException();
        }
        if (str.equals("Invalid token") || str.equals("Token has expired") || str.equals("Invalid ticket data")) {
            throw new InvalidAccessTokenException(str);
        }
        MultipartEntityBuilder multipartEntityBuilder = setupCommonMultiparts(new JSONObject(URLDecoder.decode(str, "UTF-8")), z);
        multipartEntityBuilder.addTextBody(SyncHubConstants.X_AMZ_META_CHECKSUM, str6);
        if (!z) {
            multipartEntityBuilder.addTextBody(SyncHubConstants.X_AMZ_META_CONTENT_ID, str2);
            multipartEntityBuilder.addTextBody(SyncHubConstants.X_AMZ_META_SIGNATURE, str5.trim());
        } else if (z2) {
            multipartEntityBuilder.addTextBody("Cache-Control", "no-cache");
        }
        multipartEntityBuilder.addTextBody(SyncHubConstants.X_AMZ_META_FILE_NAME, str3);
        multipartEntityBuilder.addTextBody("Content-Type", str4);
        multipartEntityBuilder.addTextBody("Content-Disposition", "attachment; filename=" + str3);
        multipartEntityBuilder.addBinaryBody("file", file, ContentType.create(str4), str3);
        return multipartEntityBuilder;
    }

    public static String getPublicKeyFromResponse(Map<String, List<String>> map) throws IOException {
        if (map == null) {
            throw new IOException("server response can't be null");
        }
        List<String> list = map.get(SyncHubConstants.PUBLIC_KEY);
        if (list == null || list.size() < 1) {
            throw new IOException("response headers don't contain required data");
        }
        return list.get(0);
    }

    private static MultipartEntityBuilder setupCommonMultiparts(JSONObject jSONObject, boolean z) throws JSONException, IllegalArgumentException {
        if (jSONObject == null) {
            throw new IllegalArgumentException("jsonResponse is not allowed to be null");
        }
        MultipartEntityBuilder multipartEntityBuilderCreate = MultipartEntityBuilder.create();
        multipartEntityBuilderCreate.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        multipartEntityBuilderCreate.setBoundary(SyncHubConstants.BOUNDARY);
        multipartEntityBuilderCreate.addTextBody("key", jSONObject.getString("key"));
        multipartEntityBuilderCreate.addTextBody(SyncHubConstants.ACL, z ? SyncHubConstants.ACL_TYPE_PUBLIC : SyncHubConstants.ACL_TYPE);
        multipartEntityBuilderCreate.addTextBody(SyncHubConstants.POLICY, jSONObject.getString("policy"));
        multipartEntityBuilderCreate.addTextBody(SyncHubConstants.X_AMZ_ALGORITHM, SyncHubConstants.ALGORITHM);
        multipartEntityBuilderCreate.addTextBody(SyncHubConstants.X_AMZ_CREDENTIAL, jSONObject.getString(SyncHubConstants.JSON_CREDENTIAL));
        multipartEntityBuilderCreate.addTextBody("x-amz-date", jSONObject.getString(SyncHubConstants.JSON_DATE));
        if (!z) {
            multipartEntityBuilderCreate.addTextBody("x-amz-server-side-encryption", SyncHubConstants.X_AMZ_ENCRYPTION_TYPE);
        }
        multipartEntityBuilderCreate.addTextBody(SyncHubConstants.X_AMZ_SIGNATURE, jSONObject.getString("signature"));
        return multipartEntityBuilderCreate;
    }
}
