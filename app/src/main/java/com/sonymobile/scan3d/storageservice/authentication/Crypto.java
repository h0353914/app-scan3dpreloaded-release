package com.sonymobile.scan3d.storageservice.authentication;

import java.security.GeneralSecurityException;

/* JADX INFO: loaded from: classes.dex */
interface Crypto {
    String decrypt(String str) throws GeneralSecurityException;

    String encrypt(String str) throws GeneralSecurityException;
}
