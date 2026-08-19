package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.os.Handler;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.content.SyncService;

/* JADX INFO: loaded from: classes.dex */
public abstract class SyncFragment extends Fragment implements SyncService.SyncObserver {
    private static final long SYNC_CHECK_TIMEOUT = 2000;

    public abstract void onSyncChanged(boolean z);

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        SyncService.registerObserver(this);
        onSync(SyncService.isSyncActive());
    }

    @Override // androidx.fragment.app.Fragment
    public void onPause() {
        super.onPause();
        SyncService.unregisterObserver(this);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.SyncService.SyncObserver
    public final void onSync(final boolean z) {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            activity.runOnUiThread(new Runnable() {
            final SyncFragment f$0 = SyncFragment.this; // from class: com.sonymobile.scan3d.storageservice.ui.fragment.-$$Lambda$SyncFragment$pqXGAF7OPQlOdfZe-uT4lTzG4ec
                @Override // java.lang.Runnable
                public final void run() {
                    SyncFragment.lambda$onSync$0(this.f$0, z);
                }
            });
        }
    }

    public static /* synthetic */ void lambda$onSync$0(SyncFragment syncFragment, boolean z) {
        if (syncFragment.isResumed()) {
            syncFragment.onSyncChanged(z);
        }
    }

    public void sync() {
        new Handler().postDelayed(new Runnable() {
            final SyncFragment f$0 = SyncFragment.this; // from class: com.sonymobile.scan3d.storageservice.ui.fragment.-$$Lambda$SyncFragment$i3EMiyrOXmbEybwRTIGpbebc5v8
            @Override // java.lang.Runnable
            public final void run() {
                SyncFragment.lambda$sync$1(this.f$0);
            }
        }, SYNC_CHECK_TIMEOUT);
        Jobs.requestSync(getContext(), true);
    }

    public static /* synthetic */ void lambda$sync$1(SyncFragment syncFragment) {
        if (syncFragment.isResumed()) {
            syncFragment.onSync(SyncService.isSyncActive());
        }
    }
}
