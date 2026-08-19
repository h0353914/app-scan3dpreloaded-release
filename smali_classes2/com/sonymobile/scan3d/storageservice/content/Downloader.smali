.class final Lcom/sonymobile/scan3d/storageservice/content/Downloader;
.super Ljava/lang/Object;
.source "Downloader.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private final mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    .line 43
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 44
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    return-void
.end method

.method private download(Ljava/lang/String;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation

    .line 91
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v0

    .line 93
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getDownloadableContent(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;

    .line 94
    invoke-virtual {v3, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;->isTransferred(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 95
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    invoke-virtual {v3, v2, v4, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;->download(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 97
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;->getTransferFlag()I

    move-result v4

    or-int/2addr v0, v4

    .line 98
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {p0, v4, v3, v2, v0}, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->notifyProvider(Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;Ljava/io/File;I)Z

    move-result v2

    if-nez v2, :cond_0

    :cond_1
    return v2
.end method

.method private notifyProvider(Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;Ljava/io/File;I)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p3, :cond_0

    .line 121
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    move v2, v0

    goto :goto_0

    :cond_0
    move v2, v1

    :goto_0
    if-eqz v2, :cond_2

    .line 124
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "transfer_flags"

    .line 125
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-virtual {v2, v3, p4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 127
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;->getType()I

    move-result p4

    packed-switch p4, :pswitch_data_0

    .line 135
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Unsupported content "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    const-string p2, "url"

    .line 132
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_1
    const-string p2, "thumb_url"

    .line 129
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    :goto_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p2, p1, v2, p3, p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_1

    move v2, v0

    goto :goto_2

    :cond_1
    move v2, v1

    :cond_2
    :goto_2
    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public isValid()Z
    .locals 3

    .line 78
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/4 v2, 0x4

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public transfer()Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 49
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 53
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 55
    :try_start_0
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v5, "sync_state"

    const/4 v6, 0x4

    .line 57
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 58
    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-virtual {v5, v1, v4, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 61
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->download(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v2}, Landroid/content/ContentValues;-><init>(I)V

    if-eqz v0, :cond_0

    const-string v2, "sync_state"

    const/4 v5, 0x2

    .line 65
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v2, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_0
    const-string v5, "sync_state"

    .line 67
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 70
    :goto_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1, v4, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 63
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v2}, Landroid/content/ContentValues;-><init>(I)V

    .line 67
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const-string v5, "sync_state"

    invoke-virtual {v4, v5, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 70
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Downloader;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v2, v1, v4, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 71
    throw v0

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method
