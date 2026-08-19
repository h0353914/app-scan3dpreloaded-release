.class Lcom/sonymobile/scan3d/storageservice/content/Modifier;
.super Ljava/lang/Object;
.source "Modifier.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mContext:Landroid/content/Context;

    .line 39
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-void
.end method


# virtual methods
.method public isValid()Z
    .locals 2

    .line 64
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v0

    const/4 v1, 0x6

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public transfer()Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 44
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 48
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-static {v2, v0, v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->updateMetadata(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    .line 52
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x1

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v4, "sync_state"

    const/4 v5, 0x2

    .line 53
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 55
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/content/Modifier;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v0, v2, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v0

    :cond_1
    :goto_0
    return v1
.end method
