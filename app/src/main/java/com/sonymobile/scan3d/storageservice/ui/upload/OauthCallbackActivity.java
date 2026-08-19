package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Intent;
import android.net.Uri;
import androidx.browser.customtabs.CustomTabsClient;
import androidx.browser.customtabs.CustomTabsIntent;
import androidx.browser.customtabs.CustomTabsServiceConnection;

/* JADX INFO: loaded from: classes.dex */
public class OauthCallbackActivity extends Activity {
    private static final String CUSTOM_TAB_PACKAGE_NAME = "com.android.chrome";
    public static final String EXTRA_URL = "url";
    private boolean mBound;
    private CustomTabsServiceConnection mCustomTabsServiceConnection;

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.mCustomTabsServiceConnection == null) {
            this.mCustomTabsServiceConnection = new CustomTabsServiceConnection() { // from class: com.sonymobile.scan3d.storageservice.ui.upload.OauthCallbackActivity.1
                @Override // androidx.browser.customtabs.CustomTabsServiceConnection
                public void onCustomTabsServiceConnected(ComponentName componentName, CustomTabsClient customTabsClient) {
                    OauthCallbackActivity.this.mBound = true;
                    customTabsClient.warmup(0L);
                    new CustomTabsIntent.Builder(customTabsClient.newSession(null)).setShowTitle(true).build().launchUrl(OauthCallbackActivity.this, Uri.parse(OauthCallbackActivity.this.getIntent().getStringExtra("url")));
                }

                @Override // android.content.ServiceConnection
                public void onServiceDisconnected(ComponentName componentName) {
                    OauthCallbackActivity.this.mBound = false;
                }
            };
            CustomTabsClient.bindCustomTabsService(this, CUSTOM_TAB_PACKAGE_NAME, this.mCustomTabsServiceConnection);
        } else {
            setResult(0);
            finish();
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        if (this.mBound) {
            unbindService(this.mCustomTabsServiceConnection);
            this.mBound = false;
        }
        super.onDestroy();
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        setResult(-1, intent);
        finish();
    }
}
