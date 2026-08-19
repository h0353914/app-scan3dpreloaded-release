.class Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;
.super Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->computePrintMesh(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field final synthetic val$listener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;ZZLcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V
    .locals 7

    .line 266
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iput-object p8, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->val$listener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    move-object v0, p0

    move-object v1, p2

    move-object v2, p3

    move-object v3, p4

    move-object v4, p5

    move v5, p6

    move v6, p7

    invoke-direct/range {v0 .. v6}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;ZZ)V

    return-void
.end method


# virtual methods
.method protected onCancelled()V
    .locals 2

    .line 269
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->onCancelled()V

    .line 270
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$902(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-void
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;)V
    .locals 8

    .line 275
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintLoadResult(Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;)V

    .line 276
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget v1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->textLimit:I

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setTextLimit(I)V

    .line 277
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    if-ne v0, v1, :cond_0

    .line 278
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$902(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 279
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->val$listener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1000(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1100(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1200(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 280
    invoke-static {v3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1300(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v3

    .line 279
    invoke-interface {p1, v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;->onPrintMeshComputed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    goto :goto_0

    .line 282
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$902(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 283
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->val$listener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1000(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v3

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1100(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v4

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1200(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v5

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 284
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1300(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v6

    iget-object v7, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 283
    invoke-interface/range {v2 .. v7}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;->onPrintMeshFailed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;)V

    .line 286
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1402(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;)Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 266
    check-cast p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;->onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;)V

    return-void
.end method
