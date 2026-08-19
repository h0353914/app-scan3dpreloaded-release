package com.sonymobile.scan3d.storageservice.content.aws;

import com.amazonaws.mobileconnectors.s3.transferutility.TransferObserver;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferState;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferUtility;
import com.sonymobile.scan3d.storageservice.Cancellable;

/* JADX INFO: loaded from: classes.dex */
public final class TransferControl {
    private static final long REFRESH_SAMPLE_DELAY = 300;
    private final TransferObserver mObserver;
    private final TransferUtility mUtility;

    TransferControl(TransferUtility transferUtility, TransferObserver transferObserver) {
        this.mUtility = transferUtility;
        this.mObserver = transferObserver;
    }

    public boolean monitor(Cancellable cancellable) {
        long j = 0;
        while (!cancellable.isCancelled() && isRunning()) {
            long jCurrentTimeMillis = System.currentTimeMillis();
            if (jCurrentTimeMillis - j > REFRESH_SAMPLE_DELAY) {
                this.mObserver.refresh();
                j = jCurrentTimeMillis;
            }
        }
        this.mObserver.refresh();
        return TransferState.COMPLETED.equals(this.mObserver.getState());
    }

    public boolean cancel() {
        int id = this.mObserver.getId();
        this.mObserver.cleanTransferListener();
        return this.mUtility.cancel(id);
    }

    public int pause() {
        int id = this.mObserver.getId();
        this.mObserver.cleanTransferListener();
        this.mUtility.pause(id);
        return id;
    }

    public boolean isRunning() {
        switch (this.mObserver.getState()) {
            case COMPLETED:
            case FAILED:
            case CANCELED:
                return false;
            default:
                return true;
        }
    }
}
