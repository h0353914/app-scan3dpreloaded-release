package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.annotation.DrawableRes;
import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.appcompat.app.AlertDialog;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class InfoFragment extends ListenableDialogFragment<String> {
    private static final String KEY_DESCRIPTION_TEXT = "description_text";
    private static final String KEY_LOGO = "logo";
    private static final String KEY_NEGATIVE_BUTTON_TEXT = "negative_button_text";
    private static final String KEY_POSITIVE_BUTTON_TEXT = "positive_button_text";
    private static final String KEY_TITLE_TEXT = "title";
    private static final int NO_RES_ID = 0;

    public static InfoFragment newInstance(int i, @StringRes int i2, @DrawableRes int i3, @StringRes int i4, @StringRes int i5, @StringRes int i6) {
        Bundle bundle = new Bundle();
        bundle.putInt("id", i);
        bundle.putInt(KEY_TITLE_TEXT, i2);
        bundle.putInt(KEY_LOGO, i3);
        bundle.putInt(KEY_DESCRIPTION_TEXT, i4);
        bundle.putInt(KEY_POSITIVE_BUTTON_TEXT, i5);
        bundle.putInt(KEY_NEGATIVE_BUTTON_TEXT, i6);
        InfoFragment infoFragment = new InfoFragment();
        infoFragment.setArguments(bundle);
        return infoFragment;
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        Activity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactDialog);
        Bundle arguments = getArguments();
        int i = arguments.getInt(KEY_LOGO);
        int i2 = arguments.getInt(KEY_TITLE_TEXT);
        int i3 = arguments.getInt(KEY_DESCRIPTION_TEXT);
        int i4 = arguments.getInt(KEY_POSITIVE_BUTTON_TEXT);
        int i5 = arguments.getInt(KEY_NEGATIVE_BUTTON_TEXT, 0);
        AlertDialog.Builder positiveButton = new AlertDialog.Builder(activity).setTitle(i2).setIcon(i).setMessage(i3).setPositiveButton(i4, new DialogInterface.OnClickListener() { // from class: com.sonymobile.scan3d.storageservice.ui.upload.InfoFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i6) {
                InfoFragment.this.onSuccess(null);
            }
        });
        if (i5 != 0) {
            positiveButton.setNegativeButton(i5, new DialogInterface.OnClickListener() { // from class: com.sonymobile.scan3d.storageservice.ui.upload.InfoFragment.2
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialogInterface, int i6) {
                    InfoFragment.this.onCancel();
                }
            });
        }
        return positiveButton.create();
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        onDismiss();
    }
}
