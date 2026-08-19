package com.sonymobile.scan3d.storageservice.network;

/* JADX INFO: loaded from: classes.dex */
abstract class HttpConstants {
    public static final String ACCEPT = "Accept";
    public static final String AUTHORIZATION_HEADER = "Authorization";
    public static final String BEARER = "Bearer ";
    public static final String CACHE_CONTROL_HEADER = "Cache-Control";
    public static final String COMMA = ",";
    public static final String CONTENT_ENCODING_HEADER = "Content-Encoding";
    public static final String CONTENT_LENGTH = "Content-Length";
    public static final String CONTENT_TYPE_HEADER = "Content-Type";
    public static final String ENCODING_GZIP = "gzip";
    public static final String NO_CACHE = "no-cache";

    HttpConstants() {
    }

    public static String getMultipartContentType(String str) {
        return "multipart/form-data; boundary=" + str;
    }
}
