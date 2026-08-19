.class final Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->uploadToS3(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1102
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic getNetworkRequest(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1102
    check-cast p2, Ljava/lang/Void;

    check-cast p3, [Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;->getNetworkRequest(Ljava/lang/String;Ljava/lang/Void;[Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/Void;[Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 2

    const/4 p2, 0x0

    .line 1129
    aget-object p3, p3, p2

    .line 1130
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->getBody()Lorg/apache/http/HttpEntity;

    move-result-object p3

    .line 1132
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->POST:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-direct {v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V

    .line 1133
    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setUseStreamingMode(Z)V

    .line 1134
    invoke-virtual {v0, p3}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setBody(Lorg/apache/http/HttpEntity;)V

    return-object v0
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Boolean;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1107
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;->getInput()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    .line 1109
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v2

    const/16 v3, 0xc9

    if-eq v2, v3, :cond_0

    const/16 v3, 0xcc

    if-eq v2, v3, :cond_0

    .line 1120
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1121
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1120
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1112
    :cond_0
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->getFile()Ljava/io/File;

    move-result-object p1

    .line 1117
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->isEncrypted()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    const/4 p1, 0x1

    move v1, p1

    .line 1124
    :cond_2
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1102
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
