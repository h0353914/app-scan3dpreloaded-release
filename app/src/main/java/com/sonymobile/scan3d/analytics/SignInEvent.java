package com.sonymobile.scan3d.analytics;

import android.content.Context;

import androidx.annotation.Nullable;

import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;

public enum SignInEvent {
    STARTING_SIGNIN("GoogleSignInStarted"),
    GOOGLE_PLAY_SERVICE_AVAILABILITY("GooglePlayServiceAvailability"),
    SIGNIN_ACTIVITY_ACCOUNT("SignInActivityAccount"),
    HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS("HandleGoogleSignInResultListenerOnSuccess"),
    HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE("HandleGoogleSignInResultListenerOnFailure"),
    HANDLE_SIGNIN("HandleSignIn"),
    HANDLE_SIGNIN_FAILURE("HandleSignInFailure"),
    KEY_CHECK_EXECUTION("KeyCheckExecution"),
    SYNC_HUB_EXECUTION("SyncHubApiExecution");

    private static int sSignInSessionId;

    private final String mActionName;

    SignInEvent(String actionName) {
        mActionName = actionName;
    }

    private static void setSessionId(int sessionId) {
        sSignInSessionId = sessionId;
    }

    public void send(Context context) {
        if ("GoogleSignInStarted".equals(mActionName)) {
            setSessionId(AccountUtils.generateSignInSessionID(context));
        }
        SBDPUtil.getInstance(context).pushSignInEvent(mActionName, sSignInSessionId);
    }

    public void send(Context context, int resultCode) {
        send(context, resultCode, null);
    }

    public void send(Context context, int resultCode, @Nullable String extra) {
        if ("GoogleSignInStarted".equals(mActionName)) {
            setSessionId(AccountUtils.generateSignInSessionID(context));
        }
        SBDPUtil.getInstance(context).pushSignInEvent(mActionName, sSignInSessionId, resultCode, extra);
    }

    public enum KeyCheckExecutionType {
        DRIVE_KEY_EXISTS,
        TRY_START_UPLOAD,
        HAS_METADATA,
        HAS_NO_METADATA,
        DRIVE_KEY_EXIST_AFTER_UPLOAD,
        DRIVE_KEY_DOES_NOT_EXIST_AFTER_UPLOAD,
        UPLOAD_FAILED,
        UPLOAD_SUCCEEDED
    }
}
