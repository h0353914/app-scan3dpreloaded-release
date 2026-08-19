package com.sonymobile.scan3d.viewer;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.TextView;
import androidx.annotation.Nullable;
import androidx.fragment.app.DialogFragment;
import androidx.lifecycle.LifecycleOwner;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import com.sonymobile.scan3d.utils.UserInputReducer;
import java.util.HashSet;

/* JADX INFO: loaded from: classes.dex */
public class TipDialog extends DialogFragment implements UserInputReducer.InputReducer {
    private static final String ARG_SHOW_TITLE = "show_title";
    private static final String ARG_TIP = "tip";
    private static final String ARG_TIP_CATEGORY = "tip_category";
    private CheckBox mCheckBox;

    public interface ITipDialogListener {
        void onTipNegative();

        void onTipPositive(TipCategory tipCategory, Tip tip);
    }

    public static TipDialog newInstance(TipCategory tipCategory, Tip tip, boolean z) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(ARG_TIP_CATEGORY, tipCategory);
        bundle.putParcelable(ARG_TIP, tip);
        bundle.putBoolean(ARG_SHOW_TITLE, z);
        TipDialog tipDialog = new TipDialog();
        tipDialog.setArguments(bundle);
        return tipDialog;
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        Bundle arguments = getArguments();
        TipCategory tipCategory = (TipCategory) arguments.getParcelable(ARG_TIP_CATEGORY);
        Tip tip = (Tip) arguments.getParcelable(ARG_TIP);
        switch (view.getId()) {
            case R.id.tip_dialog_button_negative /* 2131296747 */:
                getListener().onTipNegative();
                excludeTipIfNeeded();
                dismiss();
                break;
            case R.id.tip_dialog_button_positive /* 2131296748 */:
                getListener().onTipPositive(tipCategory, tip);
                excludeTipIfNeeded();
                dismiss();
                break;
        }
    }

    private ITipDialogListener getListener() {
        LifecycleOwner targetFragment = getTargetFragment();
        if (targetFragment instanceof ITipDialogListener) {
            return (ITipDialogListener) targetFragment;
        }
        throw new IllegalStateException("Target fragment should be set and implement ITipDialogListener");
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        Dialog dialog = new Dialog(getActivity(), R.style.TipDialog);
        dialog.getWindow().setGravity(80);
        return dialog;
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialogInterface) {
        super.onCancel(dialogInterface);
        getListener().onTipNegative();
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle arguments = getArguments();
        Tip tip = (Tip) arguments.getParcelable(ARG_TIP);
        View viewInflate = layoutInflater.inflate(R.layout.fragment_quick_tip_dialog, viewGroup, false);
        TextView textView = (TextView) viewInflate.findViewById(R.id.tip_dialog_description);
        this.mCheckBox = (CheckBox) viewInflate.findViewById(R.id.tip_dialog_checkbox);
        if (!tip.isExcludeable()) {
            this.mCheckBox.setVisibility(8);
        }
        Button button = (Button) viewInflate.findViewById(R.id.tip_dialog_button_positive);
        button.setOnClickListener(this);
        Button button2 = (Button) viewInflate.findViewById(R.id.tip_dialog_button_negative);
        button2.setOnClickListener(this);
        textView.setText(tip.getShortDescription());
        button.setText(tip.getPositiveButton());
        if (tip.getTitle() != 0 && arguments.getBoolean(ARG_SHOW_TITLE)) {
            TextView textView2 = (TextView) viewInflate.findViewById(R.id.tip_dialog_title);
            textView2.setText(tip.getTitle());
            textView2.setVisibility(0);
        }
        if (tip.getPositiveAction() > 0) {
            button2.setText(R.string.tip_dialog_button_skip);
        }
        return viewInflate;
    }

    private void excludeTipIfNeeded() {
        Tip tip;
        CheckBox checkBox = this.mCheckBox;
        if (checkBox == null || !checkBox.isChecked() || (tip = (Tip) getArguments().getParcelable(ARG_TIP)) == null) {
            return;
        }
        String string = getString(R.string.pref_key_excluded_tips);
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getContext());
        HashSet hashSet = new HashSet(defaultSharedPreferences.getStringSet(string, new HashSet()));
        hashSet.add(getResources().getResourceEntryName(tip.getShortDescription()));
        defaultSharedPreferences.edit().putStringSet(string, hashSet).apply();
    }
}
