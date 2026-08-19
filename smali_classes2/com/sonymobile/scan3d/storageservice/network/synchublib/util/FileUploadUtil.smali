.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;
.super Ljava/lang/Object;
.source "FileUploadUtil.java"


# static fields
.field private static final FILE_NAME:Ljava/lang/String; = "fileName"

.field private static final FILE_TYPE:Ljava/lang/String; = "fileType"

.field private static final INVALID_TICKET_DATA:Ljava/lang/String; = "Invalid ticket data"

.field private static final INVALID_TOKEN:Ljava/lang/String; = "Invalid token"

.field private static final TOKEN_EXPIRED:Ljava/lang/String; = "Token has expired"

.field private static final UPDATE_CACHE_METADATA:Ljava/lang/String; = "updateCacheMetadata"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Lorg/apache/http/HttpEntity;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidAccessTokenException;
        }
    .end annotation

    .line 198
    invoke-static/range {p0 .. p8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getMultipartBuilderFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object p0

    .line 206
    invoke-virtual {p0}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->build()Lorg/apache/http/HttpEntity;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONForPrivateSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 58
    invoke-static/range {v0 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getJSONForSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method public static getJSONForPublicSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lorg/json/JSONObject;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    move v8, p6

    .line 91
    invoke-static/range {v0 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getJSONForSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lorg/json/JSONObject;

    move-result-object p0

    return-object p0
.end method

.method private static getJSONForSignedUriRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 129
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "3dContent"

    .line 132
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "requestType"

    if-eqz p7, :cond_0

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_PUBLIC_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 134
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result v2

    goto :goto_0

    :cond_0
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->REQUEST_POST_CONTENT:Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;

    .line 135
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/RequestType;->getId()I

    move-result v2

    .line 133
    :goto_0
    invoke-virtual {p0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, "3dContentId"

    .line 136
    invoke-virtual {p0, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p3, "clientType"

    const/4 v1, 0x1

    .line 137
    invoke-virtual {p0, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    move-result-object p0

    const-string p3, "apiKey"

    .line 139
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getInstance()Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;

    move-result-object v1

    .line 140
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->isProductionReady()Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "property_1"

    goto :goto_1

    :cond_1
    const-string v2, "property_5"

    .line 139
    :goto_1
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 138
    invoke-virtual {p0, p3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p3, "accessToken"

    .line 142
    invoke-virtual {p0, p3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p3, "checksum"

    .line 143
    invoke-virtual {p0, p3, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p3, "fileName"

    .line 144
    invoke-virtual {p0, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p0

    const-string p1, "fileType"

    .line 145
    invoke-virtual {p0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-nez p7, :cond_2

    const-string p0, "signature"

    .line 148
    invoke-virtual {v0, p0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :cond_2
    const-string p0, "updateCacheMetadata"

    .line 151
    invoke-virtual {v0, p0, p8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_2
    return-object v0

    .line 154
    :catch_0
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method

.method private static getMultipartBuilderFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidAccessTokenException;
        }
    .end annotation

    if-eqz p0, :cond_3

    const-string v0, "Invalid token"

    .line 308
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "Token has expired"

    .line 309
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "Invalid ticket data"

    .line 310
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 313
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "UTF-8"

    .line 314
    invoke-static {p0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 315
    invoke-static {v0, p7}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->setupCommonMultiparts(Lorg/json/JSONObject;Z)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object p0

    const-string v0, "x-amz-meta-checksum"

    .line 316
    invoke-virtual {p0, v0, p5}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    if-nez p7, :cond_0

    const-string p5, "x-amz-meta-content-id"

    .line 318
    invoke-virtual {p0, p5, p1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string p1, "x-amz-meta-signature"

    .line 319
    invoke-virtual {p4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p4}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    goto :goto_0

    :cond_0
    if-eqz p8, :cond_1

    const-string p1, "Cache-Control"

    const-string p4, "no-cache"

    .line 323
    invoke-virtual {p0, p1, p4}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    :cond_1
    :goto_0
    const-string p1, "x-amz-meta-file-name"

    .line 327
    invoke-virtual {p0, p1, p2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string p1, "Content-Type"

    .line 328
    invoke-virtual {p0, p1, p3}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string p1, "Content-Disposition"

    .line 329
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "attachment; filename="

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p0, p1, p4}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string p1, "file"

    .line 333
    invoke-static {p3}, Lorg/apache/http/entity/ContentType;->create(Ljava/lang/String;)Lorg/apache/http/entity/ContentType;

    move-result-object p3

    .line 331
    invoke-virtual {p0, p1, p6, p3, p2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addBinaryBody(Ljava/lang/String;Ljava/io/File;Lorg/apache/http/entity/ContentType;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    return-object p0

    .line 311
    :cond_2
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidAccessTokenException;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidAccessTokenException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 307
    :cond_3
    new-instance p0, Ljava/io/IOException;

    invoke-direct {p0}, Ljava/io/IOException;-><init>()V

    throw p0
.end method

.method public static getPrivateHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lorg/apache/http/HttpEntity;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidAccessTokenException;
        }
    .end annotation

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    .line 267
    invoke-static/range {v0 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Lorg/apache/http/HttpEntity;

    move-result-object p0

    return-object p0
.end method

.method public static getPublicHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Z)Lorg/apache/http/HttpEntity;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidAccessTokenException;
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    move-object v6, p5

    move v8, p6

    .line 232
    invoke-static/range {v0 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/FileUploadUtil;->getHttpEntityFromResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/io/File;ZZ)Lorg/apache/http/HttpEntity;

    move-result-object p0

    return-object p0
.end method

.method public static getPublicKeyFromResponse(Ljava/util/Map;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p0, :cond_1

    const-string v0, "publicKey"

    .line 350
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_0

    .line 351
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x0

    .line 354
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 352
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "response headers don\'t contain required data"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 348
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "server response can\'t be null"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getUrlFromServerResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .line 168
    new-instance v0, Lorg/json/JSONObject;

    const-string v1, "UTF-8"

    invoke-static {p0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "url"

    .line 169
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static setupCommonMultiparts(Lorg/json/JSONObject;Z)Lorg/apache/http/entity/mime/MultipartEntityBuilder;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    if-eqz p0, :cond_2

    .line 374
    invoke-static {}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->create()Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    move-result-object v0

    .line 375
    sget-object v1, Lorg/apache/http/entity/mime/HttpMultipartMode;->BROWSER_COMPATIBLE:Lorg/apache/http/entity/mime/HttpMultipartMode;

    invoke-virtual {v0, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->setMode(Lorg/apache/http/entity/mime/HttpMultipartMode;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "-----------TOMTE"

    .line 376
    invoke-virtual {v0, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->setBoundary(Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "key"

    const-string v2, "key"

    .line 377
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "acl"

    if-eqz p1, :cond_0

    const-string v2, "public-read"

    goto :goto_0

    :cond_0
    const-string v2, "private"

    .line 378
    :goto_0
    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "Policy"

    const-string v2, "policy"

    .line 382
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 381
    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "x-amz-algorithm"

    const-string v2, "AWS4-HMAC-SHA256"

    .line 383
    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "x-amz-credential"

    const-string v2, "credential"

    .line 385
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 384
    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    const-string v1, "x-amz-date"

    const-string v2, "date"

    .line 387
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 386
    invoke-virtual {v0, v1, v2}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    if-nez p1, :cond_1

    const-string p1, "x-amz-server-side-encryption"

    const-string v1, "AES256"

    .line 389
    invoke-virtual {v0, p1, v1}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    :cond_1
    const-string p1, "x-amz-signature"

    const-string v1, "signature"

    .line 393
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 392
    invoke-virtual {v0, p1, p0}, Lorg/apache/http/entity/mime/MultipartEntityBuilder;->addTextBody(Ljava/lang/String;Ljava/lang/String;)Lorg/apache/http/entity/mime/MultipartEntityBuilder;

    return-object v0

    .line 372
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "jsonResponse is not allowed to be null"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
