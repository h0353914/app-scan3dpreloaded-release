package com.sonymobile.scan3d;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import androidx.appcompat.app.AlertDialog;
import androidx.core.view.KeyEventDispatcher;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentActivity;

public class BreakScanningDialog extends DialogFragment implements DialogInterface.OnClickListener {
    private static final String ARG_BUTTON_ID = "button_id";
    private static final String ARG_MESSAGE_ID = "message_id";
    private static final int NO_TITLE = 0;
    private OnBadStartListener mListener;

    public interface OnBadStartListener {
        void onCancelScanClicked();

        void onRestartScanClicked(boolean z);
    }

    public static BreakScanningDialog newInstance(int i, int i2) {
        Bundle bundle = new Bundle();
        bundle.putInt(ARG_MESSAGE_ID, i);
        bundle.putInt(ARG_BUTTON_ID, i2);
        BreakScanningDialog breakScanningDialog = new BreakScanningDialog();
        breakScanningDialog.setArguments(bundle);
        return breakScanningDialog;
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        KeyEventDispatcher.Component activity = getActivity();
        if (activity instanceof OnBadStartListener) {
            this.mListener = (OnBadStartListener) activity;
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        FragmentActivity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactTheme);
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setMessage(getMessage());
        if (4 == getButtonId()) {
            builder.setPositiveButton(R.string.dialog_break_scanning_ok, this);
        } else {
            builder.setPositiveButton(R.string.dialog_break_scanning_restart_scan, this);
        }
        int title = getTitle();
        if (title != 0) {
            builder.setTitle(title);
        }
        setCancelable(false);
        AlertDialog alertDialogCreate = builder.create();
        alertDialogCreate.setCanceledOnTouchOutside(false);
        alertDialogCreate.getWindow().addFlags(8);
        alertDialogCreate.setOnShowListener(dialogInterface -> {
            getDialog().getWindow().getDecorView().setSystemUiVisibility(getActivity().getWindow().getDecorView().getSystemUiVisibility());
            getDialog().getWindow().clearFlags(8);
        });
        return alertDialogCreate;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        if (this.mListener != null) {
            if (4 == getButtonId()) {
                this.mListener.onCancelScanClicked();
            }
            this.mListener.onRestartScanClicked(true);
        }
        dismiss();
    }

    int getMessage() {
        switch (getResourceArgument(ARG_MESSAGE_ID)) {
            case 0:
                return R.string.dialog_break_scanning_hint_too_hot_message;
            case 1:
                return R.string.dialog_break_scanning_hint_low_battery_message;
            case 2:
                return R.string.dialog_break_scanning_hint_low_storage_message;
            default:
                return R.string.dialog_break_scanning_restart_scanning_message;
        }
    }

    int getTitle() {
        switch (getResourceArgument(ARG_MESSAGE_ID)) {
            case 0:
                return R.string.dialog_break_scanning_hint_too_hot_title;
            case 1:
                return R.string.dialog_break_scanning_hint_low_battery_title;
            case 2:
                return R.string.dialog_break_scanning_hint_low_storage_title;
            default:
                return 0;
        }
    }

    private int getButtonId() {
        return getResourceArgument(ARG_BUTTON_ID);
    }

    private int getResourceArgument(String str) {
        return getArguments().getInt(str);
    }
}
