package com.sonymobile.scan3d.storageservice.network;

/* JADX INFO: loaded from: classes.dex */
public class TransferProgress {
    private long mBytesTransferred;
    private long mTotalBytes;

    boolean update(long j, long j2) {
        int percent = getPercent();
        this.mTotalBytes = j;
        this.mBytesTransferred = j2;
        return percent != getPercent();
    }

    public long getTotalBytes() {
        return this.mTotalBytes;
    }

    public long getBytesTransferred() {
        return this.mBytesTransferred;
    }

    public int getPercent() {
        long j = this.mTotalBytes;
        if (j > 0) {
            return (int) ((this.mBytesTransferred * 100) / j);
        }
        return 0;
    }
}
