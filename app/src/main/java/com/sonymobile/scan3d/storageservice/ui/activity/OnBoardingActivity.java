package com.sonymobile.scan3d.storageservice.ui.activity;

import android.content.Intent;
import android.os.Bundle;
import android.preference.PreferenceManager;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.Scan3DApp;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.storageservice.ui.component.OnBoardingIndicatorControl;
import com.sonymobile.scan3d.storageservice.ui.fragment.OnBoardingItemFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.OnCloseListener;
import com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener;
import com.sonymobile.scan3d.utils.SystemUtils;
import com.sonymobile.scan3d.viewer.fragments.DataPermissionFragment;

/* JADX INFO: loaded from: classes.dex */
public class OnBoardingActivity extends FragmentActivity implements OnCloseListener, IStatusListener {
    private static final int DATA_DIALOG_ID = 1000;

    public enum OnBoarding {
        CREATE(R.drawable.onboarding_create, R.string.onboarding_create_title, R.string.onboarding_create_description),
        SHARE(R.drawable.onboarding_share, R.string.onboarding_share_title, R.string.onboarding_share_description);

        final int mDescription;
        final int mImage;
        final int mTitle;

        OnBoarding(int i, int i2, int i3) {
            this.mImage = i;
            this.mTitle = i2;
            this.mDescription = i3;
        }

        public int getImage() {
            return this.mImage;
        }

        public int getTitle() {
            return this.mTitle;
        }

        public int getDescription() {
            return this.mDescription;
        }

        static OnBoarding getItem(int i) {
            return values()[i];
        }
    }

    private static class OnBoardingAdapter extends FragmentStatePagerAdapter {
        private boolean mRTLDirection;

        OnBoardingAdapter(FragmentManager fragmentManager, boolean z) {
            super(fragmentManager, 1);
            this.mRTLDirection = z;
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter
        public Fragment getItem(int i) {
            if (this.mRTLDirection) {
                i = (getCount() - 1) - i;
            }
            return OnBoardingItemFragment.newInstance(OnBoarding.getItem(i));
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return OnBoarding.values().length;
        }
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!Scan3DApp.isPartOfBetaProgram(this)) {
            finish();
            return;
        }
        boolean z = PreferenceManager.getDefaultSharedPreferences(this).getBoolean(getString(R.string.pref_key_show_onboarding), true);
        if (SystemUtils.showCtaNotification(this)) {
            DataPermissionFragment.newInstance(1000).show(getSupportFragmentManager(), DataPermissionFragment.class.toString());
            z = true;
        }
        if (z) {
            setContentView(R.layout.activity_onboarding);
            getWindow().getDecorView().setSystemUiVisibility(1792);
            ViewPager viewPager = (ViewPager) findViewById(R.id.view_pager);
            boolean z2 = getApplicationContext().getResources().getConfiguration().getLayoutDirection() == 1;
            viewPager.setAdapter(new OnBoardingAdapter(getSupportFragmentManager(), z2));
            ((OnBoardingIndicatorControl) findViewById(R.id.indicator)).setOnCloseListener(this);
            if (z2) {
                viewPager.setCurrentItem(viewPager.getAdapter().getCount() - 1);
            }
            ScreenEvent.ONBOARDING.send(this);
            return;
        }
        close();
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.OnCloseListener
    public void onClose() {
        PreferenceManager.getDefaultSharedPreferences(this).edit().putBoolean(getString(R.string.pref_key_show_onboarding), false).apply();
        close();
    }

    private void close() {
        if ("android.intent.action.MAIN".equals(getIntent().getAction())) {
            Intent intent = new Intent(this, (Class<?>) GalleryActivity.class);
            intent.setFlags(268468224);
            startActivity(intent);
        }
        finish();
        overridePendingTransition(0, android.R.anim.fade_out);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onSuccess(int i, Object obj) {
        if (i == 1000) {
            PreferenceManager.getDefaultSharedPreferences(this).edit().putBoolean(getString(R.string.pref_key_show_cta_notification), false).apply();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onFailure(int i, int i2) {
        if (i == 1000) {
            finish();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onDismiss(int i) {
        if (i == 1000) {
            finish();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.IStatusListener
    public void onCancel(int i) {
        if (i == 1000) {
            finish();
        }
    }
}
