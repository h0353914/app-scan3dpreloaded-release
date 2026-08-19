package com.sonymobile.scan3d.storageservice.provider;

import android.app.AlarmManager;
import android.app.IntentService;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Messenger;
import android.os.Parcelable;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.widget.Toast;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;
import androidx.core.content.FileProvider;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ZipResourceManager;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.network.ContentType;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.utils.SharingUtil;
import com.sonymobile.scan3d.viewer.ModelContainer;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public final class FileRecordService extends IntentService {
    private static final int ACTION_CHECK_ENCRYPTION = 12;
    private static final int ACTION_CHECK_INTEGRITY = 5;
    private static final int ACTION_DELETE = 11;
    private static final int ACTION_DELETE_ANIMATION = 13;
    private static final int ACTION_DELETE_FILESET = 1;
    private static final int ACTION_DELETE_SHARE_FILES = 10;
    private static final int ACTION_INSERT = 4;
    private static final int ACTION_INSERT_EXAMPLES = 2;
    private static final int ACTION_SHARE_GLB = 15;
    private static final int ACTION_SHARE_GLB_MESH = 14;
    private static final int ACTION_SHARE_MESH = 9;
    private static final int ACTION_STORE_FILE = 6;
    private static final int ACTION_UPDATE = 0;
    private static final int ACTION_UPDATE_METADATA = 8;
    private static final String EXAMPLE_CARD_NAME_FACE = "example_face.zip";
    private static final String EXAMPLE_CARD_NAME_FOOD = "example_food.zip";
    private static final String EXAMPLE_CARD_NAME_FREEFORM = "example_freeform.zip";
    private static final String EXAMPLE_CARD_NAME_HEAD = "example_head.zip";
    private static final String EXTRA_COMPONENT_NAME = "com.sonymobile.scan3d.extra.COMPONENT_NAME";
    private static final String EXTRA_CONTENT_ACTION = "com.sonymobile.scan3d.extra.CONTENT_ACTION";
    private static final String EXTRA_CONTENT_VALUES = "com.sonymobile.scan3d.extra.CONTENT_VALUES";
    public static final String EXTRA_EXPORT_GLB_URL = "com.sonymobile.scan3d.extra.EXTRA_EXPORT_GLB_URL";
    public static final String EXTRA_IS_TESSELLATED = "com.sonymobile.scan3d.extra.IS_TESSELLATED";
    public static final String EXTRA_MESSENGER = "com.sonymobile.scan3d.extra.EXTRA_MESSENGER";
    private static final String EXTRA_PERFORM_SYNC = "com.sonymobile.scan3d.extra.PERFORM_SYNC";
    private static final String EXTRA_TEXTURE_SIZE = "com.sonymobile.scan3d.extra.TEXTURE_SIZE";
    private static final String PREF_KEY_ENCRYPTION_CHECKED = "pref_key_encryption_checked";
    private static final String SELECTION = "sync_state=?";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.provider.FileRecordService";
    private static final String WORKER_THREAD = "FileRecordService#WorkerThread";
    private static final long SHARE_DELETE_TIME_MILLIS = TimeUnit.HOURS.toMillis(12);
    private static final String[] SELECTION_ARGS = {String.valueOf(9)};

    static void checkIntegrity(Context context) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.putExtra(EXTRA_CONTENT_ACTION, 5);
        context.startService(intent);
    }

    static void checkEncryption(Context context) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.putExtra(EXTRA_CONTENT_ACTION, 12);
        context.startService(intent);
    }

    static void insertExampleScans(Context context) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.putExtra(EXTRA_CONTENT_ACTION, 2);
        context.startService(intent);
    }

    static void insertRecord(Context context, Uri uri, ContentValues contentValues, boolean z) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 4);
        intent.putExtra(EXTRA_CONTENT_VALUES, contentValues);
        intent.putExtra(EXTRA_PERFORM_SYNC, z);
        context.startService(intent);
    }

    static void deleteFileSet(Context context, Uri uri, boolean z) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 1);
        intent.putExtra(EXTRA_PERFORM_SYNC, z);
        context.startService(intent);
    }

    static void delete(Context context, Uri uri) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 11);
        context.startService(intent);
    }

    static void deleteAnimation(Context context, Uri uri) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 13);
        context.startService(intent);
    }

    static void shareMesh(Context context, Uri uri, ComponentName componentName, boolean z) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_COMPONENT_NAME, componentName);
        intent.putExtra(EXTRA_IS_TESSELLATED, z);
        intent.putExtra(EXTRA_CONTENT_ACTION, 9);
        context.startService(intent);
    }

    static void shareGlbMesh(Context context, Uri uri, ComponentName componentName, int i, Handler handler) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_COMPONENT_NAME, componentName);
        intent.putExtra(EXTRA_TEXTURE_SIZE, i);
        intent.putExtra(EXTRA_CONTENT_ACTION, 14);
        if (handler != null) {
            intent.putExtra(EXTRA_MESSENGER, new Messenger(handler));
        }
        context.startService(intent);
    }

    static void shareGlb(Context context, Uri uri, String str, ComponentName componentName, int i) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_EXPORT_GLB_URL, str);
        intent.putExtra(EXTRA_COMPONENT_NAME, componentName);
        intent.putExtra(EXTRA_TEXTURE_SIZE, i);
        intent.putExtra(EXTRA_CONTENT_ACTION, 15);
        context.startService(intent);
    }

    static void update(Context context, Uri uri, ContentValues contentValues, boolean z) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 0);
        intent.putExtra(EXTRA_CONTENT_VALUES, contentValues);
        intent.putExtra(EXTRA_PERFORM_SYNC, z);
        context.startService(intent);
    }

    static void scheduleShareFileDeletion(Context context) {
        AlarmManager alarmManager = (AlarmManager) context.getSystemService(NotificationCompat.CATEGORY_ALARM);
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.putExtra(EXTRA_CONTENT_ACTION, 10);
        alarmManager.set(3, SystemClock.elapsedRealtime() + SHARE_DELETE_TIME_MILLIS, PendingIntent.getService(context, 0, intent, 134217728));
    }

    static void storeFile(Context context, Uri uri, ContentValues contentValues) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 6);
        intent.putExtra(EXTRA_CONTENT_VALUES, contentValues);
        context.startService(intent);
    }

    static void updateMetaData(Context context, Uri uri, ContentValues contentValues, boolean z) {
        Intent intent = new Intent(context, (Class<?>) FileRecordService.class);
        intent.setData(uri);
        intent.putExtra(EXTRA_CONTENT_ACTION, 8);
        intent.putExtra(EXTRA_CONTENT_VALUES, contentValues);
        intent.putExtra(EXTRA_PERFORM_SYNC, z);
        context.startService(intent);
    }

    public FileRecordService() {
        super(WORKER_THREAD);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
        ModelContainer modelContainer;
        File file;
        File shareFile;
        IOException e;
        Throwable th;
        if (intent != null) {
            int intExtra = intent.getIntExtra(EXTRA_CONTENT_ACTION, -1);
            boolean booleanExtra = intent.getBooleanExtra(EXTRA_PERFORM_SYNC, false);
            ContentResolver contentResolver = getContentResolver();
            ModelContainer modelContainer2 = null;
            File resizedGLBFile = null;
            modelContainer2 = null;
            switch (intExtra) {
                case 0:
                    Uri data = intent.getData();
                    ContentValues contentValues = (ContentValues) intent.getParcelableExtra(EXTRA_CONTENT_VALUES);
                    if (data == null || !hasValues(contentValues) || contentResolver.update(data, contentValues, null, null) <= 0 || !booleanExtra) {
                        return;
                    }
                    Jobs.requestSync(this, false);
                    return;
                case 1:
                    Uri data2 = intent.getData();
                    IFileSet iFileSetCreate = Factory.create(this, data2);
                    if (iFileSetCreate == null || !iFileSetCreate.deleteAllFiles(this) || contentResolver.delete(data2, null, null) <= 0) {
                        return;
                    }
                    Jobs.cancelJob(this, data2);
                    if (booleanExtra) {
                        Jobs.requestSync(this, false);
                        return;
                    }
                    return;
                case 2:
                    try {
                        ZipResourceFile zipResourceFileNewInstance = ZipResourceManager.newInstance(ZipResourceManager.getInstance().EXPANSION_FILE_PATH);
                        if (!(addExampleScan(EXAMPLE_CARD_NAME_FACE, zipResourceFileNewInstance, R.string.file_set_example_scan_face, 256) & true & addExampleScan(EXAMPLE_CARD_NAME_HEAD, zipResourceFileNewInstance, R.string.file_set_example_scan_head, 257) & addExampleScan(EXAMPLE_CARD_NAME_FOOD, zipResourceFileNewInstance, R.string.file_set_example_scan_food, 512) & addExampleScan(EXAMPLE_CARD_NAME_FREEFORM, zipResourceFileNewInstance, R.string.file_set_example_scan_freeform, 0))) {
                            DebugLog.e(TAG, "Failed exporting example scans from expansions file.");
                            return;
                        }
                        return;
                    } catch (IOException unused) {
                        DebugLog.e(TAG, "Failed exporting example scans from expansions file.");
                        return;
                    }
                case 3:
                case 7:
                default:
                    DebugLog.d(TAG, "onHandleIntent(): Unknown action " + intExtra);
                    return;
                case 4:
                    if (getContentResolver().insert(intent.getData(), (ContentValues) intent.getParcelableExtra(EXTRA_CONTENT_VALUES)) == null || !booleanExtra) {
                        return;
                    }
                    Jobs.requestSync(this, false);
                    return;
                case 5:
                    if (checkIntegrity()) {
                        Jobs.requestSync(this, false);
                        return;
                    }
                    return;
                case 6:
                    Uri data3 = intent.getData();
                    ContentValues contentValues2 = (ContentValues) intent.getParcelableExtra(EXTRA_CONTENT_VALUES);
                    FsUtils.insertFromFile(this, contentValues2.getAsString("name"), new File(data3.getPath()), null, 0, contentValues2.getAsInteger("scan_type").intValue());
                    return;
                case 8:
                    Uri data4 = intent.getData();
                    ContentValues contentValues3 = (ContentValues) intent.getParcelableExtra(EXTRA_CONTENT_VALUES);
                    if (data4 == null || !hasValues(contentValues3)) {
                        return;
                    }
                    if (Factory.create(this, data4).isSynced()) {
                        contentValues3.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 6);
                    }
                    if (contentResolver.update(data4, contentValues3, null, null) <= 0 || !booleanExtra) {
                        return;
                    }
                    Jobs.requestSync(this, false);
                    return;
                case 9:
                    boolean booleanExtra2 = intent.getBooleanExtra(EXTRA_IS_TESSELLATED, false);
                    ComponentName componentName = (ComponentName) intent.getParcelableExtra(EXTRA_COMPONENT_NAME);
                    IFileSet iFileSetCreate2 = Factory.create(this, intent.getData());
                    if (iFileSetCreate2 == null) {
                        return;
                    }
                    File file2 = new File(iFileSetCreate2.getZipFileUrl());
                    File shareFile2 = FsUtils.getShareFile(this);
                    modelContainer = null;
                    shareFile = null;
                    try {
                        Vault.decrypt(this, file2, shareFile2);
                        modelContainer = new ModelContainer();
                        try {
                            if (modelContainer.importZip(shareFile2.getPath(), null)) {
                                modelContainer.tessellate(booleanExtra2 ? 1 : 0);
                                shareFile = FsUtils.getShareFile(this, iFileSetCreate2.getName() + FsUtils.ZIP_SUFFIX);
                                modelContainer.exportZip(shareFile.getPath(), null);
                            } else {
                                shareFile = null;
                            }
                            modelContainer.release();
                        } catch (RuntimeException thCaught) {
                            if (modelContainer != null) {
                                modelContainer.release();
                            }
                            throw thCaught;
                        }
                    } catch (IOException e3) {
                        DebugLog.e(TAG, "Failed to share the file.", e3);
                        if (modelContainer != null) {
                            modelContainer.release();
                        }
                    }
                    if (shareFile != null) {
                        Intent intent2 = new Intent("android.intent.action.SEND");
                        Uri uriForFile = FileProvider.getUriForFile(this, getString(R.string.file_provider_authority), shareFile);
                        intent2.setComponent(componentName);
                        intent2.putExtra("android.intent.extra.STREAM", uriForFile);
                        intent2.putExtra("android.intent.extra.SUBJECT", String.format(getString(R.string.share_as_file_message_title), iFileSetCreate2.getName()));
                        intent2.putExtra("android.intent.extra.TEXT", iFileSetCreate2.getName());
                        intent2.putExtra(SharingConstants.EXTRA_SCAN_TYPE, FsUtils.scanTypeToString(iFileSetCreate2.getScanType()));
                        intent2.setFlags(268435457);
                        if (componentName == null) {
                            intent2.setType(ContentType.ZIP.toMimeString());
                        } else {
                            HitEvent.SHARE_MESH.send(this, componentName.toString());
                            intent2.setDataAndType(uriForFile, SharingConstants.SCAN_3D_MIME_TYPE);
                        }
                        startActivity(intent2);
                    }
                    scheduleShareFileDeletion(this);
                    return;
                case 10:
                    FsUtils.deleteShareFile(this);
                    return;
                case 11:
                    getContentResolver().delete(intent.getData(), null, null);
                    return;
                case 12:
                    checkEncryption();
                    return;
                case 13:
                    Uri data5 = intent.getData();
                    IFileSet iFileSetCreate3 = Factory.create(this, data5);
                    ContentValues contentValues4 = new ContentValues(2);
                    contentValues4.put(Contract.FileRecord.COLUMN_RIGGED_SCAN_URL, "");
                    contentValues4.put(Contract.FileRecord.COLUMN_RIGGED_PREVIEW_URL, "");
                    contentResolver.update(data5, contentValues4, null, null);
                    if (!new File(iFileSetCreate3.getRiggedFileUrl()).delete()) {
                        DebugLog.e(TAG, "Failed to remove file " + iFileSetCreate3.getRiggedFileUrl());
                    }
                    if (new File(iFileSetCreate3.getRiggedPreviewUrl()).delete()) {
                        DebugLog.e(TAG, "Failed to remove file " + iFileSetCreate3.getRiggedPreviewUrl());
                        return;
                    }
                    return;
                case 14:
                case 15:
                    IFileSet iFileSetCreate4 = Factory.create(this, intent.getData());
                    int intExtra2 = intent.getIntExtra(EXTRA_TEXTURE_SIZE, 0);
                    if (iFileSetCreate4 != null) {
                        if (intExtra == 14) {
                            resizedGLBFile = SharingUtil.getRiggedFileForSharing(this, iFileSetCreate4, intExtra2);
                        } else if (intExtra == 15) {
                            String stringExtra = intent.getStringExtra(EXTRA_EXPORT_GLB_URL);
                            if (intExtra2 == 0) {
                                resizedGLBFile = new File(stringExtra);
                            } else {
                                resizedGLBFile = SharingUtil.getResizedGLBFile(this, iFileSetCreate4, stringExtra, intExtra2);
                            }
                        }
                        if (resizedGLBFile != null) {
                            ComponentName componentName2 = (ComponentName) intent.getParcelableExtra(EXTRA_COMPONENT_NAME);
                            Intent intent3 = new Intent("android.intent.action.SEND");
                            Uri uriForFile2 = FileProvider.getUriForFile(this, getString(R.string.file_provider_authority), resizedGLBFile);
                            intent3.putExtra("android.intent.extra.STREAM", uriForFile2);
                            intent3.putExtra("android.intent.extra.SUBJECT", String.format(getString(R.string.share_as_file_message_title), iFileSetCreate4.getName()));
                            intent3.putExtra("android.intent.extra.TEXT", iFileSetCreate4.getName());
                            intent3.putExtra(SharingConstants.EXTRA_SCAN_TYPE, FsUtils.scanTypeToString(iFileSetCreate4.getScanType()));
                            intent3.setComponent(componentName2);
                            intent3.setFlags(268435457);
                            if (componentName2 != null) {
                                intent3.setDataAndType(uriForFile2, SharingConstants.GLTF_MIME_TYPE);
                                Parcelable messengerFromIntent = getMessengerFromIntent(intent);
                                if (messengerFromIntent != null) {
                                    intent3.putExtra(EXTRA_MESSENGER, messengerFromIntent);
                                }
                                HitEvent.ANIMATION_SHARED.send(this, componentName2.toString());
                            } else {
                                intent3.setType(SharingConstants.GLTF_MIME_TYPE);
                            }
                            startActivity(intent3);
                            return;
                        }
                        Toast.makeText(this, "Unable to share this file.", 0).show();
                        return;
                    }
                    return;
            }
        }
    }

    @Nullable
    private Messenger getMessengerFromIntent(@NonNull Intent intent) {
        Bundle extras = intent.getExtras();
        if (extras != null) {
            return (Messenger) extras.get(EXTRA_MESSENGER);
        }
        return null;
    }

    private boolean shouldCheckEncryption() {
        return Config.encrypt(this) && !PreferenceManager.getDefaultSharedPreferences(this).getBoolean(PREF_KEY_ENCRYPTION_CHECKED, false);
    }

    private boolean addExampleScan(String str, ZipResourceFile zipResourceFile, int i, int i2) {
        File file = new File(getFilesDir().getAbsolutePath() + FsUtils.RESULTS_DIR_NAME + "/" + str);
        StringBuilder sb = new StringBuilder();
        sb.append(getFilesDir().getAbsolutePath());
        sb.append(FsUtils.RESULTS_DIR_NAME);
        File file2 = new File(sb.toString());
        if (!file2.exists() && !file2.mkdirs()) {
            DebugLog.e(TAG, "Failed to create result directory");
            return false;
        }
        try {
            InputStream inputStream = zipResourceFile.getInputStream(str);
            Throwable th = null;
            try {
                if (inputStream != null) {
                    StreamUtils.saveToDisc(file, inputStream);
                    FsUtils.insertFromFile(this, getString(i), file, null, 8, i2);
                    inputStream.close();
                }
                if (inputStream == null) {
                    return true;
                }
                inputStream.close();
                return true;
            } catch (Throwable th2) {
                if (inputStream != null) {
                    if (0 != 0) {
                        try {
                            inputStream.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                    } else {
                        inputStream.close();
                    }
                }
                throw th2;
            }
        } catch (IOException e) {
            DebugLog.e(TAG, "Failed to Add Example scan " + str + ": " + e.getMessage());
            return false;
        }
    }

    private void checkEncryption() {
        if (shouldCheckEncryption()) {
            boolean z = true;
            for (IFileSet iFileSet : Factory.create(this, null, null)) {
                if (!iFileSet.isRemote() && iFileSet.getSyncState() != 8) {
                    String zipFileUrl = iFileSet.getZipFileUrl();
                    File file = new File(zipFileUrl);
                    File tempDirectory = FsUtils.getTempDirectory(this);
                    ModelContainer modelContainer = new ModelContainer();
                    try {
                        if (modelContainer.importZip(zipFileUrl, null)) {
                            File file2 = new File(tempDirectory, "temp.zip");
                            if (modelContainer.exportZip(file2.getPath(), Vault.getPassword(this))) {
                                Files.move(file2.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);
                            } else {
                                z = false;
                            }
                        }
                        modelContainer.release();
                        FsUtils.deleteFiles(tempDirectory, true);
                    } catch (Exception unused) {
                        modelContainer.release();
                        FsUtils.deleteFiles(tempDirectory, true);
                        z = false;
                    } catch (Throwable th) {
                        modelContainer.release();
                        FsUtils.deleteFiles(tempDirectory, true);
                        throw th;
                    }
                }
            }
            if (z) {
                SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(this).edit();
                editorEdit.putBoolean(PREF_KEY_ENCRYPTION_CHECKED, true);
                editorEdit.apply();
            }
        }
    }

    private boolean checkIntegrity() {
        ContentResolver contentResolver = getContentResolver();
        ContentValues contentValues = new ContentValues(1);
        contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
        return contentResolver.update(Contract.FileRecord.CONTENT_URI, contentValues, SELECTION, SELECTION_ARGS) > 0;
    }

    private static boolean hasValues(ContentValues contentValues) {
        return contentValues != null && contentValues.size() > 0;
    }
}
