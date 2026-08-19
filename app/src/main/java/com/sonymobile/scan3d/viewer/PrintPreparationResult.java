package com.sonymobile.scan3d.viewer;

import android.content.Context;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public enum PrintPreparationResult {
    SUCCESS(Integer.valueOf(R.string.printpreparation_success)),
    FAIL_EMPTY_MODEL(Integer.valueOf(R.string.printpreparation_empty_model)),
    FAIL_NO_CONTACT(Integer.valueOf(R.string.printpreparation_above_socle)),
    FAIL_SHELL_CALC(Integer.valueOf(R.string.printpreparation_shell_fail)),
    FAIL_TEXT(Integer.valueOf(R.string.printpreparation_text_fail)),
    FAIL_GEOMETRY(Integer.valueOf(R.string.printpreparation_geometry_fail)),
    FAIL_UNKNOWN(Integer.valueOf(R.string.printpreparation_unknown_fail));

    private final Integer mValue;

    PrintPreparationResult(Integer num) {
        this.mValue = num;
    }

    public String getString(Context context) {
        return context.getString(this.mValue.intValue());
    }
}
