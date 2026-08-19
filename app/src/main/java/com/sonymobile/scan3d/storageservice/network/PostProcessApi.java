package com.sonymobile.scan3d.storageservice.network;

import android.content.Context;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSession;
import com.sonymobile.scan3d.storageservice.content.aws.AwsSessionException;
import com.sonymobile.scan3d.storageservice.content.aws.GeneralAwsException;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: loaded from: classes.dex */
public final class PostProcessApi {
    private static final String LOG_S3_KEY = "log";
    private static final String S3_PREFIX = "cognito/3dcreator";
    private static final String SLASH = "/";

    private PostProcessApi() {
    }

    public static String getPostProcessLogKey(String str, String str2) {
        return buildS3Path(str, str2, LOG_S3_KEY);
    }

    public static List<String> listLogs(Context context, AwsSession awsSession) throws AwsSessionException, GeneralAwsException {
        ArrayList arrayList = new ArrayList();
        if (awsSession != null) {
            Iterator<S3ObjectSummary> it = awsSession.listObjects(Config.getPostProcessLogBucket(context), buildS3Path(awsSession.getIdentityId())).iterator();
            while (it.hasNext()) {
                String key = it.next().getKey();
                if (key.endsWith(LOG_S3_KEY)) {
                    String[] strArrSplit = key.split(SLASH);
                    if (strArrSplit.length > 3) {
                        arrayList.add(strArrSplit[3]);
                    }
                }
            }
        }
        return arrayList;
    }

    public static void deleteLog(Context context, AwsSession awsSession, IFileSet iFileSet) throws AwsSessionException, GeneralAwsException {
        int transferFlags = iFileSet.getTransferFlags();
        if (awsSession == null || (transferFlags & 8) == 0) {
            return;
        }
        awsSession.delete(Config.getPostProcessLogBucket(context), buildS3Path(awsSession.getIdentityId(), iFileSet.getIdentifier()));
    }

    private static String buildS3Path(String... strArr) {
        StringBuilder sb = new StringBuilder(S3_PREFIX);
        for (String str : strArr) {
            sb.append(SLASH);
            sb.append(str);
        }
        return sb.toString();
    }
}
