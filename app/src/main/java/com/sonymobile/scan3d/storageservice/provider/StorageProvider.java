package com.sonymobile.scan3d.storageservice.provider;

import android.content.ContentProvider;
import android.content.ContentUris;
import android.content.ContentValues;
import android.content.Context;
import android.content.UriMatcher;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteQueryBuilder;
import android.net.Uri;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.sonymobile.scan3d.logging.DebugLog;
import java.util.HashMap;

/* JADX INFO: loaded from: classes.dex */
public class StorageProvider extends ContentProvider {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.provider.StorageProvider";
    private static HashMap<String, String> sFileProjection = new HashMap<>(21);
    private static HashMap<String, String> sImprovementProjection;
    private static UriMatcher sMatcher;
    private static HashMap<String, String> sUploadProjection;
    private SQLiteOpenHelper mDbHelper;

    static {
        sFileProjection.put("_id", "_id");
        sFileProjection.put("created", "created");
        sFileProjection.put(Contract.FileRecord.COLUMN_ETAG, Contract.FileRecord.COLUMN_ETAG);
        sFileProjection.put("name", "name");
        sFileProjection.put("url", "url");
        sFileProjection.put(Contract.FileRecord.COLUMN_THUMBNAIL_URL, Contract.FileRecord.COLUMN_THUMBNAIL_URL);
        sFileProjection.put(Contract.FileRecord.COLUMN_IDENTIFIER, Contract.FileRecord.COLUMN_IDENTIFIER);
        sFileProjection.put(Contract.FileRecord.COLUMN_SYNC_STATE, Contract.FileRecord.COLUMN_SYNC_STATE);
        sFileProjection.put(Contract.FileRecord.COLUMN_LOG_URL, Contract.FileRecord.COLUMN_LOG_URL);
        sFileProjection.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Contract.FileRecord.COLUMN_TRANSFER_FLAGS);
        sFileProjection.put("scan_type", "scan_type");
        sFileProjection.put(Contract.FileRecord.COLUMN_DOWNLOADABLE, Contract.FileRecord.COLUMN_DOWNLOADABLE);
        sFileProjection.put(Contract.FileRecord.COLUMN_VISIBLE, Contract.FileRecord.COLUMN_VISIBLE);
        sFileProjection.put(Contract.FileRecord.COLUMN_SHARE_HASH, Contract.FileRecord.COLUMN_SHARE_HASH);
        sFileProjection.put(Contract.FileRecord.COLUMN_LOG_TRANSFER_ID, Contract.FileRecord.COLUMN_LOG_TRANSFER_ID);
        sFileProjection.put(Contract.FileRecord.COLUMN_IMPROVEMENT, Contract.FileRecord.COLUMN_IMPROVEMENT);
        sFileProjection.put(Contract.FileRecord.COLUMN_RIGGED_SCAN_URL, Contract.FileRecord.COLUMN_RIGGED_SCAN_URL);
        sFileProjection.put(Contract.FileRecord.COLUMN_IS_RIGGABLE, Contract.FileRecord.COLUMN_IS_RIGGABLE);
        sFileProjection.put(Contract.FileRecord.COLUMN_RIGGED_PREVIEW_URL, Contract.FileRecord.COLUMN_RIGGED_PREVIEW_URL);
        sFileProjection.put(Contract.FileRecord.COLUMN_PROP_MESH_URL, Contract.FileRecord.COLUMN_PROP_MESH_URL);
        sFileProjection.put(Contract.FileRecord.COLUMN_SHARED_MESHES, Contract.FileRecord.COLUMN_SHARED_MESHES);
        sUploadProjection = new HashMap<>(5);
        sUploadProjection.put("_id", "_id");
        sUploadProjection.put(Contract.UploadRecord.COLUMN_PROVIDER, Contract.UploadRecord.COLUMN_PROVIDER);
        sUploadProjection.put("state", "state");
        sUploadProjection.put(Contract.UploadRecord.COLUMN_UID, Contract.UploadRecord.COLUMN_UID);
        sUploadProjection.put("parent_id", "parent_id");
        sImprovementProjection = new HashMap<>(10);
        sImprovementProjection.put("_id", "_id");
        sImprovementProjection.put(Contract.ImprovementRecord.COLUMN_S3_KEY, Contract.ImprovementRecord.COLUMN_S3_KEY);
        sImprovementProjection.put("parent_id", "parent_id");
        sImprovementProjection.put("name", "name");
        sImprovementProjection.put(Contract.ImprovementRecord.COLUMN_FILE_SET_ID, Contract.ImprovementRecord.COLUMN_FILE_SET_ID);
        sImprovementProjection.put(Contract.ImprovementRecord.COLUMN_IMPROVEMENT_TYPE, Contract.ImprovementRecord.COLUMN_IMPROVEMENT_TYPE);
        sImprovementProjection.put(Contract.ImprovementRecord.COLUMN_SQS_MESSAGE_ID, Contract.ImprovementRecord.COLUMN_SQS_MESSAGE_ID);
        sImprovementProjection.put("scan_type", "scan_type");
        sImprovementProjection.put(Contract.ImprovementRecord.COLUMN_FAIL_STATE, Contract.ImprovementRecord.COLUMN_FAIL_STATE);
        sImprovementProjection.put("created", "created");
        sMatcher = new Matcher();
    }

    @Override // android.content.ContentProvider
    public boolean onCreate() {
        DebugLog.d(TAG, "onCreate():");
        this.mDbHelper = new DatabaseHelper(getContext());
        return true;
    }

    @Override // android.content.ContentProvider
    public void shutdown() {
        super.shutdown();
        DebugLog.d(TAG, "shutdown():");
        SQLiteOpenHelper sQLiteOpenHelper = this.mDbHelper;
        if (sQLiteOpenHelper != null) {
            sQLiteOpenHelper.close();
        }
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Cursor query(@NonNull Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        SQLiteQueryBuilder sQLiteQueryBuilder = new SQLiteQueryBuilder();
        switch (sMatcher.match(uri)) {
            case 0:
                sQLiteQueryBuilder.setTables("file");
                sQLiteQueryBuilder.setProjectionMap(sFileProjection);
                sQLiteQueryBuilder.appendWhere("_id=" + uri.getLastPathSegment());
                break;
            case 1:
                sQLiteQueryBuilder.setTables("file");
                sQLiteQueryBuilder.setProjectionMap(sFileProjection);
                break;
            case 2:
                sQLiteQueryBuilder.setTables("upload");
                sQLiteQueryBuilder.setProjectionMap(sUploadProjection);
                sQLiteQueryBuilder.appendWhere("_id=" + uri.getLastPathSegment());
                break;
            case 3:
                sQLiteQueryBuilder.setTables("upload");
                sQLiteQueryBuilder.setProjectionMap(sUploadProjection);
                break;
            case 4:
                sQLiteQueryBuilder.setTables("upload");
                sQLiteQueryBuilder.setProjectionMap(sUploadProjection);
                sQLiteQueryBuilder.appendWhere("_id=" + uri.getLastPathSegment() + " AND parent_id=" + uri.getPathSegments().get(2));
                break;
            case 5:
                sQLiteQueryBuilder.setTables("upload");
                sQLiteQueryBuilder.setProjectionMap(sUploadProjection);
                sQLiteQueryBuilder.appendWhere("parent_id=" + uri.getPathSegments().get(2));
                break;
            case 6:
                sQLiteQueryBuilder.setTables("upload");
                sQLiteQueryBuilder.setProjectionMap(sUploadProjection);
                sQLiteQueryBuilder.appendWhere("parent_id=" + uri.getPathSegments().get(2) + " AND " + Contract.UploadRecord.COLUMN_PROVIDER + "='" + uri.getLastPathSegment() + "'");
                break;
            case 7:
                sQLiteQueryBuilder.setTables("improvement");
                sQLiteQueryBuilder.setProjectionMap(sImprovementProjection);
                sQLiteQueryBuilder.appendWhere("_id=" + uri.getLastPathSegment());
                break;
            case 8:
                sQLiteQueryBuilder.setTables("improvement");
                sQLiteQueryBuilder.setProjectionMap(sImprovementProjection);
                break;
            default:
                return null;
        }
        Context context = getContext();
        Cursor cursorQuery = sQLiteQueryBuilder.query(this.mDbHelper.getReadableDatabase(), strArr, str, strArr2, null, null, str2);
        if (cursorQuery != null && context != null) {
            cursorQuery.setNotificationUri(context.getContentResolver(), uri);
        }
        return cursorQuery;
    }

    @Override // android.content.ContentProvider
    @Nullable
    public String getType(@NonNull Uri uri) {
        switch (sMatcher.match(uri)) {
            case 0:
                return Contract.FileRecord.MIME_ITEM;
            case 1:
                return Contract.FileRecord.MIME_DIR;
            case 2:
            case 4:
            case 6:
                return Contract.UploadRecord.MIME_ITEM;
            case 3:
            case 5:
                return Contract.UploadRecord.MIME_DIR;
            case 7:
                return Contract.ImprovementRecord.MIME_ITEM;
            case 8:
                return Contract.ImprovementRecord.MIME_DIR;
            default:
                return null;
        }
    }

    @Override // android.content.ContentProvider
    @Nullable
    public Uri insert(@NonNull Uri uri, ContentValues contentValues) {
        Uri uriInsert;
        SQLiteDatabase writableDatabase = this.mDbHelper.getWritableDatabase();
        int iMatch = sMatcher.match(uri);
        if (iMatch == 1) {
            uriInsert = insert(uri, writableDatabase, contentValues, "file");
        } else if (iMatch == 3) {
            uriInsert = insert(uri, writableDatabase, contentValues, "upload");
        } else if (iMatch == 5) {
            contentValues.put("parent_id", uri.getPathSegments().get(2));
            uriInsert = insert(uri, writableDatabase, contentValues, "upload");
        } else if (iMatch == 8) {
            uriInsert = insert(uri, writableDatabase, contentValues, "improvement");
        } else {
            throw new IllegalArgumentException("Unsupported uri " + uri);
        }
        Context context = getContext();
        if (uriInsert != null && context != null) {
            context.getContentResolver().notifyChange(uriInsert, null);
        }
        return uriInsert;
    }

    @Override // android.content.ContentProvider
    public int delete(@NonNull Uri uri, String str, String[] strArr) {
        int iDelete;
        SQLiteDatabase writableDatabase = this.mDbHelper.getWritableDatabase();
        switch (sMatcher.match(uri)) {
            case 0:
                iDelete = delete(writableDatabase, appendToSelection(str, "_id", uri.getLastPathSegment()), strArr, "file");
                break;
            case 1:
                iDelete = delete(writableDatabase, str, strArr, "file");
                break;
            case 2:
                iDelete = delete(writableDatabase, appendToSelection(str, "_id", uri.getLastPathSegment()), strArr, "upload");
                break;
            case 3:
                iDelete = delete(writableDatabase, str, strArr, "upload");
                break;
            case 4:
                iDelete = delete(writableDatabase, appendToSelection(appendToSelection(str, "parent_id", uri.getPathSegments().get(2)), "_id", uri.getLastPathSegment()), strArr, "upload");
                break;
            case 5:
                iDelete = delete(writableDatabase, appendToSelection(str, "parent_id", uri.getPathSegments().get(2)), strArr, "upload");
                break;
            case 6:
            default:
                throw new IllegalArgumentException("Unsupported uri " + uri);
            case 7:
                iDelete = delete(writableDatabase, appendToSelection(str, "_id", uri.getLastPathSegment()), strArr, "improvement");
                break;
            case 8:
                iDelete = delete(writableDatabase, str, strArr, "improvement");
                break;
        }
        Context context = getContext();
        if (iDelete > 0 && context != null) {
            context.getContentResolver().notifyChange(uri, null);
        }
        return iDelete;
    }

    @Override // android.content.ContentProvider
    public int update(@NonNull Uri uri, ContentValues contentValues, String str, String[] strArr) {
        int iUpdate;
        SQLiteDatabase writableDatabase = this.mDbHelper.getWritableDatabase();
        switch (sMatcher.match(uri)) {
            case 0:
                iUpdate = update(writableDatabase, contentValues, appendToSelection(str, "_id", uri.getLastPathSegment()), strArr, "file");
                break;
            case 1:
                iUpdate = update(writableDatabase, contentValues, str, strArr, "file");
                break;
            case 2:
                iUpdate = update(writableDatabase, contentValues, appendToSelection(str, "_id", uri.getLastPathSegment()), strArr, "upload");
                break;
            case 3:
            case 5:
            case 6:
            default:
                throw new IllegalArgumentException("Unsupported uri " + uri);
            case 4:
                iUpdate = update(writableDatabase, contentValues, appendToSelection(appendToSelection(str, "_id", uri.getLastPathSegment()), "parent_id", uri.getPathSegments().get(2)), strArr, "upload");
                break;
            case 7:
                iUpdate = update(writableDatabase, contentValues, appendToSelection(str, "_id", uri.getLastPathSegment()), strArr, "improvement");
                break;
            case 8:
                iUpdate = update(writableDatabase, contentValues, str, strArr, "improvement");
                break;
        }
        Context context = getContext();
        if (iUpdate > 0 && context != null) {
            context.getContentResolver().notifyChange(uri, null);
        }
        return iUpdate;
    }

    private static Uri insert(Uri uri, SQLiteDatabase sQLiteDatabase, ContentValues contentValues, String str) {
        Uri uriWithAppendedId = null;
        if (contentValues != null && contentValues.size() > 0) {
            try {
                sQLiteDatabase.beginTransaction();
                long jInsert = sQLiteDatabase.insert(str, null, contentValues);
                if (jInsert != -1) {
                    sQLiteDatabase.setTransactionSuccessful();
                    uriWithAppendedId = ContentUris.withAppendedId(uri, jInsert);
                }
            } finally {
                sQLiteDatabase.endTransaction();
            }
        }
        return uriWithAppendedId;
    }

    private static int delete(SQLiteDatabase sQLiteDatabase, String str, String[] strArr, String str2) {
        try {
            sQLiteDatabase.beginTransaction();
            int iDelete = sQLiteDatabase.delete(str2, str, strArr);
            sQLiteDatabase.setTransactionSuccessful();
            return iDelete;
        } finally {
            sQLiteDatabase.endTransaction();
        }
    }

    private static int update(SQLiteDatabase sQLiteDatabase, ContentValues contentValues, String str, String[] strArr, String str2) {
        try {
            sQLiteDatabase.beginTransaction();
            int iUpdate = sQLiteDatabase.update(str2, contentValues, str, strArr);
            sQLiteDatabase.setTransactionSuccessful();
            return iUpdate;
        } finally {
            sQLiteDatabase.endTransaction();
        }
    }

    private static String appendToSelection(String str, String str2, String str3) {
        String str4 = str2 + "=" + str3;
        if (str == null) {
            return str4;
        }
        return str4 + " AND " + str;
    }
}
