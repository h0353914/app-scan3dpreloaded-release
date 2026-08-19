package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;

/* JADX INFO: loaded from: classes.dex */
public class AboutTechFragment extends Fragment {
    public static AboutTechFragment newInstance() {
        return new AboutTechFragment();
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.wizard_fragment_about_technology, viewGroup, false);
    }
}
