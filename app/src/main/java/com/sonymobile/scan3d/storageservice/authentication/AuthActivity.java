package com.sonymobile.scan3d.storageservice.authentication;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Scope;
import com.sonymobile.scan3d.Scan3DApp;
import com.sonymobile.scan3d.storageservice.Config;

/* JADX INFO: loaded from: classes.dex */
abstract class AuthActivity extends Activity {
    private GoogleSignInClient mClient;
    private final boolean mGoogleClientRequired;

    public AuthActivity(boolean z) {
        this.mGoogleClientRequired = z;
    }

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (!Scan3DApp.isPartOfBetaProgram(this)) {
            finish();
            return;
        }
        getWindow().getDecorView().setSystemUiVisibility(1792);
        if (this.mGoogleClientRequired) {
            this.mClient = GoogleSignIn.getClient((Activity) this, new GoogleSignInOptions.Builder().requestScopes(new Scope("https://www.googleapis.com/auth/drive.appdata"), new Scope[0]).requestServerAuthCode(Config.getSynchubServerClientId(this), true).requestEmail().requestId().requestProfile().build());
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        setResult(0);
        finish();
    }

    protected boolean isSignedin() {
        return isSignedin(this);
    }

    public static boolean isSignedin(Context context) {
        GoogleSignInAccount lastSignedInAccount = GoogleSignIn.getLastSignedInAccount(context);
        return lastSignedInAccount != null && GoogleSignIn.hasPermissions(lastSignedInAccount, new Scope(Scopes.DRIVE_APPFOLDER));
    }

    protected final void onResultReceived(boolean z, Bundle bundle) {
        Intent intent = new Intent();
        if (bundle != null) {
            intent.putExtras(bundle);
        }
        setResult(z ? -1 : 0, intent);
        finish();
    }

    protected GoogleSignInClient getGoogleSignInClient() {
        if (this.mGoogleClientRequired) {
            return this.mClient;
        }
        throw new RuntimeException("The activity is not configured to create a client.");
    }
}
