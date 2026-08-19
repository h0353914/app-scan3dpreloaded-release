.class public final synthetic Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

.field private final synthetic f$1:F


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;->f$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    iput p2, p0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;->f$1:F

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;->f$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;

    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;->f$1:F

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->lambda$rotate$1(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;F)V

    return-void
.end method
