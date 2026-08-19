package com.sonymobile.scan3d.viewer;

import android.annotation.SuppressLint;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.text.method.LinkMovementMethod;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.appcompat.app.AlertDialog;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.utils.LinkUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public abstract class PrivacyFragment extends DialogFragment {
    protected abstract String getApplicationName();

    protected abstract String getPrivacyLink();

    @StringRes
    protected int getPrivacyTextId() {
        return R.string.consent_share_privacy_policy;
    }

    protected void onNegativeAnswer() {
    }

    protected abstract void onPositiveAnswer();

    @Override // androidx.fragment.app.DialogFragment
    @NonNull
    @SuppressLint({"InflateParams"})
    public Dialog onCreateDialog(Bundle bundle) {
        View viewInflate = LayoutInflater.from(getContext()).inflate(R.layout.dialog_message_layout, (ViewGroup) null, false);
        TextView textView = (TextView) viewInflate.findViewById(R.id.message);
        String privacyLink = getPrivacyLink();
        final Uri uri = privacyLink != null ? Uri.parse(privacyLink) : null;
        Object[] objArr = new Object[2];
        objArr[0] = getApplicationName();
        objArr[1] = uri != null ? "linkText1" : "";
        textView.setText(LinkUtil.createClickableLink(getContext(), getPrivacyTextId(), objArr, new UserInputReducer.InputReducer[]{view -> lambda$onCreateDialog$0(this, uri, view)}));
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        FragmentActivity activity = getActivity();
        activity.setTheme(R.style.SphinxAppCompactDialog);
        AlertDialog.Builder builder = new AlertDialog.Builder(activity);
        builder.setTitle(getTitle());
        builder.setView(viewInflate);
        builder.setPositiveButton(android.R.string.ok, (dialogInterface, i) -> lambda$onCreateDialog$1(this, dialogInterface, i));
        builder.setNegativeButton(android.R.string.cancel, (dialogInterface, i) -> lambda$onCreateDialog$2(this, dialogInterface, i));
        return builder.create();
    }

    public static /* synthetic */ void lambda$onCreateDialog$0(PrivacyFragment privacyFragment, Uri uri, View view) {
        if (uri != null) {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(uri);
            privacyFragment.startActivity(intent);
        }
    }

    public static /* synthetic */ void lambda$onCreateDialog$1(PrivacyFragment privacyFragment, DialogInterface dialogInterface, int i) {
        privacyFragment.onPositiveAnswer();
        privacyFragment.dismiss();
    }

    public static /* synthetic */ void lambda$onCreateDialog$2(PrivacyFragment privacyFragment, DialogInterface dialogInterface, int i) {
        privacyFragment.onNegativeAnswer();
        privacyFragment.dismiss();
    }

    private String getTitle() {
        return getContext().getResources().getString(R.string.consent_share_partner_title, getApplicationName());
    }
}
