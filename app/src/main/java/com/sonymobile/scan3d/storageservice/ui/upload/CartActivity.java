package com.sonymobile.scan3d.storageservice.ui.upload;

import android.app.Activity;
import android.os.Bundle;
import androidx.browser.customtabs.CustomTabsIntent;

/* JADX INFO: loaded from: classes.dex */
public class CartActivity extends Activity {
    static final String EXTRA_PROVIDER = "com.sonymobile.sphinx.EXTRA_PROVIDER";

    @Override // android.app.Activity
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        ServiceProvider.valueOf(getIntent().getStringExtra(EXTRA_PROVIDER)).sendCartScreenEvent(this);
        new CustomTabsIntent.Builder(null).setShowTitle(true).build().launchUrl(this, getIntent().getData());
        finish();
    }
}
