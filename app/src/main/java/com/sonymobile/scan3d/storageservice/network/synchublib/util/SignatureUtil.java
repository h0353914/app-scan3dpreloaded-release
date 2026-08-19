package com.sonymobile.scan3d.storageservice.network.synchublib.util;

import android.util.Base64;
import com.sonymobile.scan3d.logging.DebugLog;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

/* JADX INFO: loaded from: classes.dex */
public class SignatureUtil {
    public static final String CONTENT_EMPTY = "empty";
    private static final String HMAC_TYPE = "HmacSHA256";

    public static String getSignature(String str, byte[] bArr) {
        try (FileInputStream fileInputStream = new FileInputStream(new File(str))) {
            byte[] bArr2 = new byte[8192];
            Mac signingMac = getSigningMac(bArr);
            while (true) {
                int i = fileInputStream.read(bArr2);
                if (i == -1) {
                    return performSigning(signingMac, 0);
                }
                signingMac.update(bArr2, 0, i);
            }
        } catch (IOException e) {
            DebugLog.e(SignatureUtil.class.getSimpleName(), e.getMessage());
            return null;
        }
    }

    private static Mac getSigningMac(byte[] bArr) {
        Mac mac = null;
        try {
            mac = Mac.getInstance(HMAC_TYPE);
            mac.init(new SecretKeySpec(bArr, HMAC_TYPE));
            return mac;
        } catch (InvalidKeyException | NoSuchAlgorithmException unused) {
            return mac;
        }
    }

    private static String performSigning(Mac mac, int i) {
        return Base64.encodeToString(mac.doFinal(), i);
    }

    private static byte[] appendPasswordToKey(byte[] bArr, byte[] bArr2) {
        byte[] bArr3 = new byte[bArr.length + bArr2.length];
        System.arraycopy(bArr, 0, bArr3, 0, bArr.length);
        System.arraycopy(bArr2, 0, bArr3, bArr.length, bArr2.length);
        return bArr3;
    }
}
