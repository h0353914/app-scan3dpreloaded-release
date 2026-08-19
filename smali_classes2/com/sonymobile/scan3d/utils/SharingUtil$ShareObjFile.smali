.class Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;
.super Ljava/lang/Object;
.source "SharingUtil.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/utils/SharingUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ShareObjFile"
.end annotation


# instance fields
.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private final mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;)V
    .locals 1

    .line 219
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 220
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mContext:Ljava/lang/ref/WeakReference;

    .line 221
    iput-object p3, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mUri:Landroid/net/Uri;

    .line 222
    iput-object p2, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mHandler:Landroid/os/Handler;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 227
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_0

    .line 229
    iget-object v1, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 230
    new-instance v2, Ljava/io/File;

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 231
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareFile(Landroid/content/Context;)Ljava/io/File;

    move-result-object v3

    .line 233
    :try_start_0
    invoke-static {v0, v2, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->decrypt(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    const v2, 0x7f100123

    .line 235
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 234
    invoke-static {v0, v2, v3}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 236
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->scheduleShareFileDeletion(Landroid/content/Context;)V

    .line 237
    iget-object v3, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mHandler:Landroid/os/Handler;

    const/4 v4, 0x0

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v1

    const/4 v5, -0x1

    invoke-static {v3, v4, v1, v5, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 238
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 240
    :catch_0
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteShareFile(Landroid/content/Context;)V

    .line 241
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareObjFile;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    :goto_0
    return-void
.end method
