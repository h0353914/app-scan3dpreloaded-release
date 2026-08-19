.class Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;
.super Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->loadMesh()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/content/Context;)V
    .locals 0

    .line 206
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic lambda$onPostExecute$0(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;)V
    .locals 3

    .line 217
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$700(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$800(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    return-void
.end method

.method public static synthetic lambda$onPostExecute$1(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;)V
    .locals 2

    .line 222
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$700(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method


# virtual methods
.method protected onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;)V
    .locals 3

    if-eqz p1, :cond_0

    .line 210
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$002(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 211
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;->fileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 212
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$102(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 213
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$202(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 214
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$302(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Ljava/lang/String;)Ljava/lang/String;

    .line 215
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object p1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;->model:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$400(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 216
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 217
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$600(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$1$fKZi1hsWV6AGdK_rd6zLxVX2ugo;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$1$fKZi1hsWV6AGdK_rd6zLxVX2ugo;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 220
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$002(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 221
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 222
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$600(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$1$GXsuZw6T-ZL4B5dQ65jG_TCrf1I;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$1$GXsuZw6T-ZL4B5dQ65jG_TCrf1I;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 206
    check-cast p1, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;->onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;)V

    return-void
.end method
