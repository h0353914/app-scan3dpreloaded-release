package com.sonymobile.scan3d.editor;

import android.os.Bundle;

import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentTransaction;

import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.viewer.ModelContainer;

public class EditorActivity extends FragmentActivity {
    public static final String EXTRA_FACE_DETECTED = "face_detected";
    public static final String EXTRA_MODEL = "model";
    public static final String EXTRA_NAME = "name";

    private OnBackPressListener mOnBackPressListener;

    private void showFragment(Fragment fragment) {
        getSupportFragmentManager().beginTransaction()
                .setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE)
                .replace(R.id.fragment_container, fragment)
                .commit();
    }

    @Override
    public void onAttachFragment(Fragment fragment) {
        super.onAttachFragment(fragment);
        if (fragment instanceof OnBackPressListener) {
            mOnBackPressListener = (OnBackPressListener) fragment;
        }
    }

    @Override
    public void onBackPressed() {
        if (mOnBackPressListener != null && mOnBackPressListener.onBackPressed()) {
            return;
        }
        super.onBackPressed();
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_editor);
        if (savedInstanceState == null) {
            ModelContainer model = getIntent().getParcelableExtra(EXTRA_MODEL);
            String name = getIntent().getStringExtra(EXTRA_NAME);
            boolean faceDetected = getIntent().getBooleanExtra(EXTRA_FACE_DETECTED, true);
            Fragment fragment = EditorFragment.newInstance(model, name, faceDetected);
            showFragment(fragment);
        }
    }
}
