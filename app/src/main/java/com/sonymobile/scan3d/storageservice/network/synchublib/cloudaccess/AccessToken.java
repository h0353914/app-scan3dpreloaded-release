package com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess;

import java.util.Objects;

/* JADX INFO: loaded from: classes.dex */
public class AccessToken {
    private long mExpirationTime;
    private String mRefreshToken;
    private String mTokenData;

    public AccessToken(String str, String str2, long j) {
        this.mTokenData = str;
        this.mRefreshToken = str2;
        this.mExpirationTime = j;
    }

    public String getTokenData() {
        return this.mTokenData;
    }

    public long getExpirationTime() {
        return this.mExpirationTime;
    }

    public String getRefreshToken() {
        return this.mRefreshToken;
    }

    public boolean isValid() {
        return System.currentTimeMillis() < this.mExpirationTime;
    }

    public boolean equals(Object obj) {
        String str;
        if (!(obj instanceof AccessToken) || (str = this.mTokenData) == null) {
            return false;
        }
        return str.equals(((AccessToken) obj).getTokenData());
    }

    public int hashCode() {
        return Objects.hashCode(this.mTokenData);
    }
}
