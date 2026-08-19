package com.sonymobile.scan3d.storageservice.authentication;

import android.util.Base64;
import java.util.Objects;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public class KeyPair {
    private static final String ENCRYPTION_KEY = "encryption_key";
    private static final String SIGNATURE_SECRET = "signature_secret";
    private final String mEncryptionKey;
    private final String mSignatureSecretKey;

    public KeyPair(String str, String str2) {
        this.mEncryptionKey = str;
        this.mSignatureSecretKey = str2;
    }

    public String getEncryptionKey() {
        return this.mEncryptionKey;
    }

    public byte[] getEncryptionKeyDecoded() {
        return Base64.decode(this.mEncryptionKey, 8);
    }

    public String getSignatureKey() {
        return this.mSignatureSecretKey;
    }

    public byte[] getSignatureKeyDecoded() {
        return Base64.decode(this.mSignatureSecretKey, 8);
    }

    JSONObject toJson() {
        try {
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(ENCRYPTION_KEY, this.mEncryptionKey);
            jSONObject.put(SIGNATURE_SECRET, this.mSignatureSecretKey);
            return jSONObject;
        } catch (JSONException unused) {
            throw new RuntimeException("Could not create json object.");
        }
    }

    public int hashCode() {
        return Objects.hash(this.mEncryptionKey, this.mSignatureSecretKey);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof KeyPair)) {
            return false;
        }
        KeyPair keyPair = (KeyPair) obj;
        return Objects.equals(this.mEncryptionKey, keyPair.mEncryptionKey) && Objects.equals(this.mSignatureSecretKey, keyPair.mSignatureSecretKey);
    }

    static KeyPair newKeyPair() {
        return new KeyPair(CryptoFactory.generateRandomKey(), CryptoFactory.generateRandomKey());
    }

    static KeyPair from(JSONObject jSONObject) {
        try {
            return new KeyPair(jSONObject.getString(ENCRYPTION_KEY), jSONObject.getString(SIGNATURE_SECRET));
        } catch (JSONException unused) {
            throw new RuntimeException("Could not construct the json object");
        }
    }
}
