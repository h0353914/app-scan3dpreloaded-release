package com.sonymobile.scan3d.storageservice.network;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public interface IHttpResponse extends Closeable {
    ContentType getContentType();

    Map<String, List<String>> getHeaders();

    InputStream getInputStream() throws IOException;

    int getStatusCode();

    boolean isResponseReceived();
}
