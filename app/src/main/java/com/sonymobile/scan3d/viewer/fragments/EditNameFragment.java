package com.sonymobile.scan3d.viewer.fragments;

import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputFilter;
import android.text.TextWatcher;
import android.view.MotionEvent;
import android.view.View;
import android.view.Window;
import android.widget.EditText;
import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.viewer.OnNameChangedListener;

/* JADX INFO: loaded from: classes2.dex */
public class EditNameFragment extends DialogFragment implements TextWatcher {
    private static final String ARG_MAX_LENGTH = "maxlen";
    private static final String ARG_TEXT = "text";
    private static final String ARG_TITLE = "title";
    private static final String EMPTY_STRING = "";
    private String mCurrentText;

    @Override // android.text.TextWatcher
    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    @Override // android.text.TextWatcher
    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    public static EditNameFragment newInstance(String str, @StringRes int i, int i2, Fragment fragment) {
        if (fragment != null && !(fragment instanceof OnNameChangedListener)) {
            throw new IllegalArgumentException("Target fragment must implement onNameChangedListener");
        }
        Bundle bundle = new Bundle();
        bundle.putString(ARG_TEXT, str);
        bundle.putInt(ARG_TITLE, i);
        if (i2 > 0) {
            bundle.putInt(ARG_MAX_LENGTH, i2);
        }
        EditNameFragment editNameFragment = new EditNameFragment();
        editNameFragment.setArguments(bundle);
        if (fragment != null) {
            editNameFragment.setTargetFragment(fragment, 0);
        }
        return editNameFragment;
    }

    public static EditNameFragment newInstance(String str, @StringRes int i, Fragment fragment) {
        return newInstance(str, i, 0, fragment);
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        if (getTargetFragment() == null && !(getActivity() instanceof OnNameChangedListener)) {
            throw new IllegalStateException("Neither activity nor target fragment are implementing onNameChangedListener");
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        FragmentActivity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactTheme);
        AlertDialog alertDialogShow = new AlertDialog.Builder(activity).setTitle(getArguments().getInt(ARG_TITLE)).setView(R.layout.edit_text_dialog).setPositiveButton(android.R.string.ok, (dialogInterface, i) -> getListener().onNameChanged(this.mCurrentText)).setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null).show();
        String string = getArguments().getString(ARG_TEXT, "");
        int i = getArguments().getInt(ARG_MAX_LENGTH, 0);
        EditText editText = (EditText) alertDialogShow.findViewById(R.id.edit_text);
        if (i > 0) {
            string = string.substring(0, i);
            editText.setFilters(new InputFilter[]{new InputFilter.LengthFilter(i)});
        }
        editText.addTextChangedListener(this);
        editText.setText(string);
        editText.setSelection(editText.getText().length());
        editText.setOnTouchListener((view, motionEvent) -> {
            boolean z = true;
            if (motionEvent.getAction() != 1) {
                return false;
            }
            EditText touchedEditText = (EditText) view;
            if (getContext().getResources().getConfiguration().getLayoutDirection() == 1) {
                if (motionEvent.getX() >= touchedEditText.getCompoundPaddingEnd()) {
                    z = false;
                }
            } else if (motionEvent.getX() <= touchedEditText.getWidth() - touchedEditText.getCompoundPaddingEnd()) {
                z = false;
            }
            if (z) {
                touchedEditText.setText("");
            }
            return false;
        });
        Window window = alertDialogShow.getWindow();
        if (window != null) {
            window.setSoftInputMode(5);
        }
        return alertDialogShow;
    }

    private OnNameChangedListener getListener() {
        if (getTargetFragment() == null) {
            return (OnNameChangedListener) getActivity();
        }
        return (OnNameChangedListener) getTargetFragment();
    }

    @Override // android.text.TextWatcher
    public final void afterTextChanged(Editable editable) {
        this.mCurrentText = editable.toString();
    }
}
