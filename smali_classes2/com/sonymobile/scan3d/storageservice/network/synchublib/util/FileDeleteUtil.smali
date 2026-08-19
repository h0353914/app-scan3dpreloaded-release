.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileDeleteUtil;
.super Ljava/lang/Object;
.source "FileDeleteUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getJSON(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 47
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "requestType"

    .line 48
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "clientType"

    const/4 v2, 0x1

    .line 49
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "apiKey"

    .line 51
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    move-result-object v2

    .line 52
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->isProductionReady()Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "property_1"

    goto :goto_0

    :cond_0
    const-string v3, "property_5"

    .line 51
    :goto_0
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 50
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "accessToken"

    .line 54
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getJSON(Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 25
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "requestType"

    if-eqz p2, :cond_0

    .line 26
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 27
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result p2

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_DELETE_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 28
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result p2

    .line 26
    :goto_0
    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p2

    const-string v0, "clientType"

    const/4 v1, 0x1

    .line 29
    invoke-virtual {p2, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p2

    const-string v0, "3dContentId"

    .line 30
    invoke-virtual {p2, v0, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "apiKey"

    .line 32
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    move-result-object v0

    .line 33
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->isProductionReady()Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "property_1"

    goto :goto_1

    :cond_1
    const-string v1, "property_5"

    .line 32
    :goto_1
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 31
    invoke-virtual {p0, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p2, "accessToken"

    .line 35
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method
