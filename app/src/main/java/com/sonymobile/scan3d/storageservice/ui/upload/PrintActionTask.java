package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import com.sonymobile.scan3d.NativeEGL;
import com.sonymobile.scan3d.PrintExecution;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.viewer.ModelContainer;
import java.io.File;

/* JADX INFO: loaded from: classes.dex */
public abstract class PrintActionTask extends ActionTask {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.ui.upload.PrintActionTask";

    public abstract ActionTask.ActionResult execute(Context context, Action action, IFileSet iFileSet, Credentials credentials, File file, PrintSelection printSelection);

    public PrintActionTask(ServiceProvider serviceProvider, IFileSet iFileSet, Credentials credentials, Action action, Uri uri, Bundle bundle) {
        super(serviceProvider, iFileSet, credentials, action, uri, bundle);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ActionTask
    public final ActionTask.ActionResult execute(Context context, Action action, IFileSet iFileSet, Credentials credentials, Bundle bundle) {
        File fileSavePrint;
        int iOrdinal = 1;
        PrintSelection printSelection = (PrintSelection) bundle.getParcelable(PrintSelection.SELECTION_KEY_PARCELABLE);
        long jCreateContext = NativeEGL.createContext(null, true);
        ActionTask.ActionResult actionResult = new ActionTask.ActionResult(false, null);
        try {
            fileSavePrint = savePrint(context, iFileSet, printSelection);
        } catch (Throwable th2) {
            fileSavePrint = null;
            NativeEGL.destroyContext(jCreateContext);
            if (fileSavePrint != null && !fileSavePrint.delete()) {
                DebugLog.d(TAG, "Failed to delete print file.");
            }
            throw th2;
        }
        try {
            if (printSelection != null && printSelection.getPrintType() != null) {
                iOrdinal = printSelection.getPrintType().ordinal();
            }
            String serviceProviderName = getServiceProvider().getServiceProviderName(context);
            if (fileSavePrint != null && fileSavePrint.exists()) {
                HitEvent.PRINTING_UPLOAD_STARTED.send(context, serviceProviderName, iOrdinal);
                actionResult = execute(context, action, iFileSet, credentials, fileSavePrint, printSelection);
            }
            if (actionResult.success()) {
                HitEvent.PRINTING_UPLOAD_SUCCEEDED.send(context, serviceProviderName, iOrdinal);
            } else {
                HitEvent.PRINTING_UPLOAD_FAILED.send(context, serviceProviderName, iOrdinal);
            }
        } catch (Throwable th) {
            NativeEGL.destroyContext(jCreateContext);
            if (fileSavePrint != null && !fileSavePrint.delete()) {
                DebugLog.d(TAG, "Failed to delete print file.");
            }
            throw th;
        }
        NativeEGL.destroyContext(jCreateContext);
        if (fileSavePrint != null && !fileSavePrint.delete()) {
            DebugLog.d(TAG, "Failed to delete print file.");
        }
        return actionResult;
    }

    private File savePrint(Context context, IFileSet iFileSet, PrintSelection printSelection) {
        String strGenerateRandomFileName = FsUtils.generateRandomFileName(FsUtils.ZIP_SUFFIX);
        File file = new File(iFileSet.getZipFileUrl());
        File file2 = new File(file.getParent(), strGenerateRandomFileName);
        if (file.exists()) {
            applyPrintSelection(context, printSelection, file, file2);
        }
        return file2;
    }

    private void applyPrintSelection(Context context, PrintSelection printSelection, File file, File file2) {
        String path = file.getPath();
        ServiceProvider serviceProvider = getServiceProvider();
        ModelContainer modelContainer = new ModelContainer();
        if (modelContainer.importZip(path, Vault.getPassword(context))) {
            PrintExecution.apply(context, modelContainer, file2, printSelection, serviceProvider.getCoordSystem(), serviceProvider.getSupportedModelFormat() == 1, serviceProvider.getSupportedTextureFormat() == 101);
        }
        modelContainer.release();
    }
}
