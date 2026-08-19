package com.sonymobile.scan3d.storageservice.utils;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.text.TextUtils;
import com.amazonaws.services.s3.model.InstructionFileId;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.UUID;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/* JADX INFO: loaded from: classes.dex */
public final class FsUtils {
    private static final String DEFAULT_GLB_NAME_SHARE = "scan.glb";
    private static final String DEFAULT_NAME_NO_EXTENSION = "scan";
    private static final String DEFAULT_NAME_SHARE = "scan.zip";
    private static final String DIR_SHARE = ".share";
    private static final String DIR_TEMP = ".temp";
    public static final String JPG_SUFFIX = ".jpg";
    public static final String MESH_JPEG = "mesh.jpeg";
    public static final String MESH_MTL = "mesh.mtl";
    public static final String MESH_OBJ = "mesh.obj";
    public static final String RESULTS_DIR_NAME = "/results";
    private static final String SLASH = "/";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.utils.FsUtils";
    private static final String UNDERSCORE = "_";
    public static final String ZIP_SUFFIX = ".zip";

    public static String scanTypeToString(int i) {
        if (i == 512) {
            return "food";
        }
        switch (i) {
            case 256:
                return "face";
            case 257:
                return "head";
            default:
                return "any";
        }
    }

    private FsUtils() {
    }

    public static File moveFile(Context context, File file, String str) {
        if (file == null || !file.exists()) {
            return null;
        }
        File file2 = new File(getResultsDirectory(context, str), file.getName());
        if (file.renameTo(file2)) {
            return file2;
        }
        return null;
    }

    public static boolean moveFile(File file, File file2) {
        if (file == null || file2 == null) {
            return false;
        }
        try {
            Files.move(file.toPath(), file2.toPath(), StandardCopyOption.REPLACE_EXISTING);
            return true;
        } catch (IOException e) {
            DebugLog.e(TAG, "Failed to move file.", e);
            return false;
        }
    }

    public static File getResultsDirectory(Context context, String str) {
        File file = new File(context.getFilesDir().getPath().concat(RESULTS_DIR_NAME).concat(SLASH).concat(str).concat(SLASH));
        if (file.exists() || file.mkdirs()) {
            DebugLog.d(TAG, "getResultsDirectory(): Created " + file.getPath());
        }
        return file;
    }

    public static String getTempRootDirectory(Context context) {
        return context.getFilesDir().getPath().concat(SLASH).concat(DIR_TEMP);
    }

    public static boolean cleanTempDir(Context context, File file) {
        boolean z;
        File file2 = new File(getTempRootDirectory(context));
        if (!file2.exists()) {
            return true;
        }
        File[] fileArrListFiles = file2.listFiles();
        if (fileArrListFiles != null) {
            z = true;
            for (File file3 : fileArrListFiles) {
                DebugLog.d(TAG, "cleanTempDir(): clean " + file3.getPath());
                if (file3.isDirectory()) {
                    z = deleteFiles(file3, true) && z;
                } else {
                    z = file3.delete() && z;
                }
            }
        } else {
            DebugLog.d(TAG, "cleanTempDir(): don't find any temp files" + file2.getPath());
            z = true;
        }
        return file2.delete() && z;
    }

    public static File getTempDirectory(Context context) {
        File file = new File(getTempRootDirectory(context).concat(SLASH).concat(UUID.randomUUID().toString()).concat(SLASH));
        if (file.exists() || file.mkdirs()) {
            DebugLog.d(TAG, "getTempDirectory(): Created " + file.getPath());
        }
        return file;
    }

    public static void deleteShareFile(Context context) {
        File file = new File(context.getFilesDir().getPath().concat(SLASH).concat(DIR_SHARE).concat(SLASH));
        if (file.exists()) {
            deleteFilesAndFolders(file, false);
        }
    }

    private static File getShareDirectory(Context context) {
        File file = new File(context.getFilesDir().getPath().concat(SLASH).concat(DIR_SHARE).concat(SLASH).concat(UUID.randomUUID().toString()).concat(SLASH));
        file.mkdirs();
        return file;
    }

    public static boolean deleteFiles(File file, boolean z) {
        if (file == null || !file.exists() || !file.isDirectory()) {
            throw new IllegalArgumentException("Directory is not valid.");
        }
        File[] fileArrListFiles = file.listFiles();
        boolean z2 = true;
        if (fileArrListFiles != null) {
            boolean z3 = true;
            for (File file2 : fileArrListFiles) {
                z3 = file2.isFile() && file2.delete() && z3;
            }
            z2 = z3;
        }
        return (z2 && z) ? file.delete() : z2;
    }

    private static boolean deleteFilesAndFolders(File file, boolean z) {
        if (!file.exists() || !file.isDirectory()) {
            throw new IllegalArgumentException("Directory is not valid.");
        }
        File[] fileArrListFiles = file.listFiles();
        boolean z2 = true;
        if (fileArrListFiles != null) {
            boolean z3 = true;
            for (File file2 : fileArrListFiles) {
                if (file2.isFile()) {
                    z3 = file2.delete() && z3;
                } else if (file2.isDirectory()) {
                    z3 = deleteFilesAndFolders(file2, true) && z3;
                }
            }
            z2 = z3;
        }
        return (z2 && z) ? file.delete() : z2;
    }

    public static File getScanFile(Context context, String str, String str2) {
        return new File(getResultsDirectory(context, str), str2);
    }

    public static File getShareFile(Context context) {
        return getShareFile(context, DEFAULT_NAME_SHARE);
    }

    public static File getShareGlbFile(Context context, String str) {
        if (TextUtils.isEmpty(str)) {
            str = DEFAULT_GLB_NAME_SHARE;
        }
        return getShareFile(context, str);
    }

    public static File getShareFile(Context context, String str) {
        File shareDirectory = getShareDirectory(context);
        if (TextUtils.isEmpty(str)) {
            str = DEFAULT_NAME_SHARE;
        }
        if (str.lastIndexOf(InstructionFileId.DOT) == 0) {
            str = DEFAULT_NAME_NO_EXTENSION + str;
        }
        return new File(shareDirectory, str.replace(SLASH, UNDERSCORE).replaceAll("\\p{So}+", UNDERSCORE));
    }

    public static File copyRawToStorage(Context context, int i, String str) {
        try (InputStream inputStreamOpenRawResource = context.getResources().openRawResource(i)) {
            File file = new File(str);
            File parentFile = file.getParentFile();
            if (parentFile != null && !parentFile.exists() && !parentFile.mkdir()) {
                throw new IOException("Can't create folder: " + parentFile.getAbsolutePath());
            }
            StreamUtils.saveToDisc(file, inputStreamOpenRawResource);
            return file;
        } catch (IOException e) {
            DebugLog.e(TAG, "Error while copying example scans from raw.", e);
            return null;
        }
    }

    public static boolean validScan3dFile(File file) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(MESH_JPEG);
        arrayList.add(MESH_MTL);
        arrayList.add(MESH_OBJ);
        try {
            ZipFile zipFile = new ZipFile(file, 1);
            Throwable th = null;
            try {
                Enumeration<? extends ZipEntry> enumerationEntries = zipFile.entries();
                while (enumerationEntries.hasMoreElements()) {
                    arrayList.remove(enumerationEntries.nextElement().getName());
                }
                zipFile.close();
            } catch (Throwable th2) {
                if (0 != 0) {
                    try {
                        zipFile.close();
                    } catch (Throwable th3) {
                        th.addSuppressed(th3);
                    }
                } else {
                    zipFile.close();
                }
                throw th2;
            }
        } catch (IOException | RuntimeException e) {
            DebugLog.d(TAG, "Error while validating the Scan3d file", e);
        }
        return arrayList.isEmpty();
    }

    public static Uri insertFromFile(Context context, String str, File file, File file2, int i, int i2) {
        ITransientFileSet iTransientFileSetCreate = Factory.create(context, str, file, file2, i, i2);
        if (iTransientFileSetCreate == null) {
            return null;
        }
        ContentValues contentValues = iTransientFileSetCreate.toContentValues();
        contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, Integer.valueOf(i));
        return context.getContentResolver().insert(Contract.FileRecord.CONTENT_URI, contentValues);
    }

    public static String generateRandomFileName(String str) {
        return UUID.randomUUID().toString().concat(str);
    }
}
