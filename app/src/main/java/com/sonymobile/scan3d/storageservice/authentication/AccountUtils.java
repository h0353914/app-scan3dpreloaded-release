package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.content.aws.Aws;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess.AccessToken;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* JADX INFO: loaded from: classes.dex */
public enum AccountUtils {
    INSTANCE;

    private static final String ACCOUNT_PREFS = "account";
    public static final String GOOGLE_ACCOUNT_ID = "accounts.google.com";
    private static final String KEY_ACCOUNT_NAME = "ACCOUNT_NAME";
    public static final String KEY_AUTH_TOKEN = "AUTH_TOKEN";
    private static final String KEY_DELETE_ONGOING = "deleting_account";
    private static final String KEY_DISPLAY_NAME = "DISPLAY_NAME";
    private static final String KEY_EXPIRY_TIME = "EXPIRY_TIME";
    private static final String KEY_EXTRACT_ONGOING = "extract_ongoing";
    private static final String KEY_SIGNIN_SESSION_ID = "signin_session_id";
    private static final String KEY_UD_REFRESH_TOKEN = "REFRESH_TOKEN";
    private static final String TAG = AccountUtils.class.getName();
    private static CustomAccountUtils mCustomAccountUtils;
    private InternalListener mInternalListener;

    public interface AccountListener {
        void onDeleteAccountChanged(boolean z);

        void onExtractAccountChanged(boolean z);

        void onSignedOut();
    }

    private static class InternalListener implements SharedPreferences.OnSharedPreferenceChangeListener {
        private final Set<AccountListener> mAccountListeners;

        private InternalListener() {
            this.mAccountListeners = new HashSet();
        }

        void addListener(AccountListener accountListener) {
            this.mAccountListeners.add(accountListener);
        }

        void removeListener(AccountListener accountListener) {
            this.mAccountListeners.remove(accountListener);
        }

        boolean isEmpty() {
            return this.mAccountListeners.isEmpty();
        }

        @Override // android.content.SharedPreferences.OnSharedPreferenceChangeListener
        public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String str) {
            if (AccountUtils.KEY_ACCOUNT_NAME.equals(str) && !sharedPreferences.contains(AccountUtils.KEY_ACCOUNT_NAME)) {
                Iterator<AccountListener> it = this.mAccountListeners.iterator();
                while (it.hasNext()) {
                    it.next().onSignedOut();
                }
            } else {
                if (AccountUtils.KEY_DELETE_ONGOING.equals(str)) {
                    boolean z = sharedPreferences.getBoolean(str, false);
                    Iterator<AccountListener> it2 = this.mAccountListeners.iterator();
                    while (it2.hasNext()) {
                        it2.next().onDeleteAccountChanged(z);
                    }
                    return;
                }
                if (AccountUtils.KEY_EXTRACT_ONGOING.equals(str)) {
                    boolean z2 = sharedPreferences.getBoolean(str, false);
                    Iterator<AccountListener> it3 = this.mAccountListeners.iterator();
                    while (it3.hasNext()) {
                        it3.next().onExtractAccountChanged(z2);
                    }
                }
            }
        }
    }

    public static boolean isSignedIn(Context context) {
        return false;
    }

    public void registerListener(Context context, AccountListener accountListener) {
        if (this.mInternalListener == null) {
            this.mInternalListener = new InternalListener();
            context.getSharedPreferences(ACCOUNT_PREFS, 0).registerOnSharedPreferenceChangeListener(this.mInternalListener);
        }
        this.mInternalListener.addListener(accountListener);
    }

    public void unregisterListener(Context context, AccountListener accountListener) {
        InternalListener internalListener = this.mInternalListener;
        if (internalListener != null) {
            internalListener.removeListener(accountListener);
            if (this.mInternalListener.isEmpty()) {
                context.getSharedPreferences(ACCOUNT_PREFS, 0).unregisterOnSharedPreferenceChangeListener(this.mInternalListener);
                this.mInternalListener = null;
            }
        }
    }

    public static boolean removeAccount(Context context) {
        boolean z = false;
        SharedPreferences sharedPreferences = context.getSharedPreferences(ACCOUNT_PREFS, 0);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        for (String str : sharedPreferences.getAll().keySet()) {
            if (!KEY_SIGNIN_SESSION_ID.equals(str)) {
                editorEdit.remove(str);
            }
        }
        editorEdit.apply();
        AwsSession awsSessionStartSession = Aws.INSTANCE.startSession(context);
        try {
            awsSessionStartSession.clearCredentials();
            z = true;
        } catch (AwsSessionException unused) {
            DebugLog.e(TAG, "Could not invalidate aws credentials.");
        } finally {
            Aws.INSTANCE.endSession(awsSessionStartSession);
        }
        return z;
    }

    public static boolean isPostProcessAccepted(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(context.getString(R.string.pref_key_privacy_post_process_agreed), false);
    }

    public static void acceptPostProcessing(Context context) {
        String string = context.getString(R.string.pref_key_privacy_post_process_agreed);
        SharedPreferences.Editor editorEdit = PreferenceManager.getDefaultSharedPreferences(context).edit();
        editorEdit.putBoolean(string, true);
        editorEdit.apply();
    }

    public static boolean isExtractDataOngoing(Context context) {
        return context.getSharedPreferences(ACCOUNT_PREFS, 0).getBoolean(KEY_EXTRACT_ONGOING, false);
    }

    public static int generateSignInSessionID(Context context) {
        SharedPreferences sharedPreferences = context.getSharedPreferences(ACCOUNT_PREFS, 0);
        int i = sharedPreferences.getInt(KEY_SIGNIN_SESSION_ID, 0);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        editorEdit.putInt(KEY_SIGNIN_SESSION_ID, i + 1);
        editorEdit.apply();
        return i;
    }

    public static void setExtractDataOngoing(Context context, boolean z) {
        SharedPreferences.Editor editorEdit = context.getSharedPreferences(ACCOUNT_PREFS, 0).edit();
        editorEdit.putBoolean(KEY_EXTRACT_ONGOING, z);
        editorEdit.apply();
    }

    public static boolean isDeleteOngoing(Context context) {
        return context.getSharedPreferences(ACCOUNT_PREFS, 0).getBoolean(KEY_DELETE_ONGOING, false);
    }

    public static void setDeleteOngoing(Context context, boolean z) {
        SharedPreferences.Editor editorEdit = context.getSharedPreferences(ACCOUNT_PREFS, 0).edit();
        editorEdit.putBoolean(KEY_DELETE_ONGOING, z);
        editorEdit.apply();
    }

    static String getRefreshToken(Context context) {
        try {
            Crypto passwordCrypto = CryptoFactory.getPasswordCrypto();
            String userData = getUserData(context, KEY_UD_REFRESH_TOKEN);
            if (userData != null) {
                return passwordCrypto.decrypt(userData);
            }
            return null;
        } catch (IOException | GeneralSecurityException unused) {
            return null;
        }
    }

    public static String getDisplayName(Context context) {
        return getUserData(context, KEY_DISPLAY_NAME);
    }

    public static String getAccountName(Context context) {
        return getUserData(context, KEY_ACCOUNT_NAME);
    }

    private static boolean isExpired(Context context) {
        String userData = getUserData(context, KEY_EXPIRY_TIME);
        if (userData != null) {
            try {
                return new Date(Long.parseLong(userData)).before(new Date());
            } catch (NumberFormatException unused) {
                DebugLog.e(TAG, "Could not parse expiry time.");
            }
        }
        return true;
    }

    private static String getUserData(Context context, String str) {
        return context.getSharedPreferences(ACCOUNT_PREFS, 0).getString(str, null);
    }

    public static void setCustomAccountUtils(CustomAccountUtils customAccountUtils) {
        mCustomAccountUtils = customAccountUtils;
    }

    public static String getAuthenticationToken(Context context, boolean z) {
        CustomAccountUtils customAccountUtils = mCustomAccountUtils;
        if (customAccountUtils != null) {
            return customAccountUtils.getAuthToken();
        }
        return getAuthToken(context, z);
    }

    public static String getAuthToken(Context context, boolean z) {
        Intent intent;
        String refreshToken;
        AccessToken accessTokenExecute;
        String tokenData = null;
        try {
            Crypto passwordCrypto = CryptoFactory.getPasswordCrypto();
            String userData = getUserData(context, KEY_AUTH_TOKEN);
            String strDecrypt = userData != null ? passwordCrypto.decrypt(userData) : null;
            if (strDecrypt != null) {
                try {
                    if (isExpired(context)) {
                        refreshToken = getRefreshToken(context);
                        if (refreshToken != null) {
                            accessTokenExecute = SyncHubApi.refreshAuthToken(context, refreshToken).execute();
                            if (accessTokenExecute != null) {
                                updateToken(context, accessTokenExecute);
                                tokenData = accessTokenExecute.getTokenData();
                            }
                        } else {
                            tokenData = strDecrypt;
                        }
                    } else {
                        tokenData = strDecrypt;
                    }
                    if (tokenData == null) {
                        removeAccount(context);
                        if (z) {
                            intent = new Intent(context, (Class<?>) SigninActivity.class);
                            intent.setFlags(DriveFile.MODE_READ_ONLY);
                            context.startActivity(intent);
                        }
                    }
                } catch (NetworkException unused) {
                    tokenData = strDecrypt;
                    if (tokenData == null) {
                        removeAccount(context);
                        if (z) {
                            intent = new Intent(context, (Class<?>) SigninActivity.class);
                            intent.setFlags(DriveFile.MODE_READ_ONLY);
                            context.startActivity(intent);
                        }
                    }
                    DebugLog.d(TAG, "getAuthToken() - end");
                    return tokenData;
                } catch (Throwable th2) {
                    if (strDecrypt == null) {
                        removeAccount(context);
                        if (z) {
                            Intent intent2 = new Intent(context, (Class<?>) SigninActivity.class);
                            intent2.setFlags(DriveFile.MODE_READ_ONLY);
                            context.startActivity(intent2);
                        }
                    }
                    throw th2;
                }
            } else {
                refreshToken = getRefreshToken(context);
                if (refreshToken != null) {
                    accessTokenExecute = SyncHubApi.refreshAuthToken(context, refreshToken).execute();
                    if (accessTokenExecute != null) {
                        updateToken(context, accessTokenExecute);
                        tokenData = accessTokenExecute.getTokenData();
                    }
                } else {
                    tokenData = strDecrypt;
                }
                if (tokenData == null) {
                    removeAccount(context);
                    if (z) {
                        intent = new Intent(context, (Class<?>) SigninActivity.class);
                        intent.setFlags(DriveFile.MODE_READ_ONLY);
                        context.startActivity(intent);
                    }
                }
            }
        } catch (NetworkException | IOException | GeneralSecurityException unused2) {
            removeAccount(context);
            if (z) {
                intent = new Intent(context, (Class<?>) SigninActivity.class);
                intent.setFlags(DriveFile.MODE_READ_ONLY);
                context.startActivity(intent);
            }
        } catch (Throwable th3) {
            removeAccount(context);
            if (z) {
                Intent intent2 = new Intent(context, (Class<?>) SigninActivity.class);
                intent2.setFlags(DriveFile.MODE_READ_ONLY);
                context.startActivity(intent2);
            }
            throw th3;
        }
        DebugLog.d(TAG, "getAuthToken() - end");
        return tokenData;
    }

    private static void updateToken(Context context, AccessToken accessToken) {
        try {
            Crypto passwordCrypto = CryptoFactory.getPasswordCrypto();
            context.getSharedPreferences(ACCOUNT_PREFS, 0).edit().putString(KEY_UD_REFRESH_TOKEN, passwordCrypto.encrypt(accessToken.getRefreshToken())).putString(KEY_AUTH_TOKEN, passwordCrypto.encrypt(accessToken.getTokenData())).putString(KEY_EXPIRY_TIME, String.valueOf(accessToken.getExpirationTime())).apply();
        } catch (IOException | GeneralSecurityException e) {
            removeAccount(context);
            DebugLog.e(TAG, "Account removed due to exception: " + e.getMessage());
        }
    }

    static void addAccount(Context context, String str, AccessToken accessToken, String str2) {
        SharedPreferences.Editor editorEdit = context.getSharedPreferences(ACCOUNT_PREFS, 0).edit();
        editorEdit.putString(KEY_ACCOUNT_NAME, str);
        editorEdit.putString(KEY_DISPLAY_NAME, str2);
        editorEdit.apply();
        updateToken(context, accessToken);
    }
}
