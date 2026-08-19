.class public Lcom/sonymobile/scan3d/NativeGLTextureView;
.super Landroid/view/TextureView;
.source "NativeGLTextureView.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;
    }
.end annotation


# static fields
.field private static final LOG_ATTACH_DETACH:Z = true

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.NativeGLTextureView"


# instance fields
.field private mCharon:Ljava/lang/Runnable;

.field private mDetached:Z

.field private mGLThread:Lcom/sonymobile/scan3d/GLThread;

.field private final mLock:Ljava/lang/Object;

.field private mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 67
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 226
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mLock:Ljava/lang/Object;

    .line 68
    invoke-direct {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 76
    invoke-direct {p0, p1, p2}, Landroid/view/TextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 226
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mLock:Ljava/lang/Object;

    .line 77
    invoke-direct {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->init()V

    return-void
.end method

.method private init()V
    .locals 0

    .line 83
    invoke-virtual {p0, p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    return-void
.end method

.method public static synthetic lambda$stopEncoder$0(Lcom/sonymobile/scan3d/NativeGLTextureView;)V
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->stopEncoder()V

    return-void
.end method


# virtual methods
.method public getGLThread()Lcom/sonymobile/scan3d/GLThread;
    .locals 1

    .line 112
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 3

    .line 170
    invoke-super {p0}, Landroid/view/TextureView;->onAttachedToWindow()V

    .line 171
    sget-object v0, Lcom/sonymobile/scan3d/NativeGLTextureView;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAttachedToWindow reattach ="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mDetached:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mDetached:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    if-eqz v0, :cond_0

    .line 173
    new-instance v1, Lcom/sonymobile/scan3d/GLThread;

    iget-object v2, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mLock:Ljava/lang/Object;

    invoke-direct {v1, v2, v0}, Lcom/sonymobile/scan3d/GLThread;-><init>(Ljava/lang/Object;Lcom/sonymobile/scan3d/GLThread$Renderer;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->start()V

    :cond_0
    const/4 v0, 0x0

    .line 176
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mDetached:Z

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 2

    .line 181
    sget-object v0, Lcom/sonymobile/scan3d/NativeGLTextureView;->TAG:Ljava/lang/String;

    const-string v1, "onDetachedFromWindow"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestExitAndWait()V

    :cond_0
    const/4 v0, 0x1

    .line 185
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mDetached:Z

    .line 186
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mCharon:Ljava/lang/Runnable;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 187
    :cond_1
    invoke-super {p0}, Landroid/view/TextureView;->onDetachedFromWindow()V

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->onResume()V

    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 1

    .line 192
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-eqz v0, :cond_0

    .line 193
    invoke-virtual {v0, p1, p2, p3}, Lcom/sonymobile/scan3d/GLThread;->surfaceCreated(Landroid/graphics/SurfaceTexture;II)V

    :cond_0
    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    .line 204
    iget-object p1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->surfaceDestroyed()V

    const/4 p1, 0x1

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    .line 199
    iget-object p1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1, p2, p3}, Lcom/sonymobile/scan3d/GLThread;->onWindowResize(II)V

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public requestRender()V
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    return-void
.end method

.method public setRenderer(Lcom/sonymobile/scan3d/GLThread$Renderer;Ljava/lang/Runnable;)V
    .locals 1
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 97
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-nez v0, :cond_0

    .line 100
    iput-object p1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/GLThread$Renderer;

    .line 101
    iput-object p2, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mCharon:Ljava/lang/Runnable;

    .line 102
    new-instance p2, Lcom/sonymobile/scan3d/GLThread;

    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mLock:Ljava/lang/Object;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/GLThread;-><init>(Ljava/lang/Object;Lcom/sonymobile/scan3d/GLThread$Renderer;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    .line 103
    iget-object p1, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->start()V

    return-void

    .line 98
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "setRenderer has already been called for this instance."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;J)V
    .locals 10

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    .line 213
    invoke-virtual/range {v0 .. v9}, Lcom/sonymobile/scan3d/NativeGLTextureView;->startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;JIIIIZ)V

    return-void
.end method

.method public startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;JIIIIZ)V
    .locals 11

    move-object v0, p0

    .line 218
    iget-object v1, v0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    move-object v2, p1

    move-object v3, p2

    move-wide v4, p3

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    invoke-virtual/range {v1 .. v10}, Lcom/sonymobile/scan3d/GLThread;->startEncoder(Ljava/io/File;Lcom/sonymobile/scan3d/TextureMovieEncoder2$EncoderListener;JIIIIZ)V

    return-void
.end method

.method public stop()V
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestExitAndWait()V

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mCharon:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method public stopEncoder()V
    .locals 2

    .line 223
    iget-object v0, p0, Lcom/sonymobile/scan3d/NativeGLTextureView;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$NativeGLTextureView$cEIrHBBmYtyLp-n2wkDKcAR2jO8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/-$$Lambda$NativeGLTextureView$cEIrHBBmYtyLp-n2wkDKcAR2jO8;-><init>(Lcom/sonymobile/scan3d/NativeGLTextureView;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method
