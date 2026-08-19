package com.sonymobile.scan3d.viewer;

import android.R;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.appcompat.app.AlertDialog;
import androidx.core.view.KeyEventDispatcher;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentActivity;
import androidx.lifecycle.LifecycleOwner;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class YesNoQuestionFragment extends DialogFragment {
    private static final String ARG_COOKIE = "cookie";
    private static final String ARG_NEGATIVE_BUTTON = "negative_button";
    private static final String ARG_POSITIVE_BUTTON = "positive_button";
    private static final String ARG_QUESTION = "question";
    private static final String ARG_QUESTION_ID = "id";
    private static final String ARG_QUESTION_PARAMS = "question_params";
    private static final String ARG_TITLE = "title";
    private static final int NO_TITLE = 0;
    private OnYesNoListener mListener;

    public interface OnYesNoListener {
        void onNegativeAnswer(int i, Parcelable parcelable);

        void onPositiveAnswer(int i, Parcelable parcelable);
    }

    public static YesNoQuestionFragment newInstance(int i, @StringRes int i2, @StringRes int i3, ArrayList<String> arrayList, @StringRes int i4, @StringRes int i5, Parcelable parcelable) {
        Bundle bundle = new Bundle();
        bundle.putInt("id", i);
        bundle.putInt(ARG_TITLE, i2);
        bundle.putInt(ARG_QUESTION, i3);
        bundle.putStringArrayList(ARG_QUESTION_PARAMS, arrayList);
        bundle.putInt(ARG_POSITIVE_BUTTON, i4);
        bundle.putInt(ARG_NEGATIVE_BUTTON, i5);
        bundle.putParcelable(ARG_COOKIE, parcelable);
        YesNoQuestionFragment yesNoQuestionFragment = new YesNoQuestionFragment();
        yesNoQuestionFragment.setArguments(bundle);
        return yesNoQuestionFragment;
    }

    public static YesNoQuestionFragment newInstance(int i, @StringRes int i2, @StringRes int i3, @StringRes int i4, @StringRes int i5, Parcelable parcelable) {
        return newInstance(i, i2, i3, null, i4, i5, parcelable);
    }

    public static YesNoQuestionFragment newInstance(int i, @StringRes int i2, @StringRes int i3, @StringRes int i4, Parcelable parcelable) {
        return newInstance(i, i2, i3, i4, R.string.cancel, parcelable);
    }

    public static YesNoQuestionFragment newInstance(int i, @StringRes int i2, @StringRes int i3) {
        return newInstance(i, 0, i2, i3, null);
    }

    @Override // androidx.fragment.app.DialogFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        KeyEventDispatcher.Component activity = getActivity();
        LifecycleOwner targetFragment = getTargetFragment();
        if (targetFragment instanceof OnYesNoListener) {
            this.mListener = (OnYesNoListener) targetFragment;
        } else if (activity instanceof OnYesNoListener) {
            this.mListener = (OnYesNoListener) activity;
        }
    }

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    public Dialog onCreateDialog(Bundle bundle) {
        FragmentActivity activity = getActivity();
        activity.setTheme(com.sonymobile.scan3d.R.style.SphinxAppCompactTheme);
        int titleResource = getTitleResource();
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        if (titleResource != 0) {
            builder.setTitle(titleResource);
        }
        builder.setMessage(getQuestionResource());
        builder.setPositiveButton(getPositiveTextResource(), new DialogInterface.OnClickListener() { // from class: com.sonymobile.scan3d.viewer.YesNoQuestionFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (YesNoQuestionFragment.this.mListener != null) {
                    YesNoQuestionFragment.this.mListener.onPositiveAnswer(YesNoQuestionFragment.this.getQuestionId(), YesNoQuestionFragment.this.getCookie());
                }
            }
        });
        builder.setNegativeButton(getNegativeTextResource(), new DialogInterface.OnClickListener() { // from class: com.sonymobile.scan3d.viewer.YesNoQuestionFragment.2
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                if (YesNoQuestionFragment.this.mListener != null) {
                    YesNoQuestionFragment.this.mListener.onNegativeAnswer(YesNoQuestionFragment.this.getQuestionId(), YesNoQuestionFragment.this.getCookie());
                }
            }
        });
        return builder.show();
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialogInterface) {
        this.mListener = null;
        super.onDismiss(dialogInterface);
    }

    private int getQuestionId() {
        return getArguments().getInt("id");
    }

    private String getQuestionResource() {
        ArrayList<String> stringArrayList = getArguments().getStringArrayList(ARG_QUESTION_PARAMS);
        if (stringArrayList != null) {
            int resourceArgument = getResourceArgument(ARG_QUESTION);
            Object[] objArr = new Object[3];
            objArr[0] = stringArrayList.get(0);
            objArr[1] = stringArrayList.size() > 1 ? stringArrayList.get(1) : "";
            objArr[2] = stringArrayList.size() > 2 ? stringArrayList.get(2) : "";
            return getString(resourceArgument, objArr);
        }
        return getString(getResourceArgument(ARG_QUESTION));
    }

    private int getTitleResource() {
        return getResourceArgument(ARG_TITLE);
    }

    private int getPositiveTextResource() {
        return getResourceArgument(ARG_POSITIVE_BUTTON);
    }

    private int getNegativeTextResource() {
        return getResourceArgument(ARG_NEGATIVE_BUTTON);
    }

    private int getResourceArgument(String str) {
        return getArguments().getInt(str);
    }

    private Parcelable getCookie() {
        return getArguments().getParcelable(ARG_COOKIE);
    }
}
