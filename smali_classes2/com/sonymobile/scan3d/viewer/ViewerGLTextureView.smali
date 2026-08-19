.class public Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;
.super Lcom/sonymobile/scan3d/NativeGLTextureView;
.source "ViewerGLTextureView.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;
    }
.end annotation


# static fields
.field private static final VELOCITY_MIN:F = 1500.0f


# instance fields
.field private mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

.field private mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

.field private mSurfaceListeners:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;",
            ">;"
        }
    .end annotation
.end field

.field private mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 68
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;-><init>(Landroid/content/Context;)V

    .line 51
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    .line 69
    new-instance v0, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-direct {v0, p1, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 73
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/NativeGLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 51
    new-instance p2, Ljava/util/Vector;

    invoke-direct {p2}, Ljava/util/Vector;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    .line 74
    new-instance p2, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-direct {p2, p1, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    return-void
.end method


# virtual methods
.method public addSurfaceListener(Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;)V
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDoubleTap()Z
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onDoubleTap()Z

    move-result v0

    .line 208
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    return v0
.end method

.method public onDown()Z
    .locals 1

    .line 238
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onDown()Z

    move-result v0

    return v0
.end method

.method public onDrawFrame(F)Z
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onDrawFrame(F)Z

    move-result p1

    return p1
.end method

.method public final onFling(FF)Z
    .locals 2

    .line 230
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x44bb8000    # 1500.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onFling(FF)Z

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onMoveSingleTap(FF)Z
    .locals 1

    .line 198
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onMoveSingleTap(FF)Z

    move-result p1

    .line 199
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    return p1
.end method

.method public onPause()V
    .locals 2

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->setOnFlingStopListener(Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;)V

    .line 148
    invoke-super {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 140
    invoke-super {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onResume()V

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->setOnFlingStopListener(Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;)V

    .line 142
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    return-void
.end method

.method public final onSingleTap()Z
    .locals 2

    .line 216
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSingleTap()Z

    move-result v0

    if-nez v0, :cond_0

    .line 219
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    if-eqz v1, :cond_0

    .line 220
    invoke-interface {v1}, Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;->onSingleTouch()V

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onStopFling()V
    .locals 0

    return-void
.end method

.method public onSurfaceChanged(II)V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSurfaceChanged(II)V

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;

    .line 89
    invoke-interface {v1, p1, p2}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;->onSurfaceChanged(II)V

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 2

    .line 79
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSurfaceCreated()V

    .line 80
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;

    .line 81
    invoke-interface {v1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;->onSurfaceCreated()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onSurfaceDestroyed()V
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;

    .line 102
    invoke-interface {v1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;->onSurfaceDestroyed()V

    goto :goto_0

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSurfaceDestroyed()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 156
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 159
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

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

    .line 188
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onTransform(FFFFFFF)Z

    move-result p1

    .line 190
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    return p1
.end method

.method public setScenography(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    if-eqz v0, :cond_0

    .line 169
    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    .line 171
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 172
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    :cond_0
    return-void
.end method

.method public setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V
    .locals 0

    .line 115
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    return-void
.end method

.method public start(Lcom/sonymobile/scan3d/viewer/MeshRenderer;Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    .line 134
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    const/4 p1, 0x0

    .line 135
    invoke-virtual {p0, p0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->setRenderer(Lcom/sonymobile/scan3d/GLThread$Renderer;Ljava/lang/Runnable;)V

    return-void
.end method
