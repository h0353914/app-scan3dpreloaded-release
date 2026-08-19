.class final Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getToken(Landroid/content/Context;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Ljava/lang/Boolean;",
        "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1302
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;->val$context:Landroid/content/Context;

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

    .line 1302
    check-cast p2, Ljava/lang/String;

    check-cast p3, [Ljava/lang/Boolean;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;->getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Boolean;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    .line 1320
    aget-object p3, p3, v0

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    .line 1321
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->POST:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-direct {v1, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V

    const-string p1, "Accept"

    .line 1322
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addHeader(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1323
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setUseStreamingMode(Z)V

    .line 1326
    invoke-static {p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/AccessTokenUtil;->getJSON(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p1

    .line 1327
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setBody(Ljava/lang/String;Z)V

    return-object v1
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1306
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->SYNC_HUB_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;->val$context:Landroid/content/Context;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    .line 1309
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 1310
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    .line 1312
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object p1

    .line 1311
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/AccessTokenUtil;->handleServerResponse(Ljava/lang/String;Ljava/util/Map;)Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public bridge synthetic getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1302
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;

    move-result-object p1

    return-object p1
.end method
