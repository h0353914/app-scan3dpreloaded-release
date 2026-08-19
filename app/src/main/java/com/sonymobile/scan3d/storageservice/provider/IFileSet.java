package com.sonymobile.scan3d.storageservice.provider;

import android.content.Context;
import android.net.Uri;

public interface IFileSet extends ITransientFileSet {
    long getId();

    int getTransferFlags();

    int getTransferId();

    Uri getUri();

    boolean isImprovable(Context context);
}
