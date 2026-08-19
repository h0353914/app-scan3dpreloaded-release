package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.text.SpannableStringBuilder;
import android.text.method.LinkMovementMethod;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.common.GoogleApiAvailability;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.analytics.SignInEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.network.IRestExecutor;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.network.TransferProgress;
import com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess.AccessToken;
import com.sonymobile.scan3d.storageservice.utils.ConnectionUtils;
import com.sonymobile.scan3d.utils.LinkUtil;
import com.sonymobile.scan3d.utils.UserInputReducer;

/* JADX INFO: loaded from: classes.dex */
public class SigninActivity extends PrivacyActivity implements UserInputReducer.InputReducer, OnSuccessListener<Boolean>, OnFailureListener, IRestExecutor.IRestExecutorListener<AccessToken> {
    private static final int REQUEST_CODE_SIGN_IN = 9000;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.authentication.SigninActivity";
    private String mAuthCode;
    private String mDisplayName;
    private String mEmail;

    private enum SignInFailureType {
        API_EXCEPTION,
        ACTIVITY_ON_FAILURE,
        ACTIVITY_ON_SUCCESS_BAD_RESULT,
        SIGNIN_TOKEN_FAILED,
        SIGNIN_CANCELLED
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.PrivacyActivity
    public int getLayoutResource() {
        return R.layout.signin_layout;
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorProgressListener
    public void onExecutionProgress(IRestExecutor<AccessToken> iRestExecutor, TransferProgress transferProgress) {
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorListener
    public void onPreExecution(IRestExecutor<AccessToken> iRestExecutor) {
    }

    public SigninActivity() {
        super(true);
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.PrivacyActivity, com.sonymobile.scan3d.storageservice.authentication.AuthActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setRequestedOrientation(14);
        if (!AccountUtils.isSignedIn(this)) {
            Button button = (Button) findViewById(R.id.button_cancel);
            if (Config.isSigninMandatory(this)) {
                button.setVisibility(8);
            } else {
                button.setOnClickListener(this);
            }
            findViewById(R.id.sign_in_button).setOnClickListener(this);
            if (bundle == null) {
                ScreenEvent.AUTH_SCREEN.send(this);
                return;
            }
            return;
        }
        finish();
    }

    @Override // android.app.Activity
    protected void onStop() {
        super.onStop();
        enableButton();
    }

    @Override // android.app.Activity
    public void onActivityResult(int i, int i2, Intent intent) {
        super.onActivityResult(i, i2, intent);
        if (i == REQUEST_CODE_SIGN_IN) {
            SignInEvent.SIGNIN_ACTIVITY_ACCOUNT.send(getApplicationContext(), i2);
            switch (i2) {
                case -1:
                    try {
                        handleGoogleSignInResult(GoogleSignIn.getSignedInAccountFromIntent(intent).getResult(ApiException.class));
                    } catch (ApiException e) {
                        handleSignInFailure(SignInFailureType.API_EXCEPTION, e);
                    }
                    break;
                case 0:
                    enableButton();
                    if (!ConnectionUtils.isInternetConnectionAvailable(getApplicationContext())) {
                        TextView textView = (TextView) findViewById(R.id.status);
                        textView.setText(R.string.no_internet_connection);
                        textView.setVisibility(0);
                    } else {
                        handleSignInFailure(SignInFailureType.SIGNIN_CANCELLED, null);
                    }
                    break;
            }
        }
    }

    @Override // com.sonymobile.scan3d.utils.UserInputReducer.InputReducer
    public void doClick(View view) {
        int id = view.getId();
        if (id == R.id.button_cancel) {
            finish();
        } else {
            if (id != R.id.sign_in_button) {
                return;
            }
            signIn();
        }
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorListener
    public void onExecutionDone(IRestExecutor<AccessToken> iRestExecutor, AccessToken accessToken) {
        handleSignIn(accessToken);
    }

    @Override // com.sonymobile.scan3d.storageservice.network.IRestExecutor.IRestExecutorListener
    public void onExecutionCancelled(IRestExecutor<AccessToken> iRestExecutor) {
        onExecutionDone(iRestExecutor, (AccessToken) null);
    }

    @Override // com.google.android.gms.tasks.OnFailureListener
    public void onFailure(@NonNull Exception exc) {
        DebugLog.d(TAG, "onFailure(): ", exc);
        SignInEvent.HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_FAILURE.send(getApplicationContext());
        handleSignInFailure(SignInFailureType.ACTIVITY_ON_FAILURE, exc);
    }

    @Override // com.google.android.gms.tasks.OnSuccessListener
    public void onSuccess(Boolean bool) {
        DebugLog.d(TAG, "onSuccess(): result " + bool);
        SignInEvent.HANDLE_GOOGLE_SIGNIN_RESULT_LISTENER_ON_SUCCESS.send(getApplicationContext(), bool.booleanValue() ? 1 : 0);
        if (bool.booleanValue()) {
            SyncHubApi.getAuthToken(this, this.mAuthCode).executeAsync(this);
        } else {
            handleSignInFailure(SignInFailureType.ACTIVITY_ON_SUCCESS_BAD_RESULT, null);
        }
    }

    private void handleSignIn(AccessToken accessToken) {
        int i = accessToken != null ? 1 : 0;
        Bundle bundle = new Bundle();
        SignInEvent.HANDLE_SIGNIN.send(getApplicationContext(), i);
        if (i != 0) {
            DebugLog.d(TAG, "onExecutionDone(): Got payload");
            bundle.putString(AccountUtils.KEY_AUTH_TOKEN, accessToken.getTokenData());
            AccountUtils.addAccount(this, this.mEmail, accessToken, this.mDisplayName);
            onResultReceived(true, bundle);
            return;
        }
        DebugLog.d(TAG, "onExecutionDone(): failure to get payload");
        handleSignInFailure(SignInFailureType.SIGNIN_TOKEN_FAILED, null);
    }

    private void signIn() {
        SignInEvent.STARTING_SIGNIN.send(getApplicationContext());
        GoogleApiAvailability googleApiAvailability = GoogleApiAvailability.getInstance();
        int iIsGooglePlayServicesAvailable = googleApiAvailability.isGooglePlayServicesAvailable(this);
        SignInEvent.GOOGLE_PLAY_SERVICE_AVAILABILITY.send(getApplicationContext(), iIsGooglePlayServicesAvailable);
        if (iIsGooglePlayServicesAvailable == 0) {
            disableButton();
            startActivityForResult(getGoogleSignInClient().getSignInIntent(), REQUEST_CODE_SIGN_IN);
        } else {
            googleApiAvailability.showErrorDialogFragment(this, iIsGooglePlayServicesAvailable, 0);
        }
    }

    private void handleGoogleSignInResult(GoogleSignInAccount googleSignInAccount) {
        this.mAuthCode = googleSignInAccount.getServerAuthCode();
        this.mEmail = googleSignInAccount.getEmail();
        this.mDisplayName = googleSignInAccount.getDisplayName();
        DebugLog.d(TAG, "handleGoogleSignInResult code=" + this.mAuthCode + ", email=" + googleSignInAccount.getEmail());
        DriveActions.handleDriveKey(this, googleSignInAccount).execute().addOnSuccessListener(this, this).addOnFailureListener(this, this);
    }

    private void disableButton() {
        findViewById(R.id.sign_in_button).setEnabled(false);
        findViewById(R.id.sign_in_progress).setVisibility(0);
    }

    private void enableButton() {
        findViewById(R.id.sign_in_progress).setVisibility(8);
        findViewById(R.id.sign_in_button).setEnabled(true);
    }

    private void handleSignInFailure(SignInFailureType signInFailureType, @Nullable Exception exc) {
        enableButton();
        SpannableStringBuilder spannableStringBuilderCreateClickableLink = LinkUtil.createClickableLink(getApplicationContext(), R.string.storage_service_signin_failure_txt, view -> startActivity(SigninLearnMoreActivity.getLaunchIntent(getApplicationContext())));
        TextView textView = (TextView) findViewById(R.id.status);
        textView.setText(spannableStringBuilderCreateClickableLink);
        textView.setMovementMethod(LinkMovementMethod.getInstance());
        textView.setVisibility(0);
        getGoogleSignInClient().signOut().addOnCompleteListener(task -> DebugLog.d(TAG, "Successfully signed out."));
        SignInEvent.HANDLE_SIGNIN_FAILURE.send(getApplicationContext(), signInFailureType.ordinal(), exc == null ? null : Log.getStackTraceString(exc));
    }

    public static Intent getLaunchIntent(Context context) {
        return new Intent(context, (Class<?>) SigninActivity.class);
    }
}
