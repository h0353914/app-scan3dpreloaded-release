package com.sonymobile.scan3d.storageservice.authentication;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import androidx.localbroadcastmanager.content.LocalBroadcastManager;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveClient;
import com.google.android.gms.drive.DriveContents;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.DriveResourceClient;
import com.google.android.gms.drive.ExecutionOptions;
import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.MetadataBuffer;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.sonymobile.scan3d.analytics.SignInEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.ContentType;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.util.Date;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.Callable;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public final class DriveActions {
    static final String ACTION_DRIVE = "com.sonymobile.scan3d.action.DRIVE_EVENT";
    static final String EXTRA_DRIVE_ID = "com.sonymobile.scan3d.extra.DRIVE_ID";
    static final String EXTRA_RESULT = "com.sonymobile.scan3d.extra.DRIVE_RESULT";
    private static final String TAG = "DriveActions";

    private static class DriveSync implements Callable<Void> {
        private DriveClient mClient;

        DriveSync(DriveClient driveClient) {
            this.mClient = driveClient;
        }

        @Override // java.util.concurrent.Callable
        public Void call() throws Exception {
            return (Void) Tasks.await(this.mClient.requestSync());
        }
    }

    private static class GetAppFolder implements Callable<DriveFolder> {
        private DriveResourceClient mClient;

        private GetAppFolder(DriveResourceClient driveResourceClient) {
            this.mClient = driveResourceClient;
        }
        @Override // java.util.concurrent.Callable
        public DriveFolder call() throws Exception {
            return (DriveFolder) Tasks.await(this.mClient.getAppFolder());
        }
    }

    private static class KeyCheckExecution extends DriveAction<Boolean> {
        private static final long WAIT_TIME = 5000;
        private WeakReference<Context> mContext;
        private DriveClient mDriveClient;
        private LocalBroadcastManager mManager;
        private DriveResourceClient mResourceClient;

        private static class CompletionReceiver extends BroadcastReceiver {
            private final BlockingQueue<Intent> mQueue;

            CompletionReceiver(BlockingQueue<Intent> blockingQueue) {
                this.mQueue = blockingQueue;
            }

            @Override // android.content.BroadcastReceiver
            public void onReceive(Context context, Intent intent) {
                if (DriveActions.ACTION_DRIVE.equals(intent.getAction())) {
                    this.mQueue.add(intent);
                }
            }
        }

        private KeyCheckExecution(Context context, GoogleSignInAccount googleSignInAccount) {
            this.mContext = new WeakReference<>(context);
            this.mResourceClient = Drive.getDriveResourceClient(context, googleSignInAccount);
            this.mDriveClient = Drive.getDriveClient(context, googleSignInAccount);
            this.mManager = LocalBroadcastManager.getInstance(context);
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.DriveAction
        public Task<Boolean> getRunningTask() {
            return exists().continueWithTask(getExecutor(), task -> {
                if (((Boolean) task.getResult()).booleanValue()) {
                    SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), SignInEvent.KeyCheckExecutionType.DRIVE_KEY_EXISTS.ordinal());
                    return task;
                }
                SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), SignInEvent.KeyCheckExecutionType.TRY_START_UPLOAD.ordinal());
                return tryStartUpload();
            });
        }

        private Task<Boolean> tryStartUpload() {
            return Tasks.call(getExecutor(), new DriveSync(this.mDriveClient))
                    .continueWith(getExecutor(), task -> Boolean.valueOf(task.isSuccessful()))
                    .continueWithTask(getExecutor(), task -> exists())
                    .continueWithTask(getExecutor(), task -> {
                        if (((Boolean) task.getResult()).booleanValue()) {
                            SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), SignInEvent.KeyCheckExecutionType.DRIVE_KEY_EXIST_AFTER_UPLOAD.ordinal());
                            return task;
                        }
                        SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), SignInEvent.KeyCheckExecutionType.DRIVE_KEY_DOES_NOT_EXIST_AFTER_UPLOAD.ordinal());
                        return upload();
                    });
        }

        private Task<Boolean> exists() {
            return Tasks.call(getExecutor(), new GetAppFolder(this.mResourceClient))
                    .continueWithTask(getExecutor(), task -> this.mResourceClient.listChildren((DriveFolder) task.getResult()))
                    .continueWith(getExecutor(), task -> {
                        int iOrdinal;
                        MetadataBuffer metadataBuffer = (MetadataBuffer) task.getResult();
                        try {
                            boolean zHasMetadata = hasMetadata(metadataBuffer);
                            SignInEvent signInEvent = SignInEvent.KEY_CHECK_EXECUTION;
                            Context context = this.mContext.get();
                            if (zHasMetadata) {
                                iOrdinal = SignInEvent.KeyCheckExecutionType.HAS_METADATA.ordinal();
                            } else {
                                iOrdinal = SignInEvent.KeyCheckExecutionType.HAS_NO_METADATA.ordinal();
                            }
                            signInEvent.send(context, iOrdinal);
                            return Boolean.valueOf(zHasMetadata);
                        } finally {
                            metadataBuffer.release();
                        }
                    });
        }

        private Task<Boolean> upload() {
            return Tasks.call(getExecutor(), new GetAppFolder(this.mResourceClient)).continueWith(getExecutor(), task -> {
                DriveContents driveContents = (DriveContents) Tasks.await(this.mResourceClient.createContents());
                SynchronousQueue<Intent> synchronousQueue = new SynchronousQueue<>();
                CompletionReceiver completionReceiver = new CompletionReceiver(synchronousQueue);
                boolean success = false;
                DriveFile driveFile = null;
                try (OutputStream outputStream = driveContents.getOutputStream()) {
                    try {
                        this.mManager.registerReceiver(completionReceiver, new IntentFilter(ACTION_DRIVE));
                        Vault.writeKey(outputStream);
                        MetadataChangeSet metadataChangeSet = new MetadataChangeSet.Builder().setTitle("encryption_keys_v1.json").setMimeType(ContentType.JSON.toMimeString()).setPinned(false).build();
                        ExecutionOptions executionOptions = new ExecutionOptions.Builder().setNotifyOnCompletion(true).setConflictStrategy(0).build();
                        long startTime = System.currentTimeMillis();
                        DriveFolder driveFolder = (DriveFolder) task.getResult();
                        driveFile = (DriveFile) Tasks.await(this.mResourceClient.createFile(driveFolder, metadataChangeSet, driveContents, executionOptions));
                        Intent intent = (Intent) synchronousQueue.poll(WAIT_TIME, TimeUnit.MILLISECONDS);
                        DebugLog.d(TAG, "Drive file upload execution time: " + (System.currentTimeMillis() - startTime) + " ms");
                        if (intent != null && intent.getBooleanExtra(EXTRA_RESULT, false)) {
                            DriveId driveId = intent.getParcelableExtra(EXTRA_DRIVE_ID);
                            if (driveId != null && driveId.equals(driveFile.getDriveId())) {
                                success = true;
                            }
                        }
                    } finally {
                        this.mManager.unregisterReceiver(completionReceiver);
                        if (!success && driveFile != null) {
                            this.mResourceClient.delete(driveFile);
                        }
                    }
                }
                SignInEvent signInEvent = SignInEvent.KEY_CHECK_EXECUTION;
                Context context = this.mContext.get();
                signInEvent.send(context, (success ? SignInEvent.KeyCheckExecutionType.UPLOAD_SUCCEEDED : SignInEvent.KeyCheckExecutionType.UPLOAD_FAILED).ordinal());
                return Boolean.valueOf(success);
            });
        }

        private boolean hasMetadata(MetadataBuffer metadataBuffer) {
            Metadata metadata = null;
            for (Metadata metadata2 : metadataBuffer) {
                if ("encryption_keys_v1.json".equals(metadata2.getTitle())) {
                    metadata = metadata2;
                }
            }
            return metadata != null;
        }
    }

    private static class GetKeyExecution extends DriveAction<KeyPair> {
        private final DriveResourceClient mResourceClient;

        private GetKeyExecution(Context context, GoogleSignInAccount googleSignInAccount) {
            this.mResourceClient = Drive.getDriveResourceClient(context, googleSignInAccount);
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.DriveAction
        public Task<KeyPair> getRunningTask() {
            return Tasks.call(getExecutor(), new GetAppFolder(this.mResourceClient))
                    .continueWithTask(getExecutor(), task -> this.mResourceClient.listChildren((DriveFolder) task.getResult()))
                    .continueWith(getExecutor(), task -> {
                        MetadataBuffer metadataBuffer = (MetadataBuffer) task.getResult();
                        try {
                            Metadata metadata = getMetadata(metadataBuffer);
                            return metadata != null ? metadata.getDriveId().asDriveFile() : null;
                        } finally {
                            if (metadataBuffer != null) {
                                metadataBuffer.release();
                            }
                        }
                    })
                    .continueWithTask(getExecutor(), task -> this.mResourceClient.openFile((DriveFile) task.getResult(), DriveFile.MODE_READ_ONLY))
                    .continueWith(getExecutor(), task -> {
                        try (InputStream inputStream = ((DriveContents) task.getResult()).getInputStream()) {
                            return KeyPair.from(StreamUtils.toJsonUrlEncoded(inputStream));
                        }
                    });
        }

        private Metadata getMetadata(MetadataBuffer metadataBuffer) {
            Metadata metadata = null;
            for (Metadata metadata2 : metadataBuffer) {
                if ("encryption_keys_v1.json".equals(metadata2.getTitle())) {
                    Date createdDate = metadata2.getCreatedDate();
                    if (metadata == null || createdDate.before(metadata.getCreatedDate())) {
                        metadata = metadata2;
                    }
                }
            }
            return metadata;
        }
    }

    static DriveAction<Boolean> handleDriveKey(Context context, GoogleSignInAccount googleSignInAccount) {
        return new KeyCheckExecution(context, googleSignInAccount);
    }

    public static DriveAction<KeyPair> getKeys(Context context) {
        return new GetKeyExecution(context, GoogleSignIn.getLastSignedInAccount(context));
    }
}
