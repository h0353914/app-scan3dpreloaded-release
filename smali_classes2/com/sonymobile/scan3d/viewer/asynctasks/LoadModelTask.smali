.class public Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;
.super Landroid/os/AsyncTask;
.source "LoadModelTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/net/Uri;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 25
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;
    .locals 4

    const/4 v0, 0x0

    .line 31
    aget-object p1, p1, v0

    .line 33
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 36
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 37
    new-instance v2, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;

    invoke-direct {v2}, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;-><init>()V

    .line 39
    new-instance v3, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {v3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    iput-object v3, v2, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;->model:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 40
    iput-object p1, v2, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;->fileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 42
    iget-object v3, v2, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;->model:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1, v1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->importZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 43
    iget-object p1, v2, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;->model:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return-object v0

    :cond_0
    move-object v0, v2

    :cond_1
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;->doInBackground([Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;

    move-result-object p1

    return-object p1
.end method
