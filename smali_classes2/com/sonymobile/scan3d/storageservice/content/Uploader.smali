.class Lcom/sonymobile/scan3d/storageservice/content/Uploader;
.super Ljava/lang/Object;
.source "Uploader.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private final mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    .line 47
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 48
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    return-void
.end method

.method private upload(Ljava/lang/String;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v0

    .line 111
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getUploadableContent(Landroid/content/Context;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;

    .line 112
    invoke-virtual {v2, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->isTransferred(I)Z

    move-result v4

    if-nez v4, :cond_0

    .line 114
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mKeys:Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    invoke-virtual {v2, v4, v5, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->upload(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 115
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->getTransferFlag()I

    move-result v2

    or-int/2addr v0, v2

    .line 116
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "transfer_flags"

    .line 117
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 118
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v2, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :cond_2
    return v3
.end method


# virtual methods
.method public isValid()Z
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public transfer()Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 54
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 56
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 60
    :try_start_0
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v6, "sync_state"

    const/4 v7, 0x3

    .line 61
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 62
    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    invoke-virtual {v6, v2, v5, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 65
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->upload(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5, v3}, Landroid/content/ContentValues;-><init>(I)V

    if-eqz v0, :cond_0

    const-string v1, "sync_state"

    const/4 v3, 0x2

    .line 70
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_0
    const-string v3, "sync_state"

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v5, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 76
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v2, v5, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :catchall_0
    move-exception v0

    .line 67
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const-string v3, "sync_state"

    invoke-virtual {v5, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 76
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Uploader;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, v2, v5, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 77
    throw v0

    :cond_1
    move v0, v1

    :goto_1
    return v0
.end method
