package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.activity.OnBoardingActivity;

/* JADX INFO: loaded from: classes.dex */
public class OnBoardingItemFragment extends Fragment {
    private static final String KEY_CONTENT = "content";

    public static OnBoardingItemFragment newInstance(OnBoardingActivity.OnBoarding onBoarding) {
        Bundle bundle = new Bundle();
        bundle.putString("content", onBoarding.name());
        OnBoardingItemFragment onBoardingItemFragment = new OnBoardingItemFragment();
        onBoardingItemFragment.setArguments(bundle);
        return onBoardingItemFragment;
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.component_onboarding_item, viewGroup, false);
        OnBoardingActivity.OnBoarding onBoardingValueOf = OnBoardingActivity.OnBoarding.valueOf(getArguments().getString("content"));
        ((ImageView) viewInflate.findViewById(R.id.image)).setImageResource(onBoardingValueOf.getImage());
        ((TextView) viewInflate.findViewById(R.id.title)).setText(onBoardingValueOf.getTitle());
        ((TextView) viewInflate.findViewById(R.id.description)).setText(onBoardingValueOf.getDescription());
        return viewInflate;
    }
}
