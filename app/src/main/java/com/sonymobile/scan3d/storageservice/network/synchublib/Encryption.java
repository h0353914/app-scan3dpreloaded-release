package com.sonymobile.scan3d.storageservice.network.synchublib;

import androidx.annotation.Nullable;
import com.amazonaws.services.s3.internal.crypto.JceEncryptionConstants;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes.dex */
public class Encryption {
    private static final String ENCRYPTION_ALGORITHM = "AES/CBC/PKCS5Padding";
    private static final int IV_LENGTH = 16;
    private static SecureRandom sRand;

    public static CipherOutputStream cipherOutputStream(OutputStream outputStream, byte[] bArr) throws GeneralSecurityException, IOException, InvalidEncryptionKeyException {
        byte[] bArr2 = new byte[16];
        if (sRand == null) {
            sRand = new SecureRandom();
        }
        sRand.nextBytes(bArr2);
        outputStream.write(bArr2);
        outputStream.flush();
        return new CipherOutputStream(outputStream, initCipher(1, bArr, bArr2));
    }

    @Nullable
    public static CipherInputStream cipherInputStream(InputStream inputStream, byte[] bArr) throws GeneralSecurityException, IOException, InvalidEncryptionKeyException {
        byte[] bArr2 = new byte[16];
        if (inputStream.read(bArr2) != 16) {
            return null;
        }
        return new CipherInputStream(inputStream, initCipher(2, bArr, bArr2));
    }

    private static Cipher initCipher(int i, byte[] bArr, byte[] bArr2) throws GeneralSecurityException, IOException, InvalidEncryptionKeyException {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        try {
            cipher.init(i, new SecretKeySpec(bArr, JceEncryptionConstants.SYMMETRIC_KEY_ALGORITHM), new IvParameterSpec(bArr2));
            return cipher;
        } catch (IllegalArgumentException e) {
            throw new InvalidEncryptionKeyException("Could not create SecretKeySpec: " + e.getMessage());
        }
    }
}
