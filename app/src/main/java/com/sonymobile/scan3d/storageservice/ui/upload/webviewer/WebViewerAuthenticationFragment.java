package com.sonymobile.scan3d.storageservice.ui.upload.webviewer;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.SigninActivity;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import com.sonymobile.scan3d.storageservice.ui.upload.ListenableFragment;

/* JADX INFO: loaded from: classes.dex */
public class WebViewerAuthenticationFragment extends ListenableFragment<Credentials> {
    private static final String KEY_HAS_ERRORS = "has_errors";
    private static final String KEY_IS_FINISHED = "is_finished";
    private static final String KEY_TOKEN = "token";
    private static final String LOG_TAG = "com.sonymobile.scan3d.storageservice.ui.upload.webviewer.WebViewerAuthenticationFragment";
    private static final int REQUEST_CODE_SIGNIN = 1000;
    private Credentials mCredentials;
    private boolean mHasErrors;
    private boolean mIsFinished = false;

    public static WebViewerAuthenticationFragment newInstance(int i) {
        DebugLog.d(LOG_TAG, "newInstance(): begin");
        Bundle bundle = new Bundle();
        bundle.putInt("id", i);
        WebViewerAuthenticationFragment webViewerAuthenticationFragment = new WebViewerAuthenticationFragment();
        webViewerAuthenticationFragment.setArguments(bundle);
        return webViewerAuthenticationFragment;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ListenableFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        Credentials credentials = this.mCredentials;
        if (credentials == null) {
            new GetAuthTask().execute(new Void[0]);
        } else {
            reportResult(credentials);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.webviewer_authentication_layout, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        Credentials credentials = null;
        if (i == 1000 && i2 == -1) {
            if (intent != null) {
                String stringExtra = intent.getStringExtra(AccountUtils.KEY_AUTH_TOKEN);
                if (stringExtra != null) {
                    credentials = new Credentials(stringExtra);
                }
            } else {
                this.mHasErrors = true;
            }
        }
        reportResult(credentials);
    }

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle != null) {
            this.mIsFinished = bundle.getBoolean(KEY_IS_FINISHED);
            this.mHasErrors = bundle.getBoolean(KEY_HAS_ERRORS);
            this.mCredentials = (Credentials) bundle.getParcelable(KEY_TOKEN);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        if (this.mIsFinished) {
            reportResult(this.mCredentials);
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
        bundle.putBoolean(KEY_IS_FINISHED, this.mIsFinished);
        bundle.putBoolean(KEY_HAS_ERRORS, this.mHasErrors);
        bundle.putParcelable(KEY_TOKEN, this.mCredentials);
    }

    private void reportResult(Credentials credentials) {
        this.mCredentials = credentials;
        if (isResumed()) {
            if (this.mHasErrors) {
                onFailure(R.string.upload_network_failure_txt);
                return;
            }
            Credentials credentials2 = this.mCredentials;
            if (credentials2 != null) {
                onSuccess(credentials2);
                return;
            } else {
                onCancel();
                return;
            }
        }
        this.mIsFinished = true;
    }

    private class GetAuthTask extends AsyncTask<Void, Void, String> {
        private GetAuthTask() {
        }

        @Override // android.os.AsyncTask
        protected String doInBackground(Void... voidArr) {
            return AccountUtils.getAuthenticationToken(WebViewerAuthenticationFragment.this.getContext(), false);
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(String str) {
            if (str != null) {
                WebViewerAuthenticationFragment.this.reportResult(new Credentials(str));
            } else {
                WebViewerAuthenticationFragment webViewerAuthenticationFragment = WebViewerAuthenticationFragment.this;
                webViewerAuthenticationFragment.startActivityForResult(SigninActivity.getLaunchIntent(webViewerAuthenticationFragment.getContext()), 1000);
            }
        }
    }
}
