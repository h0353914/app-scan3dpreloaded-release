package com.sonymobile.scan3d.viewer.asynctasks;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.viewer.ModelContainer;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public class SaveModelTask extends AsyncTask<Void, Void, SaveModelTask.Result> {
    private final Context mContext;
    private ModelContainer mModel;
    private final String mName;

    public static class Result {
        public String name;
        public String path;
        public int scanType;
    }

    public SaveModelTask(Context context, ModelContainer modelContainer, String str) {
        this.mContext = context;
        this.mModel = modelContainer.copy();
        this.mName = str;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Result doInBackground(Void... voidArr) {
        Result result = new Result();
        String password = Vault.getPassword(this.mContext);
        result.name = this.mName;
        String strCreateDateStampedFileName = createDateStampedFileName();
        if (!this.mModel.exportZip(strCreateDateStampedFileName, password)) {
            strCreateDateStampedFileName = null;
        }
        result.path = strCreateDateStampedFileName;
        result.scanType = this.mModel.getScanType();
        return result;
    }
    @Override // android.os.AsyncTask
    protected void onPostExecute(Result result) {
        this.mModel.release();
        this.mModel = null;
        if (result.path != null) {
            Uri uriFromFile = Uri.fromFile(new File(result.path));
            ContentValues contentValues = new ContentValues(1);
            contentValues.put("name", result.name);
            contentValues.put("scan_type", Integer.valueOf(result.scanType));
            FileTasks.storeFile(this.mContext, uriFromFile, contentValues);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onCancelled(Result result) {
        this.mModel.release();
        this.mModel = null;
    }

    private String createDateStampedFileName() {
        return this.mContext.getFilesDir().getAbsolutePath() + FsUtils.RESULTS_DIR_NAME + "/3DCreator_" + new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date()) + ".obj.zip";
    }
}
