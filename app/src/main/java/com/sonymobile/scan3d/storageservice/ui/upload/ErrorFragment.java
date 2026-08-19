package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.appcompat.app.AlertDialog;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class ErrorFragment extends ListenableDialogFragment<String> {
    private static final String ARG_MESSAGE = "message";

    public static ErrorFragment newInstance(int i, String str) {
        Bundle bundle = new Bundle();
        bundle.putInt("id", i);
        bundle.putString("message", str);
        ErrorFragment errorFragment = new ErrorFragment();
        errorFragment.setArguments(bundle);
        return errorFragment;
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        Activity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactDialog);
        return new AlertDialog.Builder(activity).setMessage(getMessage()).setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() { // from class: com.sonymobile.scan3d.storageservice.ui.upload.ErrorFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                ErrorFragment.this.onCancel();
            }
        }).create();
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        onCancel();
    }

    private String getMessage() {
        return getArguments().getString("message");
    }
}
