package com.sonymobile.scan3d.storageservice.network;

import android.content.Context;
import android.net.Uri;
import android.net.http.HttpResponseCache;
import com.sonymobile.scan3d.logging.DebugLog;
import java.io.ByteArrayInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.zip.GZIPOutputStream;
import org.apache.http.HttpEntity;

/* JADX INFO: loaded from: classes.dex */
class NetworkRequest extends HttpConstants {
    private static final String CACHE_DIRECTORY = "httpcache";
    private static final long CACHE_SIZE = 5242880;
    private static final int DEFAULT_CONNECTION_TIMEOUT = 60000;
    private static final int DEFAULT_READ_TIMEOUT = 60000;
    private static final int MAX_BUFFER_SIZE = 16384;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.NetworkRequest";
    private byte[] mBody;
    private boolean mCompress;
    private HttpEntity mEntity;
    private MultipartForm mForm;
    private Map<String, List<String>> mHeaders;
    private final Method mMethod;
    private INetworkProgressListener mNetworkProgressListener;
    private final TransferProgress mTransferProgress;
    private final Uri mUri;
    private final boolean mUseCache;
    private boolean mUseStreamingMode;

    interface INetworkProgressListener {
        void onNetworkProgress(NetworkRequest networkRequest, TransferProgress transferProgress);
    }

    public enum Method {
        GET,
        POST,
        DELETE,
        PUT,
        PATCH
    }

    NetworkRequest(String str, Method method, boolean z) {
        this.mUri = Uri.parse(str);
        this.mMethod = method;
        this.mUseCache = z;
        this.mHeaders = new HashMap();
        this.mTransferProgress = new TransferProgress();
        this.mUseStreamingMode = true;
    }

    NetworkRequest(String str, Method method) {
        this(str, method, false);
    }

    void addTokenAuthentication(String str) {
        addHeader("Authorization", HttpConstants.BEARER + str);
    }

    void addHeader(String str, Object obj) {
        List<String> listComputeIfAbsent = this.mHeaders.computeIfAbsent(str, str2 -> new ArrayList<>());
        if ((obj instanceof String) || (obj instanceof Long) || (obj instanceof Integer)) {
            String strValueOf = String.valueOf(obj);
            if (listComputeIfAbsent != null) {
                listComputeIfAbsent.add(strValueOf);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("Unsupported type " + obj);
    }

    void setProgressListener(INetworkProgressListener iNetworkProgressListener) {
        this.mNetworkProgressListener = iNetworkProgressListener;
    }

    void setUseStreamingMode(boolean z) {
        this.mUseStreamingMode = z;
    }

    void setBody(byte[] bArr, String str, boolean z) {
        this.mBody = bArr;
        addHeader("Content-Type", str);
        this.mCompress = z;
        if (this.mCompress) {
            addHeader("Content-Encoding", HttpConstants.ENCODING_GZIP);
        }
    }

    void setBody(String str, boolean z) {
        setBody(str.getBytes(StandardCharsets.UTF_8), ContentType.JSON.toMimeString() + "; charset=utf-8", z);
    }

    void setBody(HttpEntity httpEntity) {
        this.mEntity = httpEntity;
    }

    void setMultipartForm(MultipartForm multipartForm) {
        this.mForm = multipartForm;
    }

    public final IHttpResponse execute(Context context) throws Exception {
        if (context == null) {
            return null;
        }
        if (this.mUseCache) {
            installHttpCache(context);
        }
        IHttpResponse iHttpResponseExecute = execute(context, setupConnection());
        if (!this.mUseCache) {
            return iHttpResponseExecute;
        }
        flushHttpCaching();
        return iHttpResponseExecute;
    }

    private IHttpResponse execute(Context context, HttpURLConnection httpURLConnection) throws Exception {
        if (this.mBody != null) {
            addBody(httpURLConnection);
        } else if (this.mForm != null) {
            addMultiPartBody(context, httpURLConnection);
        } else if (this.mEntity != null) {
            addMultipartAsEntity(httpURLConnection);
        } else {
            httpURLConnection.setDoOutput(false);
        }
        return new HttpResponse(httpURLConnection);
    }

    private HttpURLConnection setupConnection() throws Exception {
        URL url = new URL(this.mUri.toString());
        DebugLog.d(TAG, "setupConnection(): " + url.getHost());
        HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
        addHeaders(httpURLConnection);
        if (!this.mUseCache) {
            httpURLConnection.addRequestProperty("Cache-Control", "no-cache");
        }
        httpURLConnection.setDefaultUseCaches(this.mUseCache);
        httpURLConnection.setUseCaches(this.mUseCache);
        httpURLConnection.setReadTimeout(60000);
        httpURLConnection.setConnectTimeout(60000);
        httpURLConnection.setRequestMethod(this.mMethod.toString());
        httpURLConnection.setDoInput(true);
        httpURLConnection.setDoOutput(true);
        return httpURLConnection;
    }

    private void addHeaders(HttpURLConnection httpURLConnection) {
        for (Map.Entry<String, List<String>> entry : this.mHeaders.entrySet()) {
            List<String> value = entry.getValue();
            StringBuilder sb = new StringBuilder();
            int i = 0;
            while (i < value.size()) {
                sb.append(value.get(i));
                i++;
                if (i < value.size()) {
                    sb.append(",");
                }
            }
            DebugLog.d(TAG, "addHeaders(): header values=" + sb.toString());
            if (sb.length() > 0) {
                httpURLConnection.addRequestProperty(entry.getKey(), sb.toString());
            }
        }
    }

    private void addBody(HttpURLConnection httpURLConnection) throws IOException {
        if (this.mUseStreamingMode) {
            if (this.mCompress) {
                httpURLConnection.setChunkedStreamingMode(-1);
            } else {
                httpURLConnection.setFixedLengthStreamingMode(this.mBody.length);
            }
        }
        try (OutputStream outputStream = getOutputStream(httpURLConnection);
             ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(this.mBody)) {
            byte[] bArr = new byte[16384];
            int i = 0;
            while (true) {
                int i2 = byteArrayInputStream.read(bArr);
                if (i2 == -1) {
                    return;
                }
                if (Thread.currentThread().isInterrupted()) {
                    throw new RuntimeException("The upload request was interrupted.");
                }
                outputStream.write(bArr, 0, i2);
                i += i2;
                reportNetworkProgress(this.mBody.length, i);
            }
        }
    }

    private void addMultipartAsEntity(HttpURLConnection httpURLConnection) throws IOException {
        httpURLConnection.setRequestProperty("Content-Type", this.mEntity.getContentType().getValue());
        httpURLConnection.setRequestProperty("Content-Length", String.valueOf(this.mEntity.getContentLength()));
        if (this.mUseStreamingMode) {
            httpURLConnection.setChunkedStreamingMode(-1);
        }
        try (OutputStream outputStream = httpURLConnection.getOutputStream()) {
            this.mEntity.writeTo(outputStream);
        }
    }

    private void addMultiPartBody(Context context, HttpURLConnection httpURLConnection) throws Exception {
        httpURLConnection.setRequestProperty("Content-Type", getMultipartContentType(this.mForm.getBoundary()));
        if (this.mUseStreamingMode) {
            httpURLConnection.setChunkedStreamingMode(-1);
        }
        try (DataOutputStream dataOutputStream = new DataOutputStream(httpURLConnection.getOutputStream())) {
            this.mForm.onWrite(context, dataOutputStream, this);
        }
    }

    private OutputStream getOutputStream(HttpURLConnection httpURLConnection) throws IOException {
        OutputStream outputStream = httpURLConnection.getOutputStream();
        return this.mCompress ? new GZIPOutputStream(outputStream) : new DataOutputStream(outputStream);
    }

    private static void installHttpCache(Context context) {
        try {
            if (HttpResponseCache.getInstalled() == null) {
                HttpResponseCache.install(new File(context.getCacheDir(), CACHE_DIRECTORY), CACHE_SIZE);
            }
        } catch (IOException e) {
            DebugLog.d(TAG, "Enabling http cache failed:", e);
        }
    }

    private static void flushHttpCaching() {
        HttpResponseCache installed = HttpResponseCache.getInstalled();
        if (installed != null) {
            DebugLog.d(TAG, "Flushing of http cache to the filesystem.");
            installed.flush();
        } else {
            DebugLog.d(TAG, "There is no valid cache installed.");
        }
    }

    void reportNetworkProgress(long j, long j2) {
        if (this.mNetworkProgressListener == null || !this.mTransferProgress.update(j, j2)) {
            return;
        }
        this.mNetworkProgressListener.onNetworkProgress(this, this.mTransferProgress);
    }
}
