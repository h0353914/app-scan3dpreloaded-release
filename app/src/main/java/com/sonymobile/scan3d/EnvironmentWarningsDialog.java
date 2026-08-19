package com.sonymobile.scan3d;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.view.KeyEvent;
import androidx.annotation.NonNull;
import androidx.core.view.KeyEventDispatcher;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentActivity;

public class EnvironmentWarningsDialog extends DialogFragment implements DialogInterface.OnClickListener {
    private OnEnvironmentWarnings mListener;

    public interface OnEnvironmentWarnings {
        void onDialogDisplayed();

        void onIgnoreWarnings();

        void onShowErrors();
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        KeyEventDispatcher.Component activity = getActivity();
        if (activity instanceof OnEnvironmentWarnings) {
            this.mListener = (OnEnvironmentWarnings) activity;
            this.mListener.onDialogDisplayed();
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        FragmentActivity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactDialog);
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle(R.string.dialog_environment_warning_title);
        builder.setMessage(R.string.dialog_environment_warning_message);
        builder.setPositiveButton(R.string.dialog_environment_warning_show_me, this);
        setCancelable(false);
        AlertDialog alertDialogCreate = builder.create();
        alertDialogCreate.setCanceledOnTouchOutside(false);
        alertDialogCreate.getWindow().setCallback(new WindowCallbackProxy(alertDialogCreate) {
            @Override // com.sonymobile.scan3d.WindowCallbackProxy, android.view.Window.Callback
            public boolean dispatchKeyEvent(KeyEvent keyEvent) {
                if (keyEvent.getKeyCode() == 80) {
                    if (keyEvent.getAction() != 0) {
                        return true;
                    }
                    EnvironmentWarningsDialog.this.mListener.onIgnoreWarnings();
                    EnvironmentWarningsDialog.this.dismiss();
                    return true;
                }
                return super.dispatchKeyEvent(keyEvent);
            }
        });
        alertDialogCreate.getWindow().addFlags(8);
        alertDialogCreate.setOnShowListener(dialogInterface -> {
            getDialog().getWindow().getDecorView().setSystemUiVisibility(getActivity().getWindow().getDecorView().getSystemUiVisibility());
            getDialog().getWindow().clearFlags(8);
        });
        return alertDialogCreate;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialogInterface, int i) {
        this.mListener.onShowErrors();
        dismiss();
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        this.mListener.onIgnoreWarnings();
    }
}
