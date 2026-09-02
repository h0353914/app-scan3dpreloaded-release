package com.sonymobile.scan3d.storageservice.authentication;

import android.content.Context;
import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.google.api.client.http.FileContent;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.FileList;
import com.sonymobile.scan3d.analytics.SignInEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.network.ContentType;
import com.sonymobile.scan3d.storageservice.network.StreamUtils;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.List;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class DriveActions {
    private static final String APP_DATA_FOLDER = "appDataFolder";
    private static final String TAG = "DriveActions";

    private static class GetKeyExecution extends DriveAction<KeyPair> {
        private Drive mDriveService;
        private String mFileId;

        private GetKeyExecution(Drive drive) {
            this.mDriveService = drive;
        }

        private String getFileId(Drive drive) {
            try {
                for (File file : drive.files().list().setSpaces(APP_DATA_FOLDER).execute().getFiles()) {
                    if ("encryption_keys_v1.json".equals(file.getName())) {
                        return file.getId();
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.DriveAction
        public Task<KeyPair> getRunningTask() {
            return Tasks.call(getExecutor(), () -> {
                this.mFileId = getFileId(this.mDriveService);
                try (InputStream inputStream = this.mDriveService.files().get(this.mFileId).executeMediaAsInputStream()) {
                    return KeyPair.from(StreamUtils.toJsonUrlEncoded(inputStream));
                } catch (IOException e) {
                    DebugLog.e(TAG, "Error in reading keyfile from Drive", e);
                    return KeyPair.from(new JSONObject());
                }
            });
        }
    }

    private static class KeyCheckExecution extends DriveAction<Boolean> {
        private WeakReference<Context> mContext;
        private Drive mDriveService;

        private KeyCheckExecution(Context context, Drive drive) {
            this.mContext = new WeakReference<>(context);
            this.mDriveService = drive;
        }

        @Override // com.sonymobile.scan3d.storageservice.authentication.DriveAction
        public Task<Boolean> getRunningTask() {
            return exists().continueWithTask(getExecutor(), task -> {
                if (((Boolean) task.getResult()).booleanValue()) {
                    SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), SignInEvent.KeyCheckExecutionType.DRIVE_KEY_EXISTS.ordinal());
                    return task;
                }
                SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), SignInEvent.KeyCheckExecutionType.TRY_START_UPLOAD.ordinal());
                return upload();
            });
        }

        private Task<Boolean> exists() {
            return Tasks.call(getExecutor(), () -> this.mDriveService.files().list().setSpaces(APP_DATA_FOLDER).execute())
                    .continueWithTask(getExecutor(), task -> {
                        FileList fileList = task.getResult();
                        if (!task.isSuccessful()) {
                            Exception exception = task.getException();
                            if (exception == null) {
                                exception = new Exception("Unable to query files");
                            }
                            DebugLog.e(TAG, "Query task failed", exception.fillInStackTrace());
                            return Tasks.forException(exception);
                        }
                        if (fileList == null) {
                            return Tasks.forResult(Boolean.valueOf(false));
                        }
                        boolean zHasKeyFile = hasEncryptionKeyFile(fileList.getFiles());
                        SignInEvent.KEY_CHECK_EXECUTION.send(this.mContext.get(), (zHasKeyFile ? SignInEvent.KeyCheckExecutionType.HAS_METADATA : SignInEvent.KeyCheckExecutionType.HAS_NO_METADATA).ordinal());
                        return Tasks.forResult(Boolean.valueOf(zHasKeyFile));
                    });
        }

        private boolean hasEncryptionKeyFile(List<File> list) {
            for (File file : list) {
                if ("encryption_keys_v1.json".equals(file.getName())) {
                    return true;
                }
            }
            return false;
        }

        private Task<Boolean> upload() {
            return Tasks.call(getExecutor(), () -> {
                File file = new File();
                file.setName("encryption_keys_v1.json");
                file.setParents(Collections.singletonList(APP_DATA_FOLDER));
                file.setMimeType(ContentType.JSON.toMimeString());
                java.io.File localFile = new java.io.File(this.mContext.get().getFilesDir().getAbsolutePath() + java.io.File.separator + "encryption_keys_v1.json");
                Vault.writeKey(new FileOutputStream(localFile));
                File fileCreated = this.mDriveService.files().create(file, new FileContent("application/json", localFile)).execute();
                if (!localFile.delete()) {
                    DebugLog.d(TAG, "Failed to delete temp file.");
                }
                return Boolean.valueOf(fileCreated.getId() != null);
            });
        }
    }

    static DriveAction<Boolean> handleDriveKey(Context context, Drive drive) {
        return new KeyCheckExecution(context, drive);
    }

    public static DriveAction<KeyPair> getKeys(Context context) {
        GoogleSignInAccount googleSignInAccount = GoogleSignIn.getLastSignedInAccount(context);
        return new GetKeyExecution(DriveActionsUtil.getGoogleDrive(context, googleSignInAccount));
    }
}
