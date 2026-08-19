package com.sonymobile.scan3d.viewer.sharing.tabs;

import android.content.Context;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.sharing.LocalPlugin;
import com.sonymobile.scan3d.sharing.Plugin;
import com.sonymobile.scan3d.sharing.SharingConstants;
import com.sonymobile.scan3d.sharing.SharingManager;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.ui.upload.ServiceProvider;
import com.sonymobile.scan3d.viewer.fragments.NoLocalPrintersFragment;
import com.sonymobile.scan3d.viewer.fragments.PrintPreviewFragment;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes2.dex */
public class TabPagePrint extends TabPageBase {
    private boolean mHasFacePlugins = false;

    public static TabPagePrint newInstance(IFileSet iFileSet, int i) {
        TabPagePrint tabPagePrint = new TabPagePrint();
        tabPagePrint.setArguments(getBaseArguments(iFileSet, i));
        return tabPagePrint;
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase
    protected boolean hasFacePlugins() {
        return this.mHasFacePlugins;
    }

    public static void showFragment(FragmentManager fragmentManager, PrintPreviewFragment printPreviewFragment) {
        showFragment(fragmentManager, (Fragment) printPreviewFragment);
    }

    @Override // com.sonymobile.scan3d.viewer.sharing.tabs.TabPageBase
    protected List<Plugin> getPlugins() {
        List<Plugin> list = new ArrayList<>();
        SharingManager sharingManager = SharingManager.getInstance();
        boolean zIsGooglePlayEnabled = Config.isGooglePlayEnabled(getContext());
        int scanType = this.mFileSet.getScanType();
        if (zIsGooglePlayEnabled && ServiceProvider.hasPrintProviders(getContext())) {
            this.mHasFacePlugins |= true;
        }
        this.mHasFacePlugins |= sharingManager.hasPluginsExact(SharingConstants.Category.PRINT, 256);
        this.mHasFacePlugins |= sharingManager.hasPluginsExact(SharingConstants.Category.PRINT, 257);
        list.add(new LocalPrintPlugin(sharingManager.hasPlugins(SharingConstants.Category.PRINT, scanType)));
        if (zIsGooglePlayEnabled) {
            list.add(new FindMorePlugin());
        }
        return list;
    }

    private class LocalPrintPlugin extends LocalPlugin {
        private static final String LOCAL_PRINT_NAME = "LocalPrint";
        private boolean mHasInstalledApps;

        LocalPrintPlugin(boolean z) {
            super(TabPagePrint.this.getContext(), R.drawable.share_local_print, R.string.print_3rd_party_plugins_card_title, LOCAL_PRINT_NAME);
            this.mHasInstalledApps = z;
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            if (this.mHasInstalledApps) {
                TabPagePrint.this.showFragment(PrintPreviewFragment.newInstance());
            } else {
                showNoSupportedAppsInstalledFragment();
            }
        }

        private void showNoSupportedAppsInstalledFragment() {
            FragmentManager fragmentManager = TabPagePrint.this.getParentFragment().getFragmentManager();
            NoLocalPrintersFragment noLocalPrintersFragment = new NoLocalPrintersFragment();
            FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
            fragmentTransactionBeginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_FADE);
            fragmentTransactionBeginTransaction.replace(R.id.fragment_container, noLocalPrintersFragment);
            fragmentTransactionBeginTransaction.addToBackStack(noLocalPrintersFragment.getClass().getName());
            fragmentTransactionBeginTransaction.commit();
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPagePrint.this.getContext().getColor(R.color.sharing_local_print);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return type == Shareable.Type.DEFAULT;
        }
    }

    private class FindMorePlugin extends LocalPlugin {
        private static final String FIND_MORE_NAME = "FindMoreApps";

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public boolean isEnabled(Shareable.Type type, Context context, int i) {
            return true;
        }

        FindMorePlugin() {
            super(TabPagePrint.this.getContext(), R.drawable.print_moreapps, R.string.find_more_apps, FIND_MORE_NAME);
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public void shareMesh(Context context, IFileSet iFileSet) {
            if (TabPagePrint.this.startGooglePlay("\"" + context.getString(R.string.google_play_search_all_plugins) + "\"")) {
                HitEvent.FIND_MORE_PRINTING.send(this.mContext, 1L);
            }
        }

        @Override // com.sonymobile.scan3d.sharing.Plugin
        public int getBackgroundColor() {
            return TabPagePrint.this.getContext().getColor(R.color.sharing_find_more);
        }
    }
}
