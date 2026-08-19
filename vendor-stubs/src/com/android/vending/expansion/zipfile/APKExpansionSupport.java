package com.android.vending.expansion.zipfile;

import android.content.Context;
import android.os.Environment;
import com.amazonaws.services.s3.model.InstructionFileId;
import java.io.File;
import java.io.IOException;
import java.util.Vector;

/* JADX INFO: loaded from: classes.dex */
public class APKExpansionSupport {
    private static final String EXP_PATH = "/Android/obb/";

    public static String[] getAPKExpansionFiles(Context context, long j, int i) {
        String packageName = context.getPackageName();
        Vector vector = new Vector();
        if (Environment.getExternalStorageState().equals("mounted")) {
            File file = new File(Environment.getExternalStorageDirectory().toString() + EXP_PATH + packageName);
            if (file.exists()) {
                if (j > 0) {
                    String str = file + File.separator + "main." + j + InstructionFileId.DOT + packageName + ".obb";
                    if (new File(str).isFile()) {
                        vector.add(str);
                    }
                }
                if (i > 0) {
                    String str2 = file + File.separator + "patch." + j + InstructionFileId.DOT + packageName + ".obb";
                    if (new File(str2).isFile()) {
                        vector.add(str2);
                    }
                }
            }
        }
        String[] strArr = new String[vector.size()];
        vector.toArray(strArr);
        return strArr;
    }

    public static ZipResourceFile getResourceZipFile(String[] strArr) throws Throwable {
        ZipResourceFile zipResourceFile = null;
        for (String str : strArr) {
            if (zipResourceFile == null) {
                zipResourceFile = new ZipResourceFile(str);
            } else {
                zipResourceFile.addPatchFile(str);
            }
        }
        return zipResourceFile;
    }

    public static ZipResourceFile getAPKExpansionZipFile(Context context, int i, int i2) throws Throwable {
        return getResourceZipFile(getAPKExpansionFiles(context, i, i2));
    }
}
