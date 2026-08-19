package com.google.android.vending.expansion.downloader.impl;

import android.content.Context;
import android.os.Build;
import android.os.PowerManager;
import android.os.Process;
import android.util.Log;
import com.google.android.vending.expansion.downloader.Constants;
import com.google.android.vending.expansion.downloader.Helpers;
import java.io.File;
import java.io.FileDescriptor;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.SyncFailedException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Locale;
import org.apache.http.HttpHeaders;
import org.apache.http.protocol.HTTP;

/* JADX INFO: loaded from: classes.dex */
public class DownloadThread {
    private Context mContext;
    private final DownloadsDB mDB;
    private DownloadInfo mInfo;
    private final DownloadNotification mNotification;
    private DownloaderService mService;
    private String mUserAgent;

    public DownloadThread(DownloadInfo downloadInfo, DownloaderService downloaderService, DownloadNotification downloadNotification) {
        this.mContext = downloaderService;
        this.mInfo = downloadInfo;
        this.mService = downloaderService;
        this.mNotification = downloadNotification;
        this.mDB = DownloadsDB.getDB(downloaderService);
        this.mUserAgent = "APKXDL (Linux; U; Android " + Build.VERSION.RELEASE + ";" + Locale.getDefault().toString() + "; " + Build.DEVICE + "/" + Build.ID + ")" + downloaderService.getPackageName();
    }

    private String userAgent() {
        return this.mUserAgent;
    }

    private static class State {
        public String mFilename;
        public String mNewUri;
        public int mRedirectCount;
        public String mRequestUri;
        public FileOutputStream mStream;
        public boolean mCountRetry = false;
        public int mRetryAfter = 0;
        public boolean mGotData = false;

        public State(DownloadInfo downloadInfo, DownloaderService downloaderService) {
            this.mRedirectCount = 0;
            this.mRedirectCount = downloadInfo.mRedirectCount;
            this.mRequestUri = downloadInfo.mUri;
            this.mFilename = downloaderService.generateTempSaveFileName(downloadInfo.mFileName);
        }
    }

    private static class InnerState {
        public int mBytesNotified;
        public int mBytesSoFar;
        public int mBytesThisSession;
        public boolean mContinuingDownload;
        public String mHeaderContentDisposition;
        public String mHeaderContentLength;
        public String mHeaderContentLocation;
        public String mHeaderETag;
        public long mTimeLastNotification;

        private InnerState() {
            this.mBytesSoFar = 0;
            this.mBytesThisSession = 0;
            this.mContinuingDownload = false;
            this.mBytesNotified = 0;
            this.mTimeLastNotification = 0L;
        }
    }

    private class StopRequest extends Throwable {
        private static final long serialVersionUID = 6338592678988347973L;
        public int mFinalStatus;

        public StopRequest(int i, String str) {
            super(str);
            this.mFinalStatus = i;
        }

        public StopRequest(int i, String str, Throwable th) {
            super(str, th);
            this.mFinalStatus = i;
        }
    }

    private class RetryDownload extends Throwable {
        private static final long serialVersionUID = 6196036036517540229L;

        private RetryDownload() {
        }
    }

    public void run() {
        Process.setThreadPriority(10);
        State state = new State(this.mInfo, this.mService);
        PowerManager.WakeLock wakeLock = null;
        try {
            try {
                PowerManager.WakeLock wakeLockNewWakeLock = ((PowerManager) this.mContext.getSystemService("power")).newWakeLock(1, Constants.TAG);
                wakeLockNewWakeLock.acquire();
                boolean z = false;
                while (!z) {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(state.mRequestUri).openConnection();
                    httpURLConnection.setRequestProperty("User-Agent", userAgent());
                    try {
                        executeDownload(state, httpURLConnection);
                        httpURLConnection.disconnect();
                        z = true;
                    } catch (RetryDownload unused) {
                        httpURLConnection.disconnect();
                    } catch (Throwable th) {
                        httpURLConnection.disconnect();
                        throw th;
                    }
                }
                finalizeDestinationFile(state);
                if (wakeLockNewWakeLock != null) {
                    wakeLockNewWakeLock.release();
                }
                cleanupDestination(state, 200);
                notifyDownloadCompleted(200, state.mCountRetry, state.mRetryAfter, state.mRedirectCount, state.mGotData, state.mFilename);
            } catch (Throwable th2) {
                if (0 != 0) {
                    wakeLock.release();
                }
                cleanupDestination(state, 491);
                notifyDownloadCompleted(491, state.mCountRetry, state.mRetryAfter, state.mRedirectCount, state.mGotData, state.mFilename);
                throw th2;
            }
        } catch (StopRequest e) {
            Log.w(Constants.TAG, "Aborting request for download " + this.mInfo.mFileName + ": " + e.getMessage());
            e.printStackTrace();
            int i = e.mFinalStatus;
            if (0 != 0) {
                wakeLock.release();
            }
            cleanupDestination(state, i);
            notifyDownloadCompleted(i, state.mCountRetry, state.mRetryAfter, state.mRedirectCount, state.mGotData, state.mFilename);
        } catch (Throwable th3) {
            Log.w(Constants.TAG, "Exception for " + this.mInfo.mFileName + ": " + th3);
            if (0 != 0) {
                wakeLock.release();
            }
            cleanupDestination(state, 491);
            notifyDownloadCompleted(491, state.mCountRetry, state.mRetryAfter, state.mRedirectCount, state.mGotData, state.mFilename);
        }
    }

    private void executeDownload(State state, HttpURLConnection httpURLConnection) throws StopRequest, RetryDownload {
        InnerState innerState = new InnerState();
        checkPausedOrCanceled(state);
        setupDestinationFile(state, innerState);
        addRequestHeaders(innerState, httpURLConnection);
        checkConnectivity(state);
        this.mNotification.onDownloadStateChanged(3);
        handleExceptionalStatus(state, innerState, httpURLConnection, sendRequest(state, httpURLConnection));
        processResponseHeaders(state, innerState, httpURLConnection);
        InputStream inputStreamOpenResponseEntity = openResponseEntity(state, httpURLConnection);
        this.mNotification.onDownloadStateChanged(4);
        transferData(state, innerState, new byte[4096], inputStreamOpenResponseEntity);
    }

    private void checkConnectivity(State state) throws StopRequest {
        switch (this.mService.getNetworkAvailabilityState(this.mDB)) {
            case 1:
                return;
            case 2:
                throw new StopRequest(DownloaderService.STATUS_WAITING_FOR_NETWORK, "waiting for network to return");
            case 3:
                throw new StopRequest(DownloaderService.STATUS_QUEUED_FOR_WIFI, "waiting for wifi");
            case 4:
            default:
                return;
            case 5:
                throw new StopRequest(DownloaderService.STATUS_WAITING_FOR_NETWORK, "roaming is not allowed");
            case 6:
                throw new StopRequest(DownloaderService.STATUS_QUEUED_FOR_WIFI_OR_CELLULAR_PERMISSION, "waiting for wifi or for download over cellular to be authorized");
        }
    }

    private void transferData(State state, InnerState innerState, byte[] bArr, InputStream inputStream) throws StopRequest {
        while (true) {
            int fromResponse = readFromResponse(state, innerState, bArr, inputStream);
            if (fromResponse == -1) {
                handleEndOfStream(state, innerState);
                return;
            }
            state.mGotData = true;
            writeDataToDestination(state, bArr, fromResponse);
            innerState.mBytesSoFar += fromResponse;
            innerState.mBytesThisSession += fromResponse;
            reportProgress(state, innerState);
            checkPausedOrCanceled(state);
        }
    }

    private void finalizeDestinationFile(State state) throws Throwable {
        syncDestination(state);
        String str = state.mFilename;
        String strGenerateSaveFileName = Helpers.generateSaveFileName(this.mService, this.mInfo.mFileName);
        if (state.mFilename.equals(strGenerateSaveFileName)) {
            return;
        }
        File file = new File(str);
        File file2 = new File(strGenerateSaveFileName);
        if (this.mInfo.mTotalBytes != -1 && this.mInfo.mCurrentBytes == this.mInfo.mTotalBytes) {
            if (!file.renameTo(file2)) {
                throw new StopRequest(492, "unable to finalize destination file");
            }
            return;
        }
        throw new StopRequest(DownloaderService.STATUS_FILE_DELIVERED_INCORRECTLY, "file delivered with incorrect size. probably due to network not browser configured");
    }

    private void cleanupDestination(State state, int i) {
        closeDestination(state);
        if (state.mFilename == null || !DownloaderService.isStatusError(i)) {
            return;
        }
        new File(state.mFilename).delete();
        state.mFilename = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v0 */
    /* JADX WARN: Type inference failed for: r0v12 */
    /* JADX WARN: Type inference failed for: r0v25 */
    /* JADX WARN: Type inference failed for: r0v26 */
    /* JADX WARN: Type inference failed for: r0v27 */
    /* JADX WARN: Type inference failed for: r0v28 */
    /* JADX WARN: Type inference failed for: r0v29 */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v30 */
    /* JADX WARN: Type inference failed for: r0v31 */
    /* JADX WARN: Type inference failed for: r0v32 */
    /* JADX WARN: Type inference failed for: r0v33 */
    /* JADX WARN: Type inference failed for: r0v34 */
    /* JADX WARN: Type inference failed for: r0v35 */
    /* JADX WARN: Type inference failed for: r0v4, types: [java.io.FileOutputStream] */
    /* JADX WARN: Type inference failed for: r0v7 */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x003f -> B:51:0x00c5). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:27:0x0049 -> B:51:0x00c5). Please report as a decompilation issue!!! */
    private void syncDestination(State state) {
        FileOutputStream downloadedFileStream = null;
        try {
            try {
                downloadedFileStream = new FileOutputStream(state.mFilename, true);
                FileDescriptor fd = downloadedFileStream.getFD();
                fd.sync();
            } catch (FileNotFoundException e) {
                Log.w(Constants.TAG, "file " + state.mFilename + " not found: " + e);
            } catch (SyncFailedException e2) {
                Log.w(Constants.TAG, "file " + state.mFilename + " sync failed: " + e2);
            } catch (IOException e3) {
                Log.w(Constants.TAG, "IOException trying to sync " + state.mFilename + ": " + e3);
            } catch (RuntimeException e4) {
                Log.w(Constants.TAG, "exception while syncing file: ", e4);
            }
        } finally {
            if (downloadedFileStream != null) {
                try {
                    downloadedFileStream.close();
                } catch (IOException e5) {
                    Log.w(Constants.TAG, "IOException while closing synced file: ", e5);
                } catch (RuntimeException e6) {
                    Log.w(Constants.TAG, "exception while closing file: ", e6);
                }
            }
        }
    }

    private void closeDestination(State state) {
        try {
            if (state.mStream != null) {
                state.mStream.close();
                state.mStream = null;
            }
        } catch (IOException unused) {
        }
    }

    private void checkPausedOrCanceled(State state) throws StopRequest {
        if (this.mService.getControl() == 1 && this.mService.getStatus() == 193) {
            throw new StopRequest(this.mService.getStatus(), "download paused");
        }
    }

    private void reportProgress(State state, InnerState innerState) {
        long jCurrentTimeMillis = System.currentTimeMillis();
        if (innerState.mBytesSoFar - innerState.mBytesNotified <= 4096 || jCurrentTimeMillis - innerState.mTimeLastNotification <= 1000) {
            return;
        }
        this.mInfo.mCurrentBytes = innerState.mBytesSoFar;
        this.mDB.updateDownloadCurrentBytes(this.mInfo);
        innerState.mBytesNotified = innerState.mBytesSoFar;
        innerState.mTimeLastNotification = jCurrentTimeMillis;
        this.mService.notifyUpdateBytes(((long) innerState.mBytesThisSession) + this.mService.mBytesSoFar);
    }

    private void writeDataToDestination(State state, byte[] bArr, int i) throws StopRequest {
        try {
            if (state.mStream == null) {
                state.mStream = new FileOutputStream(state.mFilename, true);
            }
            state.mStream.write(bArr, 0, i);
            closeDestination(state);
        } catch (IOException e) {
            if (!Helpers.isExternalMediaMounted()) {
                throw new StopRequest(499, "external media not mounted while writing destination file");
            }
            if (Helpers.getAvailableBytes(Helpers.getFilesystemRoot(state.mFilename)) < i) {
                throw new StopRequest(498, "insufficient space while writing destination file", e);
            }
            throw new StopRequest(492, "while writing destination file: " + e.toString(), e);
        }
    }

    private void handleEndOfStream(State state, InnerState innerState) throws StopRequest {
        this.mInfo.mCurrentBytes = innerState.mBytesSoFar;
        this.mDB.updateDownload(this.mInfo);
        if ((innerState.mHeaderContentLength == null || innerState.mBytesSoFar == Integer.parseInt(innerState.mHeaderContentLength)) ? false : true) {
            if (cannotResume(innerState)) {
                throw new StopRequest(489, "mismatched content length");
            }
            throw new StopRequest(getFinalStatusForHttpError(state), "closed socket before end of file");
        }
    }

    private boolean cannotResume(InnerState innerState) {
        return innerState.mBytesSoFar > 0 && innerState.mHeaderETag == null;
    }

    private int readFromResponse(State state, InnerState innerState, byte[] bArr, InputStream inputStream) throws StopRequest {
        try {
            return inputStream.read(bArr);
        } catch (IOException e) {
            logNetworkState();
            this.mInfo.mCurrentBytes = innerState.mBytesSoFar;
            this.mDB.updateDownload(this.mInfo);
            if (cannotResume(innerState)) {
                throw new StopRequest(489, "while reading response: " + e.toString() + ", can't resume interrupted download with no ETag", e);
            }
            throw new StopRequest(getFinalStatusForHttpError(state), "while reading response: " + e.toString(), e);
        }
    }

    private InputStream openResponseEntity(State state, HttpURLConnection httpURLConnection) throws StopRequest {
        try {
            return httpURLConnection.getInputStream();
        } catch (IOException e) {
            logNetworkState();
            throw new StopRequest(getFinalStatusForHttpError(state), "while getting entity: " + e.toString(), e);
        }
    }

    private void logNetworkState() {
        StringBuilder sb = new StringBuilder();
        sb.append("Net ");
        sb.append(this.mService.getNetworkAvailabilityState(this.mDB) == 1 ? "Up" : "Down");
        Log.i(Constants.TAG, sb.toString());
    }

    private void processResponseHeaders(State state, InnerState innerState, HttpURLConnection httpURLConnection) throws StopRequest {
        if (innerState.mContinuingDownload) {
            return;
        }
        readResponseHeaders(state, innerState, httpURLConnection);
        try {
            state.mFilename = this.mService.generateSaveFile(this.mInfo.mFileName, this.mInfo.mTotalBytes);
            try {
                state.mStream = new FileOutputStream(state.mFilename);
            } catch (FileNotFoundException e) {
                try {
                    if (new File(Helpers.getSaveFilePath(this.mService)).mkdirs()) {
                        state.mStream = new FileOutputStream(state.mFilename);
                    }
                } catch (Exception unused) {
                    throw new StopRequest(492, "while opening destination file: " + e.toString(), e);
                }
            }
            updateDatabaseFromHeaders(state, innerState);
            checkConnectivity(state);
        } catch (DownloaderService.GenerateSaveFileError e2) {
            throw new StopRequest(e2.mStatus, e2.mMessage);
        }
    }

    private void updateDatabaseFromHeaders(State state, InnerState innerState) {
        this.mInfo.mETag = innerState.mHeaderETag;
        this.mDB.updateDownload(this.mInfo);
    }

    private void readResponseHeaders(State state, InnerState innerState, HttpURLConnection httpURLConnection) throws StopRequest {
        String headerField = httpURLConnection.getHeaderField("Content-Disposition");
        if (headerField != null) {
            innerState.mHeaderContentDisposition = headerField;
        }
        String headerField2 = httpURLConnection.getHeaderField(HttpHeaders.CONTENT_LOCATION);
        if (headerField2 != null) {
            innerState.mHeaderContentLocation = headerField2;
        }
        String headerField3 = httpURLConnection.getHeaderField("ETag");
        if (headerField3 != null) {
            innerState.mHeaderETag = headerField3;
        }
        String headerField4 = httpURLConnection.getHeaderField("Transfer-Encoding");
        String str = headerField4 != null ? headerField4 : null;
        String headerField5 = httpURLConnection.getHeaderField("Content-Type");
        if (headerField5 != null && !headerField5.equals("application/vnd.android.obb")) {
            throw new StopRequest(DownloaderService.STATUS_FILE_DELIVERED_INCORRECTLY, "file delivered with incorrect Mime type");
        }
        if (str == null) {
            long contentLength = httpURLConnection.getContentLength();
            if (headerField5 != null) {
                if (contentLength != -1 && contentLength != this.mInfo.mTotalBytes) {
                    Log.e(Constants.TAG, "Incorrect file size delivered.");
                } else {
                    innerState.mHeaderContentLength = Long.toString(contentLength);
                }
            }
        }
        if (innerState.mHeaderContentLength == null && (str == null || !str.equalsIgnoreCase(HTTP.CHUNK_CODING))) {
            throw new StopRequest(495, "can't know size of download, giving up");
        }
    }

    private void handleExceptionalStatus(State state, InnerState innerState, HttpURLConnection httpURLConnection, int i) throws StopRequest, RetryDownload {
        if (i == 503 && this.mInfo.mNumFailed < 5) {
            handleServiceUnavailable(state, httpURLConnection);
        }
        if (i != (innerState.mContinuingDownload ? 206 : 200)) {
            handleOtherStatus(state, innerState, i);
        } else {
            state.mRedirectCount = 0;
        }
    }

    private void handleOtherStatus(State state, InnerState innerState, int i) throws StopRequest {
        int i2;
        if (DownloaderService.isStatusError(i)) {
            i2 = i;
        } else if (i < 300 || i >= 400) {
            i2 = (innerState.mContinuingDownload && i == 200) ? 489 : 494;
        } else {
            i2 = 493;
        }
        throw new StopRequest(i2, "http error " + i);
    }

    private void addRequestHeaders(InnerState innerState, HttpURLConnection httpURLConnection) {
        if (innerState.mContinuingDownload) {
            if (innerState.mHeaderETag != null) {
                httpURLConnection.setRequestProperty("If-Match", innerState.mHeaderETag);
            }
            httpURLConnection.setRequestProperty("Range", "bytes=" + innerState.mBytesSoFar + Constants.FILENAME_SEQUENCE_SEPARATOR);
        }
    }

    private void handleServiceUnavailable(State state, HttpURLConnection httpURLConnection) throws StopRequest {
        state.mCountRetry = true;
        String headerField = httpURLConnection.getHeaderField(HttpHeaders.RETRY_AFTER);
        if (headerField != null) {
            try {
                state.mRetryAfter = Integer.parseInt(headerField);
                if (state.mRetryAfter < 0) {
                    state.mRetryAfter = 0;
                } else {
                    if (state.mRetryAfter < 30) {
                        state.mRetryAfter = 30;
                    } else if (state.mRetryAfter > 86400) {
                        state.mRetryAfter = Constants.MAX_RETRY_AFTER;
                    }
                    state.mRetryAfter += Helpers.sRandom.nextInt(31);
                    state.mRetryAfter *= 1000;
                }
            } catch (NumberFormatException unused) {
            }
        }
        throw new StopRequest(DownloaderService.STATUS_WAITING_TO_RETRY, "got 503 Service Unavailable, will retry later");
    }

    private int sendRequest(State state, HttpURLConnection httpURLConnection) throws StopRequest {
        try {
            return httpURLConnection.getResponseCode();
        } catch (IOException e) {
            logNetworkState();
            throw new StopRequest(getFinalStatusForHttpError(state), "while trying to execute request: " + e.toString(), e);
        } catch (IllegalArgumentException e2) {
            throw new StopRequest(495, "while trying to execute request: " + e2.toString(), e2);
        }
    }

    private int getFinalStatusForHttpError(State state) {
        if (this.mService.getNetworkAvailabilityState(this.mDB) != 1) {
            return DownloaderService.STATUS_WAITING_FOR_NETWORK;
        }
        if (this.mInfo.mNumFailed < 5) {
            state.mCountRetry = true;
            return DownloaderService.STATUS_WAITING_TO_RETRY;
        }
        Log.w(Constants.TAG, "reached max retries for " + this.mInfo.mNumFailed);
        return 495;
    }

    private void setupDestinationFile(State state, InnerState innerState) throws StopRequest {
        if (state.mFilename != null) {
            if (!Helpers.isFilenameValid(state.mFilename)) {
                throw new StopRequest(492, "found invalid internal destination filename");
            }
            File file = new File(state.mFilename);
            if (file.exists()) {
                long length = file.length();
                if (length == 0) {
                    file.delete();
                    state.mFilename = null;
                } else {
                    if (this.mInfo.mETag == null) {
                        file.delete();
                        throw new StopRequest(489, "Trying to resume a download that can't be resumed");
                    }
                    try {
                        state.mStream = new FileOutputStream(state.mFilename, true);
                        innerState.mBytesSoFar = (int) length;
                        if (this.mInfo.mTotalBytes != -1) {
                            innerState.mHeaderContentLength = Long.toString(this.mInfo.mTotalBytes);
                        }
                        innerState.mHeaderETag = this.mInfo.mETag;
                        innerState.mContinuingDownload = true;
                    } catch (FileNotFoundException e) {
                        throw new StopRequest(492, "while opening destination for resuming: " + e.toString(), e);
                    }
                }
            }
        }
        if (state.mStream != null) {
            closeDestination(state);
        }
    }

    private void notifyDownloadCompleted(int i, boolean z, int i2, int i3, boolean z2, String str) {
        updateDownloadDatabase(i, z, i2, i3, z2, str);
        DownloaderService.isStatusCompleted(i);
    }

    private void updateDownloadDatabase(int i, boolean z, int i2, int i3, boolean z2, String str) {
        DownloadInfo downloadInfo = this.mInfo;
        downloadInfo.mStatus = i;
        downloadInfo.mRetryAfter = i2;
        downloadInfo.mRedirectCount = i3;
        downloadInfo.mLastMod = System.currentTimeMillis();
        if (!z) {
            this.mInfo.mNumFailed = 0;
        } else if (z2) {
            this.mInfo.mNumFailed = 1;
        } else {
            this.mInfo.mNumFailed++;
        }
        this.mDB.updateDownload(this.mInfo);
    }
}
