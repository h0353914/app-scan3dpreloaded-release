package com.sonymobile.scan3d.storageservice.content;

import android.app.Notification;
import android.app.PendingIntent;
import android.app.job.JobParameters;
import android.content.Context;
import android.os.PersistableBundle;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.drive.DriveFile;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.DriveActions;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import com.sonymobile.scan3d.utils.notification.Notifier;
import java.security.GeneralSecurityException;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
final class ExtractDataTask extends AwsTask {
    private static final int EXTRACT_DATA_NOTIFICATION_ID = -1;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.ExtractDataTask";

    ExtractDataTask(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, false, false, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) {
        PersistableBundle extras = jobParameters.getExtras();
        String string = extras.getString("com.sonymobile.scan3d.extra.session_id");
        String string2 = extras.getString("com.sonymobile.scan3d.extra.server_key");
        if (AccountUtils.isExtractDataOngoing(context)) {
            try {
                GoogleSignInAccount lastSignedInAccount = GoogleSignIn.getLastSignedInAccount(context);
                KeyPair keyPairExecuteWait = DriveActions.getKeys(context).executeWait();
                if ((lastSignedInAccount == null || keyPairExecuteWait == null) ? false : send(awsSession, string, string2, keyPairExecuteWait.getEncryptionKey(), lastSignedInAccount)) {
                    return;
                }
                AccountUtils.setExtractDataOngoing(context, false);
                notifyFailed(context);
            } catch (AwsSessionException | InterruptedException | ExecutionException unused) {
                setReschedule(true);
            } catch (GeneralSecurityException e) {
                AccountUtils.setExtractDataOngoing(context, false);
                notifyFailed(context);
                DebugLog.d(TAG, "doWork(): Failed to send message ", e);
            }
        }
    }

    private boolean send(AwsSession awsSession, String str, String str2, String str3, GoogleSignInAccount googleSignInAccount) throws GeneralSecurityException, AwsSessionException {
        String email = googleSignInAccount.getEmail();
        String givenName = googleSignInAccount.getGivenName();
        String id = googleSignInAccount.getId();
        if (email != null && givenName != null && id != null) {
            return awsSession.postExtractDataJob(str, Vault.encryptWithServerKey(str2, email), Vault.encryptWithServerKey(str2, givenName), Vault.encryptWithServerKey(str2, id), Vault.encryptWithServerKey(str2, str3)) != null;
        }
        DebugLog.d(TAG, "send(): Could not extract all data from google account.");
        return false;
    }

    private void notifyFailed(Context context) {
        Notifier notifierNewNotifier = NotificationUtil.newNotifier(context, Notifier.TYPE_GPDR);
        Notification.Builder builderNewBuilder = notifierNewNotifier.newBuilder(context, 1);
        builderNewBuilder.setContentTitle(context.getString(R.string.notification_gdpr_export_data_failed_title));
        builderNewBuilder.setContentText(context.getString(R.string.notification_gdpr_failed_subtitle));
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setAutoCancel(true);
        builderNewBuilder.setContentIntent(PendingIntent.getActivity(context, 0, GalleryActivity.getBackupSyncIntent(context), DriveFile.MODE_READ_ONLY));
        notifierNewNotifier.notify(-1, builderNewBuilder.build());
    }
}
