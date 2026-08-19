package com.sonymobile.scan3d.viewer.asynctasks;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class ImproveTask extends AsyncTask<Uri, Void, Void> {
    private static final String TAG = "com.sonymobile.scan3d.viewer.asynctasks.ImproveTask";
    private static final String WHERE = "improvement_type=? AND parent_id=?";
    private final WeakReference<Context> mContext;
    private final String mType;

    public ImproveTask(Context context, String str) {
        this.mContext = new WeakReference<>(context);
        this.mType = str;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Void doInBackground(Uri... uriArr) {
        IFileSet iFileSetCreate;
        Uri uri = uriArr[0];
        Context context = this.mContext.get();
        if (context == null || (iFileSetCreate = Factory.create(context, uri)) == null || !iFileSetCreate.isImprovable(context)) {
            return null;
        }
        ContentResolver contentResolver = context.getContentResolver();
        deleteImprovement(contentResolver, iFileSetCreate);
        ContentValues contentValues = new ContentValues(4);
        contentValues.put("parent_id", Long.valueOf(iFileSetCreate.getId()));
        contentValues.put(Contract.ImprovementRecord.COLUMN_IMPROVEMENT_TYPE, this.mType);
        contentValues.put("name", iFileSetCreate.getName());
        contentValues.put("scan_type", Integer.valueOf(iFileSetCreate.getScanType()));
        Uri uriInsert = contentResolver.insert(Contract.ImprovementRecord.CONTENT_URI, contentValues);
        DebugLog.d(TAG, "Created improvement uri " + uriInsert);
        if (uriInsert == null || Jobs.requestInitImprovementJob(context, uriInsert)) {
            return null;
        }
        DebugLog.d(TAG, "Job could not be posted.");
        deleteImprovement(contentResolver, iFileSetCreate);
        return null;
    }

    private void deleteImprovement(ContentResolver contentResolver, IFileSet iFileSet) {
        contentResolver.delete(Contract.ImprovementRecord.CONTENT_URI, WHERE, new String[]{this.mType, String.valueOf(iFileSet.getId())});
    }
}
