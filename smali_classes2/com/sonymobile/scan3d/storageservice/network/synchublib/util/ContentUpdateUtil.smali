.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentUpdateUtil;
.super Ljava/lang/Object;
.source "ContentUpdateUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getJSON(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZZ)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "requestType"

    .line 40
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_PUT_UPDATE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 42
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result v2

    .line 41
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "3dContentId"

    .line 43
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "clientType"

    const/4 v2, 0x1

    .line 44
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "3dContentData"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "3dContentName"

    .line 47
    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v2, "3dContentDisplayName"

    .line 48
    invoke-virtual {p2, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "3dContentDownloadable"

    .line 50
    invoke-virtual {p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "3dContentFavorite"

    .line 52
    invoke-virtual {p2, p3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string p3, "3dContentIsImprovement"

    .line 54
    invoke-virtual {p2, p3, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    .line 45
    invoke-virtual {p0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "apiKey"

    .line 57
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    move-result-object p3

    .line 58
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->isProductionReady()Z

    move-result p4

    if-eqz p4, :cond_0

    const-string p4, "property_1"

    goto :goto_0

    :cond_0
    const-string p4, "property_5"

    .line 57
    :goto_0
    invoke-virtual {p3, p4}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    .line 56
    invoke-virtual {p0, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "accessToken"

    .line 60
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 62
    :catch_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method
