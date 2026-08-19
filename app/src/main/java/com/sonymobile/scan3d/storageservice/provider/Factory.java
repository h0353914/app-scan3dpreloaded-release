package com.sonymobile.scan3d.storageservice.provider;

import android.content.ContentProviderClient;
import android.content.ContentUris;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.RemoteException;
import androidx.annotation.Nullable;
import androidx.loader.content.CursorLoader;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.network.synchublib.SphinxContent;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class Factory {
    private static final String SELECTION = "sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=?";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.provider.Factory";
    private static final String[] FILE_PROJECTION = {"_id", Contract.FileRecord.COLUMN_IDENTIFIER, "name", "url", Contract.FileRecord.COLUMN_THUMBNAIL_URL, Contract.FileRecord.COLUMN_ETAG, "created", Contract.FileRecord.COLUMN_SYNC_STATE, Contract.FileRecord.COLUMN_LOG_URL, "scan_type", Contract.FileRecord.COLUMN_DOWNLOADABLE, Contract.FileRecord.COLUMN_VISIBLE, Contract.FileRecord.COLUMN_SHARE_HASH, Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Contract.FileRecord.COLUMN_LOG_TRANSFER_ID, Contract.FileRecord.COLUMN_IMPROVEMENT, Contract.FileRecord.COLUMN_RIGGED_SCAN_URL, Contract.FileRecord.COLUMN_IS_RIGGABLE, Contract.FileRecord.COLUMN_RIGGED_PREVIEW_URL, Contract.FileRecord.COLUMN_PROP_MESH_URL, Contract.FileRecord.COLUMN_SHARED_MESHES};
    private static final String[] UPLOAD_PROJECTION = {"_id", "state", Contract.UploadRecord.COLUMN_UID};
    private static final String[] IMPROVEMENT_PROJECTION = {"_id", "parent_id", "name", Contract.ImprovementRecord.COLUMN_S3_KEY, Contract.ImprovementRecord.COLUMN_IMPROVEMENT_TYPE, Contract.ImprovementRecord.COLUMN_FILE_SET_ID, Contract.ImprovementRecord.COLUMN_SQS_MESSAGE_ID, "scan_type", Contract.ImprovementRecord.COLUMN_FAIL_STATE};
    private static final String[] SELECTION_ARG = {String.valueOf(7), String.valueOf(1), String.valueOf(4), String.valueOf(9), String.valueOf(10)};

    public static ITransientFileSet create(Context context, String str, File file, File file2, int i, int i2) {
        FileSet fileSet = null;
        if (file != null && file.exists()) {
            try {
                Vault.ExtractionResult extractionResultExtract = Vault.extract(context, file);
                if (extractionResultExtract == null || !extractionResultExtract.success()) {
                    return null;
                }
                String identifier = extractionResultExtract.getIdentifier();
                String previewPath = extractionResultExtract.getPreviewPath();
                Date date = new Date(file.lastModified());
                File fileMoveFile = FsUtils.moveFile(context, file, identifier);
                File fileMoveFile2 = FsUtils.moveFile(context, file2, identifier);
                fileSet = new FileSet();
                fileSet.setIdentifier(identifier);
                fileSet.setName(str);
                fileSet.setZipFileUrl(fileMoveFile.getPath());
                if (fileMoveFile2 != null && fileMoveFile2.exists()) {
                    fileSet.setLogUrl(fileMoveFile2.getPath());
                }
                fileSet.setPreviewUrl(previewPath);
                fileSet.setSyncState(i);
                fileSet.setCreated(date);
                fileSet.setScanType(i2);
                return fileSet;
            } catch (IOException e) {
                DebugLog.e(TAG, "create(): Failed to create file set.", e);
                return fileSet;
            }
        }
        DebugLog.d(TAG, "create(): The file does not exist.");
        return null;
    }

    @Nullable
    public static IFileSet create(Context context, Uri uri) {
        IFileSet fileSet = null;
        if (context == null) {
            return null;
        }
        if (new Matcher().match(uri) == 0) {
            Cursor cursorOuter = context.getContentResolver().query(uri, FILE_PROJECTION, null, null, null);
            if (cursorOuter != null) {
                try (Cursor cursorQuery = cursorOuter) {
                    if (cursorQuery.moveToFirst()) {
                        fileSet = createFileSet(cursorQuery);
                    } else {
                        DebugLog.d(TAG, "create(): Could not get cursor.");
                    }
                }
            } else {
                DebugLog.d(TAG, "create(): Could not get cursor.");
            }
        } else {
            DebugLog.d(TAG, "create(): unknown uri " + uri);
        }
        return fileSet;
    }

    public static Map<String, IFileSet> createMap(ContentProviderClient contentProviderClient) throws RemoteException {
        HashMap map = new HashMap();
        try (Cursor cursorQuery = contentProviderClient.query(Contract.FileRecord.CONTENT_URI, FILE_PROJECTION, null, null, null)) {
            if (cursorQuery != null && cursorQuery.moveToFirst()) {
                do {
                    IFileSet iFileSetCreateFileSet = createFileSet(cursorQuery);
                    map.put(iFileSetCreateFileSet.getIdentifier(), iFileSetCreateFileSet);
                } while (cursorQuery.moveToNext());
            }
        }
        return map;
    }

    public static List<IFileSet> createFileRecords(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null && cursor.moveToFirst()) {
            do {
                arrayList.add(createFileSet(cursor));
            } while (cursor.moveToNext());
        }
        return arrayList;
    }

    public static List<Improvement> createImprovementRecords(Cursor cursor) {
        ArrayList arrayList = new ArrayList();
        if (cursor != null && cursor.moveToFirst()) {
            do {
                arrayList.add(createImprovement(cursor));
            } while (cursor.moveToNext());
        }
        return arrayList;
    }

    public static List<IFileSet> create(Context context, String str, String[] strArr) {
        ArrayList arrayList = new ArrayList();
        Cursor cursorQuery = context.getContentResolver().query(Contract.FileRecord.CONTENT_URI, FILE_PROJECTION, str, strArr, null);
        if (cursorQuery != null) {
            Throwable th = null;
            try {
                if (cursorQuery.moveToFirst()) {
                    do {
                        arrayList.add(createFileSet(cursorQuery));
                    } while (cursorQuery.moveToNext());
                }
            } catch (Throwable th2) {
                if (cursorQuery != null) {
                    if (th != null) {
                        try {
                            cursorQuery.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                    } else {
                        cursorQuery.close();
                    }
                }
                throw th2;
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return arrayList;
    }

    static List<IFileSet> create(SQLiteDatabase sQLiteDatabase) {
        try (Cursor cursorQuery = sQLiteDatabase.query("file", FILE_PROJECTION, null, null, null, null, null)) {
            return createFileRecords(cursorQuery);
        }
    }

    public static Map<String, ITransientFileSet> readContentList(List<SphinxContent> list) {
        HashMap map = new HashMap();
        if (list != null) {
            Iterator<SphinxContent> it = list.iterator();
            while (it.hasNext()) {
                FileSet content = readContent(it.next());
                map.put(content.getIdentifier(), content);
            }
        }
        return map;
    }

    public static CursorLoader createFileRecordLoader(Context context, String str) {
        return new CursorLoader(context, Contract.FileRecord.CONTENT_URI, FILE_PROJECTION, SELECTION, SELECTION_ARG, str);
    }

    public static CursorLoader createFileRecordLoader(Context context, String str, String[] strArr, String str2) {
        return new CursorLoader(context, Contract.FileRecord.CONTENT_URI, FILE_PROJECTION, str, strArr, str2);
    }

    public static CursorLoader createImprovementLoader(Context context, String str, String[] strArr) {
        return new CursorLoader(context, Contract.ImprovementRecord.CONTENT_URI, IMPROVEMENT_PROJECTION, str, strArr, null);
    }
    public static Upload getUpload(Context context, Uri uri, ServiceProvider serviceProvider) {
        String strName = serviceProvider.name();
        Upload upload = null;
        if (uri != null) {
            Uri.Builder builderBuildUpon = uri.buildUpon();
            builderBuildUpon.appendPath("upload");
            builderBuildUpon.appendPath(strName);
            try (Cursor cursorQuery = context.getContentResolver().query(builderBuildUpon.build(), UPLOAD_PROJECTION, null, null, null)) {
                if (cursorQuery != null) {
                    if (cursorQuery.moveToFirst()) {
                        upload = createUpload(cursorQuery);
                    }
                }
            }
        }
        return upload;
    }
    public static Improvement getImprovement(Context context, String str) {
        try (Cursor cursorQuery = context.getContentResolver().query(Contract.ImprovementRecord.CONTENT_URI, IMPROVEMENT_PROJECTION, "sqs_message_id=?", new String[]{str}, null)) {
            Improvement improvementCreateImprovement = null;
            if (cursorQuery != null && cursorQuery.moveToFirst()) {
                improvementCreateImprovement = createImprovement(cursorQuery);
            }
            return improvementCreateImprovement;
        }
    }

    public static Improvement getImprovement(Context context, Uri uri) {
        Cursor cursorQuery = context.getContentResolver().query(uri, IMPROVEMENT_PROJECTION, null, null, null);
        Improvement improvementCreateImprovement = null;
        improvementCreateImprovement = null;
        Throwable th = null;
        if (cursorQuery != null) {
            try {
                if (cursorQuery.moveToFirst()) {
                    improvementCreateImprovement = createImprovement(cursorQuery);
                }
            } catch (Throwable th2) {
                if (cursorQuery != null) {
                    if (th != null) {
                        try {
                            cursorQuery.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                    } else {
                        cursorQuery.close();
                    }
                }
                throw th2;
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return improvementCreateImprovement;
    }

    public static ArrayList<Improvement> getImprovements(Context context, Uri uri) {
        return getImprovements(context, "parent_id=?", new String[]{String.valueOf(ContentUris.parseId(uri))});
    }

    public static ArrayList<Improvement> getImprovements(Context context, int i) {
        return getImprovements(context, "created<=?", new String[]{"datetime('now', '-" + i + " day')"});
    }

    public static ArrayList<Improvement> getImprovements(Context context) {
        return getImprovements(context, null, null);
    }

    private static ArrayList<Improvement> getImprovements(Context context, String str, String[] strArr) {
        ArrayList<Improvement> arrayList = new ArrayList<>();
        Cursor cursorQuery = context.getContentResolver().query(Contract.ImprovementRecord.CONTENT_URI, IMPROVEMENT_PROJECTION, str, strArr, null);
        if (cursorQuery != null) {
            Throwable th = null;
            try {
                if (cursorQuery.moveToFirst()) {
                    do {
                        arrayList.add(createImprovement(cursorQuery));
                    } while (cursorQuery.moveToNext());
                }
            } catch (Throwable th2) {
                if (cursorQuery != null) {
                    if (th != null) {
                        try {
                            cursorQuery.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                    } else {
                        cursorQuery.close();
                    }
                }
                throw th2;
            }
        }
        if (cursorQuery != null) {
            cursorQuery.close();
        }
        return arrayList;
    }

    private static IFileSet createFileSet(Cursor cursor) {
        FileSet fileSet = new FileSet();
        fileSet.setId(cursor.getLong(0));
        fileSet.setIdentifier(cursor.getString(1));
        fileSet.setName(cursor.getString(2));
        fileSet.setZipFileUrl(cursor.getString(3));
        fileSet.setPreviewUrl(cursor.getString(4));
        fileSet.setEtag(cursor.getString(5));
        fileSet.setCreated(cursor.getString(6));
        fileSet.setSyncState(cursor.getInt(7));
        fileSet.setLogUrl(cursor.getString(8));
        fileSet.setScanType(cursor.getInt(9));
        fileSet.setDownloadable(cursor.getInt(10) > 0);
        fileSet.setVisible(cursor.getInt(11) > 0);
        fileSet.setShareHash(cursor.getString(12));
        fileSet.setTransferFlags(cursor.getInt(13));
        fileSet.setLogTransferId(cursor.getInt(14));
        fileSet.setIsImprovement(cursor.getInt(15) > 0);
        fileSet.setRiggedFileUrl(cursor.getString(16));
        fileSet.setIsRiggable(cursor.getInt(17) > 0);
        fileSet.setRiggedPreviewUrl(cursor.getString(18));
        fileSet.setPropFileUrl(cursor.getString(19));
        fileSet.setSharedMeshes(cursor.getInt(20));
        return fileSet;
    }

    private static Upload createUpload(Cursor cursor) {
        Upload upload = new Upload();
        upload.setId(cursor.getLong(0));
        upload.setState(cursor.getInt(1));
        upload.setUid(cursor.getString(2));
        return upload;
    }

    private static Improvement createImprovement(Cursor cursor) {
        Improvement improvement = new Improvement();
        improvement.setId(cursor.getLong(0));
        improvement.setParentId(cursor.getLong(1));
        improvement.setName(cursor.getString(2));
        improvement.setS3Path(cursor.getString(3));
        improvement.setType(cursor.getString(4));
        improvement.setFileSetId(cursor.getLong(5));
        improvement.setMessageId(cursor.getString(6));
        improvement.setScanType(cursor.getInt(7));
        improvement.setFailState(cursor.getInt(8));
        return improvement;
    }

    private static FileSet readContent(SphinxContent sphinxContent) {
        FileSet fileSet = new FileSet();
        fileSet.setSyncState(1);
        fileSet.setName(sphinxContent.getName());
        fileSet.setIdentifier(sphinxContent.getContentId());
        fileSet.setCreated(new Date(sphinxContent.getCreationDate()));
        fileSet.setEtag(sphinxContent.getETag());
        fileSet.setScanType(sphinxContent.getPolicy());
        fileSet.setShareHash(sphinxContent.getShareHash());
        fileSet.setVisible(sphinxContent.isVisible());
        fileSet.setDownloadable(sphinxContent.isDownloadable());
        fileSet.setIsImprovement(sphinxContent.isImprovement());
        fileSet.setSharedMeshes(sphinxContent.getSharedMeshes());
        return fileSet;
    }
}
