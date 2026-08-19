package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.NotificationManager;
import android.content.Context;
import android.content.Intent;
import android.database.ContentObserver;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Upload;
import java.lang.ref.WeakReference;

/* JADX INFO: loaded from: classes.dex */
public class MonitorFragment extends Fragment {
    private static final String KEY_CREDENTIALS = "credentials";
    protected static final String KEY_FILESET = "fileset";
    protected static final String KEY_SERVICE_PROVIDER = "service_provider";
    private Handler mHandler;
    private ContentObserver mObserver;

    public static MonitorFragment newInstance(IFileSet iFileSet, ServiceProvider serviceProvider, Credentials credentials) {
        MonitorFragment monitorFragment = new MonitorFragment();
        monitorFragment.setArguments(prepareArgs(iFileSet, serviceProvider, credentials));
        return monitorFragment;
    }

    protected static Bundle prepareArgs(IFileSet iFileSet, ServiceProvider serviceProvider, Credentials credentials) {
        Bundle bundle = new Bundle();
        bundle.putParcelable(KEY_FILESET, iFileSet);
        bundle.putString(KEY_SERVICE_PROVIDER, serviceProvider.name());
        bundle.putParcelable(KEY_CREDENTIALS, credentials);
        return bundle;
    }

    private class UploadObserver extends ContentObserver {
        UploadObserver(Handler handler) {
            super(handler);
        }

        @Override // android.database.ContentObserver
        public void onChange(boolean z, Uri uri) {
            new UploadMonitorTask(MonitorFragment.this).execute(new Void[0]);
        }
    }

    private static class UploadMonitorTask extends AsyncTask<Void, Void, Upload> {
        private WeakReference<MonitorFragment> mFragment;

        UploadMonitorTask(MonitorFragment monitorFragment) {
            this.mFragment = new WeakReference<>(monitorFragment);
        }

        @Override // android.os.AsyncTask
        protected Upload doInBackground(Void... voidArr) {
            Context context;
            MonitorFragment monitorFragment = this.mFragment.get();
            if (monitorFragment == null || (context = monitorFragment.getContext()) == null) {
                return null;
            }
            return Factory.getUpload(context, monitorFragment.getUri(), monitorFragment.getServiceProvider());
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Upload upload) {
            MonitorFragment monitorFragment = this.mFragment.get();
            if (monitorFragment != null) {
                monitorFragment.onUploadReceived(upload);
            }
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        this.mHandler = new Handler();
        this.mObserver = new UploadObserver(this.mHandler);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.progress_bar_layout, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStart() {
        super.onStart();
        getContext().getContentResolver().registerContentObserver(Contract.UploadRecord.CONTENT_URI, true, this.mObserver);
    }

    @Override // androidx.fragment.app.Fragment
    public void onStop() {
        super.onStop();
        getContext().getContentResolver().unregisterContentObserver(this.mObserver);
        this.mHandler.removeCallbacksAndMessages(null);
        this.mObserver.dispatchChange(false, Contract.UploadRecord.CONTENT_URI);
    }

    private void onUploadReceived(Upload upload) {
        FragmentActivity activity = getActivity();
        if (activity != null) {
            if (upload == null || !upload.isUploaded()) {
                if (upload == null) {
                    onHandleNoUploadRecord();
                    return;
                }
                return;
            }
            Intent intent = activity.getIntent();
            String action = intent.getAction();
            Bundle extras = intent.getExtras();
            getServiceProvider().startActivity(activity, action, upload.getUid(), getCredentials(), extras);
            NotificationManager notificationManager = (NotificationManager) getContext().getSystemService("notification");
            if (notificationManager != null) {
                notificationManager.cancel("upload", (int) upload.getId());
            }
            activity.finish();
        }
    }

    protected void onHandleNoUploadRecord() {
        getActivity().finish();
    }

    private Uri getUri() {
        return ((IFileSet) getArguments().getParcelable(KEY_FILESET)).getUri();
    }

    protected ServiceProvider getServiceProvider() {
        return ServiceProvider.valueOf(getArguments().getString(KEY_SERVICE_PROVIDER));
    }

    private Credentials getCredentials() {
        return (Credentials) getArguments().getParcelable(KEY_CREDENTIALS);
    }
}
