package com.sonymobile.scan3d.storageservice;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;

import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.storageservice.ui.tips.Tip;
import com.sonymobile.scan3d.viewer.sharing.Shareable;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public final class Config {
    public static final String GOOGLE_PLAY_PACKAGE_NAME = "com.android.vending";
    private static final String PATH_SEPARATOR = "/";
    private static final String QUERY_EQUALS = "=";
    private static final String QUERY_SEPARATOR = "&";
    private static final String QUERY_START = "?";
    private static final boolean TEST_HIDE_GOOGLE_PLAY = false;
    private static final String WEBVIEWER_QUERY_TYPE = "type";
    private static CustomConfig mCustomConfig;

    private Config() {
    }

    public static void customizePromotionsList(Context context, List<Tip> tips) {
        Set<Tip> toRemove = new HashSet<>();
        if (!isGooglePlayEnabled(context)) {
            for (Tip tip : tips) {
                if (tip.isGooglePlayRequired()) {
                    toRemove.add(tip);
                }
            }
        }
        tips.removeAll(toRemove);
    }

    public static boolean encrypt(Context context) {
        return context.getResources().getBoolean(R.bool.encrypt_content);
    }

    private static ApplicationInfo getApplicationInfo(Context context, String packageName) {
        try {
            return context.getPackageManager().getApplicationInfo(packageName, 0);
        } catch (PackageManager.NameNotFoundException e) {
            return null;
        }
    }

    public static String getGdprExecuteJobSqsUrl(Context context) {
        return context.getString(R.string.gdpr_execute_job_sqs_url);
    }

    public static String getPostProcessCognitoIdentityPool(Context context) {
        return context.getString(R.string.cognito_identity_pool_id);
    }

    public static String getPostProcessExecuteJobSqsUrl(Context context) {
        return context.getString(R.string.pp_execute_job_sqs_url);
    }

    public static String getPostProcessInitJobSqsUrl(Context context) {
        return context.getString(R.string.pp_init_job_sqs_url);
    }

    public static String getPostProcessLogBucket(Context context) {
        return context.getString(R.string.pp_log_bucket);
    }

    public static String getRevokeRefreshTokenUrl(Context context, String token) {
        StringBuilder sb = new StringBuilder();
        sb.append(context.getString(R.string.revoke_refresh_token_url));
        sb.append(token);
        return sb.toString();
    }

    public static String getSyncHubServiceHost(Context context) {
        if (mCustomConfig != null) {
            return mCustomConfig.getSyncHubServiceHost(context);
        }
        return context.getString(R.string.synchub_server_base_url);
    }

    public static String getSynchubServerClientId(Context context) {
        return context.getString(R.string.synchub_server_client_id);
    }

    public static String getTokenScope(Context context) {
        return "audience:server:client_id:".concat(getSynchubServerClientId(context));
    }

    public static String getWebViewerShareUrl(Context context, String identifier, Shareable shareable) {
        StringBuilder sb = new StringBuilder(context.getString(R.string.webviewer_server_url));
        sb.append(PATH_SEPARATOR);
        sb.append(identifier);
        sb.append(QUERY_START);
        sb.append(WEBVIEWER_QUERY_TYPE);
        sb.append(QUERY_EQUALS);
        sb.append(shareable.getShareType().getCloudContentType());
        return sb.toString();
    }

    public static boolean isGooglePlayEnabled(Context context) {
        ApplicationInfo applicationInfo = getApplicationInfo(context, GOOGLE_PLAY_PACKAGE_NAME);
        return applicationInfo != null && applicationInfo.enabled;
    }

    public static boolean isPostProcessEnabled(Context context) {
        return context.getResources().getBoolean(R.bool.post_process_enabled);
    }

    public static boolean isProviderEnabled(Context context, String packageName) {
        String[] blacklist = context.getResources().getStringArray(R.array.provider_blacklist);
        for (String disabled : blacklist) {
            if (disabled.equals(packageName)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isSigninMandatory(Context context) {
        return context.getResources().getBoolean(R.bool.mandatory_sign_in);
    }

    public static void setCustomConfigImpl(CustomConfig customConfig) {
        mCustomConfig = customConfig;
    }
}
