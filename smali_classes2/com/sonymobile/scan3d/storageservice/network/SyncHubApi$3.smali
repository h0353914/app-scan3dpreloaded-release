.class final Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->updateMetadata(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
        "Ljava/lang/Boolean;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 191
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

    .line 191
    check-cast p2, Ljava/lang/String;

    check-cast p3, [Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;->getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 212
    aget-object p3, p3, v0

    .line 213
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->PUT:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-direct {v1, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V

    .line 214
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setUseStreamingMode(Z)V

    .line 216
    invoke-interface {p3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    .line 217
    invoke-interface {p3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getDisplayName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    .line 218
    invoke-interface {p3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isDownloadable()Z

    move-result v7

    invoke-interface {p3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isImprovement()Z

    move-result v9

    const/4 v8, 0x0

    move-object v4, p2

    .line 216
    invoke-static/range {v3 .. v9}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentUpdateUtil;->getJSON(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Lorg/json/JSONObject;

    move-result-object p1

    .line 219
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setBody(Ljava/lang/String;Z)V

    return-object v1
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Boolean;
    .locals 1

    .line 197
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result p1

    const/16 v0, 0xc8

    if-eq p1, v0, :cond_0

    const/16 v0, 0xcc

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    .line 206
    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

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

    .line 191
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method
