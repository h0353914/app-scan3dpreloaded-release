package com.sonymobile.scan3d.viewer;

import android.R;
import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.fragment.app.DialogFragment;

/* JADX INFO: loaded from: classes.dex */
public abstract class ErrorDialogFragment extends DialogFragment {
    @StringRes
    protected abstract int getMessage();

    @StringRes
    protected int getNegativeButton() {
        return R.string.cancel;
    }

    @StringRes
    protected int getPositiveButton() {
        return R.string.ok;
    }

    @StringRes
    protected abstract int getProviderName();

    @StringRes
    protected abstract int getTitle();

    protected abstract void onPositiveAnswer();

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    @SuppressLint({"InflateParams"})
    public Dialog onCreateDialog(Bundle bundle) {
        View viewInflate = LayoutInflater.from(getContext()).inflate(com.sonymobile.scan3d.R.layout.dialog_message_layout, (ViewGroup) null, false);
        ((TextView) viewInflate.findViewById(com.sonymobile.scan3d.R.id.message)).setText(String.format(getString(getMessage()), getString(getProviderName())));
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setTitle(getTitle());
        builder.setView(viewInflate);
        if (getPositiveButton() != 0) {
            builder.setPositiveButton(getPositiveButton(), new DialogInterface.OnClickListener() {
            final ErrorDialogFragment f$0 = ErrorDialogFragment.this; // from class: com.sonymobile.scan3d.viewer.-$$Lambda$ErrorDialogFragment$g-LxVSz4X6Zzva1OQf_RXi4JCjE
                @Override // android.content.DialogInterface.OnClickListener
                public final void onClick(DialogInterface dialogInterface, int i) {
                    this.f$0.onPositiveAnswer();
                }
            });
        }
        if (getNegativeButton() != 0) {
            builder.setNegativeButton(getNegativeButton(), (DialogInterface.OnClickListener) null);
        }
        return builder.create();
    }
}
