.class public interface abstract Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
.super Ljava/lang/Object;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MeshLoadingListener"
.end annotation


# virtual methods
.method public abstract onMeshLoadFailed(Landroid/net/Uri;)V
.end method

.method public abstract onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
.end method

.method public abstract onMeshLoading(Landroid/net/Uri;)V
.end method
