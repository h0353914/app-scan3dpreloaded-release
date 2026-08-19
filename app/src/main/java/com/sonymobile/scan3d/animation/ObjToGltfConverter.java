package com.sonymobile.scan3d.animation;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.net.Uri;
import android.os.Bundle;

import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.viewer.SphanRenderer;

public class ObjToGltfConverter {

    public static native boolean convert(String objPath, String texturePath, String outputPath, String tempPath, SphanRenderer renderer);

    public static native void createPreview(String objPath, String texturePath, String outputPath, SphanRenderer renderer);

    public static void showConversionFailedDialog(Fragment targetFragment, FragmentManager fragmentManager, Uri uri) {
        ErrorDialog dialog = ErrorDialog.newInstance(uri);
        dialog.setTargetFragment(targetFragment, 0);
        dialog.show(fragmentManager, null);
    }

    public interface GltfConversionListener {
        void onConversionDone(Uri uri);

        void onConversionFailed(Uri uri);
    }

    public static class ErrorDialog extends DialogFragment {
        private static final String KEY_URI = "URI";

        public static ErrorDialog newInstance(Uri uri) {
            Bundle args = new Bundle();
            ErrorDialog dialog = new ErrorDialog();
            args.putParcelable(KEY_URI, uri);
            dialog.setArguments(args);
            return dialog;
        }

        private void sendDismissDialogToTarget() {
            Fragment target = getTargetFragment();
            try {
                ErrorDialogListener listener = (ErrorDialogListener) target;
                Uri uri = (Uri) getArguments().getParcelable(KEY_URI);
                listener.onConvertErrorDialogDismiss(this, uri);
            } catch (ClassCastException e) {
                throw new ClassCastException(target.toString() + "must implement ErrorDialogListener");
            }
        }

        @Override
        public void onCancel(DialogInterface dialog) {
            super.onCancel(dialog);
            sendDismissDialogToTarget();
        }

        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
            builder.setTitle(R.string.cannot_animate_title);
            builder.setMessage(R.string.animation_rigging_failure);
            builder.setPositiveButton(R.string.dialog_break_scanning_ok, (dialog, which) -> sendDismissDialogToTarget());
            AlertDialog alertDialog = builder.create();
            alertDialog.setCanceledOnTouchOutside(true);
            return alertDialog;
        }

        public interface ErrorDialogListener {
            void onConvertErrorDialogDismiss(DialogFragment dialog, Uri uri);
        }
    }
}
