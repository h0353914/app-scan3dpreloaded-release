.class public final synthetic Lcom/sonymobile/scan3d/viewer/-$$Lambda$5kRIYLxsSr-ktLzRQlSUW9mjCoY;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$5kRIYLxsSr-ktLzRQlSUW9mjCoY;->f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/-$$Lambda$5kRIYLxsSr-ktLzRQlSUW9mjCoY;->f$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;->onPrintMeshLoading()V

    return-void
.end method
