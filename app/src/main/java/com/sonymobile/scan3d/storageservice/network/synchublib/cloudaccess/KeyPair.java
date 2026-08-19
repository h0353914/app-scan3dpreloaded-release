package com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess;

/* JADX INFO: loaded from: classes.dex */
public class KeyPair {
    private final String mEncryptionKey;
    private final String mSigningKey;

    public KeyPair(String str, String str2) {
        this.mEncryptionKey = str;
        this.mSigningKey = str2;
    }

    public String getEncryptionKey() {
        return this.mEncryptionKey;
    }

    public String getSigningKey() {
        return this.mSigningKey;
    }
}
