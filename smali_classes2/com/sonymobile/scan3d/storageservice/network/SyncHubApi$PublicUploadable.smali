.class public Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;
.super Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PublicUploadable"
.end annotation


# instance fields
.field private mShareId:Ljava/lang/String;

.field private mSpawnId:Z


# direct methods
.method constructor <init>(Landroid/content/Context;IZZ)V
    .locals 1

    const/4 v0, 0x0

    .line 734
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;-><init>(Landroid/content/Context;IZI)V

    .line 735
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mSpawnId:Z

    return-void
.end method


# virtual methods
.method public getShareUid()Ljava/lang/String;
    .locals 1

    .line 744
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mShareId:Ljava/lang/String;

    return-object v0
.end method

.method public upload(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation

    .line 757
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getTempDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 759
    :try_start_0
    invoke-virtual {p0, p1, v0, v2, v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->getFile(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/io/File;ZLcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/File;

    move-result-object v4

    const/4 v1, 0x0

    if-eqz v4, :cond_2

    .line 761
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 762
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    .line 765
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->getType()I

    move-result p1

    const/4 v3, 0x5

    if-ne p1, v3, :cond_0

    move v8, v2

    goto :goto_0

    :cond_0
    move v8, v1

    .line 766
    :goto_0
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mContext:Landroid/content/Context;

    move-object v5, p0

    move-object v7, p2

    .line 767
    invoke-static/range {v3 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$500(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p1

    .line 769
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    if-eqz p1, :cond_1

    .line 770
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mContext:Landroid/content/Context;

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$400(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p2

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-eqz p2, :cond_1

    move v1, v2

    :cond_1
    if-eqz v1, :cond_2

    .line 771
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mSpawnId:Z

    if-eqz p2, :cond_2

    .line 772
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->getShareHash()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->mShareId:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 776
    :cond_2
    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    return v1

    :catchall_0
    move-exception p1

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    .line 777
    throw p1
.end method
