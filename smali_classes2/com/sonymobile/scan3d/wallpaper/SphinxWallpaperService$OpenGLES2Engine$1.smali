.class Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;
.super Ljava/lang/Object;
.source "SphinxWallpaperService.java"

# interfaces
.implements Landroid/view/SurfaceHolder$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->initGLThread()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)V
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 0

    .line 215
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    invoke-static {p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->access$100(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Lcom/sonymobile/scan3d/GLThread;->onWindowResize(II)V

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->access$100(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/SurfaceHolder;->getSurface()Landroid/view/Surface;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/GLThread;->surfaceCreated(Landroid/view/Surface;)V

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    .line 220
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    invoke-static {p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->access$100(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object p1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->surfaceDestroyed()V

    return-void
.end method
