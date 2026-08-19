.class public Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;
.super Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Downloadable"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;IZI)V
    .locals 0

    .line 564
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;-><init>(Landroid/content/Context;IZI)V

    return-void
.end method


# virtual methods
.method public download(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;)Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation

    .line 579
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object p1

    .line 581
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;->mContext:Landroid/content/Context;

    invoke-static {v0, p0, p1, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$100(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 583
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;->mContext:Landroid/content/Context;

    invoke-static {p3, p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$200(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/File;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method
