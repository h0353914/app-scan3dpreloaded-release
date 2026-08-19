package com.sonymobile.scan3d.storageservice.ui.fragment;

import android.app.ActionBar;
import android.app.AlertDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.ContentObserver;
import android.database.Cursor;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.Html;
import android.view.LayoutInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import androidx.annotation.Nullable;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import androidx.preference.Preference;
import androidx.preference.PreferenceFragmentCompat;
import androidx.preference.PreferenceScreen;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.PrivacyActivity;
import com.sonymobile.scan3d.storageservice.authentication.PrivacyPolicies;
import com.sonymobile.scan3d.storageservice.authentication.SignoutActivity;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.ui.component.TransferPreference;

/* JADX INFO: loaded from: classes.dex */
public class BackupSyncSettings extends PreferenceFragmentCompat implements Preference.OnPreferenceClickListener, AccountUtils.AccountListener, Handler.Callback {
    private static final String KEY_SIGNOUT_ONGOING = "SIGNOUT_ONGOING";
    private static final int MSG_NOTIFY = 0;
    private static final int MSG_STATUS_UPDATED = 1;
    private static final int REQUEST_CODE_SIGNOUT = 1000;
    private Handler mHandler;
    private ContentObserver mObserver;

    @Override // androidx.preference.PreferenceFragmentCompat
    public void onCreatePreferences(Bundle bundle, String str) {
    }

    private static class FileSetObserver extends ContentObserver {
        private Handler mHandler;

        FileSetObserver(Handler handler) {
            super(handler);
            this.mHandler = handler;
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean z) {
            super.onChange(z);
            Message.obtain(this.mHandler, 0).sendToTarget();
        }
    }

    private static class MonitorStatus {
        boolean active;
        int numScans;
        int numSynced;

        private MonitorStatus() {
        }
    }

    private static class MonitorTask extends AsyncTask<Void, Void, MonitorStatus> {
        private static final String SELECTION = "sync_state!=? AND sync_state!=? AND sync_state!=? AND sync_state!=?";
        private final Handler mHandler;
        private ContentResolver mResolver;
        private static final String[] PROJECTION = {Contract.FileRecord.COLUMN_SYNC_STATE};
        private static final String[] SELECTION_ARGS = {String.valueOf(8), String.valueOf(9), String.valueOf(7), String.valueOf(10)};

        MonitorTask(Context context, Handler handler) {
            this.mResolver = context.getContentResolver();
            this.mHandler = handler;
        }

        @Override // android.os.AsyncTask
        protected MonitorStatus doInBackground(Void... voidArr) {
            MonitorStatus monitorStatus = new MonitorStatus();
            try (Cursor cursorQuery = this.mResolver.query(Contract.FileRecord.CONTENT_URI, PROJECTION, SELECTION, SELECTION_ARGS, null)) {
                if (cursorQuery != null && cursorQuery.moveToFirst()) {
                    int columnIndex = cursorQuery.getColumnIndex(Contract.FileRecord.COLUMN_SYNC_STATE);
                    do {
                        int i = cursorQuery.getInt(columnIndex);
                        if (i != 6) {
                            switch (i) {
                                case 2:
                                    monitorStatus.numSynced++;
                                    break;
                                case 3:
                                case 4:
                                    monitorStatus.active = true;
                                    break;
                            }
                        } else {
                            monitorStatus.numSynced++;
                        }
                        monitorStatus.numScans++;
                    } while (cursorQuery.moveToNext());
                }
            }
            return monitorStatus;
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(MonitorStatus monitorStatus) {
            super.onPostExecute(monitorStatus);
            Message.obtain(this.mHandler, 1, monitorStatus).sendToTarget();
        }
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        Context context = getContext();
        addPreferencesFromResource(R.xml.backup_restore_preferences);
        setHasOptionsMenu(true);
        setRetainInstance(true);
        this.mHandler = new Handler(this);
        String accountName = AccountUtils.getAccountName(context);
        if (accountName != null) {
            AccountUtils.INSTANCE.registerListener(context, this);
            this.mObserver = new FileSetObserver(this.mHandler);
            context.getContentResolver().registerContentObserver(Contract.FileRecord.CONTENT_URI, true, this.mObserver);
            findPreference(getString(R.string.pref_key_sync_over_wifi)).setOnPreferenceClickListener(this);
            findPreference(getString(R.string.pref_key_sync_when_charging)).setOnPreferenceClickListener(this);
            findPreference(getString(R.string.pref_key_sign_out)).setOnPreferenceClickListener(this);
            findPreference(getString(R.string.key_backup_personal_data)).setOnPreferenceClickListener(this);
            findPreference(getString(R.string.pref_key_account)).setTitle(accountName);
            findPreference(getString(R.string.pref_key_backup_export_data)).setOnPreferenceClickListener(this);
            updateExportPreference(AccountUtils.isExtractDataOngoing(getContext()));
            if (AccountUtils.isDeleteOngoing(getContext())) {
                showDeleteAccountMonitor();
            } else {
                findPreference(getString(R.string.pref_key_backup_delete_account)).setOnPreferenceClickListener(this);
            }
            new MonitorTask(context, this.mHandler).execute(new Void[0]);
            return;
        }
        exit();
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, @Nullable ViewGroup viewGroup, @Nullable Bundle bundle) {
        View viewOnCreateView = super.onCreateView(layoutInflater, viewGroup, bundle);
        View viewInflate = layoutInflater.inflate(R.layout.fragment_backupsync_settings, viewGroup, false);
        if (bundle != null) {
            ((ProgressBar) viewInflate.findViewById(R.id.progress)).setIndeterminate(bundle.getBoolean(KEY_SIGNOUT_ONGOING, false));
        }
        ((ViewGroup) viewInflate).addView(viewOnCreateView);
        return viewInflate;
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        ActionBar actionBar = getActivity().getActionBar();
        if (actionBar != null) {
            actionBar.setTitle(R.string.gallery_backup_sync_text);
            actionBar.setHomeButtonEnabled(true);
            actionBar.setDisplayHomeAsUpEnabled(true);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        if (menuItem.getItemId() == 16908332) {
            exit();
            return true;
        }
        return super.onOptionsItemSelected(menuItem);
    }

    @Override // androidx.preference.PreferenceFragmentCompat, androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        if (getView() != null) {
            bundle.putBoolean(KEY_SIGNOUT_ONGOING, ((ProgressBar) getView().findViewById(R.id.progress)).isIndeterminate());
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        Context context = getContext();
        AccountUtils.INSTANCE.unregisterListener(context, this);
        if (this.mObserver != null) {
            context.getContentResolver().unregisterContentObserver(this.mObserver);
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AccountUtils.AccountListener
    public void onSignedOut() {
        exit();
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AccountUtils.AccountListener
    public void onDeleteAccountChanged(boolean z) {
        if (z) {
            showDeleteAccountMonitor();
            Jobs.requestDeleteBackendDataJob(getContext());
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AccountUtils.AccountListener
    public void onExtractAccountChanged(boolean z) {
        updateExportPreference(z);
        if (z) {
            Jobs.requestKeyInitJob(getContext(), AwsSession.REQUEST_TYPE_EXTRACT_DATA);
        }
    }

    @Override // androidx.preference.Preference.OnPreferenceClickListener
    public boolean onPreferenceClick(Preference preference) {
        String key = preference.getKey();
        if (getString(R.string.pref_key_sign_out).equals(key)) {
            AlertDialog.Builder builder = new AlertDialog.Builder(getContext());
            builder.setTitle(getString(R.string.storage_service_confirm_signout_title_txt));
            builder.setMessage(getString(R.string.storage_service_confirm_signout_message_txt));
            builder.setPositiveButton(getString(R.string.storage_service_dialog_button_yes_txt), (dialogInterface, i) -> signOut());
            builder.setNegativeButton(getString(android.R.string.cancel), (DialogInterface.OnClickListener) null);
            builder.show();
        } else if (getString(R.string.key_backup_personal_data).equals(key)) {
            Intent intent = new Intent(getContext(), (Class<?>) PrivacyActivity.class);
            intent.putExtra(PrivacyActivity.EXTRA_VIEW, true);
            intent.putExtra(PrivacyActivity.EXTRA_PRIVACY, PrivacyPolicies.getPersonalDataInfoPrivacy());
            startActivity(intent);
        } else if (getString(R.string.pref_key_backup_export_data).equals(key)) {
            String accountName = AccountUtils.getAccountName(getContext());
            AlertDialog.Builder builder2 = new AlertDialog.Builder(getContext());
            builder2.setTitle(R.string.backup_sync_export_dialog_title);
            builder2.setMessage(Html.fromHtml(getString(R.string.backup_sync_export_dialog_text, accountName), 0));
            builder2.setPositiveButton(R.string.backup_sync_export_dialog_button, (dialogInterface, i) -> AccountUtils.setExtractDataOngoing(getContext(), true));
            builder2.setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null);
            builder2.show();
        } else if (getString(R.string.pref_key_backup_delete_account).equals(key)) {
            AlertDialog.Builder builder3 = new AlertDialog.Builder(getContext());
            builder3.setTitle(R.string.backup_sync_delete_dialog_title);
            builder3.setMessage(R.string.backup_sync_delete_dialog_text);
            builder3.setPositiveButton(R.string.backup_sync_delete_dialog_button, (dialogInterface, i) -> AccountUtils.setDeleteOngoing(getContext(), true));
            builder3.setNegativeButton(android.R.string.cancel, (DialogInterface.OnClickListener) null);
            builder3.show();
        } else if (getString(R.string.pref_key_sync_over_wifi).equals(key) || getString(R.string.pref_key_sync_when_charging).equals(key)) {
            Jobs.requestSync(getContext(), true);
        }
        return false;
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        if (!isResumed()) {
            return true;
        }
        switch (message.what) {
            case 0:
                new MonitorTask(getContext(), this.mHandler).execute(new Void[0]);
                break;
            case 1:
                updateMonitorPreference((MonitorStatus) message.obj);
                break;
        }
        return true;
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        if (i == 1000 && i2 == -1) {
            setProgressBarState(false);
            exit();
        }
    }

    private void updateMonitorPreference(MonitorStatus monitorStatus) {
        TransferPreference transferPreference = (TransferPreference) findPreference(getString(R.string.pref_key_transfer_monitor));
        if (transferPreference != null) {
            transferPreference.setTransferStatus(monitorStatus.active, monitorStatus.numSynced, monitorStatus.numScans);
        }
    }

    private void updateExportPreference(boolean z) {
        Preference preferenceFindPreference = findPreference(getString(R.string.pref_key_backup_export_data));
        preferenceFindPreference.setSummary(z ? getString(R.string.backup_sync_export_summary) : "");
        preferenceFindPreference.setEnabled(!z);
    }

    private void showDeleteAccountMonitor() {
        FragmentManager fragmentManager = getFragmentManager();
        if (fragmentManager != null) {
            fragmentManager.popBackStack();
            DeleteAccountMonitorFragment deleteAccountMonitorFragment = new DeleteAccountMonitorFragment();
            FragmentTransaction fragmentTransactionBeginTransaction = fragmentManager.beginTransaction();
            fragmentTransactionBeginTransaction.setCustomAnimations(android.R.animator.fade_in, android.R.animator.fade_out);
            fragmentTransactionBeginTransaction.replace(R.id.content, deleteAccountMonitorFragment);
            fragmentTransactionBeginTransaction.addToBackStack(deleteAccountMonitorFragment.getClass().getName());
            fragmentTransactionBeginTransaction.commit();
        }
    }

    private void exit() {
        if (getFragmentManager().popBackStackImmediate()) {
            return;
        }
        getActivity().finish();
    }

    private void signOut() {
        setProgressBarState(true);
        startActivityForResult(new Intent(getContext(), (Class<?>) SignoutActivity.class), 1000);
    }

    private void setProgressBarState(boolean z) {
        if (getView() != null) {
            ((ProgressBar) getView().findViewById(R.id.progress)).setIndeterminate(z);
            if (z) {
                PreferenceScreen preferenceScreen = getPreferenceScreen();
                for (int i = 0; i < preferenceScreen.getPreferenceCount(); i++) {
                    preferenceScreen.getPreference(i).setEnabled(false);
                }
            }
        }
    }
}
