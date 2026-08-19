.class Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;
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
    name = "SaveVideo"
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

.field private mHandler:Landroid/os/Handler;

.field private mSource:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/os/Handler;Ljava/lang/String;)V
    .locals 1

    .line 322
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 323
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mContext:Ljava/lang/ref/WeakReference;

    .line 324
    iput-object p2, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mHandler:Landroid/os/Handler;

    .line 325
    iput-object p3, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mSource:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 330
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 332
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void

    .line 335
    :cond_0
    new-instance v2, Ljava/io/File;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    iget-object v4, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mSource:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 336
    sget-object v3, Landroid/os/Environment;->DIRECTORY_MOVIES:Ljava/lang/String;

    const-string v4, "mp4"

    invoke-static {v3, v4}, Lcom/sonymobile/scan3d/utils/SharingUtil;->access$000(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    .line 338
    invoke-static {v2, v3}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->moveFile(Ljava/io/File;Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 339
    invoke-static {v0, v3}, Lcom/sonymobile/scan3d/utils/MediaStoreUtil;->insertVideo(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 341
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->scheduleShareFileDeletion(Landroid/content/Context;)V

    const-string v1, "video/mp4"

    .line 343
    invoke-static {v0, v2, v1}, Lcom/sonymobile/scan3d/utils/SharingUtil;->access$100(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 344
    iget-object v1, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mHandler:Landroid/os/Handler;

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 346
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 349
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SharingUtil$SaveVideo;->mHandler:Landroid/os/Handler;

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :goto_0
    return-void
.end method
