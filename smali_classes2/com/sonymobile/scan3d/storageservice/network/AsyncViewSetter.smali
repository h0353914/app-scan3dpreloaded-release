.class public abstract Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;
.super Ljava/lang/Object;
.source "AsyncViewSetter.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener<",
        "TR;>;"
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.network.AsyncViewSetter"


# instance fields
.field private final mViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;->mViewRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public onExecutionCancelled(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TR;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 76
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;->onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Ljava/lang/Object;)V

    return-void
.end method

.method public onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TR;>;TR;)V"
        }
    .end annotation

    .line 66
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;->mViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    if-eqz p1, :cond_0

    .line 68
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;->onSetResource(Landroid/view/View;Ljava/lang/Object;)V

    goto :goto_0

    .line 70
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/network/AsyncViewSetter;->TAG:Ljava/lang/String;

    const-string p2, "onResultReceived(): View reference is gc:ed."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TR;>;",
            "Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;",
            ")V"
        }
    .end annotation

    return-void
.end method

.method public onPreExecution(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TR;>;)V"
        }
    .end annotation

    return-void
.end method

.method public abstract onSetResource(Landroid/view/View;Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TR;)V"
        }
    .end annotation
.end method
