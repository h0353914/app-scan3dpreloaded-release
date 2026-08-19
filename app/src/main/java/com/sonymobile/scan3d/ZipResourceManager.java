package com.sonymobile.scan3d;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Build;
import com.android.vending.expansion.zipfile.APKExpansionSupport;
import com.android.vending.expansion.zipfile.AssetResourceFile;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public class ZipResourceManager {
    private static boolean mFoundObb = false;
    private static ZipResourceManager sInstance;
    private static ZipResourceFile sZipFile;
    public final String EXPANSION_FILE_PATH;
    private List<ZipResourceFileListener> mListeners = new ArrayList();

    public interface ZipResourceFileListener {
        void onZipResourceLoaded();
    }

    public static synchronized void init(Context context) {
        if (sInstance != null) {
            throw new IllegalStateException("init() called twice, something is wrong");
        }
        sInstance = new ZipResourceManager(context);
    }

    public static synchronized void reload(Context context) {
        if (sInstance == null) {
            throw new IllegalStateException("reload() called before init()");
        }
        sInstance = new ZipResourceManager(context);
    }

    public static boolean usingOBB() {
        return mFoundObb;
    }

    public static boolean expansionLoaded() {
        ZipResourceFile zipResourceFile = sZipFile;
        return zipResourceFile != null && zipResourceFile.numberOfEntries() > 0;
    }

    public static ZipResourceManager getInstance() {
        ZipResourceManager zipResourceManager = sInstance;
        if (zipResourceManager != null) {
            return zipResourceManager;
        }
        throw new IllegalStateException("Call init() before trying to get instance!");
    }

    private static String initializeExpansionFilePath(Context context) {
        String[] aPKExpansionFiles;
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
            if (Build.VERSION.SDK_INT >= 28) {
                aPKExpansionFiles = APKExpansionSupport.getAPKExpansionFiles(context, packageInfo.getLongVersionCode(), 0);
            } else {
                aPKExpansionFiles = APKExpansionSupport.getAPKExpansionFiles(context, packageInfo.versionCode, 0);
            }
            return aPKExpansionFiles.length > 0 ? aPKExpansionFiles[0] : "";
        } catch (PackageManager.NameNotFoundException unused) {
            throw new IllegalStateException("We cannot fail finding the expansion file!");
        }
    }

    private ZipResourceManager(Context context) {
        this.EXPANSION_FILE_PATH = initializeExpansionFilePath(context);
        if (new File(this.EXPANSION_FILE_PATH).exists()) {
            mFoundObb = true;
            new LoadZipResourceTask().executeOnExecutor(Executors.newSingleThreadExecutor(), this.EXPANSION_FILE_PATH);
            return;
        }
        mFoundObb = false;
        sZipFile = new AssetResourceFile(context);
        Iterator<ZipResourceFileListener> it = this.mListeners.iterator();
        while (it.hasNext()) {
            it.next().onZipResourceLoaded();
        }
    }

    public void addZipResourceFileListener(ZipResourceFileListener zipResourceFileListener) {
        if (zipResourceFileListener != null) {
            this.mListeners.add(zipResourceFileListener);
            if (sZipFile != null) {
                zipResourceFileListener.onZipResourceLoaded();
            }
        }
    }

    public void removeZipResourceFileListener(ZipResourceFileListener zipResourceFileListener) {
        this.mListeners.remove(zipResourceFileListener);
    }

    private class LoadZipResourceTask extends AsyncTask<String, Void, ZipResourceFile> {
        private LoadZipResourceTask() {
        }

        @Override // android.os.AsyncTask
        protected ZipResourceFile doInBackground(String... strArr) {
            try {
                return new ZipResourceFile(strArr[0]);
            } catch (IOException e) {
                throw new RuntimeException("Failed to load expansion file: " + e.getMessage());
            }
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(ZipResourceFile zipResourceFile) {
            if (ZipResourceManager.sZipFile == null || !ZipResourceManager.sZipFile.equals(zipResourceFile)) {
                ZipResourceFile unused = ZipResourceManager.sZipFile = zipResourceFile;
                Iterator it = ZipResourceManager.this.mListeners.iterator();
                while (it.hasNext()) {
                    ((ZipResourceFileListener) it.next()).onZipResourceLoaded();
                }
            }
        }
    }

    public static ZipResourceFile getZipResourceFile() {
        return sZipFile;
    }

    public static ZipResourceFile newInstance(String str) throws IOException {
        if (mFoundObb) {
            return new ZipResourceFile(str);
        }
        if (sInstance == null) {
            throw new IllegalStateException("Init() not called before trying to get ZipResourceFIle instance");
        }
        return getZipResourceFile();
    }
}
