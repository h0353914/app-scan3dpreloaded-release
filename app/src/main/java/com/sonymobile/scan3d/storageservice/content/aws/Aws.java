package com.sonymobile.scan3d.storageservice.content.aws;

import android.accounts.Account;
import android.content.Context;
import com.amazonaws.AmazonClientException;
import com.amazonaws.ClientConfiguration;
import com.amazonaws.auth.CognitoCredentialsProvider;
import com.amazonaws.regions.Region;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClient;
import com.google.android.gms.auth.GoogleAuthException;
import com.google.android.gms.auth.GoogleAuthUtil;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.TimeUnit;

/* JADX INFO: loaded from: classes.dex */
public enum Aws {
    INSTANCE;

    private static final int SOCKET_TIMEOUT = 10000;
    private CognitoCredentialsProvider mProvider;
    private AmazonS3 mS3;
    private List<AwsSession> mSessions = new ArrayList();
    private AmazonSQS mSqs;
    private static final long REFRESH_THRESHOLD = TimeUnit.MINUTES.toMillis(15);
    private static final String TAG = Aws.class.getName();

    Aws() {
    }

    public synchronized AwsSession startSession(Context context) {
        AwsSession awsSession;
        if (this.mProvider == null) {
            this.mProvider = new CognitoCredentialsProvider(Config.getPostProcessCognitoIdentityPool(context), Regions.EU_WEST_1);
        }
        ClientConfiguration clientConfiguration = null;
        if (this.mS3 == null || this.mSqs == null) {
            clientConfiguration = new ClientConfiguration();
            clientConfiguration.setSocketTimeout(10000);
        }
        if (this.mS3 == null) {
            this.mS3 = new AmazonS3Client(this.mProvider, clientConfiguration);
            this.mS3.setRegion(Region.getRegion(Regions.EU_WEST_1));
        }
        if (this.mSqs == null) {
            this.mSqs = new AmazonSQSClient(this.mProvider, clientConfiguration);
        }
        awsSession = new AwsSession(context);
        this.mSessions.add(awsSession);
        DebugLog.d(TAG, "startSession(): Number of active aws sessions " + this.mSessions.size());
        return awsSession;
    }

    public synchronized void endSession(AwsSession awsSession) {
        if (this.mSessions.remove(awsSession) && this.mSessions.isEmpty()) {
            shutdownAwsResources();
        }
        DebugLog.d(TAG, "endSession(): Number of active aws sessions " + this.mSessions.size());
    }

    synchronized boolean refreshCredentials(Context context, AwsSession awsSession) throws AwsSessionException, GeneralAwsException {
        boolean z;
        ensureSession(awsSession);
        Date date = new Date(System.currentTimeMillis() - REFRESH_THRESHOLD);
        Date sessionCredentitalsExpiration = this.mProvider.getSessionCredentitalsExpiration();
        z = true;
        if (sessionCredentitalsExpiration == null || sessionCredentitalsExpiration.before(date)) {
            try {
                authenticate(this.mProvider, getGoogleToken(context));
            } catch (GoogleAuthException | IOException unused) {
                DebugLog.d(TAG, "refreshCredentials(): Failed to refresh the token.");
                z = false;
            }
        }
        return z;
    }

    synchronized void clearCredentials(AwsSession awsSession) throws AwsSessionException {
        ensureSession(awsSession);
        this.mProvider.clear();
        invalidateSessions();
    }

    synchronized String getCognitoId(AwsSession awsSession) throws AwsSessionException {
        ensureSession(awsSession);
        return this.mProvider.getIdentityId();
    }

    synchronized AmazonS3 getS3(AwsSession awsSession) throws AwsSessionException {
        ensureSession(awsSession);
        return this.mS3;
    }

    synchronized AmazonSQS getSqs(AwsSession awsSession) throws AwsSessionException {
        ensureSession(awsSession);
        return this.mSqs;
    }

    synchronized boolean isSessionless() {
        return this.mSessions.isEmpty() && this.mS3 == null && this.mSqs == null;
    }

    synchronized void invalidateSessions() {
        this.mSessions.clear();
        shutdownAwsResources();
    }

    private void shutdownAwsResources() {
        this.mS3 = null;
        AmazonSQS amazonSQS = this.mSqs;
        if (amazonSQS != null) {
            amazonSQS.shutdown();
            this.mSqs = null;
        }
    }

    private void ensureSession(AwsSession awsSession) throws AwsSessionException {
        if (!this.mSessions.contains(awsSession)) {
            throw new AwsSessionException("Invalid session");
        }
    }

    private static String getGoogleToken(Context context) throws IOException, GoogleAuthException {
        return GoogleAuthUtil.getToken(context, new Account(AccountUtils.getAccountName(context), "com.google"), Config.getTokenScope(context));
    }

    private static void authenticate(CognitoCredentialsProvider cognitoCredentialsProvider, String str) throws GeneralAwsException {
        try {
            HashMap map = new HashMap(1);
            map.put(AccountUtils.GOOGLE_ACCOUNT_ID, str);
            cognitoCredentialsProvider.withLogins(map).refresh();
        } catch (AmazonClientException e) {
            throw new GeneralAwsException("Failure when authenticating user.", e);
        }
    }
}
