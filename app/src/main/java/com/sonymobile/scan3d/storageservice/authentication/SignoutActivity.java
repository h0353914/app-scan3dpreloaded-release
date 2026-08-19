package com.sonymobile.scan3d.storageservice.authentication;

import android.app.ActivityManager;
import android.content.ContentProviderOperation;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.OperationApplicationException;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.RemoteException;
import android.widget.Toast;
import androidx.annotation.NonNull;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.HitEvent;
import com.sonymobile.scan3d.analytics.ScreenEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import com.sonymobile.scan3d.storageservice.network.SyncHubApi;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import java.util.ArrayList;

/* JADX INFO: loaded from: classes.dex */
public class SignoutActivity extends AuthActivity implements OnCompleteListener<Void> {
    private static final String SELECTION = "sync_state=? OR sync_state=? OR sync_state=? OR sync_state=? OR sync_state=? OR sync_state=?";
    private static final String[] SELECTION_ARGS = {String.valueOf(7), String.valueOf(6), String.valueOf(4), String.valueOf(3), String.valueOf(2), String.valueOf(1)};
    private static final String TAG = "com.sonymobile.scan3d.storageservice.authentication.SignoutActivity";
    private SignoutTask mSignoutTask;

    private class SignoutTask extends AsyncTask<Void, Void, Boolean> {
        private SignoutTask() {
        }

        @Override // android.os.AsyncTask
        protected Boolean doInBackground(Void... voidArr) {
            ContentProviderOperation contentProviderOperationBuild;
            SignoutActivity signoutActivity = SignoutActivity.this;
            String refreshToken = AccountUtils.getRefreshToken(signoutActivity);
            boolean zRemoveAccount = false;
            if (!isCancelled()) {
                try {
                    SyncHubApi.revokeRefreshToken(signoutActivity, refreshToken).execute();
                } catch (NetworkException unused) {
                }
                ContentResolver contentResolver = signoutActivity.getContentResolver();
                ArrayList<ContentProviderOperation> arrayList = new ArrayList<>();
                if (!isCancelled()) {
                    for (IFileSet iFileSet : Factory.create(signoutActivity, SignoutActivity.SELECTION, SignoutActivity.SELECTION_ARGS)) {
                        if (iFileSet.getSyncState() == 3) {
                            ContentValues contentValues = new ContentValues(2);
                            contentValues.put(Contract.FileRecord.COLUMN_SYNC_STATE, (Integer) 0);
                            contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, (Integer) 0);
                            contentProviderOperationBuild = ContentProviderOperation.newUpdate(iFileSet.getUri()).withValues(contentValues).build();
                        } else {
                            iFileSet.deleteAllFiles(signoutActivity);
                            contentProviderOperationBuild = ContentProviderOperation.newDelete(iFileSet.getUri()).build();
                        }
                        arrayList.add(contentProviderOperationBuild);
                    }
                    arrayList.add(ContentProviderOperation.newDelete(Contract.ImprovementRecord.CONTENT_URI).build());
                    try {
                        contentResolver.applyBatch("com.sonymobile.scan3d.storageprovider", arrayList);
                        zRemoveAccount = AccountUtils.removeAccount(signoutActivity);
                    } catch (OperationApplicationException | RemoteException unused2) {
                    }
                }
            }
            return Boolean.valueOf(zRemoveAccount);
        }

        @Override // android.os.AsyncTask
        protected void onPostExecute(Boolean bool) {
            SignoutActivity.this.finish(bool.booleanValue());
        }
    }

    public SignoutActivity() {
        super(true);
    }

    @Override // com.sonymobile.scan3d.storageservice.authentication.AuthActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        if (bundle == null) {
            ScreenEvent.AUTH_SCREEN.send(this);
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (isSignedin()) {
            signOut();
        } else {
            finish(false);
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        SignoutTask signoutTask = this.mSignoutTask;
        if (signoutTask != null) {
            signoutTask.cancel(true);
            this.mSignoutTask = null;
        }
    }

    @Override // com.google.android.gms.tasks.OnCompleteListener
    public void onComplete(@NonNull Task<Void> task) {
        DebugLog.d(TAG, "Sign out of google completed.");
        Jobs.cancelAllJobs(this);
        this.mSignoutTask = new SignoutTask();
        this.mSignoutTask.execute(new Void[0]);
    }

    private void finish(boolean z) {
        if (z) {
            HitEvent.USER_SIGNED_OUT.send(this, 1L);
        }
        Toast.makeText(this, R.string.toast_signout_completed, 0).show();
        onResultReceived(z, null);
    }

    private void signOut() {
        if (ActivityManager.isUserAMonkey()) {
            finish(false);
        } else {
            getGoogleSignInClient().signOut().addOnCompleteListener(this);
        }
    }
}
