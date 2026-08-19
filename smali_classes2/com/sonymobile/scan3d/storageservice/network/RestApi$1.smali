.class final Lcom/sonymobile/scan3d/storageservice/network/RestApi$1;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "RestApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/network/RestApi;->getBitmap(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 46
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

    .line 46
    check-cast p2, Ljava/lang/String;

    check-cast p3, [Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/RestApi$1;->getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 2

    .line 62
    new-instance p3, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->GET:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    const/4 v1, 0x1

    invoke-direct {p3, p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;Z)V

    .line 63
    invoke-virtual {p3, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addTokenAuthentication(Ljava/lang/String;)V

    return-object p3
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Landroid/graphics/Bitmap;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v0

    const/16 v1, 0xc8

    if-ne v0, v1, :cond_0

    .line 55
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

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

    .line 46
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/RestApi$1;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method
