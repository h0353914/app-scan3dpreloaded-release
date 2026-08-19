.class public Lcom/sonymobile/scan3d/viewer/SphanRenderer;
.super Lcom/sonymobile/scan3d/Sphan;
.source "SphanRenderer.java"

# interfaces
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;
.implements Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;
    }
.end annotation


# instance fields
.field private mGLInitialized:Z

.field private mHasOpenGLContext:Z

.field private mIsLoaded:Z

.field private mLastRender:J

.field private mListener:Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;

.field private mSimpleLifeCycle:Lcom/sonymobile/scan3d/SimpleLifecycle;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 29
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Sphan;-><init>(Landroid/content/Context;)V

    const-wide/16 v0, 0x0

    .line 17
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mLastRender:J

    const/4 p1, 0x0

    .line 19
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mIsLoaded:Z

    .line 20
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mHasOpenGLContext:Z

    .line 21
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mGLInitialized:Z

    .line 22
    new-instance p1, Lcom/sonymobile/scan3d/SimpleLifecycle;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/SimpleLifecycle;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mSimpleLifeCycle:Lcom/sonymobile/scan3d/SimpleLifecycle;

    return-void
.end method


# virtual methods
.method public getLifecycle()Lcom/sonymobile/scan3d/SimpleLifecycle;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mSimpleLifeCycle:Lcom/sonymobile/scan3d/SimpleLifecycle;

    return-object v0
.end method

.method public load(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 34
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/Sphan;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mIsLoaded:Z

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onDrawFrame()Z
    .locals 1

    const/high16 v0, -0x40800000    # -1.0f

    .line 75
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onDrawFrame(F)Z

    move-result v0

    return v0
.end method

.method public onDrawFrame(F)Z
    .locals 7

    .line 57
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mIsLoaded:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 58
    :cond_0
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mHasOpenGLContext:Z

    if-nez v0, :cond_1

    return v1

    .line 59
    :cond_1
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mGLInitialized:Z

    if-nez v0, :cond_2

    .line 60
    invoke-super {p0}, Lcom/sonymobile/scan3d/Sphan;->onGLContextCreated()V

    const/4 v0, 0x1

    .line 61
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mGLInitialized:Z

    :cond_2
    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_3

    .line 64
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    goto :goto_0

    :cond_3
    const/high16 v0, 0x447a0000    # 1000.0f

    mul-float/2addr v0, p1

    float-to-long v0, v0

    .line 65
    :goto_0
    iget-wide v2, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mLastRender:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-nez v6, :cond_4

    goto :goto_1

    :cond_4
    sub-long v4, v0, v2

    .line 66
    :goto_1
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mLastRender:J

    .line 68
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/Sphan;->render(F)Z

    move-result p1

    .line 69
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mListener:Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;

    if-eqz v0, :cond_5

    invoke-interface {v0, v4, v5}, Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;->onDrawFrameDelta(J)V

    :cond_5
    return p1
.end method

.method public onSurfaceChanged(II)V
    .locals 0

    .line 52
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->surfaceChanged(II)V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 2

    .line 43
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mIsLoaded:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 44
    invoke-super {p0}, Lcom/sonymobile/scan3d/Sphan;->onGLContextCreated()V

    .line 45
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mGLInitialized:Z

    .line 47
    :cond_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mHasOpenGLContext:Z

    return-void
.end method

.method public onSurfaceDestroyed()V
    .locals 2

    .line 80
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mGLInitialized:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 81
    invoke-super {p0}, Lcom/sonymobile/scan3d/Sphan;->onGLContextDestroyed()V

    .line 82
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mGLInitialized:Z

    .line 84
    :cond_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mHasOpenGLContext:Z

    return-void
.end method

.method public setOnDrawFrameListener(Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;)V
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->mListener:Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;

    return-void
.end method
