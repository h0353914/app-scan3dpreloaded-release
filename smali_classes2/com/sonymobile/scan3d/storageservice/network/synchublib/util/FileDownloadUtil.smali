.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileDownloadUtil;
.super Ljava/lang/Object;
.source "FileDownloadUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getJSON(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "3dContent"

    .line 24
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "requestType"

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_FILE:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 25
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "3dContentId"

    .line 26
    invoke-virtual {p0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "clientType"

    const/4 v1, 0x1

    .line 27
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "apiKey"

    .line 29
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    move-result-object v1

    .line 30
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->isProductionReady()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "property_1"

    goto :goto_0

    :cond_0
    const-string v2, "property_5"

    .line 29
    :goto_0
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 28
    invoke-virtual {p0, p1, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "accessToken"

    .line 32
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 34
    :catch_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method
