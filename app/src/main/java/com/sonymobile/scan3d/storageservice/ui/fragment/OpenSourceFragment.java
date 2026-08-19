package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.app.ActionBar;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import androidx.fragment.app.FragmentTransaction;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragmentCompat;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class OpenSourceFragment extends PreferenceFragmentCompat {
    @Override // androidx.preference.PreferenceFragmentCompat
    public void onCreatePreferences(Bundle bundle, String str) {
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
        addPreferencesFromResource(R.xml.about_open_source_licenses);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        ActionBar actionBar = getActivity().getActionBar();
        if (actionBar != null) {
            actionBar.setTitle(R.string.about_open_source);
            actionBar.setHomeButtonEnabled(true);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
        return super.onCreateView(layoutInflater, viewGroup, bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 16908332) {
            getFragmentManager().popBackStack();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.preference.PreferenceManager.OnPreferenceTreeClickListener
    public boolean onPreferenceTreeClick(Preference preference) {
        int i;
        String key = preference.getKey();
        int i2 = 0;
        if (getString(R.string.pref_key_ceres_solver).equals(key)) {
            i2 = R.string.title_license_ceres_solver;
            i = R.string.text_license_ceres_solver;
        } else if (getString(R.string.pref_key_dlib).equals(key)) {
            i2 = R.string.title_license_dlib;
            i = R.string.text_license_dlib;
        } else if (getString(R.string.pref_key_eigen).equals(key)) {
            i2 = R.string.title_license_eigen;
            i = R.string.text_license_mpl2;
        } else if (getString(R.string.pref_key_lua).equals(key)) {
            i2 = R.string.title_license_lua;
            i = R.string.text_license_lua;
        } else if (getString(R.string.pref_key_mindroid).equals(key)) {
            i2 = R.string.title_license_mindroid;
            i = R.string.text_license_mindroid;
        } else if (getString(R.string.pref_key_minizip).equals(key)) {
            i2 = R.string.title_license_minizip;
            i = R.string.text_license_minizip;
        } else if (getString(R.string.pref_key_opencv).equals(key)) {
            i2 = R.string.title_license_opencv;
            i = R.string.text_license_opencv;
        } else if (getString(R.string.pref_key_pugixml).equals(key)) {
            i2 = R.string.title_license_pugixml;
            i = R.string.text_license_pugixml;
        } else if (getString(R.string.pref_key_boost).equals(key)) {
            i2 = R.string.title_license_boost;
            i = R.string.text_license_boost;
        } else if (getString(R.string.pref_key_loki).equals(key)) {
            i2 = R.string.title_license_loki;
            i = R.string.text_license_loki;
        } else if (getString(R.string.pref_key_xmltojson).equals(key)) {
            i2 = R.string.title_license_xmltojson;
            i = R.string.text_license_xmltojson;
        } else if (getString(R.string.pref_key_poly2tri).equals(key)) {
            i2 = R.string.title_license_poly2tri;
            i = R.string.text_license_poly2tri;
        } else if (getString(R.string.pref_key_jpeg).equals(key)) {
            i2 = R.string.title_license_jpeg;
            i = R.string.text_license_jpeg;
        } else {
            i = 0;
        }
        openLicense(i2, i);
        return true;
    }

    private void openLicense(int i, int i2) {
        Bundle bundle = new Bundle();
        bundle.putInt("KEY_LICENSE_TITLE", i);
        bundle.putInt("KEY_LICENSE_TEXT", i2);
        LicenseFragment licenseFragment = new LicenseFragment();
        licenseFragment.setArguments(bundle);
        FragmentTransaction fragmentTransactionBeginTransaction = getFragmentManager().beginTransaction();
        fragmentTransactionBeginTransaction.setCustomAnimations(android.R.animator.fade_in, android.R.animator.fade_out);
        fragmentTransactionBeginTransaction.replace(R.id.content, licenseFragment, LicenseFragment.class.getName());
        fragmentTransactionBeginTransaction.addToBackStack(null);
        fragmentTransactionBeginTransaction.commit();
    }
}
