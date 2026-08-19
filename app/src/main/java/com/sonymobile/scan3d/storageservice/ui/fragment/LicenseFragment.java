package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.app.ActionBar;
import android.os.Bundle;
import android.text.Html;
import android.text.method.ScrollingMovementMethod;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class LicenseFragment extends Fragment {
    static final String KEY_LICENSE_TEXT = "KEY_LICENSE_TEXT";
    static final String KEY_LICENSE_TITLE = "KEY_LICENSE_TITLE";

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        Bundle arguments = getArguments();
        TextView textView = (TextView) layoutInflater.inflate(R.layout.component_license, viewGroup, false);
        textView.setText(Html.fromHtml(getString(arguments.getInt(KEY_LICENSE_TEXT)), 0));
        textView.setMovementMethod(new ScrollingMovementMethod());
        ActionBar actionBar = getActivity().getActionBar();
        if (actionBar != null) {
            actionBar.setTitle(arguments.getInt(KEY_LICENSE_TITLE));
            actionBar.setHomeButtonEnabled(true);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
        return textView;
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 16908332) {
            getFragmentManager().popBackStack();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }
}
