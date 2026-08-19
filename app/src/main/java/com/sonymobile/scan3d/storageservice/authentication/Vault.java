package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Context;
import android.content.SharedPreferences;
import androidx.annotation.NonNull;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import com.sonymobile.scan3d.storageservice.network.synchublib.Encryption;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.SignatureUtil;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.SphinxZipCopy;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.ReadableByteChannel;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import javax.crypto.CipherOutputStream;

/* JADX INFO: loaded from: classes.dex */
public final class Vault {
    private static final String DIGEST_SHA1 = "sha1";
    static final String FILE_NAME_ENCRYPTION_KEY = "encryption_keys_v1.json";
    private static final String KEY_PASSWORD_SECRET = "password";
    private static final String PASSWORD_PREFERENCE_FILE = "password_preferences";
    private static final String PREVIEW_FILE_JPEG = "preview.jpeg";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.authentication.Vault";

    public static class ExtractionResult {
        private final String mIdentifier;
        private final String mPreviewPath;

        ExtractionResult(String str, File file) {
            this.mIdentifier = str;
            this.mPreviewPath = (file == null || !file.exists()) ? null : file.getPath();
        }

        public boolean success() {
            return (this.mIdentifier == null || this.mPreviewPath == null) ? false : true;
        }

        public String getIdentifier() {
            return this.mIdentifier;
        }

        public String getPreviewPath() {
            return this.mPreviewPath;
        }
    }

    private static class ByteBufferInputStream extends InputStream {
        private ByteBuffer mBuffer;

        ByteBufferInputStream(ByteBuffer byteBuffer) {
            this.mBuffer = byteBuffer;
            this.mBuffer.clear();
        }

        @Override // java.io.InputStream
        public int read() {
            if (this.mBuffer.hasRemaining()) {
                return this.mBuffer.get() & 255;
            }
            return -1;
        }

        @Override // java.io.InputStream
        public int read(@NonNull byte[] bArr, int i, int i2) {
            if (!this.mBuffer.hasRemaining()) {
                return -1;
            }
            int iMin = Math.min(i2, this.mBuffer.remaining());
            this.mBuffer.get(bArr, i, iMin);
            return iMin;
        }

        @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
        public void close() {
            this.mBuffer.clear();
            this.mBuffer = null;
        }
    }

    private Vault() {
    }

    public static String getPassword(Context context) {
        return getPassword(context, Config.encrypt(context), KEY_PASSWORD_SECRET);
    }

    public static ExtractionResult extract(Context context, File file) throws IOException {
        ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file));
        try {
            byte[] byteArray = null;
            for (ZipEntry nextEntry = zipInputStream.getNextEntry(); nextEntry != null && byteArray == null; nextEntry = zipInputStream.getNextEntry()) {
                String name = nextEntry.getName();
                DebugLog.d(TAG, "Found in zip file: " + name);
                if (PREVIEW_FILE_JPEG.equalsIgnoreCase(name)) {
                    byteArray = StreamUtils.toByteArray(zipInputStream);
                }
            }
            zipInputStream.close();
            if (byteArray != null) {
                String sha1UniqueIdentifier = getSha1UniqueIdentifier();
                File file2 = new File(FsUtils.getResultsDirectory(context, sha1UniqueIdentifier), PREVIEW_FILE_JPEG);
                ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(byteArray);
                try {
                    StreamUtils.saveToDisc(file2, byteArrayInputStream);
                    ExtractionResult extractionResult = new ExtractionResult(sha1UniqueIdentifier, file2);
                    byteArrayInputStream.close();
                    return extractionResult;
                } catch (Throwable th2) {
                    try {
                        byteArrayInputStream.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
            DebugLog.d(TAG, "Preview file is missing");
            return null;
        } catch (Throwable th4) {
            try {
                zipInputStream.close();
            } catch (Throwable th5) {
                th4.addSuppressed(th5);
            }
            throw th4;
        }
    }

    public static String getSha1UniqueIdentifier() {
        return toHexString(getDigest(UUID.randomUUID().toString().getBytes(StandardCharsets.UTF_8)));
    }

    public static void saveToDiskEncrypted(Context context, InputStream inputStream, File file) throws IOException {
        saveToDiskEncrypted(inputStream, file, getPassword(context));
    }

    public static String encryptWithServerKey(String str, String str2) throws GeneralSecurityException {
        return CryptoFactory.getServerKeyCrypto(str).encrypt(str2);
    }

    public static void encryptForCloud(Context context, File file, File file2, byte[] bArr) throws GeneralSecurityException, IOException {
        encryptForCloud(file, file2, bArr, getPassword(context));
    }

    public static void decrypt(Context context, File file, File file2) throws IOException {
        SphinxZipCopy sphinxZipCopy = new SphinxZipCopy();
        try {
            sphinxZipCopy.setInputFile(file.getPath(), getPassword(context));
            sphinxZipCopy.setOutputFile(file2.getPath(), null);
            if (!sphinxZipCopy.run()) {
                throw new IOException("Could not copy decrypted file to buffer.");
            }
            sphinxZipCopy.release();
        } catch (Throwable th) {
            sphinxZipCopy.release();
            throw th;
        }
    }

    public static byte[] decrypt(Context context, File file) throws IOException {
        return decrypt(file, getPassword(context));
    }

    public static InputStream decryptAsStream(Context context, File file) throws IOException {
        return new ByteArrayInputStream(decrypt(context, file));
    }

    public static String getChecksum(File file) {
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            MessageDigest messageDigest = MessageDigest.getInstance(DIGEST_SHA1);
            byte[] bArr = new byte[1024];
            while (true) {
                int i = fileInputStream.read(bArr);
                if (i == -1) {
                    break;
                }
                messageDigest.update(bArr, 0, i);
            }
            String hexString = toHexString(messageDigest.digest());
            if (hexString != null) {
                return hexString.trim();
            }
            return null;
        } catch (NoSuchAlgorithmException | IOException unused) {
            return null;
        }
    }

    public static String getSignature(File file, byte[] bArr) {
        String signature = file != null ? SignatureUtil.getSignature(file.getPath(), bArr) : null;
        if (signature != null) {
            return signature.trim();
        }
        return null;
    }

    static void saveToDiskEncrypted(InputStream inputStream, File file, String str) throws IOException {
        SphinxZipCopy sphinxZipCopy = new SphinxZipCopy();
        try {
            sphinxZipCopy.setInputBuffer(createBuffer(inputStream), null);
            sphinxZipCopy.setOutputFile(file.getPath(), str);
            if (!sphinxZipCopy.run()) {
                throw new IOException("Could not save buffer to file.");
            }
            sphinxZipCopy.release();
        } catch (Throwable th) {
            sphinxZipCopy.release();
            throw th;
        }
    }

    static void encryptForCloud(File file, File file2, byte[] bArr, String str) throws GeneralSecurityException, IOException {
        SphinxZipCopy sphinxZipCopy = new SphinxZipCopy();
        try {
            sphinxZipCopy.setInputFile(file.getPath(), str);
            sphinxZipCopy.setOutputBuffer(null);
            try (FileOutputStream fileOutputStream = new FileOutputStream(file2);
                 CipherOutputStream cipherOutputStream = Encryption.cipherOutputStream(fileOutputStream, bArr);
                 InputStream inputStreamStream = sphinxZipCopy.stream()) {
                StreamUtils.copy(inputStreamStream, cipherOutputStream);
            }
        } finally {
            sphinxZipCopy.release();
        }
    }

    static byte[] decrypt(File file, String str) throws IOException {
        SphinxZipCopy sphinxZipCopy = new SphinxZipCopy();
        try {
            sphinxZipCopy.setInputFile(file.getPath(), str);
            sphinxZipCopy.setOutputBuffer(null);
            if (sphinxZipCopy.run()) {
                ByteBufferInputStream byteBufferInputStream = new ByteBufferInputStream(sphinxZipCopy.getOutputBuffer());
                try {
                    byte[] byteArray = StreamUtils.toByteArray(byteBufferInputStream);
                    byteBufferInputStream.close();
                    sphinxZipCopy.release();
                    return byteArray;
                } catch (Throwable th2) {
                    try {
                        byteBufferInputStream.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
            throw new IOException("Could not copy decrypted file to buffer.");
        } catch (Throwable th4) {
            sphinxZipCopy.release();
            throw th4;
        }
    }

    static void writeKey(OutputStream outputStream) throws IOException {
        try (InputStream inputStreamGenerateKeyFile = generateKeyFile(KeyPair.newKeyPair())) {
            StreamUtils.copy(inputStreamGenerateKeyFile, outputStream);
        }
    }

    static InputStream generateKeyFile(KeyPair keyPair) {
        return new ByteArrayInputStream(keyPair.toJson().toString().getBytes(StandardCharsets.UTF_8));
    }

    private static String toHexString(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            sb.append(Integer.toString((b & 255) + 256, 16).substring(1));
        }
        return sb.toString();
    }

    private static byte[] getDigest(byte[] bArr) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(DIGEST_SHA1);
            messageDigest.update(bArr);
            return messageDigest.digest();
        } catch (NoSuchAlgorithmException unused) {
            return null;
        }
    }

    private static ByteBuffer createBuffer(InputStream inputStream) throws IOException {
        InputStream inputStreamCopy = StreamUtils.copy(inputStream);
        try (ReadableByteChannel readableByteChannelNewChannel = Channels.newChannel(inputStreamCopy)) {
            ByteBuffer byteBufferAllocateDirect = ByteBuffer.allocateDirect(inputStreamCopy.available());
            do {
            } while (readableByteChannelNewChannel.read(byteBufferAllocateDirect) > 0);
            return byteBufferAllocateDirect;
        }
    }

    static synchronized String getPassword(Context context, boolean z, String str) {
        String strDecrypt;
        strDecrypt = null;
        if (z) {
            try {
                Crypto passwordCrypto = CryptoFactory.getPasswordCrypto();
                SharedPreferences sharedPreferences = context.getSharedPreferences(PASSWORD_PREFERENCE_FILE, 0);
                String string = sharedPreferences.getString(str, null);
                if (string == null) {
                    string = passwordCrypto.encrypt(CryptoFactory.generateRandomKey());
                    SharedPreferences.Editor editorEdit = sharedPreferences.edit();
                    editorEdit.putString(str, string);
                    editorEdit.apply();
                }
                strDecrypt = passwordCrypto.decrypt(string);
            } catch (IOException | GeneralSecurityException unused) {
                throw new RuntimeException("Could not decrypt the key.");
            }
        }
        return strDecrypt;
    }
}
