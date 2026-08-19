package com.sonymobile.scan3d.storageservice.content;

import android.app.job.JobParameters;
import android.content.ContentProviderClient;
import android.content.Context;
import android.content.OperationApplicationException;
import android.os.RemoteException;
import android.text.TextUtils;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.content.aws.GeneralAwsException;
import com.sonymobile.scan3d.storageservice.network.NetworkException;
import java.util.concurrent.ExecutionException;

/* JADX INFO: loaded from: classes.dex */
abstract class AbstractAuthenticatedSyncAdapter extends AwsTask {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.AbstractAuthenticatedSyncAdapter";

    abstract boolean onAuthenticatedSync(Context context, AwsSession awsSession, ContentProviderClient contentProviderClient, String str) throws NetworkException, AwsSessionException, InterruptedException, RemoteException, GeneralAwsException, OperationApplicationException, ExecutionException;

    AbstractAuthenticatedSyncAdapter(TaskService taskService, JobParameters jobParameters, AwsSession awsSession) {
        super(taskService, jobParameters, false, false, awsSession);
    }

    @Override // com.sonymobile.scan3d.storageservice.content.AwsTask
    void doWork(Context context, JobParameters jobParameters, AwsSession awsSession) {
        boolean zOnAuthenticatedSync;
        Exception e;
        DebugLog.d(TAG, "doWork(): Start");
        try {
            ContentProviderClient contentProviderClientAcquireContentProviderClient = context.getContentResolver().acquireContentProviderClient("com.sonymobile.scan3d.storageprovider");
            Throwable th = null;
            try {
                String authToken = AccountUtils.getAuthToken(context, false);
                zOnAuthenticatedSync = (TextUtils.isEmpty(authToken) || AccountUtils.isDeleteOngoing(context)) ? false : onAuthenticatedSync(context, awsSession, contentProviderClientAcquireContentProviderClient, authToken);
                if (contentProviderClientAcquireContentProviderClient != null) {
                    try {
                        contentProviderClientAcquireContentProviderClient.close();
                    } catch (Exception eCaught) {
                        e = eCaught;
                        DebugLog.d(TAG, "doWork(): ", e);
                    }
                }
            } catch (Throwable th2) {
                if (contentProviderClientAcquireContentProviderClient != null) {
                    if (0 != 0) {
                        try {
                            contentProviderClientAcquireContentProviderClient.close();
                        } catch (Throwable th3) {
                            th.addSuppressed(th3);
                        }
                    } else {
                        contentProviderClientAcquireContentProviderClient.close();
                    }
                }
                throw th2;
            }
        } catch (Exception e2) {
            e = e2;
            zOnAuthenticatedSync = false;
        }
        setReschedule(zOnAuthenticatedSync ? false : true);
    }
}
