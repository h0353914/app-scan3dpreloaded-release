.class Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "TiltAnimationHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 2

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    iget-object v0, v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$200(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 89
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    iget-object v0, v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$002(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;Z)Z

    .line 90
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationCancel(Landroid/animation/Animator;)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    iget-object v0, v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$200(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 96
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;->this$1:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    iget-object v0, v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$002(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;Z)Z

    .line 97
    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void
.end method
