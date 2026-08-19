package com.sonymobile.scan3d.viewer.asynctasks;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.ModelContainer;

/* JADX INFO: loaded from: classes.dex */
public class LoadModelTask extends AsyncTask<Uri, Void, LoadModelTask.MeshAsyncTaskResult> {
    private final Context mContext;

    public static class MeshAsyncTaskResult {
        public IFileSet fileset;
        public ModelContainer model;
    }

    public LoadModelTask(Context context) {
        this.mContext = context;
    }

    @Override
    protected MeshAsyncTaskResult doInBackground(Uri... uriArr) {
        IFileSet iFileSetCreate = Factory.create(this.mContext, uriArr[0]);
        if (iFileSetCreate == null) {
            return null;
        }
        String password = Vault.getPassword(this.mContext);
        MeshAsyncTaskResult meshAsyncTaskResult = new MeshAsyncTaskResult();
        meshAsyncTaskResult.model = new ModelContainer();
        meshAsyncTaskResult.fileset = iFileSetCreate;
        if (meshAsyncTaskResult.model.importZip(iFileSetCreate.getZipFileUrl(), password)) {
            return meshAsyncTaskResult;
        }
        meshAsyncTaskResult.model.release();
        return null;
    }
}
