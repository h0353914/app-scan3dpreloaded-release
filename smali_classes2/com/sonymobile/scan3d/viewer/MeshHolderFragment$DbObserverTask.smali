.class Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;
.super Landroid/os/AsyncTask;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DbObserverTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mParentRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;",
            ">;"
        }
    .end annotation
.end field

.field private mUri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/app/Activity;)V
    .locals 1

    .line 509
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 510
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->mParentRef:Ljava/lang/ref/WeakReference;

    .line 511
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->mContext:Ljava/lang/ref/WeakReference;

    .line 512
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$700(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->mUri:Landroid/net/Uri;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 1

    .line 517
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/Context;

    if-eqz p1, :cond_0

    .line 519
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->mUri:Landroid/net/Uri;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 492
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 527
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->mParentRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-eqz v0, :cond_0

    .line 529
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$102(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 530
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Ljava/lang/Runnable;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 531
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->access$1500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Ljava/lang/Runnable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 492
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;->onPostExecute(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    return-void
.end method
