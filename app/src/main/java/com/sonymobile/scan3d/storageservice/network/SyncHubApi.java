package com.sonymobile.scan3d.storageservice.network;

import android.content.Context;
import android.text.TextUtils;
import com.sonymobile.scan3d.R;
import com.sonymobile.scan3d.analytics.SignInEvent;
import com.sonymobile.scan3d.logging.DebugLog;
import com.sonymobile.scan3d.storageservice.Config;
import com.sonymobile.scan3d.storageservice.authentication.AccountUtils;
import com.sonymobile.scan3d.storageservice.authentication.KeyPair;
import com.sonymobile.scan3d.storageservice.authentication.Vault;
import com.sonymobile.scan3d.storageservice.network.model.S3UploadData;
import com.sonymobile.scan3d.storageservice.network.synchublib.Encryption;
import com.sonymobile.scan3d.storageservice.network.synchublib.cloudaccess.AccessToken;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.AccessTokenUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.ContentListUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.ContentUpdateUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.FileDeleteUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.FileDownloadUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.FileUploadUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.PropertiesUtil;
import com.sonymobile.scan3d.storageservice.network.synchublib.util.SyncHubConstants;
import com.sonymobile.scan3d.storageservice.provider.Factory;
import com.sonymobile.scan3d.storageservice.provider.IFileSet;
import com.sonymobile.scan3d.storageservice.provider.ITransientFileSet;
import com.sonymobile.scan3d.storageservice.utils.FsUtils;
import com.sonymobile.scan3d.viewer.sharing.Shareable;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.crypto.CipherInputStream;
import org.apache.http.HttpEntity;
import org.json.JSONException;
import org.json.JSONObject;

/* JADX INFO: loaded from: classes.dex */
public final class SyncHubApi {
    private static final String TAG = "com.sonymobile.scan3d.storageservice.network.SyncHubApi";

    private SyncHubApi() {
    }

    public static void setPackageName(String str) {
        PropertiesUtil.setPackageName(str);
    }

    public static IRestExecutor<AccessToken> getAuthToken(Context context, String str) {
        return getToken(context, str, false);
    }

    public static IRestExecutor<AccessToken> refreshAuthToken(Context context, String str) {
        return getToken(context, str, true);
    }

    public static IRestExecutor<Boolean> revokeRefreshToken(Context context, String str) {
        return new AbstractRestExecutor<Void, Boolean, Void>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.1
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Boolean getOutput(IHttpResponse iHttpResponse) {
                return Boolean.valueOf(iHttpResponse.getStatusCode() == 200);
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str2, Void r2, Void[] voidArr) {
                return new NetworkRequest(str2, NetworkRequest.Method.GET);
            }
        }.init(context, Config.getRevokeRefreshTokenUrl(context, str), null, new Void[0]);
    }

    public static IRestExecutor<Map<String, ITransientFileSet>> listMetadata(Context context, String str) {
        return new AbstractRestExecutor<Void, Map<String, ITransientFileSet>, String>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.2
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Map<String, ITransientFileSet> getOutput(IHttpResponse iHttpResponse) throws Exception {
                if (iHttpResponse.getStatusCode() == 200) {
                    return Factory.readContentList(ContentListUtil.handleServerResponse(StreamUtils.toString(iHttpResponse.getInputStream())));
                }
                return null;
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str2, String str3, Void[] voidArr) throws Exception {
                NetworkRequest networkRequest = new NetworkRequest(str2, NetworkRequest.Method.POST);
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(ContentListUtil.getJSON(str3).toString(), false);
                return networkRequest;
            }
        }.init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_CONTENT_LIST, str, new Void[0]);
    }

    public static IRestExecutor<Boolean> updateMetadata(Context context, String str, IFileSet iFileSet) {
        return new AbstractRestExecutor<IFileSet, Boolean, String>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.3
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Boolean getOutput(IHttpResponse iHttpResponse) {
                int statusCode = iHttpResponse.getStatusCode();
                return Boolean.valueOf(statusCode == 200 || statusCode == 204);
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str2, String str3, IFileSet[] iFileSetArr) throws Exception {
                IFileSet iFileSet2 = iFileSetArr[0];
                NetworkRequest networkRequest = new NetworkRequest(str2, NetworkRequest.Method.PUT);
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(ContentUpdateUtil.getJSON(iFileSet2.getIdentifier(), str3, iFileSet2.getName(), AccountUtils.getDisplayName(getContext()), iFileSet2.isDownloadable(), false, iFileSet2.isImprovement()).toString(), false);
                return networkRequest;
            }
        }.init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_UPDATE_CONTENT, str, iFileSet);
    }

    public static IRestExecutor<Boolean> deleteModel(Context context, String str, String str2) {
        return deleteModel(context, str, str2, false);
    }

    public static IRestExecutor<Boolean> unshareModel(Context context, String str, String str2) {
        return deleteModel(context, str, str2, true);
    }

    public static IRestExecutor<Boolean> deleteAllModels(Context context, String str) {
        return new AbstractRestExecutor<Void, Boolean, String>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.4
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Boolean getOutput(IHttpResponse iHttpResponse) {
                return Boolean.valueOf(iHttpResponse.getStatusCode() == 200);
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str2, String str3, Void[] voidArr) throws Exception {
                NetworkRequest networkRequest = new NetworkRequest(str2, NetworkRequest.Method.POST);
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(FileDeleteUtil.getJSON(str3).toString(), false);
                return networkRequest;
            }
        }.init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_DELETE_3D_ALL, str, new Void[0]);
    }

    private static IRestExecutor<Boolean> deleteModel(Context context, String str, String str2, boolean z) {
        return new AbstractRestExecutor<Object, Boolean, String>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.5
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Boolean getOutput(IHttpResponse iHttpResponse) {
                return Boolean.valueOf(iHttpResponse.getStatusCode() == 200);
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str3, String str4, Object[] objArr) throws Exception {
                NetworkRequest networkRequest = new NetworkRequest(str3, NetworkRequest.Method.POST);
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(FileDeleteUtil.getJSON((String) objArr[0], str4, ((Boolean) objArr[1]).booleanValue()).toString(), false);
                return networkRequest;
            }
        }.init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_DELETE_3D, str2, str, Boolean.valueOf(z));
    }

    public static abstract class CloudContent {
        private static final String LOG_S3_KEY = "log";
        private static final String METADATA_S3_KEY = "metadata.json";
        private static final String PREVIEW_S3_KEY = "preview";
        private static final String PROP_MESH_S3_KEY = "prop_mesh";
        private static final String RIGGED_MESH_S3_KEY = "rigged_scan";
        private static final String SCAN_S3_KEY = "scan";
        public static final int TYPE_LOG = 3;
        public static final int TYPE_METADATA = 2;
        public static final int TYPE_PREVIEW = 0;
        public static final int TYPE_PROP_MESH = 5;
        public static final int TYPE_RIGGED_MESH = 4;
        public static final int TYPE_SCAN = 1;
        protected final Context mContext;
        private final boolean mIsEncrypted;
        private final int mTransferFlag;
        private final int mType;

        CloudContent(Context context, int i, boolean z, int i2) {
            this.mContext = context;
            this.mType = i;
            this.mIsEncrypted = z;
            this.mTransferFlag = i2;
        }

        public final boolean isTransferred(int i) {
            return (i & this.mTransferFlag) != 0;
        }

        public final int getTransferFlag() {
            return this.mTransferFlag;
        }

        public int getType() {
            return this.mType;
        }

        public final boolean isEncrypted() {
            return this.mIsEncrypted && Config.encrypt(this.mContext);
        }

        final String getS3Key() {
            switch (this.mType) {
                case 0:
                    return PREVIEW_S3_KEY;
                case 1:
                    return SCAN_S3_KEY;
                case 2:
                    return METADATA_S3_KEY;
                case 3:
                    return LOG_S3_KEY;
                case 4:
                    return RIGGED_MESH_S3_KEY;
                case 5:
                    return PROP_MESH_S3_KEY;
                default:
                    throw new IllegalArgumentException("The type must always match a key.");
            }
        }

        File getFile(IFileSet iFileSet, File file, boolean z, KeyPair keyPair) {
            String previewUrl;
            switch (getType()) {
                case 0:
                    previewUrl = iFileSet.getPreviewUrl();
                    break;
                case 1:
                    previewUrl = iFileSet.getZipFileUrl();
                    break;
                case 2:
                default:
                    throw new IllegalArgumentException("No valid type " + getType());
                case 3:
                    previewUrl = iFileSet.getLogUrl();
                    break;
                case 4:
                    previewUrl = iFileSet.getRiggedFileUrl();
                    break;
                case 5:
                    previewUrl = iFileSet.getPropFileUrl();
                    break;
            }
            if (previewUrl == null) {
                return null;
            }
            if (!isEncrypted()) {
                return new File(previewUrl);
            }
            File file2 = new File(previewUrl);
            File file3 = new File(file, file2.getName());
            try {
                if (z) {
                    Vault.decrypt(this.mContext, file2, file3);
                } else {
                    Vault.encryptForCloud(this.mContext, file2, file3, keyPair.getEncryptionKeyDecoded());
                }
                return file3;
            } catch (IOException | GeneralSecurityException e) {
                DebugLog.e(SyncHubApi.TAG, "getFile Failed", e);
                return null;
            }
        }
    }

    public static class Downloadable extends CloudContent {
        Downloadable(Context context, int i, boolean z, int i2) {
            super(context, i, z, i2);
        }

        public File download(IFileSet iFileSet, KeyPair keyPair, String str) throws NetworkException {
            String str2 = (String) SyncHubApi.getDownloadUrl(this.mContext, this, iFileSet.getIdentifier(), str).execute();
            if (str2 != null) {
                return (File) SyncHubApi.download(this.mContext, str2, this, keyPair).execute();
            }
            return null;
        }
    }

    public static class Uploadable extends CloudContent {
        Uploadable(Context context, int i, boolean z, int i2) {
            super(context, i, z, i2);
        }

        public boolean upload(IFileSet iFileSet, KeyPair keyPair, String str) throws NetworkException {
            File tempDirectory = FsUtils.getTempDirectory(this.mContext);
            boolean z = false;
            try {
                File file = getFile(iFileSet, tempDirectory, false, keyPair);
                if (file != null && file.exists()) {
                    S3UploadData s3UploadData = (S3UploadData) SyncHubApi.getS3PrivateUploadData(this.mContext, file, this, keyPair, iFileSet.getIdentifier(), str).execute();
                    if (s3UploadData != null && ((Boolean) SyncHubApi.uploadToS3(this.mContext, s3UploadData).execute()).booleanValue()) {
                        z = true;
                    }
                } else if (3 == getType()) {
                    z = true;
                }
                return z;
            } finally {
                FsUtils.deleteFiles(tempDirectory, true);
            }
        }
    }

    private static class MetadataUploader extends Uploadable {
        private static final String KEY_CREATED = "created";
        private static final String KEY_DISPLAY_NAME = "display_name";
        private static final String KEY_IMPROVEMENT = "is_improvement";
        private static final String KEY_NAME = "name";
        private static final String KEY_SCAN_TYPE = "policy_mode";
        private static final String METADATA_FILE_NAME = "metadata.json";

        MetadataUploader(Context context) {
            super(context, 2, false, 32);
        }

        @Override // com.sonymobile.scan3d.storageservice.network.SyncHubApi.CloudContent
        File getFile(IFileSet iFileSet, File file, boolean z, KeyPair keyPair) {
            try {
                File file2 = new File(file, METADATA_FILE_NAME);
                String displayName = AccountUtils.getDisplayName(this.mContext);
                JSONObject jSONObject = new JSONObject();
                jSONObject.put("name", iFileSet.getName());
                jSONObject.put("created", iFileSet.getCreated().getTime());
                jSONObject.put("policy_mode", iFileSet.getScanType());
                if (displayName == null) {
                    displayName = "";
                }
                jSONObject.put(KEY_DISPLAY_NAME, displayName);
                jSONObject.put("is_improvement", iFileSet.isImprovement());
                StreamUtils.jsonToFile(jSONObject, file2);
                return file2;
            } catch (IOException | JSONException e) {
                throw new RuntimeException("getFile(): Failed to create or write to temp file.", e);
            }
        }
    }

    public static class PublicUploadable extends CloudContent {
        private String mShareId;
        private boolean mSpawnId;

        PublicUploadable(Context context, int i, boolean z, boolean z2) {
            super(context, i, z, 0);
            this.mSpawnId = z2;
        }

        public String getShareUid() {
            return this.mShareId;
        }

        public boolean upload(IFileSet iFileSet, String str) throws NetworkException {
            File tempDirectory = FsUtils.getTempDirectory(this.mContext);
            try {
                File file = getFile(iFileSet, tempDirectory, true, null);
                boolean z = false;
                if (file != null && file.exists()) {
                    S3UploadData s3UploadData = (S3UploadData) SyncHubApi.getS3PublicUploadData(this.mContext, file, this, iFileSet.getIdentifier(), str, getType() == 5).execute();
                    if (s3UploadData != null && ((Boolean) SyncHubApi.uploadToS3(this.mContext, s3UploadData).execute()).booleanValue()) {
                        z = true;
                    }
                    if (z && this.mSpawnId) {
                        this.mShareId = s3UploadData.getShareHash();
                    }
                }
                return z;
            } finally {
                FsUtils.deleteFiles(tempDirectory, true);
            }
        }
    }

    private static class UploadDataExecutor extends AbstractRestExecutor<Void, S3UploadData, String> {
        private String mChecksum;
        private CloudContent mCloudContent;
        private String mContentId;
        private ContentType mContentType;
        private boolean mIsPublic;
        private KeyPair mKeys;
        private String mSignature;
        private boolean mUpdateCacheMetadata;
        private File mUploadFile;

        static UploadDataExecutor newPublicUploadExecutor(CloudContent cloudContent, String str, File file, boolean z) {
            return new UploadDataExecutor(true, cloudContent, str, file, null, z);
        }

        static UploadDataExecutor newPrivateUploadExecutor(CloudContent cloudContent, String str, File file, KeyPair keyPair) {
            return new UploadDataExecutor(false, cloudContent, str, file, keyPair);
        }

        UploadDataExecutor(boolean z, CloudContent cloudContent, String str, File file, KeyPair keyPair) {
            this(z, cloudContent, str, file, keyPair, false);
        }

        UploadDataExecutor(boolean z, CloudContent cloudContent, String str, File file, KeyPair keyPair, boolean z2) {
            this.mIsPublic = z;
            this.mCloudContent = cloudContent;
            this.mContentId = str;
            this.mUploadFile = file;
            this.mKeys = keyPair;
            this.mContentType = ContentType.getContentType(this.mUploadFile);
            this.mUpdateCacheMetadata = z2;
        }
        @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
        public S3UploadData getOutput(IHttpResponse iHttpResponse) throws Exception {
            HttpEntity privateHttpEntityFromResponse;
            String shareHashFromResponse;
            if (iHttpResponse.getStatusCode() != 200) {
                return null;
            }
            String string = StreamUtils.toString(iHttpResponse.getInputStream());
            if (this.mIsPublic) {
                HttpEntity publicHttpEntityFromResponse = FileUploadUtil.getPublicHttpEntityFromResponse(string, this.mContentId, this.mUploadFile.getName(), this.mContentType.toMimeString(), this.mChecksum, this.mUploadFile, this.mUpdateCacheMetadata);
                shareHashFromResponse = getShareHashFromResponse(iHttpResponse);
                privateHttpEntityFromResponse = publicHttpEntityFromResponse;
            } else {
                privateHttpEntityFromResponse = FileUploadUtil.getPrivateHttpEntityFromResponse(string, this.mContentId, this.mUploadFile.getName(), this.mContentType.toMimeString(), this.mSignature, this.mChecksum, this.mUploadFile);
                shareHashFromResponse = null;
            }
            return new S3UploadData(FileUploadUtil.getUrlFromServerResponse(string), privateHttpEntityFromResponse, this.mUploadFile, !this.mIsPublic && this.mCloudContent.isEncrypted(), shareHashFromResponse);
        }

        @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
        public NetworkRequest getNetworkRequest(String str, String str2, Void[] voidArr) throws Exception {
            JSONObject jSONForPrivateSignedUriRequest;
            if (this.mIsPublic) {
                this.mChecksum = Vault.getChecksum(this.mUploadFile);
                jSONForPrivateSignedUriRequest = FileUploadUtil.getJSONForPublicSignedUriRequest(this.mCloudContent.getS3Key(), this.mUploadFile.getName(), this.mContentType.toMimeString(), this.mContentId, str2, this.mChecksum, this.mUpdateCacheMetadata);
            } else {
                this.mSignature = Vault.getSignature(this.mUploadFile, this.mKeys.getSignatureKeyDecoded());
                this.mChecksum = Vault.getChecksum(this.mUploadFile);
                jSONForPrivateSignedUriRequest = FileUploadUtil.getJSONForPrivateSignedUriRequest(this.mCloudContent.getS3Key(), this.mUploadFile.getName(), this.mContentType.toMimeString(), this.mContentId, this.mSignature, str2, this.mChecksum);
            }
            NetworkRequest networkRequest = new NetworkRequest(str, NetworkRequest.Method.POST);
            networkRequest.setUseStreamingMode(false);
            networkRequest.setBody(jSONForPrivateSignedUriRequest.toString(), false);
            return networkRequest;
        }

        private static String getShareHashFromResponse(IHttpResponse iHttpResponse) throws IOException {
            String publicKeyFromResponse = FileUploadUtil.getPublicKeyFromResponse(iHttpResponse.getHeaders());
            if (publicKeyFromResponse != null) {
                return publicKeyFromResponse.substring(0, publicKeyFromResponse.lastIndexOf("/"));
            }
            return null;
        }
    }

    public static List<Downloadable> getDownloadableContent(Context context) {
        List<Downloadable> arrayList = new ArrayList<>(2);
        arrayList.add(new Downloadable(context, 0, false, 2));
        arrayList.add(new Downloadable(context, 1, true, 1));
        return arrayList;
    }

    public static List<Uploadable> getUploadableContent(Context context) {
        List<Uploadable> arrayList = new ArrayList<>(3);
        arrayList.add(new Uploadable(context, 1, true, 4));
        arrayList.add(new Uploadable(context, 0, false, 16));
        if (context.getResources().getBoolean(R.bool.should_upload_logs)) {
            arrayList.add(new Uploadable(context, 3, false, 0));
        }
        arrayList.add(new MetadataUploader(context));
        return arrayList;
    }

    public static List<PublicUploadable> getPublicUploads(Context context, Shareable shareable) {
        List<PublicUploadable> arrayList = new ArrayList<>(2);
        arrayList.add(new PublicUploadable(context, 0, false, true));
        if (shareable != null) {
            switch (shareable.getShareType()) {
                case DEFAULT:
                    arrayList.add(new PublicUploadable(context, 1, true, false));
                    break;
                case ANIMATION:
                    arrayList.add(new PublicUploadable(context, 4, true, false));
                    break;
                case PROPS:
                    arrayList.add(new PublicUploadable(context, 5, true, false));
                    break;
            }
        }
        return arrayList;
    }

    private static IRestExecutor<S3UploadData> getS3PrivateUploadData(Context context, File file, CloudContent cloudContent, KeyPair keyPair, String str, String str2) {
        return UploadDataExecutor.newPrivateUploadExecutor(cloudContent, str, file, keyPair).init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_POST_OBJECT, str2, new Void[0]);
    }

    private static IRestExecutor<S3UploadData> getS3PublicUploadData(Context context, File file, CloudContent cloudContent, String str, String str2, boolean z) {
        return UploadDataExecutor.newPublicUploadExecutor(cloudContent, str, file, z).init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_POST_PUBLIC_OBJECT, str2, new Void[0]);
    }

    private static IRestExecutor<Boolean> uploadToS3(Context context, S3UploadData s3UploadData) {
        return new AbstractRestExecutor<S3UploadData, Boolean, Void>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.6
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public Boolean getOutput(IHttpResponse iHttpResponse) throws Exception {
                boolean z = false;
                S3UploadData s3UploadData2 = getInput()[0];
                int statusCode = iHttpResponse.getStatusCode();
                if (statusCode != 201 && statusCode != 204) {
                    DebugLog.d(SyncHubApi.TAG, "response=" + StreamUtils.toString(iHttpResponse.getInputStream()));
                } else {
                    File file = s3UploadData2.getFile();
                    if (!s3UploadData2.isEncrypted() || file.delete()) {
                        z = true;
                    }
                }
                return Boolean.valueOf(z);
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str, Void r4, S3UploadData[] s3UploadDataArr) {
                HttpEntity body = s3UploadDataArr[0].getBody();
                NetworkRequest networkRequest = new NetworkRequest(str, NetworkRequest.Method.POST);
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(body);
                return networkRequest;
            }
        }.init(context, s3UploadData.getUrl(), null, s3UploadData);
    }

    private static IRestExecutor<File> download(Context context, String str, CloudContent cloudContent, KeyPair keyPair) {
        return new AbstractRestExecutor<Object, File, Void>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.7
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public File getOutput(IHttpResponse iHttpResponse) throws Exception {
                String checksum;
                String signature;
                boolean z;
                Throwable th;
                Throwable th2;
                Throwable th3;
                Throwable th4;
                Context context2 = getContext();
                boolean z2 = false;
                CloudContent cloudContent2 = (CloudContent) getInput()[0];
                KeyPair keyPair2 = (KeyPair) getInput()[1];
                Throwable th5 = null;
                if (iHttpResponse.getStatusCode() == 200) {
                    Map<String, List<String>> headers = iHttpResponse.getHeaders();
                    String str2 = headers.containsKey(SyncHubConstants.X_AMZ_META_SIGNATURE) ? headers.get(SyncHubConstants.X_AMZ_META_SIGNATURE).get(0) : null;
                    String str3 = headers.containsKey(SyncHubConstants.X_AMZ_META_CONTENT_ID) ? headers.get(SyncHubConstants.X_AMZ_META_CONTENT_ID).get(0) : null;
                    String str4 = headers.containsKey(SyncHubConstants.X_AMZ_META_CHECKSUM) ? headers.get(SyncHubConstants.X_AMZ_META_CHECKSUM).get(0) : null;
                    String str5 = headers.containsKey(SyncHubConstants.X_AMZ_META_FILE_NAME) ? headers.get(SyncHubConstants.X_AMZ_META_FILE_NAME).get(0) : null;
                    if (str2 != null && str3 != null && str5 != null) {
                        boolean zIsEncrypted = cloudContent2.isEncrypted();
                        File scanFile = FsUtils.getScanFile(context2, str3, str5);
                        try {
                            InputStream inputStream = iHttpResponse.getInputStream();
                            try {
                                try {
                                    if (zIsEncrypted) {
                                        File tempDirectory = FsUtils.getTempDirectory(context2);
                                        File file = new File(tempDirectory, scanFile.getName());
                                        StreamUtils.saveToDisc(file, inputStream);
                                        checksum = Vault.getChecksum(file);
                                        signature = Vault.getSignature(file, keyPair2.getSignatureKeyDecoded());
                                        try {
                                            FileInputStream fileInputStream = new FileInputStream(file);
                                            try {
                                                try {
                                                    CipherInputStream cipherInputStream = Encryption.cipherInputStream(fileInputStream, keyPair2.getEncryptionKeyDecoded());
                                                    try {
                                                        Vault.saveToDiskEncrypted(context2, cipherInputStream, scanFile);
                                                        if (cipherInputStream != null) {
                                                            cipherInputStream.close();
                                                        }
                                                        fileInputStream.close();
                                                        FsUtils.deleteFiles(tempDirectory, true);
                                                        z = false;
                                                    } catch (Throwable th6) {
                                                        try {
                                                            throw th6;
                                                        } catch (Throwable th7) {
                                                            th3 = th6;
                                                            th4 = th7;
                                                            if (cipherInputStream != null) {
                                                                if (th3 != null) {
                                                                    try {
                                                                        cipherInputStream.close();
                                                                    } catch (Throwable th18) {
                                                                        th3.addSuppressed(th18);
                                                                    }
                                                                } else {
                                                                    cipherInputStream.close();
                                                                }
                                                            }
                                                            throw th4;
                                                        }
                                                    }
                                                } catch (Throwable th8) {
                                                    th2 = th8;
                                                    th = null;
                                                    if (th == null) {
                                                        fileInputStream.close();
                                                        throw th2;
                                                    }
                                                    try {
                                                        fileInputStream.close();
                                                        throw th2;
                                                    } catch (Throwable th9) {
                                                        th.addSuppressed(th9);
                                                        throw th2;
                                                    }
                                                }
                                            } catch (Throwable th10) {
                                                try {
                                                    throw th10;
                                                } catch (Throwable th11) {
                                                    th = th10;
                                                    th2 = th11;
                                                    if (th == null) {
                                                        fileInputStream.close();
                                                        throw th2;
                                                    }
                                                    try {
                                                        fileInputStream.close();
                                                    } catch (Throwable th19) {
                                                        th.addSuppressed(th19);
                                                    }
                                                    throw th2;
                                                }
                                            }
                                        } catch (Throwable th12) {
                                            FsUtils.deleteFiles(tempDirectory, true);
                                            throw th12;
                                        }
                                    } else {
                                        StreamUtils.saveToDisc(scanFile, inputStream);
                                        checksum = Vault.getChecksum(scanFile);
                                        signature = Vault.getSignature(scanFile, keyPair2.getSignatureKeyDecoded());
                                        z = true;
                                    }
                                    try {
                                        try {
                                            if (TextUtils.equals(str4, checksum) && TextUtils.equals(str2, signature)) {
                                                z2 = true;
                                            }
                                        } catch (Throwable th20) {
                                            th5 = th20;
                                            throw th5;
                                        }
                                        if (inputStream != null) {
                                            inputStream.close();
                                        }
                                        if (z2 || !scanFile.delete()) {
                                            return scanFile;
                                        }
                                        DebugLog.d(SyncHubApi.TAG, "Deleted file.");
                                        return scanFile;
                                    } catch (Throwable th13) {
                                        z2 = z;
                                        th = th13;
                                        if (inputStream != null) {
                                            if (th5 != null) {
                                                try {
                                                    inputStream.close();
                                                } catch (Throwable th14) {
                                                    th5.addSuppressed(th14);
                                                }
                                            } else {
                                                inputStream.close();
                                            }
                                        }
                                        throw th;
                                    }
                                } catch (Throwable th15) {
                                    th = th15;
                                }
                            } catch (Throwable th16) {
                                throw th16;
                            }
                        } catch (Throwable th17) {
                            if (!z2 && scanFile.delete()) {
                                DebugLog.d(SyncHubApi.TAG, "Deleted file.");
                            }
                            throw th17;
                        }
                    }
                }
                return null;
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str2, Void r2, Object[] objArr) {
                return new NetworkRequest(str2, NetworkRequest.Method.GET);
            }
        }.init(context, str, null, cloudContent, keyPair);
    }

    private static IRestExecutor<String> getDownloadUrl(Context context, CloudContent cloudContent, String str, String str2) {
        return new AbstractRestExecutor<String, String, String>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.8
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public String getOutput(IHttpResponse iHttpResponse) throws Exception {
                if (iHttpResponse.getStatusCode() == 200) {
                    return StreamUtils.toString(iHttpResponse.getInputStream());
                }
                return null;
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str3, String str4, String[] strArr) throws Exception {
                JSONObject json = FileDownloadUtil.getJSON(strArr[0], strArr[1], str4);
                NetworkRequest networkRequest = new NetworkRequest(str3, NetworkRequest.Method.POST);
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(json.toString(), false);
                return networkRequest;
            }
        }.init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_SIGNED_URI_3D, str2, cloudContent.getS3Key(), str);
    }

    private static IRestExecutor<AccessToken> getToken(final Context context, String str, boolean z) {
        return new AbstractRestExecutor<Boolean, AccessToken, String>() { // from class: com.sonymobile.scan3d.storageservice.network.SyncHubApi.9
            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public AccessToken getOutput(IHttpResponse iHttpResponse) throws Exception {
                SignInEvent.SYNC_HUB_EXECUTION.send(context, iHttpResponse.getStatusCode());
                if (iHttpResponse.getStatusCode() == 200) {
                    return AccessTokenUtil.handleServerResponse(StreamUtils.toString(iHttpResponse.getInputStream()), iHttpResponse.getHeaders());
                }
                return null;
            }

            @Override // com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor
            public NetworkRequest getNetworkRequest(String str2, String str3, Boolean[] boolArr) throws Exception {
                boolean zBooleanValue = boolArr[0].booleanValue();
                NetworkRequest networkRequest = new NetworkRequest(str2, NetworkRequest.Method.POST);
                networkRequest.addHeader("Accept", ContentType.JSON.toMimeString());
                networkRequest.setUseStreamingMode(false);
                networkRequest.setBody(AccessTokenUtil.getJSON(str3, zBooleanValue).toString(), false);
                return networkRequest;
            }
        }.init(context, Config.getSyncHubServiceHost(context) + SyncHubConstants.REQUEST_GENERATE_TOKEN, str, Boolean.valueOf(z));
    }
}
