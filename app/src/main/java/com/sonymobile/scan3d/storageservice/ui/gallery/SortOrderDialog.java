package com.sonymobile.scan3d.storageservice.ui.gallery;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class SortOrderDialog extends DialogFragment {
    private static final String KEY_SORT_ORDER = "KEY_SORT_ORDER";

    public interface OnSortOrderSelectionListener {
        void onSortOrderSelected(SortType sortType);
    }

    public static SortOrderDialog newInstance(SortType sortType, Fragment fragment) {
        SortOrderDialog sortOrderDialog = new SortOrderDialog();
        Bundle bundle = new Bundle();
        bundle.putInt(KEY_SORT_ORDER, sortType.ordinal());
        sortOrderDialog.setArguments(bundle);
        sortOrderDialog.setTargetFragment(fragment, 0);
        return sortOrderDialog;
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        int i = getArguments() != null ? getArguments().getInt(KEY_SORT_ORDER) : 0;
        final SortType[] sortTypeArrValues = SortType.values();
        CharSequence[] charSequenceArr = new CharSequence[sortTypeArrValues.length];
        for (int i2 = 0; i2 < charSequenceArr.length; i2++) {
            charSequenceArr[i2] = getResources().getString(sortTypeArrValues[i2].getLabelId());
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
        builder.setTitle(R.string.gallery_sort_by_text);
        builder.setSingleChoiceItems(charSequenceArr, i, new DialogInterface.OnClickListener() {
            final SortOrderDialog f$0 = SortOrderDialog.this; // from class: com.sonymobile.scan3d.storageservice.ui.gallery.-$$Lambda$SortOrderDialog$ACxhvKhr2FxsnFpr7oP4qSrkIng
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i3) {
                SortOrderDialog.lambda$onCreateDialog$0(this.f$0, sortTypeArrValues, dialogInterface, i3);
            }
        });
        builder.setNegativeButton(android.R.string.cancel, new DialogInterface.OnClickListener() { // from class: com.sonymobile.scan3d.storageservice.ui.gallery.-$$Lambda$SortOrderDialog$8fAu1Lzfsyy9XlPoeCWqAZBVPgU
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i3) {
                dialogInterface.dismiss();
            }
        });
        return builder.create();
    }

    public static /* synthetic */ void lambda$onCreateDialog$0(SortOrderDialog sortOrderDialog, SortType[] sortTypeArr, DialogInterface dialogInterface, int i) {
        if (sortOrderDialog.getTargetFragment() != null) {
            ((OnSortOrderSelectionListener) sortOrderDialog.getTargetFragment()).onSortOrderSelected(sortTypeArr[i]);
        }
        dialogInterface.dismiss();
    }
}
