.class Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
.super Lcom/sonymobile/scan3d/storageservice/network/HttpConstants;
.source "NetworkRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;,
        Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;
    }
.end annotation


# static fields
.field private static final CACHE_DIRECTORY:Ljava/lang/String; = "httpcache"

.field private static final CACHE_SIZE:J = 0x500000L

.field private static final DEFAULT_CONNECTION_TIMEOUT:I = 0xea60

.field private static final DEFAULT_READ_TIMEOUT:I = 0xea60

.field private static final MAX_BUFFER_SIZE:I = 0x4000

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.network.NetworkRequest"


# instance fields
.field private mBody:[B

.field private mCompress:Z

.field private mEntity:Lorg/apache/http/HttpEntity;

.field private mForm:Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;

.field private mHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mMethod:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

.field private mNetworkProgressListener:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;

.field private final mTransferProgress:Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

.field private final mUri:Landroid/net/Uri;

.field private final mUseCache:Z

.field private mUseStreamingMode:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V
    .locals 1

    const/4 v0, 0x0

    .line 187
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;Z)V

    return-void
.end method

.method constructor <init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;Z)V
    .locals 0

    .line 170
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/HttpConstants;-><init>()V

    .line 171
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUri:Landroid/net/Uri;

    .line 172
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mMethod:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    .line 173
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseCache:Z

    .line 174
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mHeaders:Ljava/util/Map;

    .line 175
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mTransferProgress:Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

    const/4 p1, 0x1

    .line 177
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseStreamingMode:Z

    return-void
.end method

.method private addBody(Ljava/net/HttpURLConnection;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 395
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseStreamingMode:Z

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    .line 396
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mCompress:Z

    if-eqz v0, :cond_0

    .line 397
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    goto :goto_0

    .line 399
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mBody:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 403
    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->getOutputStream(Ljava/net/HttpURLConnection;)Ljava/io/OutputStream;

    move-result-object p1

    const/4 v0, 0x0

    .line 405
    :try_start_0
    new-instance v2, Ljava/io/ByteArrayInputStream;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mBody:[B

    invoke-direct {v2, v3}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    const/16 v3, 0x4000

    .line 406
    :try_start_1
    new-array v3, v3, [B

    const/4 v4, 0x0

    move v5, v4

    .line 409
    :goto_1
    invoke-virtual {v2, v3}, Ljava/io/InputStream;->read([B)I

    move-result v6

    if-eq v6, v1, :cond_3

    .line 410
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v7

    if-nez v7, :cond_2

    .line 411
    invoke-virtual {p1, v3, v4, v6}, Ljava/io/OutputStream;->write([BII)V

    add-int/2addr v5, v6

    .line 415
    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mBody:[B

    array-length v6, v6

    int-to-long v6, v6

    int-to-long v8, v5

    invoke-virtual {p0, v6, v7, v8, v9}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->reportNetworkProgress(JJ)V

    goto :goto_1

    .line 417
    :cond_2
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v3, "The upload request was interrupted."

    invoke-direct {v1, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 420
    :cond_3
    :try_start_2
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    if-eqz p1, :cond_4

    .line 421
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    :cond_4
    return-void

    :catchall_0
    move-exception v1

    move-object v3, v0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 405
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v3

    move-object v10, v3

    move-object v3, v1

    move-object v1, v10

    :goto_2
    if-eqz v3, :cond_5

    .line 420
    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_3

    :catch_1
    move-exception v2

    :try_start_5
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    :goto_3
    throw v1
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :catchall_2
    move-exception v1

    goto :goto_4

    :catch_2
    move-exception v0

    .line 403
    :try_start_6
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :goto_4
    if-eqz p1, :cond_7

    if-eqz v0, :cond_6

    .line 421
    :try_start_7
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_5

    :catch_3
    move-exception p1

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_5

    :cond_6
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    :cond_7
    :goto_5
    throw v1
.end method

.method private addHeaders(Ljava/net/HttpURLConnection;)V
    .locals 6

    .line 366
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mHeaders:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 367
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    .line 368
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v4, 0x0

    .line 369
    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_2

    .line 370
    invoke-interface {v2, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    .line 372
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    const-string v5, ","

    .line 374
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 378
    :cond_2
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "addHeaders(): header values="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 381
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private addMultiPartBody(Landroid/content/Context;Ljava/net/HttpURLConnection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 450
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mForm:Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->getBoundary()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Content-Type"

    .line 451
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->getMultipartContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseStreamingMode:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 453
    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 455
    :cond_0
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-direct {v0, p2}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    const/4 p2, 0x0

    .line 456
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mForm:Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;

    invoke-virtual {v1, p1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->onWrite(Landroid/content/Context;Ljava/io/DataOutputStream;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    move-object p2, p1

    .line 455
    :try_start_1
    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p2, :cond_1

    .line 457
    :try_start_2
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {p2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/io/DataOutputStream;->close()V

    :goto_1
    throw p1
.end method

.method private addMultipartAsEntity(Ljava/net/HttpURLConnection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Content-Type"

    .line 430
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Content-Length"

    .line 431
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v1}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseStreamingMode:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    .line 434
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 437
    :cond_0
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    const/4 v0, 0x0

    .line 438
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mEntity:Lorg/apache/http/HttpEntity;

    invoke-interface {v1, p1}, Lorg/apache/http/HttpEntity;->writeTo(Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_1

    .line 439
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 437
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz p1, :cond_3

    if-eqz v0, :cond_2

    .line 439
    :try_start_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    :cond_3
    :goto_1
    throw v1
.end method

.method private execute(Landroid/content/Context;Ljava/net/HttpURLConnection;)Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 320
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mBody:[B

    if-eqz v0, :cond_0

    .line 321
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addBody(Ljava/net/HttpURLConnection;)V

    goto :goto_0

    .line 322
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mForm:Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;

    if-eqz v0, :cond_1

    .line 323
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addMultiPartBody(Landroid/content/Context;Ljava/net/HttpURLConnection;)V

    goto :goto_0

    .line 324
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mEntity:Lorg/apache/http/HttpEntity;

    if-eqz p1, :cond_2

    .line 325
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addMultipartAsEntity(Ljava/net/HttpURLConnection;)V

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    .line 327
    invoke-virtual {p2, p1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 329
    :goto_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;

    invoke-direct {p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/HttpResponse;-><init>(Ljava/net/HttpURLConnection;)V

    return-object p1
.end method

.method private static flushHttpCaching()V
    .locals 3

    .line 492
    invoke-static {}, Landroid/net/http/HttpResponseCache;->getInstalled()Landroid/net/http/HttpResponseCache;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 494
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->TAG:Ljava/lang/String;

    const-string v2, "Flushing of http cache to the filesystem."

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 495
    invoke-virtual {v0}, Landroid/net/http/HttpResponseCache;->flush()V

    goto :goto_0

    .line 497
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->TAG:Ljava/lang/String;

    const-string v1, "There is no valid cache installed."

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method private getOutputStream(Ljava/net/HttpURLConnection;)Ljava/io/OutputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 467
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    .line 468
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mCompress:Z

    if-eqz v0, :cond_0

    new-instance v0, Ljava/util/zip/GZIPOutputStream;

    invoke-direct {v0, p1}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/DataOutputStream;

    invoke-direct {v0, p1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    :goto_0
    return-object v0
.end method

.method private static installHttpCache(Landroid/content/Context;)V
    .locals 3

    .line 478
    :try_start_0
    invoke-static {}, Landroid/net/http/HttpResponseCache;->getInstalled()Landroid/net/http/HttpResponseCache;

    move-result-object v0

    if-nez v0, :cond_0

    .line 480
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    const-string v1, "httpcache"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const-wide/32 v1, 0x500000

    .line 481
    invoke-static {v0, v1, v2}, Landroid/net/http/HttpResponseCache;->install(Ljava/io/File;J)Landroid/net/http/HttpResponseCache;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 484
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->TAG:Ljava/lang/String;

    const-string v1, "Enabling http cache failed:"

    invoke-static {v0, v1, p0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method static synthetic lambda$addHeader$0(Ljava/lang/String;)Ljava/util/List;
    .locals 0

    .line 207
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method private setupConnection()Ljava/net/HttpURLConnection;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 340
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 341
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setupConnection(): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 342
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 343
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addHeaders(Ljava/net/HttpURLConnection;)V

    .line 345
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseCache:Z

    if-nez v1, :cond_0

    const-string v1, "Cache-Control"

    const-string v2, "no-cache"

    .line 348
    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->addRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    :cond_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseCache:Z

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDefaultUseCaches(Z)V

    .line 351
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseCache:Z

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    const v1, 0xea60

    .line 352
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 353
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 354
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mMethod:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 355
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 356
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    return-object v0
.end method


# virtual methods
.method addHeader(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 207
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mHeaders:Ljava/util/Map;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/-$$Lambda$NetworkRequest$Uj4mis7UhJT69epZT_BnMp4dXdw;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/network/-$$Lambda$NetworkRequest$Uj4mis7UhJT69epZT_BnMp4dXdw;

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    .line 209
    instance-of v0, p2, Ljava/lang/String;

    if-nez v0, :cond_1

    instance-of v0, p2, Ljava/lang/Long;

    if-nez v0, :cond_1

    instance-of v0, p2, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    goto :goto_0

    .line 212
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unsupported type "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 210
    :cond_1
    :goto_0
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    if-eqz p1, :cond_2

    .line 216
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method addTokenAuthentication(Ljava/lang/String;)V
    .locals 3

    const-string v0, "Authorization"

    .line 196
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Bearer "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addHeader(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public final execute(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 296
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseCache:Z

    if-eqz v0, :cond_0

    .line 297
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->installHttpCache(Landroid/content/Context;)V

    .line 300
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setupConnection()Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 301
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->execute(Landroid/content/Context;Ljava/net/HttpURLConnection;)Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    move-result-object p1

    .line 303
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseCache:Z

    if-eqz v0, :cond_2

    .line 304
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->flushHttpCaching()V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :cond_2
    :goto_0
    return-object p1
.end method

.method reportNetworkProgress(JJ)V
    .locals 1

    .line 508
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mNetworkProgressListener:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mTransferProgress:Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

    .line 509
    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->update(JJ)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 510
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mNetworkProgressListener:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mTransferProgress:Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

    invoke-interface {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;->onNetworkProgress(Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V

    :cond_0
    return-void
.end method

.method setBody(Ljava/lang/String;Z)V
    .locals 2

    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "; charset=utf-8"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 264
    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1, v0, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setBody([BLjava/lang/String;Z)V

    return-void
.end method

.method setBody(Lorg/apache/http/HttpEntity;)V
    .locals 0

    .line 273
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mEntity:Lorg/apache/http/HttpEntity;

    return-void
.end method

.method setBody([BLjava/lang/String;Z)V
    .locals 0

    .line 248
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mBody:[B

    const-string p1, "Content-Type"

    .line 249
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addHeader(Ljava/lang/String;Ljava/lang/Object;)V

    .line 250
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mCompress:Z

    .line 251
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mCompress:Z

    if-eqz p1, :cond_0

    const-string p1, "Content-Encoding"

    const-string p2, "gzip"

    .line 252
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->addHeader(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method setMultipartForm(Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;)V
    .locals 0

    .line 282
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mForm:Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;

    return-void
.end method

.method setProgressListener(Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;)V
    .locals 0

    .line 226
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mNetworkProgressListener:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;

    return-void
.end method

.method setUseStreamingMode(Z)V
    .locals 0

    .line 237
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->mUseStreamingMode:Z

    return-void
.end method
