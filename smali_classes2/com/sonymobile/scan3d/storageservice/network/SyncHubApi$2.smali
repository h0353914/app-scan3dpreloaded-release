.class final Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$2;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->listMetadata(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Ljava/lang/Void;",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;",
        ">;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 144
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

    .line 144
    check-cast p2, Ljava/lang/String;

    check-cast p3, [Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$2;->getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 165
    new-instance p3, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->POST:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-direct {p3, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V

    const/4 p1, 0x0

    .line 166
    invoke-virtual {p3, p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setUseStreamingMode(Z)V

    .line 167
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentListUtil;->getJSON(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p2

    .line 168
    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p2, p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setBody(Ljava/lang/String;Z)V

    return-object p3
.end method

.method public bridge synthetic getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 144
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$2;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/util/Map;

    move-result-object p1

    return-object p1
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/util/Map;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 151
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 152
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toString(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object p1

    .line 154
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentListUtil;->handleServerResponse(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    .line 156
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->readContentList(Ljava/util/List;)Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
