.class Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;
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
    name = "ShareRiggedFile"
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

.field private final mTextureSize:I

.field private final mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;I)V
    .locals 1

    .line 281
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 282
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mContext:Ljava/lang/ref/WeakReference;

    .line 283
    iput-object p2, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mHandler:Landroid/os/Handler;

    .line 284
    iput-object p3, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mUri:Landroid/net/Uri;

    .line 285
    iput p4, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mTextureSize:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 290
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    if-eqz v0, :cond_1

    .line 292
    iget-object v1, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    .line 293
    iget v2, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mTextureSize:I

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/utils/SharingUtil;->getRiggedFileForSharing(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;I)Ljava/io/File;

    move-result-object v2

    if-eqz v2, :cond_0

    const v3, 0x7f100123

    .line 296
    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 295
    invoke-static {v0, v3, v2}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    .line 297
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->scheduleShareFileDeletion(Landroid/content/Context;)V

    .line 298
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mHandler:Landroid/os/Handler;

    const/4 v3, 0x0

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v1

    const/4 v4, -0x1

    invoke-static {v0, v3, v1, v4, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 299
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 301
    :cond_0
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteShareFile(Landroid/content/Context;)V

    .line 302
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$ShareRiggedFile;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :cond_1
    :goto_0
    return-void
.end method
