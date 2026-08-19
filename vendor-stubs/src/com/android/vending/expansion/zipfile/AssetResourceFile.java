package com.android.vending.expansion.zipfile;

import android.content.Context;
import android.content.res.AssetFileDescriptor;
import android.content.res.AssetManager;
import android.util.Log;
import java.io.IOException;
import java.io.InputStream;

/* JADX INFO: loaded from: classes.dex */
public class AssetResourceFile extends ZipResourceFile {
    private static final String TAG = "com.android.vending.expansion.zipfile.AssetResourceFile";
    private AssetManager mAssetManager;

    public AssetResourceFile(Context context) {
        this.mAssetManager = context.getAssets();
    }

    @Override // com.android.vending.expansion.zipfile.ZipResourceFile
    public AssetFileDescriptor getAssetFileDescriptor(String str) {
        try {
            return this.mAssetManager.openFd("expansion/" + str);
        } catch (IOException e) {
            Log.d(TAG, "Failed to load asset " + str + " with error message: " + e.getMessage());
            return null;
        }
    }

    @Override // com.android.vending.expansion.zipfile.ZipResourceFile
    public InputStream getInputStream(String str) throws IOException {
        return this.mAssetManager.open("expansion/" + str);
    }

    @Override // com.android.vending.expansion.zipfile.ZipResourceFile
    public int numberOfEntries() {
        try {
            String[] list = this.mAssetManager.list("expansion");
            if (list != null) {
                return list.length;
            }
            return 0;
        } catch (IOException e) {
            Log.d(TAG, "Failed to read files in expansion folder with error message: " + e.getMessage());
            return 0;
        }
    }
}
