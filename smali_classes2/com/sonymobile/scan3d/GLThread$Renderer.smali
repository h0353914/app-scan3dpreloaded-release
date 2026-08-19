.class public interface abstract Lcom/sonymobile/scan3d/GLThread$Renderer;
.super Ljava/lang/Object;
.source "GLThread.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/GLThread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Renderer"
.end annotation


# virtual methods
.method public onDrawFrame()Z
    .locals 1

    const/high16 v0, -0x40800000    # -1.0f

    .line 117
    invoke-interface {p0, v0}, Lcom/sonymobile/scan3d/GLThread$Renderer;->onDrawFrame(F)Z

    move-result v0

    return v0
.end method

.method public abstract onDrawFrame(F)Z
.end method

.method public abstract onSurfaceChanged(II)V
.end method

.method public abstract onSurfaceCreated()V
.end method

.method public abstract onSurfaceDestroyed()V
.end method
