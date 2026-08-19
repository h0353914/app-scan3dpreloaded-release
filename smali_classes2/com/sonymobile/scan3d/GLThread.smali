.class public Lcom/sonymobile/scan3d/GLThread;
.super Ljava/lang/Thread;
.source "GLThread.java"

# interfaces
.implements Landroid/view/Choreographer$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/GLThread$Renderer;
    }
.end annotation


# static fields
.field private static final FRAME_SKIP:I = 0x1

.field private static final FULL_HD_HEIGHT:I = 0x438

.field private static final FULL_HD_WIDTH:I = 0x780

.field private static final LOG_PAUSE_RESUME:Z = true

.field private static final LOG_RENDERER:Z = true

.field private static final LOG_RENDERER_DRAW_FRAME:Z = true

.field private static final LOG_SURFACE:Z = true

.field private static final LOG_THREADS:Z = true

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.GLThread"


# instance fields
.field private mChoreographer:Landroid/view/Choreographer;

.field private mChoreographerRunning:Z

.field private mDstHeight:I

.field private mDstWidth:I

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mFrameCounter:J

.field private mFrameTimeNanos:J

.field private mHandle:J

.field private mHeight:I

.field private mInputHandle:J

.field private final mLock:Ljava/lang/Object;

.field private mPaused:Z

.field private final mRecordingLock:Ljava/lang/Object;

.field private mRecordingOngoing:Z

.field private mRefreshPeriodNanos:J

.field private mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mSizeChanged:Z

.field private mSrcRect:Landroid/graphics/Rect;

.field private mSurface:Landroid/view/Surface;

.field private mVSync:Z

.field private mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

.field private mVirtualTimeNanos:J

.field private mWaitingForSurface:Z

.field private mWantRenderNotification:Z

.field private mWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Lcom/sonymobile/scan3d/GLThread$Renderer;)V
    .locals 3

    .line 127
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    const/4 v0, 0x1

    .line 584
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mWaitingForSurface:Z

    .line 589
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 590
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mSizeChanged:Z

    .line 595
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mVSync:Z

    const-wide/16 v1, 0x0

    .line 596
    iput-wide v1, p0, Lcom/sonymobile/scan3d/GLThread;->mFrameCounter:J

    .line 598
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mRecordingLock:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 128
    iput v1, p0, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    .line 129
    iput v1, p0, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    .line 130
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    .line 131
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mWantRenderNotification:Z

    .line 132
    iput-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    .line 133
    iput-object p2, p0, Lcom/sonymobile/scan3d/GLThread;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    .line 134
    invoke-static {}, Landroid/view/Choreographer;->getInstance()Landroid/view/Choreographer;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mChoreographer:Landroid/view/Choreographer;

    return-void
.end method

.method private static checkGlError()V
    .locals 3

    .line 560
    invoke-static {}, Landroid/opengl/GLES20;->glGetError()I

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 562
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "before glBlitFramebuffer: glError 0x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 563
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 564
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private destroyContext()V
    .locals 4

    .line 353
    iget-wide v0, p0, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 354
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/GLThread$Renderer;->onSurfaceDestroyed()V

    .line 355
    iget-wide v0, p0, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    .line 356
    iput-wide v2, p0, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    .line 357
    iput-wide v2, p0, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    :cond_0
    return-void
.end method

.method private guardedRun()V
    .locals 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    move-object/from16 v1, p0

    const/4 v2, 0x1

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    move v6, v5

    move v7, v6

    move v8, v7

    move v9, v8

    const/4 v10, 0x0

    .line 184
    :goto_0
    :try_start_0
    iget-object v11, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_3

    .line 186
    :goto_1
    :try_start_1
    iget-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mShouldExit:Z

    if-eqz v12, :cond_0

    .line 187
    monitor-exit v11
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 344
    iget-object v3, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 345
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->destroyContext()V

    .line 346
    iput-boolean v2, v1, Lcom/sonymobile/scan3d/GLThread;->mExited:Z

    .line 347
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 348
    monitor-exit v3

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    .line 190
    :cond_0
    :try_start_3
    iget-object v12, v1, Lcom/sonymobile/scan3d/GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_1

    .line 191
    iget-object v10, v1, Lcom/sonymobile/scan3d/GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Runnable;

    goto/16 :goto_3

    .line 196
    :cond_1
    iget-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mPaused:Z

    iget-boolean v15, v1, Lcom/sonymobile/scan3d/GLThread;->mRequestPaused:Z

    if-eq v12, v15, :cond_2

    .line 197
    iget-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mRequestPaused:Z

    iput-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mPaused:Z

    .line 198
    iget-object v12, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v12}, Ljava/lang/Object;->notifyAll()V

    .line 200
    sget-object v12, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "mPaused is now "

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v0, v1, Lcom/sonymobile/scan3d/GLThread;->mPaused:Z

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v0, " tid="

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v13

    invoke-virtual {v15, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v12, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 205
    :cond_2
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    if-nez v0, :cond_3

    iget-boolean v0, v1, Lcom/sonymobile/scan3d/GLThread;->mWaitingForSurface:Z

    if-nez v0, :cond_3

    .line 207
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "noticed surface lost tid="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v13

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v0, v12}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 212
    iput-boolean v2, v1, Lcom/sonymobile/scan3d/GLThread;->mWaitingForSurface:Z

    .line 213
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 217
    :cond_3
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_5

    iget-boolean v0, v1, Lcom/sonymobile/scan3d/GLThread;->mWaitingForSurface:Z

    if-eqz v0, :cond_5

    .line 219
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "noticed surface acquired tid="

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v12

    invoke-virtual {v4, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 221
    iput-boolean v3, v1, Lcom/sonymobile/scan3d/GLThread;->mWaitingForSurface:Z

    .line 223
    invoke-direct/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->destroyContext()V

    .line 225
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/NativeEGL;->createContext(Landroid/view/Surface;Z)J

    move-result-wide v12

    iput-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    .line 226
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    const-wide/16 v14, 0x0

    cmp-long v0, v12, v14

    if-eqz v0, :cond_4

    move v0, v2

    goto :goto_2

    :cond_4
    move v0, v3

    .line 227
    :goto_2
    iget-object v4, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    move v4, v0

    :cond_5
    if-eqz v7, :cond_6

    .line 232
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "sending render notification tid="

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v12

    invoke-virtual {v7, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v0, v7}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    iput-boolean v3, v1, Lcom/sonymobile/scan3d/GLThread;->mWantRenderNotification:Z

    .line 236
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    move v7, v3

    .line 240
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->readyToDraw()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 241
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    const-wide/16 v14, 0x0

    cmp-long v0, v12, v14

    if-eqz v0, :cond_13

    .line 242
    iget-boolean v0, v1, Lcom/sonymobile/scan3d/GLThread;->mSizeChanged:Z

    if-eqz v0, :cond_7

    .line 244
    iget v8, v1, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    .line 245
    iget v9, v1, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    .line 246
    iput-boolean v2, v1, Lcom/sonymobile/scan3d/GLThread;->mWantRenderNotification:Z

    .line 248
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "noticing that we want render notification tid="

    invoke-virtual {v5, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v12

    invoke-virtual {v5, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 248
    invoke-static {v0, v5}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iput-boolean v3, v1, Lcom/sonymobile/scan3d/GLThread;->mSizeChanged:Z

    move v5, v2

    .line 254
    :cond_7
    iput-boolean v3, v1, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    .line 255
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 256
    iget-boolean v0, v1, Lcom/sonymobile/scan3d/GLThread;->mWantRenderNotification:Z

    if-eqz v0, :cond_8

    move v6, v2

    .line 259
    :cond_8
    iput-boolean v3, v1, Lcom/sonymobile/scan3d/GLThread;->mVSync:Z

    .line 277
    :goto_3
    monitor-exit v11
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v10, :cond_9

    .line 280
    :try_start_4
    invoke-interface {v10}, Ljava/lang/Runnable;->run()V

    const/4 v10, 0x0

    goto/16 :goto_0

    :cond_9
    if-eqz v4, :cond_a

    .line 286
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    const-string v4, "onSurfaceCreated()"

    invoke-static {v0, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 287
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/GLThread$Renderer;->onSurfaceCreated()V

    move v4, v3

    :cond_a
    if-eqz v5, :cond_b

    .line 292
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "onSurfaceChanged("

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ", "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, ")"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Lcom/sonymobile/scan3d/logging/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    invoke-interface {v0, v8, v9}, Lcom/sonymobile/scan3d/GLThread$Renderer;->onSurfaceChanged(II)V

    move v5, v3

    .line 297
    :cond_b
    iget-wide v11, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    const-wide/16 v13, 0x0

    cmp-long v0, v11, v13

    if-eqz v0, :cond_11

    .line 299
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "onDrawFrameDelta tid="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v12

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v12, " timeNanos="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mVirtualTimeNanos:J

    invoke-virtual {v11, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v0, v11}, Lcom/sonymobile/scan3d/logging/DebugLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 300
    iget-wide v11, v1, Lcom/sonymobile/scan3d/GLThread;->mRefreshPeriodNanos:J

    const-wide/16 v13, 0x0

    cmp-long v0, v11, v13

    if-gez v0, :cond_c

    .line 301
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    iget-wide v11, v1, Lcom/sonymobile/scan3d/GLThread;->mVirtualTimeNanos:J

    long-to-float v11, v11

    const v12, 0x3089705f    # 1.0E-9f

    mul-float/2addr v11, v12

    invoke-interface {v0, v11}, Lcom/sonymobile/scan3d/GLThread$Renderer;->onDrawFrame(F)Z

    move-result v0

    if-eqz v0, :cond_d

    .line 302
    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    goto :goto_4

    .line 305
    :cond_c
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/GLThread$Renderer;->onDrawFrame()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 308
    :cond_d
    :goto_4
    iget-object v11, v1, Lcom/sonymobile/scan3d/GLThread;->mRecordingLock:Ljava/lang/Object;

    monitor-enter v11
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 309
    :try_start_5
    iget-boolean v0, v1, Lcom/sonymobile/scan3d/GLThread;->mRecordingOngoing:Z

    if-eqz v0, :cond_10

    .line 310
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->frameAvailableSoon()V

    .line 311
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    iget-wide v14, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    invoke-static {v12, v13, v14, v15}, Lcom/sonymobile/scan3d/NativeEGL;->makeCurrent(JJ)V

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v12, 0x0

    .line 312
    invoke-static {v12, v12, v12, v0}, Landroid/opengl/GLES20;->glClearColor(FFFF)V

    const/16 v0, 0x4000

    .line 313
    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    .line 314
    invoke-static {}, Lcom/sonymobile/scan3d/GLThread;->checkGlError()V

    .line 315
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mSrcRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v12, v1, Lcom/sonymobile/scan3d/GLThread;->mSrcRect:Landroid/graphics/Rect;

    iget v12, v12, Landroid/graphics/Rect;->top:I

    iget-object v13, v1, Lcom/sonymobile/scan3d/GLThread;->mSrcRect:Landroid/graphics/Rect;

    iget v13, v13, Landroid/graphics/Rect;->right:I

    iget-object v14, v1, Lcom/sonymobile/scan3d/GLThread;->mSrcRect:Landroid/graphics/Rect;

    iget v14, v14, Landroid/graphics/Rect;->bottom:I

    const/16 v20, 0x0

    const/16 v21, 0x0

    iget v15, v1, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    iget v3, v1, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    const/16 v24, 0x4000

    const/16 v25, 0x2600

    move/from16 v16, v0

    move/from16 v17, v12

    move/from16 v18, v13

    move/from16 v19, v14

    move/from16 v22, v15

    move/from16 v23, v3

    invoke-static/range {v16 .. v25}, Landroid/opengl/GLES30;->glBlitFramebuffer(IIIIIIIIII)V

    .line 319
    invoke-static {}, Landroid/opengl/GLES30;->glGetError()I

    move-result v0

    if-eqz v0, :cond_e

    .line 321
    sget-object v3, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "ERROR: glBlitFramebuffer failed: 0x"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 321
    invoke-static {v3, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    :cond_e
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mRefreshPeriodNanos:J

    const-wide/16 v14, 0x0

    cmp-long v0, v12, v14

    if-gez v0, :cond_f

    .line 325
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    iget-wide v14, v1, Lcom/sonymobile/scan3d/GLThread;->mVirtualTimeNanos:J

    invoke-static {v12, v13, v14, v15}, Lcom/sonymobile/scan3d/NativeEGL;->setPresentationTime(JJ)V

    .line 326
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mVirtualTimeNanos:J

    iget-wide v14, v1, Lcom/sonymobile/scan3d/GLThread;->mRefreshPeriodNanos:J

    neg-long v14, v14

    add-long/2addr v12, v14

    iput-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mVirtualTimeNanos:J

    goto :goto_5

    .line 328
    :cond_f
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    iget-wide v14, v1, Lcom/sonymobile/scan3d/GLThread;->mFrameTimeNanos:J

    invoke-static {v12, v13, v14, v15}, Lcom/sonymobile/scan3d/NativeEGL;->setPresentationTime(JJ)V

    .line 330
    :goto_5
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    invoke-static {v12, v13}, Lcom/sonymobile/scan3d/NativeEGL;->swap(J)V

    .line 333
    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    invoke-static {v12, v13}, Lcom/sonymobile/scan3d/NativeEGL;->makeCurrent(J)V

    .line 335
    :cond_10
    monitor-exit v11
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 336
    :try_start_6
    iget-wide v11, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    invoke-static {v11, v12}, Lcom/sonymobile/scan3d/NativeEGL;->swap(J)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    goto :goto_6

    :catchall_1
    move-exception v0

    .line 335
    :try_start_7
    monitor-exit v11
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :cond_11
    :goto_6
    if-eqz v6, :cond_12

    move v7, v2

    const/4 v3, 0x0

    const/4 v6, 0x0

    goto/16 :goto_0

    :cond_12
    const/4 v3, 0x0

    goto/16 :goto_0

    .line 266
    :cond_13
    :try_start_9
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "waiting tid="

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v12

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v12, " mHandle: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v12, v1, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    invoke-virtual {v3, v12, v13}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v12, " mPaused: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mPaused:Z

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v12, " mSurface: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v12, v1, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, " mWaitingForSurface: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mWaitingForSurface:Z

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v12, " mWidth: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v1, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " mHeight: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v12, v1, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v12, " mRequestRender: "

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v12, v1, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    iget-object v0, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->wait()V

    const/4 v3, 0x0

    goto/16 :goto_1

    :catchall_2
    move-exception v0

    .line 277
    monitor-exit v11
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    :catchall_3
    move-exception v0

    .line 344
    iget-object v3, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v3

    .line 345
    :try_start_b
    invoke-direct/range {p0 .. p0}, Lcom/sonymobile/scan3d/GLThread;->destroyContext()V

    .line 346
    iput-boolean v2, v1, Lcom/sonymobile/scan3d/GLThread;->mExited:Z

    .line 347
    iget-object v2, v1, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 348
    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 349
    throw v0

    :catchall_4
    move-exception v0

    .line 348
    :try_start_c
    monitor-exit v3
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    throw v0
.end method

.method private readyToDraw()Z
    .locals 1

    .line 362
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mPaused:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    if-lez v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/GLThread;->mVSync:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public doFrame(J)V
    .locals 7

    .line 139
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 140
    :try_start_0
    iget-wide v1, p0, Lcom/sonymobile/scan3d/GLThread;->mFrameCounter:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    const-wide/16 v2, 0x1

    const/4 v4, 0x1

    if-gtz v1, :cond_0

    .line 141
    iput-boolean v4, p0, Lcom/sonymobile/scan3d/GLThread;->mVSync:Z

    .line 142
    iput-wide v2, p0, Lcom/sonymobile/scan3d/GLThread;->mFrameCounter:J

    goto :goto_0

    .line 144
    :cond_0
    iget-wide v5, p0, Lcom/sonymobile/scan3d/GLThread;->mFrameCounter:J

    sub-long/2addr v5, v2

    iput-wide v5, p0, Lcom/sonymobile/scan3d/GLThread;->mFrameCounter:J

    .line 146
    :goto_0
    iput-wide p1, p0, Lcom/sonymobile/scan3d/GLThread;->mFrameTimeNanos:J

    const/4 p1, 0x0

    .line 147
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/GLThread;->mChoreographerRunning:Z

    .line 148
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/GLThread;->mPaused:Z

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    if-lez p1, :cond_1

    iget p1, p0, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    if-lez p1, :cond_1

    iget-boolean p1, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    if-eqz p1, :cond_1

    .line 151
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mChoreographer:Landroid/view/Choreographer;

    invoke-virtual {p1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 152
    iput-boolean v4, p0, Lcom/sonymobile/scan3d/GLThread;->mChoreographerRunning:Z

    .line 153
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 155
    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public onPause()V
    .locals 5

    .line 404
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 405
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPause tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 406
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestPaused:Z

    .line 407
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 408
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onResume()V
    .locals 5

    .line 412
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 413
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onResume tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 414
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestPaused:Z

    .line 415
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 416
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onWindowResize(II)V
    .locals 1

    .line 420
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 421
    :try_start_0
    iput p1, p0, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    .line 422
    iput p2, p0, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    const/4 p1, 0x1

    .line 423
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/GLThread;->mSizeChanged:Z

    .line 424
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    .line 425
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/GLThread;->mVSync:Z

    .line 432
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    if-ne p1, p0, :cond_0

    .line 433
    monitor-exit v0

    return-void

    .line 436
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 437
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 465
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 466
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 467
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 468
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    .line 463
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "r must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public requestExitAndWait()V
    .locals 5

    .line 443
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 444
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "requestExitAndWait tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x1

    .line 445
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mShouldExit:Z

    .line 446
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 447
    :goto_0
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 449
    :try_start_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 451
    :catch_0
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 454
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1
.end method

.method public requestRender()V
    .locals 2

    .line 368
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 369
    :try_start_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mRequestRender:Z

    .line 370
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mChoreographerRunning:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mChoreographer:Landroid/view/Choreographer;

    invoke-virtual {v1, p0}, Landroid/view/Choreographer;->postFrameCallback(Landroid/view/Choreographer$FrameCallback;)V

    .line 371
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 372
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public run()V
    .locals 5

    .line 160
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "GLThread "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/GLThread;->setName(Ljava/lang/String;)V

    .line 161
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "starting tid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 168
    :catch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 169
    :try_start_1
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "finished tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " queued_events="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/sonymobile/scan3d/GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;JIIIIZ)V
    .locals 2

    .line 487
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    const-string v1, "startEncoder()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 488
    iput-wide p3, p0, Lcom/sonymobile/scan3d/GLThread;->mRefreshPeriodNanos:J

    const-wide/16 p3, 0x0

    .line 489
    iput-wide p3, p0, Lcom/sonymobile/scan3d/GLThread;->mVirtualTimeNanos:J

    const/4 p3, 0x1

    if-nez p5, :cond_0

    if-nez p6, :cond_0

    if-nez p7, :cond_0

    if-nez p8, :cond_0

    .line 492
    iget-wide p7, p0, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    const/16 p4, 0x3057

    invoke-static {p7, p8, p4}, Lcom/sonymobile/scan3d/NativeEGL;->querySurface(JI)I

    move-result p4

    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    .line 493
    iget-wide p7, p0, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    const/16 p4, 0x3056

    invoke-static {p7, p8, p4}, Lcom/sonymobile/scan3d/NativeEGL;->querySurface(JI)I

    move-result p4

    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    .line 494
    iget p7, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    .line 495
    iget p8, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    goto :goto_0

    :cond_0
    sub-int p4, p7, p5

    add-int/2addr p4, p3

    .line 497
    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    sub-int p4, p8, p6

    add-int/2addr p4, p3

    .line 498
    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    .line 502
    :goto_0
    new-instance p4, Landroid/graphics/Rect;

    iget v0, p0, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    sub-int p8, v0, p8

    sub-int/2addr v0, p6

    invoke-direct {p4, p5, p8, p7, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object p4, p0, Lcom/sonymobile/scan3d/GLThread;->mSrcRect:Landroid/graphics/Rect;

    .line 505
    iget p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    iget p5, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    const/4 p6, 0x0

    if-lt p4, p5, :cond_1

    move p4, p3

    goto :goto_1

    :cond_1
    move p4, p6

    :goto_1
    const/16 p5, 0x780

    const/16 p7, 0x438

    if-eqz p4, :cond_2

    move p8, p5

    goto :goto_2

    :cond_2
    move p8, p7

    :goto_2
    if-eqz p4, :cond_3

    move p5, p7

    .line 508
    :cond_3
    iget p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    if-gt p4, p8, :cond_4

    iget p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    if-le p4, p5, :cond_6

    :cond_4
    int-to-float p4, p8

    .line 509
    iget p7, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    int-to-float p7, p7

    div-float/2addr p4, p7

    .line 510
    iget p7, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    int-to-float p7, p7

    mul-float/2addr p7, p4

    int-to-float p5, p5

    cmpl-float p8, p7, p5

    if-lez p8, :cond_5

    div-float/2addr p5, p7

    mul-float/2addr p4, p5

    .line 514
    :cond_5
    iget p5, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    int-to-float p5, p5

    mul-float/2addr p5, p4

    float-to-int p5, p5

    iput p5, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    .line 515
    iget p5, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    int-to-float p5, p5

    mul-float/2addr p5, p4

    float-to-int p4, p5

    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    .line 519
    :cond_6
    iget p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    and-int/lit8 p4, p4, -0x2

    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    .line 520
    iget p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    and-int/lit8 p4, p4, -0x2

    iput p4, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    .line 524
    :try_start_0
    new-instance p4, Lcom/sonymobile/scan3d/recording/VideoRecorder;

    iget p5, p0, Lcom/sonymobile/scan3d/GLThread;->mDstWidth:I

    iget p7, p0, Lcom/sonymobile/scan3d/GLThread;->mDstHeight:I

    invoke-direct {p4, p5, p7, p1, p9}, Lcom/sonymobile/scan3d/recording/VideoRecorder;-><init>(IILjava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 529
    invoke-virtual {p4}, Lcom/sonymobile/scan3d/recording/VideoRecorder;->getOutputSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-static {p1, p6}, Lcom/sonymobile/scan3d/NativeEGL;->createContext(Landroid/view/Surface;Z)J

    move-result-wide p5

    iput-wide p5, p0, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    .line 530
    new-instance p1, Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    invoke-direct {p1, p4, p2}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;-><init>(Lcom/sonymobile/scan3d/recording/VideoRecorder;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    .line 531
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->startEncoder()V

    .line 532
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/GLThread;->mRecordingOngoing:Z

    return-void

    :catch_0
    move-exception p1

    .line 526
    sget-object p2, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    const-string p3, "IOException when creating Video Encoder."

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 527
    new-instance p2, Ljava/lang/RuntimeException;

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public stopEncoder()V
    .locals 5

    .line 539
    sget-object v0, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    const-string v1, "stopEncoder()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 540
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mRecordingLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    .line 541
    :try_start_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/GLThread;->mRecordingOngoing:Z

    .line 542
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    if-eqz v1, :cond_0

    .line 543
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/TextureMovieEncoder2;->stopRecording()V

    const/4 v1, 0x0

    .line 544
    iput-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mVideoEncoder:Lcom/sonymobile/scan3d/TextureMovieEncoder2;

    .line 546
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 548
    iget-wide v0, p0, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    .line 549
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/NativeEGL;->destroyContext(J)V

    .line 550
    iput-wide v2, p0, Lcom/sonymobile/scan3d/GLThread;->mInputHandle:J

    .line 552
    iget-wide v0, p0, Lcom/sonymobile/scan3d/GLThread;->mHandle:J

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/NativeEGL;->makeCurrent(J)V

    :cond_1
    return-void

    :catchall_0
    move-exception v1

    .line 546
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public surfaceCreated(Landroid/graphics/SurfaceTexture;II)V
    .locals 3

    .line 376
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 377
    :try_start_0
    iput p2, p0, Lcom/sonymobile/scan3d/GLThread;->mWidth:I

    .line 378
    iput p3, p0, Lcom/sonymobile/scan3d/GLThread;->mHeight:I

    const/4 p2, 0x1

    .line 379
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/GLThread;->mSizeChanged:Z

    .line 381
    sget-object p2, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "surfaceCreated tid="

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v1

    invoke-virtual {p3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    new-instance p2, Landroid/view/Surface;

    invoke-direct {p2, p1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    .line 383
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 384
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public surfaceCreated(Landroid/view/Surface;)V
    .locals 5

    .line 388
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 389
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "surfaceCreated tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 390
    iput-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    .line 391
    iget-object p1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 392
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public surfaceDestroyed()V
    .locals 5

    .line 396
    iget-object v0, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    monitor-enter v0

    .line 397
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/GLThread;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "surfaceDestroyed tid="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/GLThread;->getId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 398
    iput-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mSurface:Landroid/view/Surface;

    .line 399
    iget-object v1, p0, Lcom/sonymobile/scan3d/GLThread;->mLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 400
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
