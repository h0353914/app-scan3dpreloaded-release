package com.sonymobile.scan3d;

import android.content.Context;

import java.io.File;

import com.sonymobile.scan3d.utils.PrintMaterial;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.PrintPreparationResult;

public final class PrintExecution {
    private static final float DEFAULT_THICKNESS = 2.0f;
    private static final String POST_LOG_FILE = "/post_log.txt";
    private static final String PRE_LOG_FILE = "/pre_log.txt";

    public static boolean apply(Context context, ModelContainer modelContainer, File file,
                                 PrintSelection printSelection, int i, boolean z, boolean z2) {
        String logPath = getLogPath(context, POST_LOG_FILE);
        ModelContainer outContainer = new ModelContainer();
        String fileName = file.getName();
        PrintPreparationResult result = prepare(modelContainer, outContainer, null, null,
                printSelection, null, logPath, fileName, 1);
        boolean success;
        if (PrintPreparationResult.SUCCESS == result) {
            boolean adjustColors = printSelection.getAdjustColors();
            float removeShadows = printSelection.getRemoveShadows();
            long nativeHandle = outContainer.getNativeHandle();
            String path = file.getPath();
            int materialType = printSelection.getMaterial().getType().ordinal();
            success = exportPrintToZip(nativeHandle, path, materialType, adjustColors, removeShadows,
                    z, z2, i, 0);
        } else {
            success = false;
        }
        outContainer.release();
        return success;
    }

    public static native boolean exportPrintToSTL(long j, String str, int i);

    public static native boolean exportPrintToZip(long j, String str, int i, boolean z, float f,
                                                    boolean z2, boolean z3, int i2, int i3);

    private static String getLogPath(Context context, String str) {
        return null;
    }

    private static PrintPreparationResult getResult(int i) {
        return PrintPreparationResult.values()[i];
    }

    public static PrintPreparationResult prepare(Context context, ModelContainer modelContainer,
                                                   ModelContainer modelContainer2, ModelContainer modelContainer3,
                                                   ModelContainer modelContainer4, PrintSelection printSelection,
                                                   String str, int i) {
        String logPath = getLogPath(context, PRE_LOG_FILE);
        return prepare(modelContainer, modelContainer2, modelContainer3, modelContainer4, printSelection,
                str, logPath, null, i);
    }

    private static PrintPreparationResult prepare(ModelContainer modelContainer, ModelContainer modelContainer2,
                                                    ModelContainer modelContainer3, ModelContainer modelContainer4,
                                                    PrintSelection printSelection, String str, String str2,
                                                    String str3, int i) {
        if (!printSelection.isValid()) {
            return getResult(PrintPreparationResult.FAIL_UNKNOWN.ordinal());
        }
        int printTypeOrdinal = printSelection.getPrintType().ordinal();
        String textOverride = printSelection.getTextOverride();
        String inscription = printSelection.getInscription();
        float metricSize = printSelection.getMetricSize();
        float[] transform = printSelection.getTransform();
        boolean shouldRecomputeHeight = printSelection.shouldRecomputeHeight();
        int materialTypeOrdinal = printSelection.getMaterial().getType().ordinal();
        float sizeConstraintMinDim = printSelection.getSizeConstraintMinDim();
        long handleD = (modelContainer4 != null) ? modelContainer4.getNativeHandle() : 0L;
        long handleC = (modelContainer3 != null) ? modelContainer3.getNativeHandle() : 0L;
        long handleA = modelContainer.getNativeHandle();
        long handleB = modelContainer2.getNativeHandle();
        boolean useColor = useColor(printSelection);
        boolean useTextColor = useTextColor(printSelection);
        int result = preparePrint(handleA, handleB, handleC, handleD, printTypeOrdinal, useColor,
                useTextColor, metricSize, shouldRecomputeHeight, textOverride, inscription, str2,
                str, transform, str3, materialTypeOrdinal, i, sizeConstraintMinDim);
        return getResult(result);
    }

    private static native int preparePrint(long j, long j2, long j3, long j4, int i, boolean z,
                                             boolean z2, float f, boolean z3, String str, String str2,
                                             String str3, String str4, float[] fArr, String str5,
                                             int i2, int i3, float f2);

    private static boolean useColor(PrintSelection printSelection) {
        return printSelection.getMaterial() == PrintMaterial.SANDSTONE_COLOUR
                || printSelection.getMaterial() == PrintMaterial.POLYJET_PLASTICS;
    }

    private static boolean useTextColor(PrintSelection printSelection) {
        return printSelection.getMaterial() != PrintMaterial.PORCELAIN_WHITE;
    }
}
