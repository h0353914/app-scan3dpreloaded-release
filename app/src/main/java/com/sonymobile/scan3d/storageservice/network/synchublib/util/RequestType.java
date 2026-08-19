package com.sonymobile.scan3d.storageservice.network.synchublib.util;

/* JADX INFO: loaded from: classes.dex */
public enum RequestType {
    REQUEST_POST_CONTENT(1),
    REQUEST_GET_CONTENT(2),
    REQUEST_DELETE_CONTENT(3),
    REQUEST_HEAD_CONTENT(4),
    REQUEST_POST_FILE(5),
    REQUEST_GET_FILE(6),
    REQUEST_GET_CONTENT_LIST(7),
    REQUEST_POST_PUBLIC_CONTENT(8),
    REQUEST_PUT_UPDATE_CONTENT(9),
    REQUEST_DELETE_PUBLIC_CONTENT(10);

    private final int mId;

    RequestType(int i) {
        this.mId = i;
    }

    public int getId() {
        return this.mId;
    }
}
