package com.sonymobile.scan3d.viewer.sharing;

import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toolbar;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentPagerAdapter;
import androidx.viewpager.widget.ViewPager;
import com.sonymobile.scan3d.OnBackPressListener;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.viewer.MeshHolderFragment;
import com.sonymobile.scan3d.viewer.ModelContainer;
import com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment;
import com.sonymobile.scan3d.viewer.sharing.tabs.TabPagePrint;
import com.sonymobile.scan3d.viewer.sharing.tabs.TabPageShare;

/* JADX INFO: loaded from: classes2.dex */
public class SharingFragment extends BaseViewerFragment implements OnBackPressListener, MeshHolderFragment.MeshLoadingListener {
    private static final String KEY_SHAREABLE = "shareable";
    private static final String KEY_TAB = "tab";
    private static final String KEY_VIEW_MATRIX = "view_matrix";
    private static final String LAST_TAB = "last_tab";
    private int mLastTab = -1;
    private MeshHolderFragment mMeshHolderFragment;

    public enum Tab {
        SHARE,
        PRINT
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public int getContentLayout() {
        return R.layout.fragment_scan_sharing;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment
    public String getTitleText() {
        return "";
    }

    public static String tabToString(Tab tab) {
        switch (tab) {
            case PRINT:
                return "Print";
            case SHARE:
                return "Share";
            default:
                return "Not Valid Tab";
        }
    }

    public static SharingFragment newInstance(IFileSet iFileSet, float[] fArr, Tab tab) {
        return newInstance(iFileSet, fArr, tab, null);
    }

    public static SharingFragment newInstance(Shareable shareable) {
        return newInstance(shareable.getFileSet(), shareable.getViewMatrix(), Tab.SHARE, shareable);
    }

    private static SharingFragment newInstance(IFileSet iFileSet, float[] fArr, Tab tab, Shareable shareable) {
        Bundle bundle = new Bundle();
        bundle.putFloatArray(KEY_VIEW_MATRIX, fArr);
        bundle.putSerializable(KEY_TAB, tab);
        if (shareable == null) {
            shareable = new Shareable();
            shareable.setFileSet(iFileSet).setShareType(Shareable.Type.DEFAULT).setScanFormat(0).setViewMatrix(fArr);
        }
        bundle.putBundle("shareable", shareable.toBundle());
        SharingFragment sharingFragment = new SharingFragment();
        sharingFragment.setArguments(bundle);
        return sharingFragment;
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    @Nullable
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        if (bundle != null) {
            this.mLastTab = bundle.getInt(LAST_TAB);
        }
        this.mMeshHolderFragment = MeshHolderFragment.getInstance(getActivity());
        this.mMeshHolderFragment.setMeshLoadingListener(this);
        return viewOnCreateView;
    }

    @Override // androidx.fragment.app.Fragment
    public void onViewCreated(View view, @Nullable Bundle bundle) {
        super.onViewCreated(view, bundle);
        if (new Shareable((Bundle) getArguments().getParcelable("shareable")).getScanFormat() == 1) {
            view.findViewById(R.id.tab_layout).setVisibility(8);
        }
    }

    @Override // com.sonymobile.scan3d.viewer.fragments.BaseViewerFragment, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putInt(LAST_TAB, this.mLastTab);
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoaded(Uri uri, ModelContainer modelContainer) {
        if (isAdded()) {
            ViewPager viewPager = (ViewPager) getView().findViewById(R.id.pager);
            ((Toolbar) getView().findViewById(R.id.toolbar)).setTitle(this.mMeshHolderFragment.getName());
            SharingPagerAdapter sharingPagerAdapter = new SharingPagerAdapter(getChildFragmentManager());
            viewPager.setAdapter(sharingPagerAdapter);
            int pageNumber = this.mLastTab;
            if (pageNumber < 0) {
                pageNumber = sharingPagerAdapter.getPageNumber((Tab) getArguments().getSerializable(KEY_TAB));
            }
            viewPager.setCurrentItem(pageNumber);
            SlidingTabLayout slidingTabLayout = (SlidingTabLayout) getView().findViewById(R.id.tab_layout);
            slidingTabLayout.setViewPager(viewPager);
            slidingTabLayout.setCustomTabView(R.layout.sharing_tab_item, R.id.text);
            slidingTabLayout.setSelectedIndicatorColors(getContext().getColor(R.color.primary_color_light));
            slidingTabLayout.setDividerColors(getContext().getColor(R.color.toolbar_background));
            dismissProgressDialog();
        }
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoadFailed(Uri uri) {
        handleFailedMesh();
    }

    @Override // com.sonymobile.scan3d.viewer.MeshHolderFragment.MeshLoadingListener
    public void onMeshLoading(Uri uri) {
        showProgressDialog(R.string.saving_print_geometry, false);
    }

    private class SharingPagerAdapter extends FragmentPagerAdapter {
        private Tab[] mTabs;

        SharingPagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
            if (new Shareable(SharingFragment.this.getArguments().getBundle("shareable")).getScanFormat() == 1) {
                this.mTabs = new Tab[]{Tab.SHARE};
            } else {
                this.mTabs = new Tab[]{Tab.SHARE, Tab.PRINT};
            }
        }

        @Override // androidx.fragment.app.FragmentPagerAdapter
        public Fragment getItem(int i) {
            int scanPolicyMode = SharingFragment.this.mMeshHolderFragment.getScanPolicyMode();
            Shareable shareable = new Shareable(SharingFragment.this.getArguments().getBundle("shareable"));
            IFileSet fileSet = shareable.getFileSet();
            switch (this.mTabs[i]) {
                case PRINT:
                    return TabPagePrint.newInstance(fileSet, scanPolicyMode);
                case SHARE:
                    return TabPageShare.newInstance(fileSet, scanPolicyMode, SharingFragment.this.getArguments().getFloatArray(SharingFragment.KEY_VIEW_MATRIX), shareable);
                default:
                    throw new IllegalStateException("Unsupported tab " + this.mTabs[i]);
            }
        }

        @Override // androidx.fragment.app.FragmentPagerAdapter, androidx.viewpager.widget.PagerAdapter
        public void setPrimaryItem(ViewGroup viewGroup, int i, Object obj) {
            if (SharingFragment.this.mLastTab == i) {
                return;
            }
            SharingFragment.this.mLastTab = i;
            HitEvent.SHARING_TAB_CLICKED.send(SharingFragment.this.getContext(), SharingFragment.tabToString(this.mTabs[i]), i);
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return this.mTabs.length;
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public CharSequence getPageTitle(int i) {
            switch (this.mTabs[i]) {
                case PRINT:
                    return SharingFragment.this.getString(R.string.share_tab_print);
                case SHARE:
                    return SharingFragment.this.getString(R.string.share_tab_share);
                default:
                    throw new IllegalStateException("Failed to get title for tab " + this.mTabs[i]);
            }
        }

        int getPageNumber(Tab tab) {
            int i = 0;
            while (true) {
                Tab[] tabArr = this.mTabs;
                if (i < tabArr.length) {
                    if (tabArr[i] == tab) {
                        return i;
                    }
                    i++;
                } else {
                    throw new IllegalStateException("Failed to find a tab " + tab);
                }
            }
        }
    }
}
