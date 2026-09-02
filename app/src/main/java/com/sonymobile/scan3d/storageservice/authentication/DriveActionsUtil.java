package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Context;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.api.client.extensions.android.http.AndroidHttp;
import com.google.api.client.googleapis.extensions.android.gms.auth.GoogleAccountCredential;
import com.google.api.client.json.gson.GsonFactory;
import com.google.api.services.drive.Drive;
import com.sonymobile.scan3d.R;
import java.util.Collections;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
public class DriveActionsUtil {
    private static CustomDriveActions sCustomDriveActions;

    public static void setCustomDriveActions(CustomDriveActions customDriveActions) {
        sCustomDriveActions = customDriveActions;
    }

    public static Drive getGoogleDrive(Context context, GoogleSignInAccount googleSignInAccount) {
        GoogleAccountCredential googleAccountCredential = GoogleAccountCredential.usingOAuth2(context, Collections.singleton("https://www.googleapis.com/auth/drive.appdata"));
        googleAccountCredential.setSelectedAccount(googleSignInAccount.getAccount());
        return new Drive.Builder(AndroidHttp.newCompatibleTransport(), new GsonFactory(), googleAccountCredential).setApplicationName(String.valueOf(R.string.application_name)).build();
    }

    public static KeyPair getKeysExecuteWait(Context context) throws ExecutionException, InterruptedException {
        CustomDriveActions customDriveActions = sCustomDriveActions;
        if (customDriveActions == null) {
            return DriveActions.getKeys(context).executeWait();
        }
        return customDriveActions.getKeys();
    }
}
