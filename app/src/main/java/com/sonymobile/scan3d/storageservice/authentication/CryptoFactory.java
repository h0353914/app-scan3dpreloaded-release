package com.sonymobile.scan3d.storageservice.authentication;

import android.security.keystore.KeyGenParameterSpec;
import android.util.Base64;
import com.amazonaws.services.s3.internal.crypto.JceEncryptionConstants;
import com.google.android.gms.stats.CodePackage;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.GeneralSecurityException;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes.dex */
class CryptoFactory {
    private static final int ENCRYPTION_BITS = 256;
    private static final String RANDOM_GENERATOR_ALGORITHM = "SHA1PRNG";

    CryptoFactory() {
    }

    private static class PasswordCrypto implements Crypto {
        private static final String ANDROID_KEY_STORE = "AndroidKeyStore";
        private static final byte[] IV = {-126, 40, -103, -97, 52, 9, 43, 10, -75, -29, -123, 33};
        private static final String KEY_ALIAS = "key_alias";
        private static final String TRANSFORMATION = "AES/GCM/NoPadding";
        private final KeyStore mKeystore;

        private PasswordCrypto() throws GeneralSecurityException, IOException {
            this.mKeystore = KeyStore.getInstance(ANDROID_KEY_STORE);
            this.mKeystore.load(null);
            if (this.mKeystore.containsAlias(KEY_ALIAS)) {
                return;
            }
            generateSecretKey();
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.Crypto
        public String encrypt(String str) throws GeneralSecurityException {
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(1, getSecretKey(), new GCMParameterSpec(128, IV));
            return Base64.encodeToString(cipher.doFinal(str.getBytes(StandardCharsets.UTF_8)), 0);
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.Crypto
        public String decrypt(String str) throws GeneralSecurityException {
            byte[] bArrDecode = Base64.decode(str.getBytes(StandardCharsets.UTF_8), 0);
            Cipher cipher = Cipher.getInstance(TRANSFORMATION);
            cipher.init(2, getSecretKey(), new GCMParameterSpec(128, IV));
            return new String(cipher.doFinal(bArrDecode), StandardCharsets.UTF_8);
        }

        private static void generateSecretKey() throws GeneralSecurityException {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(JceEncryptionConstants.SYMMETRIC_KEY_ALGORITHM, ANDROID_KEY_STORE);
            keyGenerator.init(new KeyGenParameterSpec.Builder(KEY_ALIAS, 3).setBlockModes(CodePackage.GCM).setEncryptionPaddings("NoPadding").setRandomizedEncryptionRequired(false).build());
            keyGenerator.generateKey();
        }

        private SecretKey getSecretKey() throws GeneralSecurityException {
            return (SecretKey) this.mKeystore.getKey(KEY_ALIAS, null);
        }
    }

    private static class ServerKeyCrypto implements Crypto {
        private static final int IV_SIZE = 16;
        private byte[] mAesKey;

        private ServerKeyCrypto(String str) {
            this.mAesKey = Base64.decode(str.getBytes(StandardCharsets.UTF_8), 8);
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.Crypto
        public String encrypt(String str) throws GeneralSecurityException {
            byte[] bArr = new byte[16];
            new SecureRandom().nextBytes(bArr);
            Cipher cipher = Cipher.getInstance(JceEncryptionConstants.SYMMETRIC_CIPHER_METHOD);
            cipher.init(1, new SecretKeySpec(this.mAesKey, JceEncryptionConstants.SYMMETRIC_KEY_ALGORITHM), new IvParameterSpec(bArr));
            return Base64.encodeToString(concatenate(bArr, cipher.doFinal(str.getBytes(StandardCharsets.UTF_8))), 10).trim();
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.Crypto
        public String decrypt(String str) throws GeneralSecurityException {
            byte[] bArrDecode = Base64.decode(str, 10);
            byte[] iv = getIv(bArrDecode);
            byte[] encoding = getEncoding(bArrDecode);
            SecretKeySpec secretKeySpec = new SecretKeySpec(this.mAesKey, JceEncryptionConstants.SYMMETRIC_KEY_ALGORITHM);
            Cipher cipher = Cipher.getInstance(JceEncryptionConstants.SYMMETRIC_CIPHER_METHOD);
            cipher.init(2, secretKeySpec, new IvParameterSpec(iv));
            return new String(cipher.doFinal(encoding), StandardCharsets.UTF_8);
        }

        private static byte[] concatenate(byte[] bArr, byte[] bArr2) {
            byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length + bArr2.length);
            System.arraycopy(bArr2, 0, bArrCopyOf, bArr.length, bArr2.length);
            return bArrCopyOf;
        }

        private static byte[] getIv(byte[] bArr) {
            byte[] bArr2 = new byte[16];
            System.arraycopy(bArr, 0, bArr2, 0, 16);
            return bArr2;
        }

        private static byte[] getEncoding(byte[] bArr) {
            byte[] bArr2 = new byte[bArr.length - 16];
            System.arraycopy(bArr, 16, bArr2, 0, bArr2.length);
            return bArr2;
        }
    }

    static Crypto getPasswordCrypto() throws GeneralSecurityException, IOException {
        return new PasswordCrypto();
    }

    static Crypto getServerKeyCrypto(String str) {
        return new ServerKeyCrypto(str);
    }

    static String generateRandomKey() {
        return Base64.encodeToString(newSecretKey().getEncoded(), 8);
    }

    private static SecretKey newSecretKey() {
        try {
            KeyGenerator keyGenerator = KeyGenerator.getInstance(JceEncryptionConstants.SYMMETRIC_KEY_ALGORITHM);
            keyGenerator.init(256, SecureRandom.getInstance(RANDOM_GENERATOR_ALGORITHM));
            return keyGenerator.generateKey();
        } catch (NoSuchAlgorithmException unused) {
            return null;
        }
    }
}
