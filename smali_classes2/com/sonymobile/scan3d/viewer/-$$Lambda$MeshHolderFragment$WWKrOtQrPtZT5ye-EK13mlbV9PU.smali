.class public final synthetic Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field private final synthetic f$1:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;->f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;->f$1:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;->f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;->f$1:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->lambda$setMeshLoadingListener$2(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    return-void
.end method
