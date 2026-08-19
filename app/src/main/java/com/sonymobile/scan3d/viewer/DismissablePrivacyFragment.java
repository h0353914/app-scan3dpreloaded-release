package com.sonymobile.scan3d.viewer;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.TextView;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public abstract class DismissablePrivacyFragment extends DialogFragment {
    public static final String ARG_CHECKBOX_KEY = "checkbox_pref";
    public static final String ARG_SHAREABLE = "shareable";
    private CheckBox mCheckBox;

    protected abstract String getDescription();

    protected abstract String getTitle();

    protected abstract void onPositiveAnswer();

    @Override // androidx.fragment.app.DialogFragment
    @SuppressLint({"InflateParams"})
    public Dialog onCreateDialog(Bundle bundle) {
        View viewInflate = LayoutInflater.from(getContext()).inflate(R.layout.share_as_dialog_content, (ViewGroup) null, false);
        this.mCheckBox = (CheckBox) viewInflate.findViewById(R.id.checkbox);
        ((TextView) viewInflate.findViewById(R.id.dialog_message)).setText(getDescription());
        FragmentActivity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactDialog);
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle(getTitle());
        builder.setView(viewInflate);
        builder.setPositiveButton(android.R.string.ok, new DialogInterface.OnClickListener() {
            final DismissablePrivacyFragment f$0 = DismissablePrivacyFragment.this; // from class: com.sonymobile.scan3d.viewer.-$$Lambda$DismissablePrivacyFragment$Kmf7V1OwUVf4QZBmxWTxfkhyy6o
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                DismissablePrivacyFragment.lambda$onCreateDialog$0(this.f$0, dialogInterface, i);
            }
        });
        builder.setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null);
        return builder.create();
    }

    public static /* synthetic */ void lambda$onCreateDialog$0(DismissablePrivacyFragment dismissablePrivacyFragment, DialogInterface dialogInterface, int i) {
        if (dismissablePrivacyFragment.mCheckBox.isChecked()) {
            PreferenceManager.getDefaultSharedPreferences(dismissablePrivacyFragment.getContext()).edit().putBoolean(dismissablePrivacyFragment.getArguments().getString(ARG_CHECKBOX_KEY), true).apply();
        }
        dismissablePrivacyFragment.onPositiveAnswer();
        dismissablePrivacyFragment.dismiss();
    }
}
