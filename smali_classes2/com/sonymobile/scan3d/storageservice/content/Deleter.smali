.class final Lcom/sonymobile/scan3d/storageservice/content/Deleter;
.super Ljava/lang/Object;
.source "Deleter.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private final mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mContext:Landroid/content/Context;

    .line 37
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-void
.end method


# virtual methods
.method public isValid()Z
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v0

    const/4 v1, 0x7

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public transfer()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 42
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 46
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->deleteModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mContext:Landroid/content/Context;

    .line 47
    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Deleter;->mContext:Landroid/content/Context;

    .line 48
    invoke-interface {v0, v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->deleteAllFiles(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    move v1, v0

    :cond_0
    return v1
.end method
