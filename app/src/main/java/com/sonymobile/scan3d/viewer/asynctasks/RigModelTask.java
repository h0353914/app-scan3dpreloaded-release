package com.sonymobile.scan3d.viewer.asynctasks;

import android.content.ContentValues;
import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import com.sonymobile.scan3d.NativeEGL;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.animation.ObjToGltfConverter;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.viewer.SphanRenderer;
import java.lang.ref.WeakReference;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/* JADX INFO: loaded from: classes.dex */
public class RigModelTask extends AsyncTask<Uri, Void, Boolean> {
    private WeakReference<Context> mContext;
    private WeakReference<ObjToGltfConverter.GltfConversionListener> mListener;
    private WeakReference<SphanRenderer> mSphanRenderer;
    private Uri mUri;

    public RigModelTask(Context context, ObjToGltfConverter.GltfConversionListener gltfConversionListener) {
        this.mContext = new WeakReference<>(context);
        this.mListener = new WeakReference<>(gltfConversionListener);
    }

    public RigModelTask(Context context, SphanRenderer sphanRenderer, ObjToGltfConverter.GltfConversionListener gltfConversionListener) {
        this.mContext = new WeakReference<>(context);
        this.mSphanRenderer = new WeakReference<>(sphanRenderer);
        this.mListener = new WeakReference<>(gltfConversionListener);
    }

    public void setListener(ObjToGltfConverter.GltfConversionListener gltfConversionListener) {
        this.mListener = new WeakReference<>(gltfConversionListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Boolean doInBackground(Uri... uriArr) {
        boolean zConvert;
        Context context = this.mContext.get();
        if (context == null) {
            return false;
        }
        this.mUri = uriArr[0];
        DebugLog.d(RigModelTask.class.getSimpleName(), "RigModelTask started for: " + this.mUri.toString());
        IFileSet iFileSetCreate = Factory.create(context, this.mUri);
        WeakReference<SphanRenderer> weakReference = this.mSphanRenderer;
        SphanRenderer sphanRenderer = weakReference != null ? weakReference.get() : null;
        if (iFileSetCreate != null) {
            String password = Vault.getPassword(context);
            String strCreateDateStampedBaseFileName = createDateStampedBaseFileName(FsUtils.getResultsDirectory(context, iFileSetCreate.getIdentifier()).getAbsolutePath());
            String str = strCreateDateStampedBaseFileName + ".glb.zip";
            String str2 = strCreateDateStampedBaseFileName + ".gif";
            zConvert = ObjToGltfConverter.convert(iFileSetCreate.getZipFileUrl(), password, str, password, sphanRenderer);
            if (zConvert) {
                long jCreateContext = NativeEGL.createContext(null, true);
                ObjToGltfConverter.createPreview(str, password, str2, sphanRenderer);
                NativeEGL.destroyContext(jCreateContext);
                ContentValues contentValues = new ContentValues(2);
                contentValues.put(Contract.FileRecord.COLUMN_RIGGED_SCAN_URL, str);
                contentValues.put(Contract.FileRecord.COLUMN_RIGGED_PREVIEW_URL, str2);
                context.getContentResolver().update(this.mUri, contentValues, null, null);
            } else {
                ContentValues contentValues2 = new ContentValues(1);
                contentValues2.put(Contract.FileRecord.COLUMN_IS_RIGGABLE, (Boolean) false);
                context.getContentResolver().update(this.mUri, contentValues2, null, null);
            }
        } else {
            zConvert = false;
        }
        return Boolean.valueOf(zConvert);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(Boolean bool) {
        ObjToGltfConverter.GltfConversionListener gltfConversionListener = this.mListener.get();
        if (this.mUri == null || gltfConversionListener == null) {
            return;
        }
        if (bool.booleanValue()) {
            if (this.mContext.get() != null) {
                HitEvent.RIGGING_PROCESS_COMPLETED.send(this.mContext.get());
            }
            gltfConversionListener.onConversionDone(this.mUri);
        } else {
            if (this.mContext.get() != null) {
                HitEvent.RIGGING_PROCESS_FAILED.send(this.mContext.get());
            }
            gltfConversionListener.onConversionFailed(this.mUri);
        }
    }

    private String createDateStampedBaseFileName(String str) {
        return str + "/3DCreator_" + new SimpleDateFormat("yyyyMMdd_HHmmss", Locale.US).format(new Date());
    }
}
