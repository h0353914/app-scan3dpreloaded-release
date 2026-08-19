.class public Lcom/sonymobile/scan3d/SimpleLifecycle;
.super Ljava/lang/Object;
.source "SimpleLifecycle.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;,
        Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;
    }
.end annotation


# instance fields
.field private mObservers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/SimpleLifecycle;->mObservers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public declared-synchronized addObserver(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;)V
    .locals 1

    monitor-enter p0

    .line 29
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SimpleLifecycle;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 30
    iget-object v0, p0, Lcom/sonymobile/scan3d/SimpleLifecycle;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 2

    monitor-enter p0

    .line 42
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SimpleLifecycle;->mObservers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;

    .line 43
    invoke-interface {v1, p1}, Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;->onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 45
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 2

    monitor-enter p0

    .line 49
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SimpleLifecycle;->mObservers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;

    .line 50
    invoke-interface {v1, p1}, Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;->onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 52
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized removeObserver(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;)V
    .locals 1

    monitor-enter p0

    .line 37
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SimpleLifecycle;->mObservers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
