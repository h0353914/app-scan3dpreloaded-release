.class public final synthetic Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field private final synthetic f$1:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;->f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;->f$1:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;->f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;->f$1:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->lambda$computePrintMesh$4(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V

    return-void
.end method
