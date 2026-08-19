package com.sonymobile.scan3d.storageservice.network;

import com.sonymobile.scan3d.logging.DebugLog;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class StreamUtils {
    private static final int BUFFER_SIZE = 1024;
    private static final int EOF = -1;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.StreamUtils";

    public static InputStream copy(InputStream inputStream) throws IOException {
        return new ByteArrayInputStream(toByteArray(inputStream));
    }

    public static void close(Closeable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (IOException unused) {
                DebugLog.v(TAG, "Could not close " + closeable);
            }
        }
    }

    public static void jsonToFile(JSONObject jSONObject, File file) throws IOException {
        try (ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(jSONObject.toString().getBytes(StandardCharsets.UTF_8));
             FileOutputStream fileOutputStream = new FileOutputStream(file)) {
            isToOs(byteArrayInputStream, fileOutputStream);
        }
    }

    public static void saveToDisc(File file, InputStream inputStream) throws IOException {
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        try {
            isToOs(inputStream, fileOutputStream);
        } finally {
            close(fileOutputStream);
        }
    }

    public static void copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        isToOs(inputStream, outputStream);
    }

    public static String toString(InputStream inputStream) throws IOException {
        return new String(toByteArray(inputStream), StandardCharsets.UTF_8);
    }

    public static JSONObject toJson(InputStream inputStream) throws JSONException, IOException {
        return new JSONObject(toString(inputStream));
    }

    public static JSONObject toJsonUrlEncoded(InputStream inputStream) throws JSONException, IOException {
        return new JSONObject(URLDecoder.decode(toString(inputStream), "UTF-8"));
    }

    public static byte[] toByteArray(InputStream inputStream) throws IOException {
        try (ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream()) {
            isToOs(inputStream, byteArrayOutputStream);
            return byteArrayOutputStream.toByteArray();
        }
    }

    private static void isToOs(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[1024];
        int i = 0;
        while (i != -1) {
            i = inputStream.read(bArr, 0, 1024);
            if (i != -1) {
                outputStream.write(bArr, 0, i);
            }
        }
    }
}
