package com.sonymobile.scan3d.storageservice.content.aws;

import android.content.Context;
import com.amazonaws.AmazonClientException;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferObserver;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferState;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferType;
import com.amazonaws.mobileconnectors.s3.transferutility.TransferUtility;
import com.amazonaws.services.s3.model.ListObjectsV2Request;
import com.amazonaws.services.s3.model.ListObjectsV2Result;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.S3ObjectSummary;
import com.amazonaws.services.sqs.model.SendMessageRequest;
import com.google.firebase.iid.FirebaseInstanceId;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.network.ContentType;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class AwsSession {
    private static final String ATTRIB_COGNITO_ID = "cognito_id";
    private static final String ATTRIB_CONTENT_ID = "content";
    private static final String ATTRIB_COUNTRY = "country";
    private static final String ATTRIB_EMAIL = "email";
    private static final String ATTRIB_FIREBASE_TOKEN = "firebase_token";
    private static final String ATTRIB_GIVEN_NAME = "given_name";
    private static final String ATTRIB_GOOGLE_ID = "google_id";
    private static final String ATTRIB_JOB_TYPE = "job_type";
    private static final String ATTRIB_KEY = "key";
    private static final String ATTRIB_LANGUAGE = "lang";
    private static final String ATTRIB_PROTOCOL_VERSION = "protocol_version";
    private static final String ATTRIB_RECEIVING_REQUEST = "receiving_request";
    private static final String ATTRIB_REQUEST_TYPE = "request_type";
    private static final String ATTRIB_SESSION_ID = "session_id";
    private static final String ATTRIB_USE_ENCRYPTION = "use_encryption";
    private static final int JSON_INDENT = 3;
    private static final int PROTOCOL_VERSION = 1;
    public static final String REQUEST_TYPE_DELETE_ACCOUNT = "delete_account_request";
    public static final String REQUEST_TYPE_EXECUTE = "execution_request";
    public static final String REQUEST_TYPE_EXTRACT_DATA = "extract_data_request";
    public static final String REQUEST_TYPE_INIT = "init_request";
    private static final String TAG = "com.sonymobile.scan3d.storageservice.content.aws.AwsSession";
    private Context mContext;

    AwsSession(Context context) {
        this.mContext = context.getApplicationContext();
    }

    public String getIdentityId() throws AwsSessionException, GeneralAwsException {
        try {
            return Aws.INSTANCE.getCognitoId(this);
        } catch (AmazonClientException e) {
            throw new GeneralAwsException("Error while fetching the cognito id.", e);
        }
    }

    public boolean refreshCredentials() throws AwsSessionException, GeneralAwsException {
        try {
            return Aws.INSTANCE.refreshCredentials(this.mContext, this);
        } catch (AmazonClientException e) {
            throw new GeneralAwsException("Error while refreshing credentials.", e);
        }
    }

    public void clearCredentials() throws AwsSessionException {
        Aws.INSTANCE.clearCredentials(this);
    }

    public boolean doesContentExist(String str, String str2) throws AwsSessionException, GeneralAwsException {
        try {
            return Aws.INSTANCE.getS3(this).doesObjectExist(str, str2);
        } catch (AmazonClientException e) {
            throw new GeneralAwsException("Error while checking if content exists", e);
        }
    }

    public List<S3ObjectSummary> listObjects(String str, String str2) throws AwsSessionException, GeneralAwsException {
        ListObjectsV2Result listObjectsV2ResultListObjectsV2;
        try {
            ArrayList arrayList = new ArrayList();
            ListObjectsV2Request listObjectsV2RequestWithPrefix = new ListObjectsV2Request().withBucketName(str).withPrefix(str2);
            do {
                listObjectsV2ResultListObjectsV2 = Aws.INSTANCE.getS3(this).listObjectsV2(listObjectsV2RequestWithPrefix);
                arrayList.addAll(listObjectsV2ResultListObjectsV2.getObjectSummaries());
                listObjectsV2RequestWithPrefix.setContinuationToken(listObjectsV2ResultListObjectsV2.getNextContinuationToken());
            } while (listObjectsV2ResultListObjectsV2.isTruncated());
            return arrayList;
        } catch (AmazonClientException e) {
            throw new GeneralAwsException("Error while listing objects.", e);
        }
    }

    public void delete(String str, String str2) throws AwsSessionException, GeneralAwsException {
        try {
            Aws.INSTANCE.getS3(this).deleteObject(str, str2);
        } catch (AmazonClientException e) {
            throw new GeneralAwsException("Error while deleting an object.", e);
        }
    }

    public TransferControl upload(String str, String str2, File file) throws AwsSessionException {
        TransferUtility transferUtility = getTransferUtility();
        ObjectMetadata objectMetadata = new ObjectMetadata();
        objectMetadata.setContentType(ContentType.getContentType(file).toMimeString());
        objectMetadata.setLastModified(new Date(file.lastModified()));
        objectMetadata.setContentLength(file.length());
        return new TransferControl(transferUtility, transferUtility.upload(str, str2, file, objectMetadata));
    }

    public TransferControl download(String str, String str2, File file) throws AwsSessionException {
        TransferUtility transferUtility = getTransferUtility();
        return new TransferControl(transferUtility, transferUtility.download(str, str2, file));
    }

    public TransferControl resume(int i) throws AwsSessionException {
        TransferUtility transferUtility;
        TransferObserver transferObserverResume;
        if (i <= 0 || (transferObserverResume = (transferUtility = getTransferUtility()).resume(i)) == null) {
            return null;
        }
        return new TransferControl(transferUtility, transferObserverResume);
    }

    public void removeAllFinishedTransfers() throws AwsSessionException {
        TransferUtility transferUtility = getTransferUtility();
        Iterator<TransferObserver> it = transferUtility.getTransfersWithTypeAndStates(TransferType.ANY, new TransferState[]{TransferState.CANCELED, TransferState.COMPLETED, TransferState.FAILED}).iterator();
        while (it.hasNext()) {
            int id = it.next().getId();
            transferUtility.deleteTransferRecord(id);
            DebugLog.d(TAG, "Removed transfer with id " + id);
        }
    }

    public String postInitKeyJob(String str) throws AwsSessionException {
        try {
            String identityId = getIdentityId();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(ATTRIB_REQUEST_TYPE, REQUEST_TYPE_INIT);
            jSONObject.put(ATTRIB_RECEIVING_REQUEST, str);
            jSONObject.put(ATTRIB_COGNITO_ID, getIdentityId());
            jSONObject.put(ATTRIB_FIREBASE_TOKEN, FirebaseInstanceId.getInstance().getToken());
            jSONObject.put(ATTRIB_PROTOCOL_VERSION, 1);
            return postJobToSqs(jSONObject.toString(3), UUID.randomUUID().toString(), Config.getPostProcessInitJobSqsUrl(this.mContext), identityId);
        } catch (GeneralAwsException | JSONException e) {
            DebugLog.d(TAG, "Failed to send init message", e);
            return null;
        }
    }

    public String postExtractDataJob(String str, String str2, String str3, String str4, String str5) throws AwsSessionException {
        try {
            String identityId = getIdentityId();
            Locale locale = Locale.getDefault();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(ATTRIB_REQUEST_TYPE, REQUEST_TYPE_EXTRACT_DATA);
            jSONObject.put(ATTRIB_SESSION_ID, str);
            jSONObject.put(ATTRIB_COGNITO_ID, identityId);
            jSONObject.put("key", str5);
            jSONObject.put("email", str2);
            jSONObject.put(ATTRIB_GIVEN_NAME, str3);
            jSONObject.put(ATTRIB_GOOGLE_ID, str4);
            jSONObject.put(ATTRIB_LANGUAGE, locale.getLanguage());
            jSONObject.put(ATTRIB_COUNTRY, locale.getCountry());
            jSONObject.put(ATTRIB_USE_ENCRYPTION, Config.encrypt(this.mContext));
            jSONObject.put(ATTRIB_FIREBASE_TOKEN, FirebaseInstanceId.getInstance().getToken());
            jSONObject.put(ATTRIB_PROTOCOL_VERSION, 1);
            return postJobToSqs(jSONObject.toString(3), str, Config.getGdprExecuteJobSqsUrl(this.mContext), identityId);
        } catch (GeneralAwsException | JSONException e) {
            DebugLog.d(TAG, "Failed to send extract data message", e);
            return null;
        }
    }

    public String postDeleteAccountJob() throws AwsSessionException {
        try {
            String identityId = getIdentityId();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(ATTRIB_REQUEST_TYPE, REQUEST_TYPE_DELETE_ACCOUNT);
            jSONObject.put(ATTRIB_COGNITO_ID, identityId);
            jSONObject.put(ATTRIB_FIREBASE_TOKEN, FirebaseInstanceId.getInstance().getToken());
            jSONObject.put(ATTRIB_PROTOCOL_VERSION, 1);
            return postJobToSqs(jSONObject.toString(3), UUID.randomUUID().toString(), Config.getGdprExecuteJobSqsUrl(this.mContext), identityId);
        } catch (GeneralAwsException | JSONException e) {
            DebugLog.d(TAG, "Failed to send delete account message", e);
            return null;
        }
    }

    public String postExecuteImprovementJob(String str, IFileSet iFileSet, String str2, String str3, int i) throws AwsSessionException {
        try {
            String identityId = getIdentityId();
            JSONObject jSONObject = new JSONObject();
            jSONObject.put(ATTRIB_REQUEST_TYPE, REQUEST_TYPE_EXECUTE);
            jSONObject.put("content", iFileSet.getIdentifier());
            jSONObject.put(ATTRIB_COGNITO_ID, getIdentityId());
            jSONObject.put(ATTRIB_FIREBASE_TOKEN, FirebaseInstanceId.getInstance().getToken());
            jSONObject.put(ATTRIB_JOB_TYPE, str);
            jSONObject.put(ATTRIB_SESSION_ID, str2);
            jSONObject.put("key", str3);
            jSONObject.put(ATTRIB_USE_ENCRYPTION, Config.encrypt(this.mContext));
            jSONObject.put(ATTRIB_PROTOCOL_VERSION, i);
            return postJobToSqs(jSONObject.toString(3), iFileSet.getIdentifier() + System.currentTimeMillis(), Config.getPostProcessExecuteJobSqsUrl(this.mContext), identityId);
        } catch (GeneralAwsException | JSONException e) {
            DebugLog.d(TAG, "Failed to send execute improvement message.", e);
            return null;
        }
    }

    private String postJobToSqs(String str, String str2, String str3, String str4) throws AwsSessionException {
        try {
            return Aws.INSTANCE.getSqs(this).sendMessage(new SendMessageRequest().withQueueUrl(str3).withMessageBody(str).withMessageDeduplicationId(str2).withMessageGroupId(str4)).getMessageId();
        } catch (AmazonClientException e) {
            DebugLog.d(TAG, "Exception while sending message.", e);
            return null;
        }
    }

    private TransferUtility getTransferUtility() throws AwsSessionException {
        return TransferUtility.builder().s3Client(Aws.INSTANCE.getS3(this)).context(this.mContext).build();
    }
}
