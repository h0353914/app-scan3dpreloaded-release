package com.sonymobile.scan3d.storageservice.provider;

import android.content.ContentValues;
import android.content.Context;
import android.os.Parcelable;

import java.io.File;
import java.util.Date;
import java.util.List;

public interface ITransientFileSet extends Parcelable {
    boolean deleteAllFiles(Context context);

    Date getCreated();

    List<File> getFiles();

    String getIdentifier();

    String getLogUrl();

    String getName();

    String getPreviewUrl();

    String getPropFileUrl();

    String getRiggedFileUrl();

    String getRiggedPreviewUrl();

    int getScanType();

    String getShareHash();

    int getSharedMeshes();

    int getSyncState();

    String getZipFileUrl();

    boolean isDownloadable();

    boolean isImprovement();

    boolean isRemote();

    boolean isRiggable();

    boolean isRigged();

    boolean isSynced();

    boolean isValid();

    boolean isVisible();

    ContentValues toContentValues();
}
