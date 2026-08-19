package com.sonymobile.scan3d.storageservice.content;

import android.content.ContentProviderClient;
import android.content.ContentProviderOperation;
import android.content.ContentProviderResult;
import android.content.Context;
import android.content.OperationApplicationException;
import android.os.RemoteException;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.DriveActions;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.Matcher;
import java.util.ArrayList;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
class SyncTransaction {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.SyncTransaction";
    private ArrayList<ContentProviderOperation> mContentProviderOperations = new ArrayList<>();
    private ArrayList<NetworkOperation> mNetworkOperations = new ArrayList<>();

    SyncTransaction() {
    }

    private static class NetworkOperation {
        private boolean mAreKeysRequired;
        private IFileSet mFileSet;
        private int mType;

        NetworkOperation(int i, IFileSet iFileSet, boolean z) {
            this.mType = i;
            this.mFileSet = iFileSet;
            this.mAreKeysRequired = z;
        }

        boolean areKeysRequired() {
            return this.mAreKeysRequired;
        }

        boolean execute(Context context, KeyPair keyPair) {
            if (this.mAreKeysRequired && keyPair == null) {
                return false;
            }
            return Jobs.requestTransferJob(context, this.mType, this.mFileSet, keyPair);
        }
    }

    int addContentProviderOperation(ContentProviderOperation contentProviderOperation) {
        this.mContentProviderOperations.add(contentProviderOperation);
        return this.mContentProviderOperations.size() - 1;
    }

    void addDownloadOperation(IFileSet iFileSet) {
        addNetworkOperation(4, iFileSet, true);
    }

    void addUploadOperation(IFileSet iFileSet) {
        addNetworkOperation(3, iFileSet, true);
    }

    void addDeleteOperation(IFileSet iFileSet) {
        addNetworkOperation(2, iFileSet, false);
    }

    void addModifyOperation(IFileSet iFileSet) {
        addNetworkOperation(1, iFileSet, false);
    }

    boolean apply(Context context, ContentProviderClient contentProviderClient) throws ExecutionException, InterruptedException, RemoteException, OperationApplicationException {
        if (this.mContentProviderOperations.size() > 0) {
            ContentProviderResult[] contentProviderResultArrApplyBatch = contentProviderClient.applyBatch(this.mContentProviderOperations);
            Matcher matcher = new Matcher();
            for (ContentProviderResult contentProviderResult : contentProviderResultArrApplyBatch) {
                if (contentProviderResult.uri != null && matcher.match(contentProviderResult.uri) == 0) {
                    addDownloadOperation(Factory.create(context, contentProviderResult.uri));
                }
            }
        } else {
            DebugLog.d(TAG, "No content provider transactions provided.");
        }
        boolean z = true;
        if (this.mNetworkOperations.size() > 0) {
            boolean z2 = true;
            KeyPair keyPairExecuteWait = null;
            for (NetworkOperation networkOperation : this.mNetworkOperations) {
                if (networkOperation.areKeysRequired()) {
                    if (keyPairExecuteWait == null) {
                        try {
                            keyPairExecuteWait = DriveActions.getKeys(context).executeWait();
                        } catch (ExecutionException e) {
                            DebugLog.d(TAG, "Could not get keys", e);
                        }
                    }
                    if (keyPairExecuteWait != null) {
                        z2 = networkOperation.execute(context, keyPairExecuteWait) && z2;
                    }
                } else {
                    z2 = networkOperation.execute(context, null) && z2;
                }
            }
            z = z2;
        } else {
            DebugLog.d(TAG, "No network transactions provided.");
        }
        DebugLog.d(TAG, "All jobs where submitted " + z);
        return z;
    }

    private void addNetworkOperation(int i, IFileSet iFileSet, boolean z) {
        this.mNetworkOperations.add(new NetworkOperation(i, iFileSet, z));
    }
}
