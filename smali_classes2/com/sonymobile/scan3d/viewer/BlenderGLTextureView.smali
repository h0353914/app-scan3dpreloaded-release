.class public Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;
.super Lcom/sonymobile/scan3d/NativeGLTextureView;
.source "BlenderGLTextureView.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshRenderer$OnStopFlingListener;
.implements Lcom/sonymobile/scan3d/GLThread$Renderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;
    }
.end annotation


# static fields
.field private static final VELOCITY_MIN:F = 1500.0f


# instance fields
.field private mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

.field protected mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

.field protected mSurfaceListeners:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector<",
            "Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;",
            ">;"
        }
    .end annotation
.end field

.field protected mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 64
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView;-><init>(Landroid/content/Context;)V

    .line 47
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    .line 65
    new-instance v0, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-direct {v0, p1, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 69
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/NativeGLTextureView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 47
    new-instance p2, Ljava/util/Vector;

    invoke-direct {p2}, Ljava/util/Vector;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    .line 70
    new-instance p2, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-direct {p2, p1, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    return-void
.end method


# virtual methods
.method public addSurfaceListener(Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;)V
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDoubleTap()Z
    .locals 1

    .line 177
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->resetView()Z

    move-result v0

    .line 178
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestRender()V

    return v0
.end method

.method public onDown()Z
    .locals 1

    .line 204
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onDown()Z

    move-result v0

    return v0
.end method

.method public onDrawFrame(F)Z
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onDrawFrame(F)Z

    move-result p1

    return p1
.end method

.method public final onFling(FF)Z
    .locals 2

    .line 196
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x44bb8000    # 1500.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 197
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onFling(FF)Z

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onMoveSingleTap(FF)Z
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->touchDrag(FF)Z

    move-result p1

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestRender()V

    return p1
.end method

.method public onPause()V
    .locals 0

    .line 86
    invoke-super {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 0

    .line 80
    invoke-super {p0}, Lcom/sonymobile/scan3d/NativeGLTextureView;->onResume()V

    .line 81
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestRender()V

    return-void
.end method

.method public final onSingleTap()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onStopFling()V
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onStopFling()V

    return-void
.end method

.method public onSurfaceChanged(II)V
    .locals 2

    .line 112
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onSurfaceChanged(II)V

    .line 113
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;

    .line 114
    invoke-interface {v1, p1, p2}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;->onSurfaceChanged(II)V

    goto :goto_0

    .line 116
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestRender()V

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onSurfaceCreated()V

    .line 105
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;

    .line 106
    invoke-interface {v1}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;->onSurfaceCreated()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onSurfaceDestroyed()V
    .locals 2

    .line 126
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mSurfaceListeners:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;

    .line 127
    invoke-interface {v1}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView$SurfaceListener;->onSurfaceDestroyed()V

    goto :goto_0

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->onSurfaceDestroyed()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result v0

    if-nez v0, :cond_0

    return v1

    .line 97
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

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

    .line 156
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    neg-float v1, p1

    neg-float v2, p2

    neg-float v3, p3

    neg-float v4, p5

    move v5, p4

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->transform(FFFFFFF)Z

    move-result p1

    .line 158
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestRender()V

    return p1
.end method

.method public setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mTouchListener:Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;

    return-void
.end method

.method public start(Lcom/sonymobile/scan3d/viewer/FaceBlender;Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    const/4 p1, 0x0

    .line 75
    invoke-virtual {p0, p0, p1}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->setRenderer(Lcom/sonymobile/scan3d/GLThread$Renderer;Ljava/lang/Runnable;)V

    return-void
.end method
