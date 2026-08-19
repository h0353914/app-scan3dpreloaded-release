.class Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UploadDataExecutor"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private mChecksum:Ljava/lang/String;

.field private mCloudContent:Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;

.field private mContentId:Ljava/lang/String;

.field private mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

.field private mIsPublic:Z

.field private mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

.field private mSignature:Ljava/lang/String;

.field private mUpdateCacheMetadata:Z

.field private mUploadFile:Ljava/io/File;


# direct methods
.method constructor <init>(ZLcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 875
    invoke-direct/range {v0 .. v6}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;-><init>(ZLcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Z)V

    return-void
.end method

.method constructor <init>(ZLcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Z)V
    .locals 0

    .line 889
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;-><init>()V

    .line 890
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mIsPublic:Z

    .line 891
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mCloudContent:Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;

    .line 892
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentId:Ljava/lang/String;

    .line 893
    iput-object p4, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    .line 894
    iput-object p5, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    .line 895
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->getContentType(Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    .line 896
    iput-boolean p6, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUpdateCacheMetadata:Z

    return-void
.end method

.method private static getShareHashFromResponse(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 959
    invoke-interface {p0}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object p0

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getPublicKeyFromResponse(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string v0, "/"

    .line 963
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x0

    .line 964
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method static newPrivateUploadExecutor(Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;
    .locals 7

    .line 861
    new-instance v6, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;

    const/4 v1, 0x0

    move-object v0, v6

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;-><init>(ZLcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V

    return-object v6
.end method

.method static newPublicUploadExecutor(Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Z)Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;
    .locals 8

    .line 846
    new-instance v7, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;

    const/4 v1, 0x1

    const/4 v5, 0x0

    move-object v0, v7

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;-><init>(ZLcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Z)V

    return-object v7
.end method


# virtual methods
.method public bridge synthetic getNetworkRequest(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 785
    check-cast p2, Ljava/lang/String;

    check-cast p3, [Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 929
    iget-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mIsPublic:Z

    if-eqz p3, :cond_0

    .line 930
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mChecksum:Ljava/lang/String;

    .line 931
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mCloudContent:Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->getS3Key()Ljava/lang/String;

    move-result-object v0

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    .line 932
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentId:Ljava/lang/String;

    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mChecksum:Ljava/lang/String;

    iget-boolean v6, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUpdateCacheMetadata:Z

    move-object v4, p2

    .line 931
    invoke-static/range {v0 .. v6}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getJSONForPublicSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    goto :goto_0

    .line 936
    :cond_0
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getSignatureKeyDecoded()[B

    move-result-object v0

    invoke-static {p3, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getSignature(Ljava/io/File;[B)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mSignature:Ljava/lang/String;

    .line 937
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mChecksum:Ljava/lang/String;

    .line 939
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mCloudContent:Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->getS3Key()Ljava/lang/String;

    move-result-object v0

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    .line 940
    invoke-virtual {p3}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentId:Ljava/lang/String;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mSignature:Ljava/lang/String;

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mChecksum:Ljava/lang/String;

    move-object v5, p2

    .line 939
    invoke-static/range {v0 .. v6}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getJSONForPrivateSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    .line 945
    :goto_0
    new-instance p3, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->POST:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-direct {p3, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V

    const/4 p1, 0x0

    .line 946
    invoke-virtual {p3, p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setUseStreamingMode(Z)V

    .line 947
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2, p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setBody(Ljava/lang/String;Z)V

    return-object p3
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 902
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0xc8

    if-ne v0, v2, :cond_2

    .line 904
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 907
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mIsPublic:Z

    if-eqz v2, :cond_0

    .line 908
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentId:Ljava/lang/String;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    .line 909
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mChecksum:Ljava/lang/String;

    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    iget-boolean v8, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUpdateCacheMetadata:Z

    move-object v2, v0

    .line 908
    invoke-static/range {v2 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getPublicHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Z)Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 911
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->getShareHashFromResponse(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/String;

    move-result-object p1

    move-object v7, p1

    move-object v4, v1

    goto :goto_0

    .line 913
    :cond_0
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentId:Ljava/lang/String;

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    .line 914
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mContentType:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mSignature:Ljava/lang/String;

    iget-object v7, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mChecksum:Ljava/lang/String;

    iget-object v8, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    move-object v2, v0

    .line 913
    invoke-static/range {v2 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getPrivateHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lorg/apache/http/HttpEntity;

    move-result-object p1

    move-object v4, p1

    move-object v7, v1

    .line 917
    :goto_0
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getUrlFromServerResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 918
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mUploadFile:Ljava/io/File;

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mIsPublic:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->mCloudContent:Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;

    .line 919
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->isEncrypted()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    :goto_1
    move v6, v0

    move-object v2, p1

    invoke-direct/range {v2 .. v7}, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;-><init>(Ljava/lang/String;Lorg/apache/http/HttpEntity;Ljava/io/File;ZLjava/lang/String;)V

    goto :goto_2

    :cond_2
    move-object p1, v1

    :goto_2
    return-object p1
.end method

.method public bridge synthetic getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 785
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    move-result-object p1

    return-object p1
.end method
