.class public Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;
.super Ljava/lang/Object;
.source "DownloadThread.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$RetryDownload;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;,
        Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private final mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

.field private mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

.field private final mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

.field private mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

.field private mUserAgent:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mContext:Landroid/content/Context;

    .line 53
    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    .line 54
    iput-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    .line 55
    iput-object p3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    .line 56
    invoke-static {p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->getDB(Landroid/content/Context;)Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    .line 57
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "APKXDL (Linux; U; Android "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ";"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "; "

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "/"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p3, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    invoke-virtual {p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getPackageName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mUserAgent:Ljava/lang/String;

    return-void
.end method

.method private addRequestHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;)V
    .locals 3

    .line 695
    iget-boolean v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz v0, :cond_1

    .line 696
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    if-eqz v0, :cond_0

    const-string v0, "If-Match"

    .line 697
    iget-object v1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    invoke-virtual {p2, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string v0, "Range"

    .line 699
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bytes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, v0, p1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private cannotResume(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)Z
    .locals 1

    .line 476
    iget v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    if-lez v0, :cond_0

    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private checkConnectivity(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 245
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    invoke-virtual {p1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getNetworkAvailabilityState(Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;)I

    move-result p1

    const/16 v0, 0xc3

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    return-void

    .line 252
    :pswitch_1
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 v0, 0xc4

    const-string v1, "waiting for wifi or for download over cellular to be authorized"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 256
    :pswitch_2
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const-string v1, "roaming is not allowed"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 259
    :pswitch_3
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 v0, 0xc5

    const-string v1, "waiting for wifi"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 249
    :pswitch_4
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const-string v1, "waiting for network to return"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    :pswitch_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private checkPausedOrCanceled(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 376
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-virtual {p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getControl()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 377
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-virtual {p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getStatus()I

    move-result p1

    const/16 v0, 0xc1

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 380
    :cond_0
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-virtual {v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getStatus()I

    move-result v0

    const-string v1, "download paused"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    return-void
.end method

.method private cleanupDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;I)V
    .locals 1

    .line 317
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->closeDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    .line 318
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->isStatusError(I)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 319
    new-instance p2, Ljava/io/File;

    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    const/4 p2, 0x0

    .line 320
    iput-object p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method private closeDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    .locals 1

    .line 359
    :try_start_0
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_0

    .line 360
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const/4 v0, 0x0

    .line 361
    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method private executeDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;,
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$RetryDownload;
        }
    .end annotation

    .line 215
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$1;)V

    const/16 v1, 0x1000

    .line 216
    new-array v1, v1, [B

    .line 218
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->checkPausedOrCanceled(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    .line 220
    invoke-direct {p0, p1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->setupDestinationFile(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V

    .line 221
    invoke-direct {p0, v0, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->addRequestHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;)V

    .line 225
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->checkConnectivity(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    .line 227
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V

    .line 228
    invoke-direct {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->sendRequest(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)I

    move-result v2

    .line 229
    invoke-direct {p0, p1, v0, p2, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->handleExceptionalStatus(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;I)V

    .line 235
    invoke-direct {p0, p1, v0, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->processResponseHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;)V

    .line 236
    invoke-direct {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->openResponseEntity(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object p2

    .line 237
    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mNotification:Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadNotification;->onDownloadStateChanged(I)V

    .line 238
    invoke-direct {p0, p1, v0, v1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->transferData(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;[BLjava/io/InputStream;)V

    return-void
.end method

.method private finalizeDestinationFile(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 294
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->syncDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    .line 295
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    .line 296
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v2, v2, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/google/android/vending/expansion/downloader/Helpers;->generateSaveFileName(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 297
    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 298
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 299
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 300
    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v1, v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v1, v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v3, v3, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    .line 301
    invoke-virtual {p1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    .line 302
    :cond_0
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 v0, 0x1ec

    const-string v1, "unable to finalize destination file"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 306
    :cond_1
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 v0, 0x1e7

    const-string v1, "file delivered with incorrect size. probably due to network not browser configured"

    invoke-direct {p1, p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method private getFinalStatusForHttpError(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)I
    .locals 3

    .line 756
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    invoke-virtual {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getNetworkAvailabilityState(Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/16 p1, 0xc3

    return p1

    .line 758
    :cond_0
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    const/4 v2, 0x5

    if-ge v0, v2, :cond_1

    .line 759
    iput-boolean v1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mCountRetry:Z

    const/16 p1, 0xc2

    return p1

    :cond_1
    const-string p1, "LVLDL"

    .line 762
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "reached max retries for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget v1, v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/16 p1, 0x1ef

    return p1
.end method

.method private handleEndOfStream(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 455
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget v1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    int-to-long v1, v1

    iput-wide v1, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    .line 460
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    invoke-virtual {v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z

    .line 462
    iget-object v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    iget-object v1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    .line 463
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    .line 465
    invoke-direct {p0, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->cannotResume(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 466
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0x1e9

    const-string v0, "mismatched content length"

    invoke-direct {p1, p0, p2, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 469
    :cond_1
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->getFinalStatusForHttpError(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)I

    move-result p1

    const-string v0, "closed socket before end of file"

    invoke-direct {p2, p0, p1, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p2

    :cond_2
    return-void
.end method

.method private handleExceptionalStatus(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;,
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$RetryDownload;
        }
    .end annotation

    const/16 v0, 0x1f7

    if-ne p4, v0, :cond_0

    .line 660
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    const/4 v1, 0x5

    if-ge v0, v1, :cond_0

    .line 661
    invoke-direct {p0, p1, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->handleServiceUnavailable(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)V

    .line 663
    :cond_0
    iget-boolean p3, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz p3, :cond_1

    const/16 p3, 0xce

    goto :goto_0

    :cond_1
    const/16 p3, 0xc8

    :goto_0
    if-eq p4, p3, :cond_2

    .line 666
    invoke-direct {p0, p1, p2, p4}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->handleOtherStatus(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;I)V

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    .line 669
    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRedirectCount:I

    :goto_1
    return-void
.end method

.method private handleOtherStatus(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 679
    invoke-static {p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->isStatusError(I)Z

    move-result p1

    if-nez p1, :cond_3

    const/16 p1, 0x12c

    if-lt p3, p1, :cond_1

    const/16 p1, 0x190

    if-lt p3, p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 p1, 0x1ed

    goto :goto_1

    .line 683
    :cond_1
    :goto_0
    iget-boolean p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz p1, :cond_2

    const/16 p1, 0xc8

    if-ne p3, p1, :cond_2

    const/16 p1, 0x1e9

    goto :goto_1

    :cond_2
    const/16 p1, 0x1ee

    goto :goto_1

    :cond_3
    move p1, p3

    .line 688
    :goto_1
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "http error "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p0, p1, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p2
.end method

.method private handleServiceUnavailable(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    const/4 v0, 0x1

    .line 711
    iput-boolean v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mCountRetry:Z

    const-string v0, "Retry-After"

    .line 712
    invoke-virtual {p2, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_3

    .line 718
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    .line 719
    iget p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    if-ltz p2, :cond_2

    .line 722
    iget p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    const/16 v0, 0x1e

    if-lt p2, v0, :cond_0

    .line 724
    iget p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    const v0, 0x15180

    if-le p2, v0, :cond_1

    .line 725
    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    goto :goto_0

    .line 723
    :cond_0
    iput v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    .line 727
    :cond_1
    :goto_0
    iget p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    sget-object v0, Lcom/google/android/vending/expansion/downloader/Helpers;->sRandom:Ljava/util/Random;

    const/16 v1, 0x1f

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/2addr p2, v0

    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    .line 728
    iget p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    mul-int/lit16 p2, p2, 0x3e8

    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    .line 720
    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 734
    :catch_0
    :cond_3
    :goto_1
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0xc2

    const-string v0, "got 503 Service Unavailable, will retry later"

    invoke-direct {p1, p0, p2, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1
.end method

.method private logNetworkState()V
    .locals 4

    const-string v0, "LVLDL"

    .line 525
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Net "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    .line 527
    invoke-virtual {v2, v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->getNetworkAvailabilityState(Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_0

    const-string v2, "Up"

    goto :goto_0

    :cond_0
    const-string v2, "Down"

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 525
    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method private notifyDownloadCompleted(IZIIZLjava/lang/String;)V
    .locals 0

    .line 824
    invoke-direct/range {p0 .. p6}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->updateDownloadDatabase(IZIIZLjava/lang/String;)V

    .line 826
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->isStatusCompleted(I)Z

    return-void
.end method

.method private openResponseEntity(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 515
    :try_start_0
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p2

    .line 517
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->logNetworkState()V

    .line 518
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->getFinalStatusForHttpError(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)I

    move-result p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "while getting entity: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 519
    invoke-virtual {p2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private processResponseHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 538
    iget-boolean v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mContinuingDownload:Z

    if-eqz v0, :cond_0

    return-void

    .line 543
    :cond_0
    invoke-direct {p0, p1, p2, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->readResponseHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;)V

    .line 546
    :try_start_0
    iget-object p3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v1, v1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    invoke-virtual {p3, v0, v1, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->generateSaveFile(Ljava/lang/String;J)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;
    :try_end_0
    .catch Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$GenerateSaveFileError; {:try_start_0 .. :try_end_0} :catch_2

    .line 551
    :try_start_1
    new-instance p3, Ljava/io/FileOutputStream;

    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {p3, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    iput-object p3, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p3

    .line 554
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-static {v1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getSaveFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 556
    :try_start_2
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 557
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 568
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->updateDatabaseFromHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V

    .line 570
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->checkConnectivity(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    return-void

    .line 560
    :catch_1
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0x1ec

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "while opening destination file: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    invoke-virtual {p3}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p0, p2, v0, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    :catch_2
    move-exception p1

    .line 548
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    iget p3, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$GenerateSaveFileError;->mStatus:I

    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService$GenerateSaveFileError;->mMessage:Ljava/lang/String;

    invoke-direct {p2, p0, p3, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p2
.end method

.method private readFromResponse(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;[BLjava/io/InputStream;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 490
    :try_start_0
    invoke-virtual {p4, p3}, Ljava/io/InputStream;->read([B)I

    move-result p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p3

    .line 492
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->logNetworkState()V

    .line 493
    iget-object p4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    int-to-long v0, v0

    iput-wide v0, p4, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    .line 494
    iget-object p4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    invoke-virtual {p4, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z

    .line 495
    invoke-direct {p0, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->cannotResume(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 496
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "while reading response: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ", can\'t resume interrupted download with no ETag"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 498
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p4, 0x1e9

    invoke-direct {p2, p0, p4, p1, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 501
    :cond_0
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->getFinalStatusForHttpError(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)I

    move-result p1

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "while reading response: "

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    invoke-virtual {p3}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-direct {p2, p0, p1, p4, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method private readResponseHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;Ljava/net/HttpURLConnection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    const-string p1, "Content-Disposition"

    .line 587
    invoke-virtual {p3, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 589
    iput-object p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentDisposition:Ljava/lang/String;

    :cond_0
    const-string p1, "Content-Location"

    .line 591
    invoke-virtual {p3, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 593
    iput-object p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentLocation:Ljava/lang/String;

    :cond_1
    const-string p1, "ETag"

    .line 595
    invoke-virtual {p3, p1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 597
    iput-object p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    :cond_2
    const/4 p1, 0x0

    const-string v0, "Transfer-Encoding"

    .line 600
    invoke-virtual {p3, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    move-object p1, v0

    :cond_3
    const-string v0, "Content-Type"

    .line 605
    invoke-virtual {p3, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    const-string v1, "application/vnd.android.obb"

    .line 608
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_0

    .line 609
    :cond_4
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0x1e7

    const-string p3, "file delivered with incorrect Mime type"

    invoke-direct {p1, p0, p2, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    :cond_5
    :goto_0
    if-nez p1, :cond_7

    .line 615
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result p3

    int-to-long v1, p3

    if-eqz v0, :cond_7

    const-wide/16 v3, -0x1

    cmp-long p3, v1, v3

    if-eqz p3, :cond_6

    .line 618
    iget-object p3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v3, p3, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    cmp-long p3, v1, v3

    if-eqz p3, :cond_6

    const-string p3, "LVLDL"

    const-string v0, "Incorrect file size delivered."

    .line 624
    invoke-static {p3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 626
    :cond_6
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p3

    iput-object p3, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    .line 645
    :cond_7
    :goto_1
    iget-object p2, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    if-nez p2, :cond_9

    if-eqz p1, :cond_8

    const-string p2, "chunked"

    .line 647
    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_9

    :cond_8
    const/4 p1, 0x1

    goto :goto_2

    :cond_9
    const/4 p1, 0x0

    :goto_2
    if-nez p1, :cond_a

    return-void

    .line 649
    :cond_a
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0x1ef

    const-string p3, "can\'t know size of download, giving up"

    invoke-direct {p1, p0, p2, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1
.end method

.method private reportProgress(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V
    .locals 6

    .line 390
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 391
    iget p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    iget v2, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesNotified:I

    sub-int/2addr p1, v2

    const/16 v2, 0x1000

    if-le p1, v2, :cond_0

    iget-wide v2, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mTimeLastNotification:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0x3e8

    cmp-long p1, v2, v4

    if-lez p1, :cond_0

    .line 396
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget v2, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    int-to-long v2, v2

    iput-wide v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mCurrentBytes:J

    .line 397
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    invoke-virtual {p1, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownloadCurrentBytes(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)V

    .line 399
    iget p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    iput p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesNotified:I

    .line 400
    iput-wide v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mTimeLastNotification:J

    .line 402
    iget p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesThisSession:I

    int-to-long p1, p1

    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    iget-wide v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->mBytesSoFar:J

    add-long/2addr p1, v0

    .line 411
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;->notifyUpdateBytes(J)V

    :cond_0
    return-void
.end method

.method private sendRequest(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 744
    :try_start_0
    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p2

    .line 749
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->logNetworkState()V

    .line 750
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->getFinalStatusForHttpError(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)I

    move-result p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "while trying to execute request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 751
    invoke-virtual {p2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_1
    move-exception p1

    .line 746
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 v0, 0x1ef

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "while trying to execute request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 747
    invoke-virtual {p1}, Ljava/lang/IllegalArgumentException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p2, p0, v0, v1, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method private setupDestinationFile(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 773
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    if-eqz v0, :cond_4

    .line 775
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-static {v0}, Lcom/google/android/vending/expansion/downloader/Helpers;->isFilenameValid(Ljava/lang/String;)Z

    move-result v0

    const/16 v1, 0x1ec

    if-eqz v0, :cond_3

    .line 781
    new-instance v0, Ljava/io/File;

    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 782
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 783
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-nez v4, :cond_0

    .line 787
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 p2, 0x0

    .line 788
    iput-object p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    goto :goto_0

    .line 789
    :cond_0
    iget-object v4, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v4, v4, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    if-eqz v4, :cond_2

    .line 797
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v4, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/4 v5, 0x1

    invoke-direct {v0, v4, v5}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    long-to-int v0, v2

    .line 802
    iput v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    .line 803
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1

    .line 804
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-wide v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mTotalBytes:J

    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderContentLength:Ljava/lang/String;

    .line 806
    :cond_1
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v0, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    iput-object v0, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    .line 807
    iput-boolean v5, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mContinuingDownload:Z

    goto :goto_0

    :catch_0
    move-exception p1

    .line 799
    new-instance p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "while opening destination for resuming: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 800
    invoke-virtual {p1}, Ljava/io/FileNotFoundException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, p0, v1, v0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 791
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 792
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0x1e9

    const-string v0, "Trying to resume a download that can\'t be resumed"

    invoke-direct {p1, p0, p2, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 777
    :cond_3
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const-string p2, "found invalid internal destination filename"

    invoke-direct {p1, p0, v1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1

    .line 812
    :cond_4
    :goto_0
    iget-object p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    if-eqz p2, :cond_5

    .line 813
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->closeDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    :cond_5
    return-void
.end method

.method private syncDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    .locals 6

    const/4 v0, 0x0

    .line 330
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    iget-object v2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/SyncFailedException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 331
    :try_start_1
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/SyncFailedException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 343
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_5

    goto/16 :goto_4

    :catchall_0
    move-exception p1

    move-object v0, v1

    goto/16 :goto_5

    :catch_0
    move-exception p1

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception v0

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_1

    :catch_2
    move-exception v0

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_2

    :catch_3
    move-exception v0

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto/16 :goto_3

    :catchall_1
    move-exception p1

    goto/16 :goto_5

    :catch_4
    move-exception p1

    :goto_0
    :try_start_3
    const-string v1, "LVLDL"

    const-string v2, "exception while syncing file: "

    .line 339
    invoke-static {v1, v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_0

    .line 343
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_5

    goto/16 :goto_4

    :catch_5
    move-exception p1

    const-string v0, "LVLDL"

    const-string v1, "exception while closing file: "

    .line 347
    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_4

    :catch_6
    move-exception p1

    const-string v0, "LVLDL"

    const-string v1, "IOException while closing synced file: "

    .line 345
    invoke-static {v0, v1, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_4

    :catch_7
    move-exception v1

    :goto_1
    :try_start_5
    const-string v2, "LVLDL"

    .line 337
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "IOException trying to sync "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v0, :cond_0

    .line 343
    :try_start_6
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_5

    goto :goto_4

    :catch_8
    move-exception v1

    :goto_2
    :try_start_7
    const-string v2, "LVLDL"

    .line 335
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " sync failed: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v0, :cond_0

    .line 343
    :try_start_8
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_4

    :catch_9
    move-exception v1

    :goto_3
    :try_start_9
    const-string v2, "LVLDL"

    .line 333
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "file "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " not found: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    if-eqz v0, :cond_0

    .line 343
    :try_start_a
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_5

    :cond_0
    :goto_4
    return-void

    :goto_5
    if-eqz v0, :cond_1

    :try_start_b
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_b
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_a

    goto :goto_6

    :catch_a
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "exception while closing file: "

    .line 347
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_6

    :catch_b
    move-exception v0

    const-string v1, "LVLDL"

    const-string v2, "IOException while closing synced file: "

    .line 345
    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 350
    :cond_1
    :goto_6
    throw p1
.end method

.method private transferData(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;[BLjava/io/InputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 273
    :goto_0
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->readFromResponse(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;[BLjava/io/InputStream;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 275
    invoke-direct {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->handleEndOfStream(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 279
    iput-boolean v1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mGotData:Z

    .line 280
    invoke-direct {p0, p1, p3, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->writeDataToDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;[BI)V

    .line 281
    iget v1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    add-int/2addr v1, v0

    iput v1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesSoFar:I

    .line 282
    iget v1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesThisSession:I

    add-int/2addr v1, v0

    iput v1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mBytesThisSession:I

    .line 283
    invoke-direct {p0, p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->reportProgress(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V

    .line 285
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->checkPausedOrCanceled(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V

    goto :goto_0
.end method

.method private updateDatabaseFromHeaders(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;)V
    .locals 0

    .line 578
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object p2, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$InnerState;->mHeaderETag:Ljava/lang/String;

    iput-object p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mETag:Ljava/lang/String;

    .line 579
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    iget-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    invoke-virtual {p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z

    return-void
.end method

.method private updateDownloadDatabase(IZIIZLjava/lang/String;)V
    .locals 0

    .line 834
    iget-object p6, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iput p1, p6, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mStatus:I

    .line 835
    iput p3, p6, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRetryAfter:I

    .line 836
    iput p4, p6, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mRedirectCount:I

    .line 837
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    iput-wide p3, p6, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mLastMod:J

    if-nez p2, :cond_0

    .line 839
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    const/4 p2, 0x0

    iput p2, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    if-eqz p5, :cond_1

    .line 841
    iget-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iput p1, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    goto :goto_0

    .line 843
    :cond_1
    iget-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget p3, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    add-int/2addr p3, p1

    iput p3, p2, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mNumFailed:I

    .line 845
    :goto_0
    iget-object p1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mDB:Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;

    iget-object p2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    invoke-virtual {p1, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadsDB;->updateDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;)Z

    return-void
.end method

.method private userAgent()Ljava/lang/String;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mUserAgent:Ljava/lang/String;

    return-object v0
.end method

.method private writeDataToDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;[BI)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;
        }
    .end annotation

    .line 425
    :try_start_0
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    if-nez v0, :cond_0

    .line 426
    new-instance v0, Ljava/io/FileOutputStream;

    iget-object v1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    .line 428
    :cond_0
    iget-object v0, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mStream:Ljava/io/FileOutputStream;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, p3}, Ljava/io/FileOutputStream;->write([BII)V

    .line 430
    invoke-direct {p0, p1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->closeDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p2

    .line 433
    invoke-static {}, Lcom/google/android/vending/expansion/downloader/Helpers;->isExternalMediaMounted()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 438
    iget-object p1, p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    .line 439
    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getFilesystemRoot(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/vending/expansion/downloader/Helpers;->getAvailableBytes(Ljava/io/File;)J

    move-result-wide v0

    int-to-long v2, p3

    cmp-long p1, v0, v2

    if-gez p1, :cond_1

    .line 441
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p3, 0x1f2

    const-string v0, "insufficient space while writing destination file"

    invoke-direct {p1, p0, p3, v0, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 444
    :cond_1
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p3, 0x1ec

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "while writing destination file: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 445
    invoke-virtual {p2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, p0, p3, v0, p2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;Ljava/lang/Throwable;)V

    throw p1

    .line 434
    :cond_2
    new-instance p1, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;

    const/16 p2, 0x1f3

    const-string p3, "external media not mounted while writing destination file"

    invoke-direct {p1, p0, p2, p3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;ILjava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public run()V
    .locals 13

    const/16 v0, 0xa

    .line 141
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 143
    new-instance v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;

    iget-object v1, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v2, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mService:Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;

    invoke-direct {v0, v1, v2}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;-><init>(Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;Lcom/google/android/vending/expansion/downloader/impl/DownloaderService;)V

    const/16 v1, 0x1eb

    const/4 v2, 0x0

    .line 148
    :try_start_0
    iget-object v3, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mContext:Landroid/content/Context;

    const-string v4, "power"

    invoke-virtual {v3, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/PowerManager;

    const-string v4, "LVLDL"

    const/4 v5, 0x1

    .line 149
    invoke-virtual {v3, v5, v4}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    .line 150
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    const/4 v3, 0x0

    :goto_0
    if-nez v3, :cond_0

    .line 166
    new-instance v4, Ljava/net/URL;

    iget-object v6, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRequestUri:Ljava/lang/String;

    invoke-direct {v4, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 167
    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v4

    check-cast v4, Ljava/net/HttpURLConnection;

    const-string v6, "User-Agent"

    .line 168
    invoke-direct {p0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->userAgent()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 170
    :try_start_1
    invoke-direct {p0, v0, v4}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->executeDownload(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;Ljava/net/HttpURLConnection;)V
    :try_end_1
    .catch Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$RetryDownload; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 175
    :try_start_2
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    move v3, v5

    goto :goto_0

    :catchall_0
    move-exception v3

    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 177
    throw v3

    .line 175
    :catch_0
    invoke-virtual {v4}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_0

    .line 184
    :cond_0
    invoke-direct {p0, v0}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->finalizeDestinationFile(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;)V
    :try_end_2
    .catch Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    const/16 v1, 0xc8

    if-eqz v2, :cond_1

    .line 200
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 203
    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->cleanupDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;I)V

    .line 204
    iget-boolean v5, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mCountRetry:Z

    iget v6, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    iget v7, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRedirectCount:I

    iget-boolean v8, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mGotData:Z

    iget-object v9, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/16 v4, 0xc8

    move-object v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;)V

    goto/16 :goto_1

    :catchall_1
    move-exception v3

    goto/16 :goto_2

    :catch_1
    move-exception v3

    :try_start_3
    const-string v4, "LVLDL"

    .line 195
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception for "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v6, v6, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v2, :cond_2

    .line 200
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 203
    :cond_2
    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->cleanupDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;I)V

    .line 204
    iget-boolean v7, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mCountRetry:Z

    iget v8, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    iget v9, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRedirectCount:I

    iget-boolean v10, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mGotData:Z

    iget-object v11, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/16 v6, 0x1eb

    move-object v5, p0

    invoke-direct/range {v5 .. v11}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;)V

    goto :goto_1

    :catch_2
    move-exception v3

    :try_start_4
    const-string v4, "LVLDL"

    .line 188
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Aborting request for download "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, p0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->mInfo:Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;

    iget-object v6, v6, Lcom/google/android/vending/expansion/downloader/impl/DownloadInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ": "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 189
    invoke-virtual {v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 188
    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    invoke-virtual {v3}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;->printStackTrace()V

    .line 191
    iget v7, v3, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$StopRequest;->mFinalStatus:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v2, :cond_3

    .line 200
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 203
    :cond_3
    invoke-direct {p0, v0, v7}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->cleanupDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;I)V

    .line 204
    iget-boolean v8, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mCountRetry:Z

    iget v9, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    iget v10, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRedirectCount:I

    iget-boolean v11, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mGotData:Z

    iget-object v12, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    move-object v6, p0

    invoke-direct/range {v6 .. v12}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;)V

    :goto_1
    return-void

    :goto_2
    if-eqz v2, :cond_4

    .line 200
    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 203
    :cond_4
    invoke-direct {p0, v0, v1}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->cleanupDestination(Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;I)V

    .line 204
    iget-boolean v6, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mCountRetry:Z

    iget v7, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRetryAfter:I

    iget v8, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mRedirectCount:I

    iget-boolean v9, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mGotData:Z

    iget-object v10, v0, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread$State;->mFilename:Ljava/lang/String;

    const/16 v5, 0x1eb

    move-object v4, p0

    invoke-direct/range {v4 .. v10}, Lcom/google/android/vending/expansion/downloader/impl/DownloadThread;->notifyDownloadCompleted(IZIIZLjava/lang/String;)V

    .line 206
    throw v3
.end method
