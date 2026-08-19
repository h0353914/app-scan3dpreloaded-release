package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.app.ActionBar;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.content.Jobs;

/* JADX INFO: loaded from: classes.dex */
public class DeleteAccountMonitorFragment extends Fragment implements AccountUtils.AccountListener {
    @Override // com.sonymobile.scan3d.storageservice.authentication.AccountUtils.AccountListener
    public void onExtractAccountChanged(boolean z) {
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AccountUtils.AccountListener
    public void onSignedOut() {
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(@NonNull LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        setHasOptionsMenu(true);
        ActionBar actionBar = getActivity().getActionBar();
        if (actionBar != null) {
            actionBar.setTitle(R.string.gallery_backup_sync_text);
            actionBar.setHomeButtonEnabled(true);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
        return layoutInflater.inflate(R.layout.fragment_delete_account_monitor, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        AccountUtils.INSTANCE.registerListener(getContext(), this);
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        AccountUtils.INSTANCE.unregisterListener(getContext(), this);
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 16908332) {
            if (getFragmentManager() == null) {
                return true;
            }
            getFragmentManager().popBackStack();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AccountUtils.AccountListener
    public void onDeleteAccountChanged(boolean z) {
        if (z || isRemoving()) {
            return;
        }
        exit();
    }

    private void exit() {
        if (getFragmentManager() != null) {
            try {
                Jobs.cancelAllJobs(getContext());
                getFragmentManager().popBackStack();
            } catch (IllegalStateException e) {
                DebugLog.e(DeleteAccountMonitorFragment.class.getSimpleName(), e.getMessage());
            }
        }
    }
}
