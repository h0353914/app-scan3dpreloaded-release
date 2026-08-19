package com.sonymobile.scan3d.viewer.fragments;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.ContentValues;
import android.content.DialogInterface;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputFilter;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.FileTasks;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;

/* JADX INFO: loaded from: classes2.dex */
public class ScanAddedFragment extends DialogFragment implements DialogInterface.OnClickListener {
    private static final String KEY_ARG_PARENT_NAME = "parent_name";
    private static final String KEY_ARG_URI = "uri";
    private EditText mNameText;

    public static ScanAddedFragment newInstance(Uri uri, Fragment fragment) {
        return newInstance(uri, fragment, null);
    }

    public static ScanAddedFragment newInstance(Uri uri, Fragment fragment, String str) {
        if (!(fragment instanceof OnNameChangedListener)) {
            throw new IllegalArgumentException("target fragment must implement onNameChangedListener");
        }
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_ARG_URI, uri);
        bundle.putString(KEY_ARG_PARENT_NAME, str);
        ScanAddedFragment scanAddedFragment = new ScanAddedFragment();
        scanAddedFragment.setArguments(bundle);
        scanAddedFragment.setTargetFragment(fragment, 0);
        return scanAddedFragment;
    }

    public ScanAddedFragment() {
        setCancelable(false);
    }

    @Override // androidx.fragment.app.DialogFragment
    @SuppressLint({"InflateParams"})
    public Dialog onCreateDialog(Bundle bundle) {
        FragmentActivity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactTheme);
        View viewInflate = activity.getLayoutInflater().inflate(R.layout.feedback_dialog_layout, (ViewGroup) null);
        this.mNameText = (EditText) viewInflate.findViewById(R.id.name_text);
        String string = getArguments().getString(KEY_ARG_PARENT_NAME);
        if (!TextUtils.isEmpty(string)) {
            int max = 0;
            for (InputFilter inputFilter : this.mNameText.getFilters()) {
                if (inputFilter instanceof InputFilter.LengthFilter) {
                    max = ((InputFilter.LengthFilter) inputFilter).getMax();
                }
            }
            if (string.length() > max) {
                string = string.substring(0, max);
            }
            this.mNameText.setText(string);
            this.mNameText.setSelection(string.length());
        }
        AlertDialog.Builder negativeButton = new AlertDialog.Builder(activity).setView(viewInflate).setPositiveButton(android.R.string.ok, this).setNegativeButton(android.R.string.cancel, this);
        if (getResources().getConfiguration().orientation == 1) {
            negativeButton.setTitle(R.string.dialog_newscan_title);
        }
        AlertDialog alertDialogCreate = negativeButton.create();
        alertDialogCreate.getWindow().setSoftInputMode(5);
        return alertDialogCreate;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        if (i != -1) {
            return;
        }
        FragmentActivity activity = getActivity();
        Uri uri = (Uri) getArguments().getParcelable(KEY_ARG_URI);
        String name = getName();
        ContentValues contentValues = new ContentValues(2);
        contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
        contentValues.put("name", name);
        FileTasks.update(activity, uri, contentValues, true);
        ((OnNameChangedListener) getTargetFragment()).onNameChanged(name);
    }

    private String getName() {
        String string = this.mNameText.getText().toString();
        return TextUtils.isEmpty(string) ? getString(R.string.file_set_no_name) : string;
    }
}
