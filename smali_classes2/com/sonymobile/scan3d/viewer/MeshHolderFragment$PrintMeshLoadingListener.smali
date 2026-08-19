.class public interface abstract Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;
.super Ljava/lang/Object;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PrintMeshLoadingListener"
.end annotation


# virtual methods
.method public abstract onPrintMeshComputed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
.end method

.method public abstract onPrintMeshFailed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;)V
.end method

.method public abstract onPrintMeshLoading()V
.end method
