.class Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$3;
.super Landroid/database/ContentObserver;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->enableFileSetObserver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/os/Handler;)V
    .locals 0

    .line 540
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$3;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(ZLandroid/net/Uri;)V
    .locals 1

    .line 543
    invoke-super {p0, p1, p2}, Landroid/database/ContentObserver;->onChange(ZLandroid/net/Uri;)V

    .line 544
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$3;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 546
    new-instance p2, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$3;->this$0:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/app/Activity;)V

    const/4 p1, 0x0

    .line 547
    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method
