package com.sonymobile.scan3d.storageservice.ui.upload;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.Credentials;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: loaded from: classes.dex */
public class CallbackAuthenticationFragment extends ListenableFragment<Credentials> {
    protected static final String KEY_AUTH_URL = "auth_url";
    private static final String LOG_TAG = "com.sonymobile.scan3d.storageservice.ui.upload.CallbackAuthenticationFragment";
    private static final String OAUTH_ACCESS_TOKEN_QUERY_KEY = "access_token";
    private static final String UTF8_CHARSET = "UTF-8";

    public static CallbackAuthenticationFragment newInstance(String str, int i) {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_AUTH_URL, str);
        bundle.putInt("id", i);
        CallbackAuthenticationFragment callbackAuthenticationFragment = new CallbackAuthenticationFragment();
        callbackAuthenticationFragment.setArguments(bundle);
        return callbackAuthenticationFragment;
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ListenableFragment, androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        loadUrl(getArguments().getString(KEY_AUTH_URL));
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        return layoutInflater.inflate(R.layout.fragment_authenticate, viewGroup, false);
    }

    @Override // com.sonymobile.scan3d.storageservice.ui.upload.ListenableFragment, com.sonymobile.scan3d.OnBackPressListener
    public boolean onBackPressed() {
        onDismiss();
        return true;
    }

    protected final void loadUrl(String str) {
        if (str != null) {
            Intent intent = new Intent(getContext(), (Class<?>) OauthCallbackActivity.class);
            intent.putExtra("url", str);
            startActivityForResult(intent, 10);
            return;
        }
        throw new IllegalArgumentException("Invalid url.");
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        switch (i2) {
            case -1:
                if (intent != null && intent.getData() != null) {
                    Credentials credentials = getCredentials(intent.getData());
                    if (credentials != null) {
                        onSuccess(credentials);
                    } else {
                        onCancel();
                    }
                } else {
                    onCancel();
                }
                break;
            case 0:
                onCancel();
                break;
        }
    }

    private Credentials getCredentials(Uri uri) {
        String str = getQueryParams(uri).get(OAUTH_ACCESS_TOKEN_QUERY_KEY);
        if (str != null) {
            return new Credentials(str);
        }
        return null;
    }

    private Map<String, String> getQueryParams(Uri uri) {
        Map<String, String> linkedHashMap = new LinkedHashMap<>();
        try {
            String fragment = uri.getFragment();
            if (fragment != null) {
                for (String str : fragment.split("&")) {
                    int iIndexOf = str.indexOf("=");
                    linkedHashMap.put(URLDecoder.decode(str.substring(0, iIndexOf), "UTF-8"), URLDecoder.decode(str.substring(iIndexOf + 1), "UTF-8"));
                }
            }
        } catch (UnsupportedEncodingException e) {
            DebugLog.e(LOG_TAG, "getQueryParams() : could not get query parameters.", e);
        }
        return linkedHashMap;
    }
}
