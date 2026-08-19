.class Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment$1;
.super Ljava/lang/Object;
.source "WallpaperPreviewer.java"

# interfaces
.implements Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V
    .locals 0

    .line 306
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment$1;->this$0:Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onSingleTouch()V
    .locals 0

    return-void
.end method
