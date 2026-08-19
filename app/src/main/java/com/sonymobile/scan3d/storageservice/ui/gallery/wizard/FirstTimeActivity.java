package com.sonymobile.scan3d.storageservice.ui.gallery.wizard;

import android.os.Bundle;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.android.vending.expansion.zipfile.ZipResourceFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.ZipResourceManager;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.FullscreenVideoTipFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.SequenceTipFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.VideoTipFragmentOwner;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import java.util.List;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

/* JADX INFO: loaded from: classes.dex */
public class FirstTimeActivity extends FragmentActivity implements VideoTipFragmentOwner, ZipResourceManager.ZipResourceFileListener {
    public static final String EXTRA_CATEGORY = "com.sonymobile.scan3d.extras.TIP_CATEGORY";
    public static final String EXTRA_HAS_RUN = "com.sonymobile.scan3d.extras.HAS_RUN";
    private TipCategory mCategory;
    private final Executor mExecutor = Executors.newSingleThreadExecutor();
    private ViewPager mPager;
    private boolean mRTLDirection;

    public interface PageListener {
        void onPageSelected(boolean z);
    }

    private static class TipAdapter extends FragmentStatePagerAdapter {
        private boolean mHasRun;
        private SparseArray<PageListener> mListeners;
        private final List<Tip> mTips;
        private ZipResourceFile mZipResourceFile;

        TipAdapter(FragmentManager fragmentManager, List<Tip> list, boolean z, ZipResourceFile zipResourceFile) {
            super(fragmentManager, 1);
            this.mTips = list;
            this.mListeners = new SparseArray<>(this.mTips.size());
            this.mHasRun = z;
            this.mZipResourceFile = zipResourceFile;
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter
        public Fragment getItem(int i) {
            Tip tip = this.mTips.get(i);
            switch (tip.getType()) {
                case 3:
                    return FullscreenVideoTipFragment.newInstance(tip, this.mZipResourceFile);
                case 4:
                    return SequenceTipFragment.newInstance(tip, this.mHasRun, i, this.mTips.size(), this.mZipResourceFile);
                default:
                    return TipFragment.newInstance(tip, this.mZipResourceFile);
            }
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return this.mTips.size();
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public void setPrimaryItem(@NonNull ViewGroup viewGroup, int i, @NonNull Object obj) {
            super.setPrimaryItem(viewGroup, i, obj);
            notifySelected(false, i - 1);
            notifySelected(true, i);
            notifySelected(false, i + 1);
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        @NonNull
        public Object instantiateItem(@NonNull ViewGroup viewGroup, int i) {
            Object objInstantiateItem = super.instantiateItem(viewGroup, i);
            if (objInstantiateItem instanceof PageListener) {
                this.mListeners.append(i, (PageListener) objInstantiateItem);
            }
            return objInstantiateItem;
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public void destroyItem(@NonNull ViewGroup viewGroup, int i, @NonNull Object obj) {
            super.destroyItem(viewGroup, i, obj);
            if (obj instanceof PageListener) {
                this.mListeners.delete(i);
            }
        }

        private void notifySelected(boolean z, int i) {
            PageListener pageListener = this.mListeners.get(i);
            if (pageListener != null) {
                pageListener.onPageSelected(z);
            }
        }
    }

    private void setUIFlags() {
        getWindow().getDecorView().setSystemUiVisibility(5894);
    }

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setContentView(R.layout.first_time_tutorial_activity);
        this.mRTLDirection = getResources().getConfiguration().getLayoutDirection() == 1;
        setUIFlags();
        TipCategory tipCategory = (TipCategory) getIntent().getParcelableExtra("com.sonymobile.scan3d.extras.TIP_CATEGORY");
        if (tipCategory != null) {
            this.mCategory = tipCategory;
        }
        ZipResourceManager.getInstance().addZipResourceFileListener(this);
        if (bundle != null || tipCategory == null) {
            return;
        }
        ScreenEvent.SCREEN_EVENT_FROM_REFERENS_ID.send(this, tipCategory.getScreenEvent());
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        setUIFlags();
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onStop() {
        super.onStop();
        ZipResourceManager.getInstance().removeZipResourceFileListener(this);
    }

    @Override // androidx.activity.ComponentActivity, android.app.Activity
    public void onBackPressed() {
        setResult(0);
        finish();
    }

    public void onStartTutorialScan(View view) {
        setResult(-1);
        finish();
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.VideoTipFragmentOwner
    public void onVideoFinished() {
        int i = this.mRTLDirection ? -1 : 1;
        ViewPager viewPager = this.mPager;
        viewPager.setCurrentItem(viewPager.getCurrentItem() + i, true);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.VideoTipFragmentOwner
    public Executor getVideoExecutor() {
        return this.mExecutor;
    }

    @Override // com.sonymobile.scan3d.ZipResourceManager.ZipResourceFileListener
    public void onZipResourceLoaded() {
        if (this.mCategory != null) {
            boolean booleanExtra = getIntent().getBooleanExtra(EXTRA_HAS_RUN, false);
            this.mPager = (ViewPager) findViewById(R.id.view_pager);
            TipAdapter tipAdapter = new TipAdapter(getSupportFragmentManager(), this.mCategory.getTips(), booleanExtra, ZipResourceManager.getZipResourceFile());
            this.mPager.setAdapter(tipAdapter);
            if (this.mRTLDirection) {
                this.mPager.setCurrentItem(tipAdapter.getCount() - 1);
                return;
            }
            return;
        }
        throw new IllegalArgumentException("No tip category added.");
    }
}
