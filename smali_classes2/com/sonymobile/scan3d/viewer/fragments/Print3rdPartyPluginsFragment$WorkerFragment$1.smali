.class Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;
.super Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
.source "Print3rdPartyPluginsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->createTask()Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;ZZ)V
    .locals 7

    .line 488
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

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
.method protected onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;)V
    .locals 3

    .line 491
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    if-eq v0, v1, :cond_0

    .line 492
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f10022e

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    .line 493
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 495
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;

    .line 496
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->getTargetFragment()Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    if-eqz v0, :cond_1

    .line 498
    iget-object v1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v2, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->name:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;)V

    .line 500
    :cond_1
    iget-object p1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 488
    check-cast p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;->onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;)V

    return-void
.end method
