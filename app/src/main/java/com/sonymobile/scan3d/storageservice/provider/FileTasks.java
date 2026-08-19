package com.sonymobile.scan3d.storageservice.provider;

import android.content.ComponentName;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.Handler;

import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;

public final class FileTasks {
    private FileTasks() {
    }

    public static void checkEncryption(Context context) {
        FileRecordService.checkEncryption(context);
    }

    public static void checkIntegrity(Context context) {
        FileRecordService.checkIntegrity(context);
    }

    public static void delete(Context context, Uri uri) {
        FileRecordService.delete(context, uri);
    }

    public static void deleteAnimation(Context context, Uri uri) {
        FileRecordService.deleteAnimation(context, uri);
    }

    public static void deleteFileSet(Context context, Uri uri, boolean notify) {
        if (AccountUtils.isSignedIn(context)) {
            ContentValues values = new ContentValues();
            values.put(Contract.FileRecord.COLUMN_SYNC_STATE, Integer.valueOf(Contract.FileRecord.DELETED_FILE));
            update(context, uri, values, notify);
        } else {
            FileRecordService.deleteFileSet(context, uri, false);
        }
    }

    public static void deleteImprovement(Context context, Improvement improvement) {
        deleteFileSet(context, improvement.getFileSetUri(), true);
        delete(context, improvement.getUri());
    }

    public static void insertExampleScans(Context context) {
        FileRecordService.insertExampleScans(context);
    }

    public static void scheduleShareFileDeletion(Context context) {
        FileRecordService.scheduleShareFileDeletion(context);
    }

    public static void shareGltfMesh(Context context, IFileSet fileSet, ComponentName componentName, int flags, Handler handler) {
        FileRecordService.shareGlbMesh(context, fileSet.getUri(), componentName, flags, handler);
    }

    public static void shareGltfObject(Context context, IFileSet fileSet, String mimeType, ComponentName componentName, int flags) {
        FileRecordService.shareGlb(context, fileSet.getUri(), mimeType, componentName, flags);
    }

    public static void shareMesh(Context context, IFileSet fileSet, ComponentName componentName) {
        shareMesh(context, fileSet, componentName, true);
    }

    public static void shareMesh(Context context, IFileSet fileSet, ComponentName componentName, boolean notify) {
        FileRecordService.shareMesh(context, fileSet.getUri(), componentName, notify);
    }

    public static void storeFile(Context context, Uri uri, ContentValues values) {
        FileRecordService.storeFile(context, uri, values);
    }

    public static void update(Context context, Uri uri, ContentValues values, boolean notify) {
        FileRecordService.update(context, uri, values, notify);
    }

    public static void updateName(Context context, Uri uri, String name, boolean notify) {
        ContentValues values = new ContentValues(1);
        values.put(Contract.FileRecord.COLUMN_NAME, name);
        FileRecordService.updateMetaData(context, uri, values, notify);
    }
}
