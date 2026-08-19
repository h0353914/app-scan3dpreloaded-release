.class public Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;
.super Lcom/sonymobile/scan3d/NativeGLTextureView;
.source "SphanGLTextureView.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;
.implements Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;,
        Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;
    }
.end annotation


# static fields
.field private static final VELOCITY_MIN:F = 1500.0f


# instance fields
.field private mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

.field private mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

.field private mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

.field private mSurfaceListeners:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;",
            ">;"
        }
    .end annotation
.end field

.field private mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

.field private mWasAnimating:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 110
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;-><init>(Landroid/content/Context;)V

    .line 54
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    .line 111
    new-instance v0, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-direct {v0, p1, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 115
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/NativeGLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 54
    new-instance p2, Ljava/util/Vector;

    invoke-direct {p2}, Ljava/util/Vector;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    .line 116
    new-instance p2, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-direct {p2, p1, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    return-void
.end method

.method public static synthetic lambda$animationStopped$0(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;I)V
    .locals 1

    .line 333
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

    if-eqz v0, :cond_0

    .line 334
    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;->onAnimationStopped(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public addSurfaceListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;)V
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public animationStopped(I)V
    .locals 2

    .line 332
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$SphanGLTextureView$O8FrNytpIviAmLWCGSZ8GoQiess;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$SphanGLTextureView$O8FrNytpIviAmLWCGSZ8GoQiess;-><init>(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;I)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public hasAnimationListener()Z
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final onDoubleTap()Z
    .locals 1

    .line 290
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 291
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    const/4 v0, 0x1

    return v0
.end method

.method public onDown()Z
    .locals 1

    .line 317
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onDown()Z

    move-result v0

    return v0
.end method

.method public onDrawFrame(F)Z
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onDrawFrame(F)Z

    move-result v0

    .line 139
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

    if-eqz v1, :cond_1

    if-eqz v0, :cond_0

    .line 141
    invoke-interface {v1, p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;->onAnimationTime(F)V

    .line 143
    :cond_0
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mWasAnimating:Z

    if-eqz p1, :cond_1

    if-nez v0, :cond_1

    .line 144
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;->onAnimationStopped()V

    .line 147
    :cond_1
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mWasAnimating:Z

    return v0
.end method

.method public final onFling(FF)Z
    .locals 2

    .line 309
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x44bb8000    # 1500.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 310
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onFling(FF)Z

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onMoveSingleTap(FF)Z
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->touchDrag(FF)V

    .line 282
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    const/4 p1, 0x1

    return p1
.end method

.method public onPause()V
    .locals 0

    .line 241
    invoke-super {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 235
    invoke-super {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onResume()V

    .line 236
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public final onSingleTap()Z
    .locals 1

    .line 299
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    if-eqz v0, :cond_0

    .line 300
    invoke-interface {v0}, Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;->onSingleTouch()V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onStopFling()V
    .locals 0

    return-void
.end method

.method public onSurfaceChanged(II)V
    .locals 2

    .line 129
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onSurfaceChanged(II)V

    .line 130
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;

    .line 131
    invoke-interface {v1, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;->onSurfaceChanged(II)V

    goto :goto_0

    .line 133
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onSurfaceCreated()V

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;

    .line 123
    invoke-interface {v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;->onSurfaceCreated()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onSurfaceDestroyed()V
    .locals 2

    .line 153
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;

    .line 154
    invoke-interface {v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$SurfaceListener;->onSurfaceDestroyed()V

    goto :goto_0

    .line 156
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onSurfaceDestroyed()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 249
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->handleEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :cond_2
    :goto_0
    return v1
.end method

.method public onTransform(FFFFFFF)Z
    .locals 8

    .line 272
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    neg-float v1, p1

    neg-float v2, p2

    neg-float v3, p3

    neg-float v5, p4

    move v4, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->transform(FFFFFFF)V

    .line 273
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    const/4 p1, 0x1

    return p1
.end method

.method public removeAnimationListener()V
    .locals 2

    const/4 v0, 0x0

    .line 209
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

    .line 210
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setNativeAnimationListener(Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;)V

    return-void
.end method

.method public setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;)V
    .locals 1

    const/4 v0, 0x0

    .line 186
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;Z)V

    return-void
.end method

.method public setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;Z)V
    .locals 0

    .line 199
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mAnimationListener:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;

    if-eqz p2, :cond_0

    .line 201
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setNativeAnimationListener(Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;)V

    :cond_0
    return-void
.end method

.method public setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V
    .locals 0

    .line 167
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    return-void
.end method

.method public start(Lcom/sonymobile/scan3d/viewer/SphanRenderer;Ljava/lang/Runnable;)V
    .locals 0
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 229
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 230
    invoke-virtual {p0, p0, p2}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setRenderer(Lcom/sonymobile/scan3d/GLThread$Renderer;Ljava/lang/Runnable;)V

    return-void
.end method
