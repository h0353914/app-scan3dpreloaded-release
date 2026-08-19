.class public Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;
.super Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Uploadable"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;IZI)V
    .locals 0

    .line 603
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;-><init>(Landroid/content/Context;IZI)V

    return-void
.end method


# virtual methods
.method public upload(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation

    .line 618
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getTempDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 620
    :try_start_0
    invoke-virtual {p0, p1, v0, v1, p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->getFile(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/io/File;ZLcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/File;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 622
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 623
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v7

    .line 624
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->mContext:Landroid/content/Context;

    move-object v5, p0

    move-object v6, p2

    move-object v8, p3

    .line 625
    invoke-static/range {v3 .. v8}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$300(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p1

    .line 626
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    if-eqz p1, :cond_1

    .line 627
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->mContext:Landroid/content/Context;

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$400(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    move v1, v2

    goto :goto_0

    :cond_0
    const/4 p1, 0x3

    .line 633
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->getType()I

    move-result p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne p1, p2, :cond_1

    move v1, v2

    .line 637
    :cond_1
    :goto_0
    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    return v1

    :catchall_0
    move-exception p1

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    .line 638
    throw p1
.end method
