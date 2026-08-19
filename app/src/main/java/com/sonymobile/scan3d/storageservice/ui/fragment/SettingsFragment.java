package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.app.ActionBar;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceManager;
import com.sonymobile.scan3d.BuildConfig;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.Sphinx;
import com.sonymobile.scan3d.utils.LinkUtil;
import com.sonymobile.scan3d.viewer.YesNoQuestionFragment;
import java.util.Map;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public class SettingsFragment extends PreferenceFragmentCompat implements YesNoQuestionFragment.OnYesNoListener {
    private static final String DIALOG_TAG = "clear_calibration_tag";
    private static final String PREFERENCE_BACKUP = "preference_backup";
    private static final int QUESTION_ID_CLEAR_CALIB = 1;
    private int mClicksLeft = 5;

    @Override // androidx.preference.PreferenceFragmentCompat
    public void onCreatePreferences(Bundle bundle, String str) {
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onNegativeAnswer(int i, Parcelable parcelable) {
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        getActivity().setTheme(R.style.SphinxAppCompactTheme);
        SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(getActivity());
        final SharedPreferences.Editor editorEdit = defaultSharedPreferences.edit();
        boolean z = defaultSharedPreferences.getBoolean(getString(R.string.pref_key_dev_enabled), false);
        addPreferencesFromResource(R.xml.gallery_settings);
        findPreference(getString(R.string.pref_ca_privacy_notice)).setVisible(LinkUtil.isUSVariant());
        findPreference(getString(R.string.pref_key_version)).setSummary(BuildConfig.VERSION_NAME);
        if (z) {
            enableDeveloperMenu();
        } else {
            findPreference(getString(R.string.pref_key_version)).setOnPreferenceClickListener(preference -> {
                this.mClicksLeft--;
                if (this.mClicksLeft == 0) {
                    enableDeveloperMenu();
                    editorEdit.putBoolean(getString(R.string.pref_key_dev_enabled), true).apply();
                }
                return true;
            });
        }
        findPreference(getString(R.string.pref_calib_reset)).setOnPreferenceClickListener(preference -> {
            FragmentManager fragmentManager = getFragmentManager();
            YesNoQuestionFragment yesNoQuestionFragmentNewInstance = YesNoQuestionFragment.newInstance(1, R.string.dialog_remove_camera_calibration_title, R.string.dialog_remove_camera_calibration_txt);
            yesNoQuestionFragmentNewInstance.setTargetFragment(this, 0);
            yesNoQuestionFragmentNewInstance.show(fragmentManager, DIALOG_TAG);
            return true;
        });
        setHasOptionsMenu(true);
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 16908332) {
            getFragmentManager().popBackStack();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ActionBar actionBar = getActivity().getActionBar();
        if (actionBar != null) {
            actionBar.setTitle(R.string.gallery_settings_text);
            actionBar.setHomeButtonEnabled(true);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
        return super.onCreateView(layoutInflater, viewGroup, bundle);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.preference.PreferenceManager.OnPreferenceTreeClickListener
    public boolean onPreferenceTreeClick(Preference preference) {
        String key = preference.getKey();
        Context context = getContext();
        if (getString(R.string.pref_key_open_source).equals(key)) {
            OpenSourceFragment openSourceFragment = new OpenSourceFragment();
            FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
            fragmentTransactionBeginTransaction.setCustomAnimations(android.R.animator.fade_in, android.R.animator.fade_out);
            fragmentTransactionBeginTransaction.replace(R.id.content, openSourceFragment);
            fragmentTransactionBeginTransaction.addToBackStack(null);
            fragmentTransactionBeginTransaction.commit();
            return true;
        }
        if (getString(R.string.pref_key_clear_preferences).equals(key)) {
            saveAndClearPreferences(PreferenceManager.getDefaultSharedPreferences(context), context.getSharedPreferences(PREFERENCE_BACKUP, 0));
            Toast.makeText(context, R.string.pref_clear_prefs_toast, 0).show();
            getActivity().finish();
            return true;
        }
        if (getString(R.string.pref_key_restore_preferences).equals(key)) {
            SharedPreferences defaultSharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
            SharedPreferences sharedPreferences = context.getSharedPreferences(PREFERENCE_BACKUP, 0);
            if (sharedPreferences.getAll().size() > 0) {
                saveAndClearPreferences(sharedPreferences, defaultSharedPreferences);
                Toast.makeText(context, R.string.pref_restore_prefs_toast, 0).show();
                getActivity().finish();
            } else {
                Toast.makeText(context, R.string.pref_restore_prefs_fail_toast, 1).show();
            }
            return true;
        }
        if (getString(R.string.pref_ca_privacy_notice).equals(key)) {
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse(getString(R.string.us_ca_privacy_policy_url)));
            startActivity(intent);
            return true;
        }
        return super.onPreferenceTreeClick(preference);
    }

    private void enableDeveloperMenu() {
        addPreferencesFromResource(R.xml.dev_preferences);
        findPreference(getString(R.string.pref_key_settings)).setOnPreferenceClickListener(preference -> {
            Intent intent = new Intent("android.settings.APPLICATION_DETAILS_SETTINGS");
            intent.setPackage("com.android.settings");
            intent.setData(Uri.parse("package:" + getContext().getPackageName()));
            getContext().startActivity(intent);
            return true;
        });
    }

    private void saveAndClearPreferences(SharedPreferences sharedPreferences, SharedPreferences sharedPreferences2) {
        Map<String, ?> all = sharedPreferences.getAll();
        SharedPreferences.Editor editorEdit = sharedPreferences2.edit();
        for (Map.Entry<String, ?> entry : all.entrySet()) {
            putObject(editorEdit, entry.getKey(), entry.getValue());
        }
        editorEdit.apply();
        sharedPreferences.edit().clear().apply();
    }

    private void putObject(SharedPreferences.Editor editor, String str, Object obj) {
        if (obj instanceof String) {
            editor.putString(str, (String) obj);
            return;
        }
        if (obj instanceof Set) {
            editor.putStringSet(str, (Set) obj);
            return;
        }
        if (obj instanceof Integer) {
            editor.putInt(str, ((Integer) obj).intValue());
            return;
        }
        if (obj instanceof Long) {
            editor.putLong(str, ((Long) obj).longValue());
        } else if (obj instanceof Float) {
            editor.putFloat(str, ((Float) obj).floatValue());
        } else if (obj instanceof Boolean) {
            editor.putBoolean(str, ((Boolean) obj).booleanValue());
        }
    }

    @Override // com.sonymobile.scan3d.viewer.YesNoQuestionFragment.OnYesNoListener
    public void onPositiveAnswer(int i, Parcelable parcelable) {
        if (i == 1) {
            Sphinx.resetCameraCalibration();
        }
    }
}
