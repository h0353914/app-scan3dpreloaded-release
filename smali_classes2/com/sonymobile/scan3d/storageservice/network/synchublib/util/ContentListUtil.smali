.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentListUtil;
.super Ljava/lang/Object;
.source "ContentListUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getJSON(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 32
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "requestType"

    .line 34
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_GET_CONTENT_LIST:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 36
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result v2

    .line 35
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "clientType"

    const/4 v3, 0x1

    .line 37
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "apiKey"

    .line 39
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    move-result-object v3

    .line 40
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->isProductionReady()Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "property_1"

    goto :goto_0

    :cond_0
    const-string v4, "property_5"

    .line 39
    :goto_0
    invoke-virtual {v3, v4}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 38
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "accessToken"

    .line 42
    invoke-virtual {v1, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 44
    :catch_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method

.method public static handleServerResponse(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 58
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentListUtil$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentListUtil$1;-><init>()V

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/ContentListUtil$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v0

    .line 62
    new-instance v1, Lcom/google/gson/Gson;

    invoke-direct {v1}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v1, p0, v0}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0

    .line 59
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "response is null or empty"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
