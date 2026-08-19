package com.sonymobile.scan3d.storageservice.network.model;

import java.io.File;
import org.apache.http.HttpEntity;

/* JADX INFO: loaded from: classes.dex */
public class S3UploadData {
    private HttpEntity mEntity;
    private File mFile;
    private boolean mIsEncrypted;
    private String mShareHash;
    private String mUrl;

    public S3UploadData(String str, HttpEntity httpEntity, File file, boolean z, String str2) {
        this.mUrl = str;
        this.mEntity = httpEntity;
        this.mFile = file;
        this.mIsEncrypted = z;
        this.mShareHash = str2;
    }

    public boolean isEncrypted() {
        return this.mIsEncrypted;
    }

    public File getFile() {
        return this.mFile;
    }

    public HttpEntity getBody() {
        return this.mEntity;
    }

    public String getUrl() {
        return this.mUrl;
    }

    public String getShareHash() {
        return this.mShareHash;
    }
}
