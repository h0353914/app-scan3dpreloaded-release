package com.sonymobile.scan3d.storageservice.network;

import android.text.TextUtils;
import java.io.File;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public enum ContentType {
    UNKNOWN(" "),
    JSON("application/json"),
    XML("application/xml"),
    XML_TEXT("text/xml"),
    ZIP("application/zip"),
    MULTIPART("multipart/form-data"),
    PLAIN_TEXT("text/plain"),
    PNG("image/png"),
    JPG("image/jpeg"),
    GLB("model/gltf-binary");

    private static final String GLB_MIME = "model/gltf-binary";
    private static final String JPG_MIME = "image/jpeg";
    private static final String JSON_MIME = "application/json";
    private static final String MULTIPART_MIME = "multipart/form-data";
    private static final String PLAIN_TEXT_MIME = "text/plain";
    private static final String PNG_MIME = "image/png";
    private static final String SUFFIX_JPEG = ".jpeg";
    private static final String SUFFIX_JSON = ".json";
    private static final String SUFFIX_PNG = ".png";
    private static final String SUFFIX_XML = ".xml";
    private static final String SUFFIX_ZIP = ".zip";
    private static final String XML_MIME = "application/xml";
    private static final String XML_TEXT_MIME = "text/xml";
    private static final String ZIP_MIME = "application/zip";
    private final String mMimeType;

    ContentType(String str) {
        this.mMimeType = str;
    }

    public String toMimeString() {
        return this.mMimeType;
    }

    public static ContentType getContentType(String str) {
        if (!TextUtils.isEmpty(str)) {
            String lowerCase = str.toLowerCase(Locale.US);
            for (ContentType contentType : values()) {
                if (lowerCase.contains(contentType.mMimeType)) {
                    return contentType;
                }
            }
        }
        return UNKNOWN;
    }

    public static ContentType getContentType(File file) {
        String name = file.getName();
        int iLastIndexOf = name.lastIndexOf(46);
        ContentType contentType = UNKNOWN;
        if (iLastIndexOf < 0) {
            return contentType;
        }
        switch (name.substring(iLastIndexOf)) {
            case ".zip":
                return ZIP;
            case ".json":
                return JSON;
            case ".jpeg":
                return JPG;
            case ".png":
                return PNG;
            case ".xml":
                return XML;
            default:
                return contentType;
        }
    }
}
