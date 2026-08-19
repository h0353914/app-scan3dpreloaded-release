package com.sonymobile.scan3d.viewer.fragments;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.ContextThemeWrapper;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.upload.ListenableDialogFragment;

/* JADX INFO: loaded from: classes2.dex */
public class DataPermissionFragment extends ListenableDialogFragment<Integer> {
    public static final int GENERIC_RESULT = 0;

    public static DataPermissionFragment newInstance(int i) {
        Bundle bundle = new Bundle();
        bundle.putInt("id", i);
        DataPermissionFragment dataPermissionFragment = new DataPermissionFragment();
        dataPermissionFragment.setArguments(bundle);
        return dataPermissionFragment;
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        return new AlertDialog.Builder(new ContextThemeWrapper(getActivity(), R.style.SphinxAppTheme_OnboardingScreen_Dialog)).setTitle(R.string.attention_dialog_title_txt).setMessage(R.string.dialog_data_traffic_body).setPositiveButton(R.string.dialog_allow_button, new DialogInterface.OnClickListener() {
            final DataPermissionFragment f$0 = DataPermissionFragment.this; // from class: com.sonymobile.scan3d.viewer.fragments.-$$Lambda$DataPermissionFragment$n5nyXijG134ZGi1y3THCtT-3O5I
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.onSuccess(0);
            }
        }).setNegativeButton(R.string.dialog_deny_button, new DialogInterface.OnClickListener() {
            final DataPermissionFragment f$0 = DataPermissionFragment.this; // from class: com.sonymobile.scan3d.viewer.fragments.-$$Lambda$DataPermissionFragment$LPmHu0bCL24-g4HdEYYDjrabQ7s
            @Override // android.content.DialogInterface.OnClickListener
            public final void onClick(DialogInterface dialogInterface, int i) {
                this.f$0.onFailure(0);
            }
        }).create();
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        onFailure(0);
    }
}
