package com.sonymobile.scan3d.storageservice.network.firebase;

import android.app.Notification;
import android.app.PendingIntent;
import android.content.ContentResolver;
import android.content.ContentValues;
import android.net.Uri;
import com.google.android.gms.drive.DriveFile;
import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.content.Jobs;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.provider.Contract;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Improvement;
import com.sonymobile.scan3d.storageservice.ui.activity.GalleryActivity;
import com.sonymobile.scan3d.utils.notification.NotificationUtil;
import com.sonymobile.scan3d.utils.notification.Notifier;

/* JADX INFO: loaded from: classes.dex */
public class MessagingService extends FirebaseMessagingService {
    private static final int DELETE_ACCOUNT_NOTIFICATION_ID = -2;
    private static final int EXTRACT_DATA_NOTIFICATION_ID = -1;
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.firebase.MessagingService";

    @Override // com.google.firebase.messaging.FirebaseMessagingService
    public void onMessageReceived(RemoteMessage remoteMessage) {
        super.onMessageReceived(remoteMessage);
        Message messageFrom = Message.from(remoteMessage.getData());
        DebugLog.d(TAG, "handleMessage(): type=" + messageFrom.getRequestType() + ", state=" + messageFrom.getState() + ", receiving_request=" + messageFrom.getReceivingRequest() + ", version=" + messageFrom.getProtocolVersion());
        switch (messageFrom.getRequestType()) {
            case "init_request":
                handleKeyInit(messageFrom);
                break;
            case "delete_account_request":
                handleDeleteAccount(messageFrom);
                break;
            case "extract_data_request":
                handleExtractData(messageFrom);
                break;
            case "execution_request":
            default:
                handleImprovement(messageFrom);
                break;
        }
    }

    private void handleKeyInit(Message message) {
        switch (message.getState()) {
            case 0:
                break;
            case 1:
                handleSuccessfulKeyInit(message);
                break;
            default:
                handleFailedKeyInit(message);
                break;
        }
    }

    private void handleSuccessfulKeyInit(Message message) {
        if (message.getProtocolVersion() == 1) {
            switch (message.getReceivingRequest()) {
                case "extract_data_request":
                    Jobs.requestExtractDataJob(this, message.getAesKey(), message.getSession());
                    break;
                case "execution_request":
                    startImprovement(message);
                    break;
            }
            return;
        }
        startImprovement(message);
    }

    private void handleFailedKeyInit(Message message) {
        if (message.getProtocolVersion() == 1) {
            switch (message.getReceivingRequest()) {
                case "extract_data_request":
                    handleFailedExtract();
                    break;
                case "execution_request":
                    handleFailedImprovement(message);
                    break;
            }
            return;
        }
        handleFailedImprovement(message);
    }

    private void handleExtractData(Message message) {
        switch (message.getState()) {
            case 0:
                NotificationUtil.newNotifier(this, Notifier.TYPE_GPDR).cancel(-1);
                break;
            case 1:
                AccountUtils.setExtractDataOngoing(this, false);
                break;
            default:
                handleFailedExtract();
                break;
        }
    }

    private void handleFailedExtract() {
        AccountUtils.setExtractDataOngoing(this, false);
        showGdprNotification(R.string.notification_gdpr_export_data_failed_title, -1);
    }

    private void handleDeleteAccount(Message message) {
        switch (message.getState()) {
            case 0:
                NotificationUtil.newNotifier(this, Notifier.TYPE_GPDR).cancel(-2);
                break;
            case 1:
                Jobs.requestDeleteAccountJob(this);
                break;
            default:
                handleFailedDelete();
                break;
        }
    }

    private void handleFailedDelete() {
        AccountUtils.setDeleteOngoing(this, false);
        showGdprNotification(R.string.notification_gdpr_delete_account_failed_title, -2);
    }

    private void startImprovement(Message message) {
        Improvement improvement = Factory.getImprovement(this, message.getMessageId());
        if (improvement != null) {
            Jobs.requestExecuteImprovementJob(this, new Jobs.RequestBuilder(Jobs.TYPE_IMPROVEMENT).withImprovement(improvement).withProtocolVersion(message.getProtocolVersion()).withServerKey(message.getAesKey()).withSessionId(message.getSession()));
        }
    }

    private void handleImprovement(Message message) {
        Improvement improvement;
        switch (message.getState()) {
            case 0:
                break;
            case 1:
                String requestType = message.getRequestType();
                byte b = -1;
                if (requestType.hashCode() == 1527188584 && requestType.equals(AwsSession.REQUEST_TYPE_EXECUTE)) {
                    b = 0;
                }
                if (b == 0 && (improvement = Factory.getImprovement(this, message.getMessageId())) != null) {
                    ContentValues contentValues = new ContentValues(1);
                    contentValues.put(Contract.ImprovementRecord.COLUMN_S3_KEY, message.getS3Key());
                    getContentResolver().update(improvement.getUri(), contentValues, null, null);
                    Jobs.requestReceiveImprovementJob(this);
                }
                break;
            default:
                handleFailedImprovement(message);
                break;
        }
    }

    private void handleFailedImprovement(Message message) {
        Improvement improvement = Factory.getImprovement(this, message.getMessageId());
        if (improvement != null) {
            Uri parentUri = improvement.getParentUri();
            ContentResolver contentResolver = getContentResolver();
            IFileSet iFileSetCreate = Factory.create(this, parentUri);
            if (iFileSetCreate != null) {
                int state = message.getState();
                if (state == 3 || state == 5) {
                    int transferFlags = iFileSetCreate.getTransferFlags() & (-9);
                    ContentValues contentValues = new ContentValues(1);
                    contentValues.put(Contract.FileRecord.COLUMN_TRANSFER_FLAGS, Integer.valueOf(transferFlags));
                    contentResolver.update(parentUri, contentValues, null, null);
                    ContentValues contentValues2 = new ContentValues(1);
                    contentValues2.put(Contract.ImprovementRecord.COLUMN_FAIL_STATE, (Integer) 2);
                    contentResolver.update(improvement.getUri(), contentValues2, null, null);
                    return;
                }
                ContentValues contentValues3 = new ContentValues(1);
                contentValues3.put(Contract.ImprovementRecord.COLUMN_FAIL_STATE, (Integer) 1);
                contentResolver.update(improvement.getUri(), contentValues3, null, null);
                return;
            }
            contentResolver.delete(improvement.getUri(), null, null);
        }
    }

    private void showGdprNotification(int i, int i2) {
        Notifier notifierNewNotifier = NotificationUtil.newNotifier(this, Notifier.TYPE_GPDR);
        Notification.Builder builderNewBuilder = notifierNewNotifier.newBuilder(this, 1);
        builderNewBuilder.setContentTitle(getString(i));
        builderNewBuilder.setContentText(getString(R.string.notification_gdpr_failed_subtitle));
        builderNewBuilder.setSmallIcon(R.drawable.notification_icon_small);
        builderNewBuilder.setAutoCancel(true);
        builderNewBuilder.setContentIntent(PendingIntent.getActivity(this, 0, GalleryActivity.getBackupSyncIntent(this), DriveFile.MODE_READ_ONLY));
        notifierNewNotifier.notify(i2, builderNewBuilder.build());
    }
}
