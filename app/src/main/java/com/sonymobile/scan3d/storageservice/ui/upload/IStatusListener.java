package com.sonymobile.scan3d.storageservice.ui.upload;

/* JADX INFO: loaded from: classes.dex */
public interface IStatusListener<T> {
    void onCancel(int i);

    void onDismiss(int i);

    void onFailure(int i, int i2);

    void onSuccess(int i, T t);
}
