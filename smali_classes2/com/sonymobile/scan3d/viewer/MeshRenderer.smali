.class public Lcom/sonymobile/scan3d/viewer/MeshRenderer;
.super Ljava/lang/Object;
.source "MeshRenderer.java"

# interfaces
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;
.implements Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;,
        Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field private static final TAG:Ljava/lang/String; = "MeshRenderer"


# instance fields
.field private mNativeHandle:J

.field private mOnDrawFrameListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;

.field private mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

.field private mTimeStamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 33
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->classInit()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mNativeHandle:J

    return-void
.end method

.method private native addMesh(JII)V
.end method

.method private static native classInit()V
.end method

.method private native create()J
.end method

.method private native destroy()V
.end method

.method private native enableOnFlingListener(Z)V
.end method

.method private declared-synchronized onStopFling()V
    .locals 1

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;->onStopFling()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 184
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private native onSurfaceChangedImpl(II)V
.end method

.method private native onSurfaceCreatedImpl()V
.end method

.method private native onSurfaceDestroyedImpl()V
.end method

.method private native removeNativeMeshes()V
.end method

.method private native renderImpl()Z
.end method

.method private synchronized native setScenography(I)V
.end method


# virtual methods
.method public addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V
    .locals 2

    .line 62
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/MeshVariant;->ordinal()I

    move-result p1

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/MeshType;->ordinal()I

    move-result p2

    invoke-direct {p0, v0, v1, p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(JII)V

    return-void
.end method

.method public synchronized native adjustViewToMesh(FZ)V
.end method

.method public declared-synchronized getNativeHandle()J
    .locals 2

    monitor-enter p0

    .line 51
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public synchronized native getSeekDefault()F
.end method

.method public synchronized native getViewM()[F
.end method

.method public synchronized native onDoubleTap()Z
.end method

.method public synchronized native onDown()Z
.end method

.method public declared-synchronized onDrawFrame(F)Z
    .locals 8

    monitor-enter p0

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    .line 146
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_0
    const/high16 v0, 0x447a0000    # 1000.0f

    mul-float/2addr p1, v0

    float-to-long v0, p1

    .line 147
    :goto_0
    iget-wide v2, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mTimeStamp:J

    sub-long v2, v0, v2

    .line 148
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnDrawFrameListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;

    if-eqz p1, :cond_2

    .line 149
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnDrawFrameListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;

    iget-wide v4, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mTimeStamp:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-nez v4, :cond_1

    move-wide v2, v6

    :cond_1
    invoke-interface {p1, v2, v3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;->onDrawFrameDelta(J)V

    .line 151
    :cond_2
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mTimeStamp:J

    .line 153
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->renderImpl()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method public synchronized native onFling(FF)Z
.end method

.method public synchronized native onMoveSingleTap(FF)Z
.end method

.method public synchronized native onSeek(F)Z
.end method

.method public synchronized native onSingleTap()Z
.end method

.method public declared-synchronized onSurfaceChanged(II)V
    .locals 0

    monitor-enter p0

    .line 139
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSurfaceChangedImpl(II)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 140
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onSurfaceCreated()V
    .locals 1

    monitor-enter p0

    .line 123
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSurfaceCreatedImpl()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 124
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onSurfaceDestroyed()V
    .locals 1

    monitor-enter p0

    .line 131
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSurfaceDestroyedImpl()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 132
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public synchronized native onTransform(FFFFFFF)Z
.end method

.method public declared-synchronized release()V
    .locals 2

    monitor-enter p0

    .line 44
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeMeshes()V

    .line 45
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->destroy()V

    const-wide/16 v0, 0x0

    .line 46
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeMeshes()V
    .locals 1

    monitor-enter p0

    .line 54
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeNativeMeshes()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public synchronized native reset()V
.end method

.method public synchronized native resetInitView()V
.end method

.method public declared-synchronized rotate(FFF)V
    .locals 8

    monitor-enter p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    move-object v0, p0

    move v4, p1

    move v5, p2

    move v6, p3

    .line 78
    :try_start_0
    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onTransform(FFFFFFF)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 79
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public synchronized native set180Mode(Z)V
.end method

.method public synchronized native setEditMode(Z)V
.end method

.method public synchronized native setIgnoreApectRatioScaling(Z)V
.end method

.method public declared-synchronized setOnDrawFrameListener(Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;)V
    .locals 0

    monitor-enter p0

    .line 111
    :try_start_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnDrawFrameListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnDrawFrameListener;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setOnFlingStopListener(Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;)V
    .locals 0

    monitor-enter p0

    .line 106
    :try_start_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

    .line 107
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->mOnFlingStopListener:Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->enableOnFlingListener(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setScenography(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    monitor-enter p0

    .line 66
    :try_start_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/ScenoID;->ordinal()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->setScenography(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public synchronized native setViewM([FI)V
.end method

.method public synchronized native stopFling()V
.end method

.method public synchronized native translateView(FFF)V
.end method
