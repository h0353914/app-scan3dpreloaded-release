package com.sonymobile.scan3d.storageservice.network;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
class HttpResponse implements IHttpResponse {
    private HttpURLConnection mConnection;
    private final ContentType mContentType;
    private Map<String, List<String>> mHeaders;
    private final int mStatus;

    private static boolean isFailedStatus(int i) {
        return i >= 400;
    }

    private static boolean isSuccessfulStatus(int i) {
        return i >= 200 && i < 300;
    }

    public HttpResponse(HttpURLConnection httpURLConnection) throws IOException {
        this.mConnection = httpURLConnection;
        this.mStatus = this.mConnection.getResponseCode();
        this.mContentType = ContentType.getContentType(this.mConnection.getContentType());
        this.mHeaders = this.mConnection.getHeaderFields();
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IHttpResponse
    public InputStream getInputStream() throws IOException {
        return getInputStreamResponse();
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IHttpResponse
    public ContentType getContentType() {
        return this.mContentType;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IHttpResponse
    public int getStatusCode() {
        return this.mStatus;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IHttpResponse
    public Map<String, List<String>> getHeaders() {
        return this.mHeaders;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IHttpResponse
    public boolean isResponseReceived() {
        return this.mStatus > 0;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        this.mConnection.disconnect();
    }

    private InputStream getInputStreamResponse() throws IOException {
        if (isSuccessfulStatus(this.mStatus)) {
            return this.mConnection.getInputStream();
        }
        if (isFailedStatus(this.mStatus)) {
            return this.mConnection.getErrorStream();
        }
        return null;
    }
}
