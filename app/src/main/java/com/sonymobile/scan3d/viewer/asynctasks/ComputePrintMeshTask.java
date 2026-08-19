package com.sonymobile.scan3d.viewer.asynctasks;

import android.content.Context;
import android.os.AsyncTask;
import com.sonymobile.scan3d.PrintExecution;
import com.sonymobile.scan3d.PrintSelection;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.utils.PrintMaterial;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.PrintPreparationResult;

/* JADX INFO: loaded from: classes.dex */
public class ComputePrintMeshTask extends AsyncTask<Void, Void, ComputePrintMeshTask.PrintMeshLoaderResult> {
    private final ModelContainer mAltPrintModel;
    private final Context mContext;
    private final ModelContainer mModel;
    private final ModelContainer mPrintEditModel;
    private final ModelContainer mPrintModel = new ModelContainer();
    private final PrintSelection mPrintSelection;
    private final ModelContainer mSocleModel;
    private final String mZipFileUrl;

    public static class PrintMeshLoaderResult {
        public ModelContainer altPrintContainer;
        public PrintPreparationResult errorType;
        public String name;
        public ModelContainer printContainer;
        public ModelContainer printEditContainer;
        public PrintSelection printSelection;
        public ModelContainer socleContainer;
        public int textLimit;
    }

    protected ComputePrintMeshTask(Context context, PrintSelection printSelection, ModelContainer modelContainer, IFileSet iFileSet, boolean z, boolean z2) {
        this.mContext = context;
        this.mPrintSelection = printSelection.clone();
        this.mModel = modelContainer.copy();
        this.mPrintModel.copyMetadataFrom(modelContainer);
        if (z2) {
            this.mSocleModel = new ModelContainer();
            this.mPrintEditModel = new ModelContainer();
            this.mSocleModel.copyMetadataFrom(modelContainer);
            this.mPrintEditModel.copyMetadataFrom(modelContainer);
        } else {
            this.mSocleModel = null;
            this.mPrintEditModel = null;
        }
        if (z) {
            this.mAltPrintModel = new ModelContainer();
            this.mAltPrintModel.copyMetadataFrom(modelContainer);
        } else {
            this.mAltPrintModel = null;
        }
        this.mZipFileUrl = iFileSet.getZipFileUrl();
    }

    @Override // android.os.AsyncTask
    protected void onCancelled() {
        super.onCancelled();
        this.mModel.release();
        this.mPrintModel.release();
        ModelContainer modelContainer = this.mAltPrintModel;
        if (modelContainer != null) {
            modelContainer.release();
        }
        ModelContainer modelContainer2 = this.mSocleModel;
        if (modelContainer2 != null) {
            modelContainer2.release();
        }
        ModelContainer modelContainer3 = this.mPrintEditModel;
        if (modelContainer3 != null) {
            modelContainer3.release();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public PrintMeshLoaderResult doInBackground(Void... voidArr) {
        PrintMeshLoaderResult printMeshLoaderResult = new PrintMeshLoaderResult();
        printMeshLoaderResult.errorType = PrintExecution.prepare(this.mContext, this.mModel, this.mPrintModel, this.mPrintEditModel, this.mSocleModel, this.mPrintSelection, this.mZipFileUrl, 0);
        if (printMeshLoaderResult.errorType == PrintPreparationResult.SUCCESS && this.mAltPrintModel != null) {
            PrintSelection printSelectionM13clone = this.mPrintSelection.clone();
            printSelectionM13clone.setMaterial(PrintMaterial.PORCELAIN_WHITE);
            printMeshLoaderResult.errorType = PrintExecution.prepare(this.mContext, this.mModel, this.mAltPrintModel, null, null, printSelectionM13clone, this.mZipFileUrl, 0);
        }
        printMeshLoaderResult.printContainer = this.mPrintModel;
        printMeshLoaderResult.printEditContainer = this.mPrintEditModel;
        printMeshLoaderResult.socleContainer = this.mSocleModel;
        printMeshLoaderResult.altPrintContainer = this.mAltPrintModel;
        PrintSelection printSelection = this.mPrintSelection;
        printMeshLoaderResult.printSelection = printSelection;
        printMeshLoaderResult.name = printSelection.getTextOverride();
        this.mModel.release();
        return printMeshLoaderResult;
    }
}
