.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;
.super Landroid/os/AsyncTask;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ReduceGLTFSizeTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Ljava/io/File;",
        ">;"
    }
.end annotation


# instance fields
.field mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field mExportName:Ljava/lang/String;

.field mShareable:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/lang/String;)V
    .locals 1

    .line 277
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 278
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mContext:Ljava/lang/ref/WeakReference;

    .line 279
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mShareable:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 280
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mExportName:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Ljava/io/File;
    .locals 4

    .line 287
    new-instance v0, Lcom/sonymobile/scan3d/animation/GLTFExporter;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;-><init>()V

    .line 288
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    if-eqz v1, :cond_0

    const/4 v2, 0x0

    .line 290
    aget-object p1, p1, v2

    .line 291
    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 292
    invoke-virtual {v0, p1, v3}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 293
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mShareable:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getTextureSize()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->reduceSize(I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 294
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mExportName:Ljava/lang/String;

    invoke-static {v1, p1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareGlbFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 298
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->save(Ljava/lang/String;Z)Z

    .line 299
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mShareable:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 248
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->doInBackground([Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/io/File;)V
    .locals 1

    .line 308
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 309
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->getInstance()Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;

    move-result-object v0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->mShareable:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->reductionDone(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 248
    check-cast p1, Ljava/io/File;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->onPostExecute(Ljava/io/File;)V

    return-void
.end method
