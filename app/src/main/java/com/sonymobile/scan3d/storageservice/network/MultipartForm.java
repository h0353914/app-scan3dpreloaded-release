package com.sonymobile.scan3d.storageservice.network;

import android.content.Context;
import android.content.res.Resources;
import android.text.TextUtils;
import android.util.TypedValue;
import android.webkit.MimeTypeMap;
import androidx.annotation.RawRes;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
final class MultipartForm {
    private static final String BOUNDARY = "*****";
    private static final String LINE_END = "\r\n";
    private static final String TWO_HYPHENS = "--";
    private final String mBoundary = getMultipartBoundary();
    private final List<FormWriter> mWriters = new ArrayList();

    static abstract class FormWriter {
        abstract long onWrite(Context context, DataOutputStream dataOutputStream, NetworkRequest networkRequest, long j, long j2) throws Exception;

        abstract long size(Context context);

        FormWriter() {
        }
    }

    private static class FormTextFieldWriter extends FormWriter {
        private final boolean mAddMime;
        private final String mField;
        private final String mValue;

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.FormWriter
        public long size(Context context) {
            return 0L;
        }

        FormTextFieldWriter(String str, String str2, boolean z) {
            this.mField = str;
            this.mValue = str2;
            this.mAddMime = z;
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.FormWriter
        public long onWrite(Context context, DataOutputStream dataOutputStream, NetworkRequest networkRequest, long j, long j2) throws IOException {
            dataOutputStream.writeBytes("Content-Disposition: form-data; name=\"" + this.mField + "\"\r\n");
            if (this.mAddMime) {
                dataOutputStream.writeBytes("Content-Type: text/plain; charset=utf-8\r\n\r\n");
                dataOutputStream.write(this.mValue.getBytes(StandardCharsets.UTF_8));
                dataOutputStream.writeBytes("\r\n");
            } else {
                dataOutputStream.writeBytes("\r\n" + this.mValue + "\r\n");
            }
            return j2;
        }
    }

    private static abstract class AbstractFileWriter extends FormWriter {
        private static final int MAX_BUFFER_SIZE = 16384;
        private final boolean mAddMime;
        private final String mFieldName;

        abstract String getFileName(Context context);

        abstract InputStream getInputStream(Context context) throws Exception;

        AbstractFileWriter(String str, boolean z) {
            this.mFieldName = str;
            this.mAddMime = z;
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.FormWriter
        public long onWrite(Context context, DataOutputStream dataOutputStream, NetworkRequest networkRequest, long j, long j2) throws Exception {
            String fileName = getFileName(context);
            if (fileName == null) {
                throw new IllegalArgumentException("Could not extract a file name.");
            }
            writeFormFileHeader(dataOutputStream, fileName);
            byte[] bArr = new byte[16384];
            try (InputStream inputStream = getInputStream(context)) {
                while (true) {
                    int i = inputStream.read(bArr);
                    if (i == -1) {
                        dataOutputStream.writeBytes("\r\n");
                        return j2;
                    }
                    if (Thread.currentThread().isInterrupted()) {
                        throw new RuntimeException("The multi part upload request was interrupted.");
                    }
                    dataOutputStream.write(bArr, 0, i);
                    j2 += (long) i;
                    networkRequest.reportNetworkProgress(j, j2);
                }
            }
        }

        private void writeFormFileHeader(DataOutputStream dataOutputStream, String str) throws IOException {
            dataOutputStream.writeBytes("Content-Disposition: form-data; name=\"" + this.mFieldName + "\"; filename=\"" + str + "\"\r\n");
            String mimeType = getMimeType(str);
            if (this.mAddMime && !TextUtils.isEmpty(mimeType)) {
                dataOutputStream.writeBytes("Content-Transfer-Encoding: binary\r\n");
                dataOutputStream.writeBytes("Content-Type: " + mimeType + "\r\n\r\n");
                return;
            }
            dataOutputStream.writeBytes("Content-Transfer-Encoding: binary\r\n\r\n");
        }

        private static String getMimeType(String str) {
            String fileExtensionFromUrl = MimeTypeMap.getFileExtensionFromUrl(str);
            if (fileExtensionFromUrl != null) {
                return MimeTypeMap.getSingleton().getMimeTypeFromExtension(fileExtensionFromUrl);
            }
            return null;
        }
    }

    private static class FileWriter extends AbstractFileWriter {
        private final File mFile;
        private final boolean mIsEncrypted;

        FileWriter(File file, String str, boolean z, boolean z2) {
            super(str, z);
            this.mFile = file;
            this.mIsEncrypted = z2;
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.AbstractFileWriter
        String getFileName(Context context) {
            return this.mFile.getName();
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.AbstractFileWriter
        InputStream getInputStream(Context context) throws Exception {
            return this.mIsEncrypted ? Vault.decryptAsStream(context, this.mFile) : new FileInputStream(this.mFile);
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.FormWriter
        long size(Context context) {
            return this.mFile.length();
        }
    }

    private static class FileResourceWriter extends AbstractFileWriter {
        private final int mResourceId;

        FileResourceWriter(int i, String str, boolean z) {
            super(str, z);
            this.mResourceId = i;
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.AbstractFileWriter
        String getFileName(Context context) {
            Resources resources = context.getResources();
            TypedValue typedValue = new TypedValue();
            resources.getValue(this.mResourceId, typedValue, true);
            CharSequence charSequenceCoerceToString = typedValue.coerceToString();
            if (charSequenceCoerceToString == null) {
                return null;
            }
            String[] strArrSplit = charSequenceCoerceToString.toString().split("/");
            return strArrSplit[strArrSplit.length - 1];
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.AbstractFileWriter
        InputStream getInputStream(Context context) {
            return context.getResources().openRawResource(this.mResourceId);
        }

        @Override // com.sonymobile.scan3d.storageservice.network.MultipartForm.FormWriter
        long size(Context context) {
            long jAvailable = 0;
            try (InputStream inputStreamOpenRawResource = context.getResources().openRawResource(this.mResourceId)) {
                jAvailable = inputStreamOpenRawResource.available();
            } catch (IOException unused) {
            }
            return jAvailable;
        }
    }

    MultipartForm() {
    }

    String getBoundary() {
        return this.mBoundary;
    }

    void addTextField(String str, String str2) {
        this.mWriters.add(new FormTextFieldWriter(str, str2, true));
    }

    void addTextField(String str, int i) {
        this.mWriters.add(new FormTextFieldWriter(str, String.valueOf(i), false));
    }

    void addFileAsResource(String str, @RawRes int i, boolean z) {
        this.mWriters.add(new FileResourceWriter(i, str, z));
    }

    void addFile(String str, File file, boolean z, boolean z2) {
        this.mWriters.add(new FileWriter(file, str, z, z2));
    }

    void addFile(String str, File file, boolean z) {
        this.mWriters.add(new FileWriter(file, str, false, z));
    }

    void onWrite(Context context, DataOutputStream dataOutputStream, NetworkRequest networkRequest) throws Exception {
        long size = size(context);
        long jOnWrite = 0;
        for (FormWriter formWriter : this.mWriters) {
            dataOutputStream.writeBytes(TWO_HYPHENS + this.mBoundary + "\r\n");
            jOnWrite = formWriter.onWrite(context, dataOutputStream, networkRequest, size, jOnWrite);
        }
        networkRequest.reportNetworkProgress(size, jOnWrite);
        dataOutputStream.writeBytes(TWO_HYPHENS + this.mBoundary + TWO_HYPHENS);
    }

    private long size(Context context) {
        Iterator<FormWriter> it = this.mWriters.iterator();
        long size = 0;
        while (it.hasNext()) {
            size += it.next().size(context);
        }
        return size;
    }

    private static String getMultipartBoundary() {
        return BOUNDARY + System.currentTimeMillis() + BOUNDARY;
    }
}
