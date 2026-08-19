package com.sonymobile.scan3d.storageservice;

public interface Cancellable {
    void cancel();

    boolean isCancelled();
}
