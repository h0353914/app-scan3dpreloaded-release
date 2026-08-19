.class public Lcom/sonymobile/scan3d/viewer/FaceBlender;
.super Ljava/lang/Object;
.source "FaceBlender.java"

# interfaces
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;


# static fields
.field private static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "FaceBlender"


# instance fields
.field private mNativeHandle:J

.field private mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

.field private final mRenderEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 26
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->classInit()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mRenderEventQueue:Ljava/util/ArrayList;

    .line 33
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mNativeHandle:J

    return-void
.end method

.method private static native classInit()V
.end method

.method private native create()J
.end method

.method private executeRenderEvents()V
    .locals 3
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mRenderEventQueue:Ljava/util/ArrayList;

    monitor-enter v0

    .line 101
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mRenderEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mRenderEventQueue:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Runnable;

    .line 102
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_2

    .line 104
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    :cond_2
    if-nez v1, :cond_0

    return-void

    :catchall_0
    move-exception v1

    .line 102
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private native onSurfaceChangedImpl(II)V
.end method

.method private native onSurfaceCreatedImpl()V
.end method

.method private native onSurfaceDestroyedImpl()V
.end method

.method private native renderImpl()Z
.end method


# virtual methods
.method public synchronized native destroy()V
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public synchronized native load(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation
.end method

.method public synchronized native onDown()Z
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public declared-synchronized onDrawFrame()Z
    .locals 1
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    monitor-enter p0

    .line 112
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->executeRenderEvents()V

    .line 113
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->renderImpl()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onDrawFrame(F)Z
    .locals 0

    monitor-enter p0

    .line 118
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->executeRenderEvents()V

    .line 119
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->renderImpl()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public synchronized native onFling(FF)Z
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public declared-synchronized onStopFling()V
    .locals 1

    monitor-enter p0

    .line 144
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

    if-eqz v0, :cond_0

    .line 145
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;->onStopFling()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSurfaceChanged(II)V
    .locals 3
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    monitor-enter p0

    .line 83
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSurfaceChanged("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onSurfaceChangedImpl(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onSurfaceCreated()V
    .locals 2
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    monitor-enter p0

    .line 64
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceCreated()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onSurfaceCreatedImpl()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSurfaceDestroyed()V
    .locals 2
    .annotation build Lcom/sonymobile/scan3d/sfmc/GlThread;
    .end annotation

    monitor-enter p0

    .line 73
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->TAG:Ljava/lang/String;

    const-string v1, "onSurfaceDestroyed()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->executeRenderEvents()V

    .line 75
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onSurfaceDestroyedImpl()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public queueOnRender(Ljava/lang/Runnable;)V
    .locals 2

    .line 90
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mRenderEventQueue:Ljava/util/ArrayList;

    monitor-enter v0

    .line 91
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mRenderEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 92
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public declared-synchronized release()V
    .locals 2
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    monitor-enter p0

    .line 40
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->TAG:Ljava/lang/String;

    const-string v1, "release()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->destroy()V

    const-wide/16 v0, 0x0

    .line 42
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/FaceBlender;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public synchronized native reset()Z
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public synchronized native resetView()Z
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public synchronized native setMeshSlider(F)V
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public synchronized native setTextureSlider(F)V
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public synchronized native touchDrag(FF)Z
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method

.method public synchronized native transform(FFFFFFF)Z
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation
.end method
