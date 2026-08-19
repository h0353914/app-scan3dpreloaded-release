package com.sonymobile.scan3d.storageservice.ui.gallery.wizard.fragment;

import android.os.Bundle;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.OnCloseListener;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.OnFragmentSelectedListener;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.PagerIndicatorControl;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.ImageTipFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.SequenceTipFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.TipFragment;
import com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.YoutubeTipFragment;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.storageservice.ui.tips.TipCategory;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public class PagerFragment extends Fragment implements OnCloseListener, ViewPager.OnPageChangeListener {
    public static final String KEY_CATEGORY = "key_category";
    public static final String KEY_TIP_INDEX = "key_tip_index";
    private TipAdapter mAdapter;
    private ViewPager mPager;

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageScrolled(int i, float f, int i2) {
    }

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageSelected(int i) {
    }

    private static class TipAdapter extends FragmentStatePagerAdapter {
        private SparseArray<OnFragmentSelectedListener> mListeners;
        private final List<Tip> mTips;

        TipAdapter(FragmentManager fragmentManager, List<Tip> list) {
            super(fragmentManager, 1);
            this.mTips = list;
            this.mListeners = new SparseArray<>(this.mTips.size());
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter
        public Fragment getItem(int i) {
            Tip tip = this.mTips.get(i);
            int type = tip.getType();
            if (type != 4) {
                switch (type) {
                    case 1:
                        return ImageTipFragment.newInstance(tip);
                    case 2:
                        return YoutubeTipFragment.newInstance(tip);
                    default:
                        return TipFragment.newInstance(tip);
                }
            }
            return SequenceTipFragment.newInstance(tip);
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return this.mTips.size();
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
            super.setPrimaryItem(viewGroup, i, obj);
            notifySelected((Fragment) obj);
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public Object instantiateItem(ViewGroup viewGroup, int i) {
            Object objInstantiateItem = super.instantiateItem(viewGroup, i);
            if (objInstantiateItem instanceof OnFragmentSelectedListener) {
                this.mListeners.append(i, (OnFragmentSelectedListener) objInstantiateItem);
            }
            return objInstantiateItem;
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            super.destroyItem(viewGroup, i, obj);
            if (obj instanceof OnFragmentSelectedListener) {
                this.mListeners.delete(i);
            }
        }
        private void notifySelected(Fragment fragment) {
            if (fragment instanceof OnFragmentSelectedListener) {
                ((OnFragmentSelectedListener) fragment).onFragmentSelected(true);
            }
        }

        OnFragmentSelectedListener getFragmentSelectedListener(int i) {
            return this.mListeners.get(i, null);
        }
    }

    public static PagerFragment newInstance(TipCategory tipCategory, int i) {
        Bundle bundle = new Bundle();
        bundle.putParcelable("key_category", tipCategory);
        bundle.putInt(KEY_TIP_INDEX, i);
        PagerFragment pagerFragment = new PagerFragment();
        pagerFragment.setArguments(bundle);
        return pagerFragment;
    }

    @Override // androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View viewInflate = layoutInflater.inflate(R.layout.wizard_fragment_pager, viewGroup, false);
        ((PagerIndicatorControl) viewInflate.findViewById(R.id.indicator)).setOnCloseListener(this);
        List<Tip> tipsWithVisuals = getTipsWithVisuals((TipCategory) getArguments().getParcelable("key_category"));
        this.mPager = (ViewPager) viewInflate.findViewById(R.id.view_pager);
        this.mPager.addOnPageChangeListener(this);
        this.mAdapter = new TipAdapter(getFragmentManager(), tipsWithVisuals);
        this.mPager.setAdapter(this.mAdapter);
        int i = getArguments().getInt(KEY_TIP_INDEX, 0);
        if (i < tipsWithVisuals.size()) {
            if (getContext().getResources().getConfiguration().getLayoutDirection() == 1) {
                this.mPager.setCurrentItem((this.mAdapter.getCount() - 1) - i, false);
            } else {
                this.mPager.setCurrentItem(i, false);
            }
        }
        return viewInflate;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.gallery.wizard.OnCloseListener
    public void onClose() {
        getActivity().finish();
    }

    @Override // androidx.viewpager.widget.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int i) {
        int currentItem = this.mPager.getCurrentItem();
        if (i != 1) {
            return;
        }
        notifyUnselected(currentItem);
        notifyUnselected(currentItem - 1);
        notifyUnselected(currentItem + 1);
    }

    private void notifyUnselected(int i) {
        OnFragmentSelectedListener fragmentSelectedListener = this.mAdapter.getFragmentSelectedListener(i);
        if (fragmentSelectedListener != null) {
            fragmentSelectedListener.onFragmentSelected(false);
        }
    }

    private static List<Tip> getTipsWithVisuals(TipCategory tipCategory) {
        ArrayList arrayList = new ArrayList();
        for (Tip tip : tipCategory.getTips()) {
            if (tip.getType() > 0) {
                arrayList.add(tip);
            }
        }
        return arrayList;
    }
}
