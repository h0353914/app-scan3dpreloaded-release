package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.LinearInterpolator;
import android.view.animation.OvershootInterpolator;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.annotation.DrawableRes;
import androidx.annotation.IntRange;
import androidx.annotation.Nullable;
import androidx.annotation.StringRes;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.ScanTutorial;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class SelectScanModeFragment extends DialogFragment {

    public interface IScanChoiceListener {
        void onScanModeSelected(DialogFragment dialogFragment, ScanMode scanMode);

        void onSelectScanModeDialogDismissed();

        void onTutorialSelected(ScanTutorial scanTutorial);
    }

    public enum ScanMode {
        FACE_SCAN(ScanTutorial.FACE, R.drawable.scan_choice_face, R.string.dialog_scan_mode_face_scan_title, R.string.dialog_scan_mode_face_scan_description),
        FOOD_SCAN(ScanTutorial.FOOD, R.drawable.scan_choice_food, R.string.dialog_scan_mode_food_scan_title, R.string.dialog_scan_mode_food_scan_description),
        SELFIE_SCAN(ScanTutorial.SELFIE, R.drawable.scan_choice_selfie, R.string.dialog_scan_mode_selfie_scan_title, R.string.dialog_scan_mode_selfie_scan_description),
        HEAD_SCAN(ScanTutorial.HEAD, R.drawable.scan_choice_head, R.string.dialog_scan_mode_head_scan_title, R.string.dialog_scan_mode_head_scan_description),
        ADV_SCAN(ScanTutorial.ADVANCE, R.drawable.scan_choice_freeform, R.string.dialog_scan_mode_adv_scan_title, R.string.dialog_scan_mode_adv_scan_description);


        @StringRes
        private final int mDescription;

        @DrawableRes
        private final int mImage;

        @StringRes
        private final int mTitle;
        private final ScanTutorial mTutorial;

        public boolean isEnabled(Context context) {
            return true;
        }

        public boolean isTutorialEnabled(Context context) {
            return true;
        }

        ScanMode(@StringRes ScanTutorial scanTutorial, @StringRes int i, int i2, int i3) {
            this.mTutorial = scanTutorial;
            this.mImage = i;
            this.mTitle = i2;
            this.mDescription = i3;
        }

        public ScanTutorial getTutorial() {
            return this.mTutorial;
        }

        @DrawableRes
        public int getImage() {
            return this.mImage;
        }

        @StringRes
        public int getTitle() {
            return this.mTitle;
        }

        @StringRes
        public int getDescription() {
            return this.mDescription;
        }
    }

    public static SelectScanModeFragment newInstance(Fragment fragment) {
        if (!(fragment instanceof IScanChoiceListener)) {
            throw new IllegalArgumentException("Target fragment must implement IScanChoiceListener");
        }
        SelectScanModeFragment selectScanModeFragment = new SelectScanModeFragment();
        selectScanModeFragment.setTargetFragment(fragment, 0);
        return selectScanModeFragment;
    }

    @Override // androidx.fragment.app.DialogFragment
    public Dialog onCreateDialog(Bundle bundle) {
        return new Dialog(getContext(), R.style.SelectScanModeDialog);
    }

    @Override // androidx.fragment.app.DialogFragment, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialogInterface) {
        ((IScanChoiceListener) getTargetFragment()).onSelectScanModeDialogDismissed();
        super.onDismiss(dialogInterface);
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.dialog_scan_mode, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, Bundle bundle) {
        super.onViewCreated(view, bundle);
        ViewPager viewPager = (ViewPager) view.findViewById(R.id.view_pager);
        viewPager.setPageTransformer(true, new ScalePageTransformer());
        viewPager.setOffscreenPageLimit(2);
        viewPager.setOverScrollMode(2);
        viewPager.setAdapter(new FragmentPagerAdapter(getChildFragmentManager(), 1) { // from class: com.sonymobile.scan3d.storageservice.ui.fragment.SelectScanModeFragment.1
            @Override // androidx.fragment.app.FragmentPagerAdapter
            public Fragment getItem(int i) {
                return ScanModeItemFragment.newInstance(SelectScanModeFragment.this.reverseIndexIfRtl(i));
            }

            @Override // androidx.viewpager.widget.PagerAdapter
            public int getCount() {
                return ScanMode.values().length;
            }
        });
        viewPager.setCurrentItem(reverseIndexIfRtl(getLastUsedScanMode()));
        View viewFindViewById = view.findViewById(R.id.selection_fab);
        viewFindViewById.setOnClickListener(view2 -> dismiss());
        if (bundle == null) {
            View viewFindViewById2 = getView().findViewById(R.id.view_pager_layout);
            viewFindViewById2.setAlpha(0.0f);
            viewFindViewById2.animate().alpha(1.0f).setInterpolator(new LinearInterpolator()).start();
            viewFindViewById.animate().rotationBy(360.0f).setDuration(1000L).setInterpolator(new OvershootInterpolator()).start();
        }
    }

    private int reverseIndexIfRtl(@IntRange(from = 0) int i) {
        return getContext().getResources().getConfiguration().getLayoutDirection() == 1 ? (ScanMode.values().length - i) - 1 : i;
    }

    private int getLastUsedScanMode() {
        try {
            return ScanMode.valueOf(PreferenceManager.getDefaultSharedPreferences(getContext()).getString(getString(R.string.pref_key_last_scan_mode), "")).ordinal();
        } catch (IllegalArgumentException unused) {
            return 0;
        }
    }

    public static class ScanModeItemFragment extends Fragment {
        private static final String ARG_POSITION = "position";
        private int mPosition;
        private ScanMode mScanMode;

        public static ScanModeItemFragment newInstance(int i) {
            ScanModeItemFragment scanModeItemFragment = new ScanModeItemFragment();
            Bundle bundle = new Bundle();
            bundle.putInt(ARG_POSITION, i);
            scanModeItemFragment.setArguments(bundle);
            return scanModeItemFragment;
        }

        @Override // androidx.fragment.app.Fragment
        public void onCreate(Bundle bundle) {
            super.onCreate(bundle);
            this.mPosition = getArguments().getInt(ARG_POSITION);
        }

        @Override // androidx.fragment.app.Fragment
        public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
            return layoutInflater.inflate(R.layout.item_scan_mode, viewGroup, false);
        }

        @Override // androidx.fragment.app.Fragment
        public void onViewCreated(View view, Bundle bundle) {
            super.onViewCreated(view, bundle);
            this.mScanMode = ScanMode.values()[this.mPosition];
            ((ImageView) view.findViewById(R.id.image)).setImageResource(this.mScanMode.getImage());
            ((TextView) view.findViewById(R.id.title)).setText(this.mScanMode.getTitle());
            ((TextView) view.findViewById(R.id.description)).setText(this.mScanMode.getDescription());
        }

        @Override // androidx.fragment.app.Fragment
        public void onResume() {
            super.onResume();
            if (this.mScanMode.getTutorial() != null) {
                View viewFindViewById = getView().findViewById(R.id.btn_view_tutorial);
                viewFindViewById.setEnabled(this.mScanMode.isTutorialEnabled(getContext()));
                viewFindViewById.setOnClickListener(view -> {
                    saveSelectedScanMode(this.mScanMode);
                    ((IScanChoiceListener) ((DialogFragment) getParentFragment()).getTargetFragment()).onTutorialSelected(this.mScanMode.getTutorial());
                });
            }
            View viewFindViewById2 = getView().findViewById(R.id.btn_start_scan);
            boolean zIsEnabled = this.mScanMode.isEnabled(getContext());
            viewFindViewById2.setEnabled(zIsEnabled);
            if (zIsEnabled) {
                viewFindViewById2.setOnClickListener(view -> {
                    saveSelectedScanMode(this.mScanMode);
                    DialogFragment dialogFragment = (DialogFragment) getParentFragment();
                    ((IScanChoiceListener) dialogFragment.getTargetFragment()).onScanModeSelected(dialogFragment, this.mScanMode);
                });
            }
        }

        private void saveSelectedScanMode(ScanMode scanMode) {
            PreferenceManager.getDefaultSharedPreferences(getContext()).edit().putString(getString(R.string.pref_key_last_scan_mode), scanMode.name()).apply();
        }
    }

    private static class ScalePageTransformer implements ViewPager.PageTransformer {
        private static final float MIN_SCALE = 0.8f;

        private ScalePageTransformer() {
        }

        @Override // androidx.viewpager.widget.ViewPager.PageTransformer
        public void transformPage(View view, float f) {
            float fAbs = MIN_SCALE;
            if (f >= -1.0f && f <= 1.0f) {
                fAbs = MIN_SCALE + ((1.0f - Math.abs(f)) * 0.19999999f);
            }
            view.setScaleX(fAbs);
            view.setScaleY(fAbs);
        }
    }
}
