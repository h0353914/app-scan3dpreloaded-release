.class Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;
.super Ljava/lang/Object;
.source "TiltAnimationHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TiltRunnable"
.end annotation


# instance fields
.field private mEndTilt:I

.field private mOldTiltDelta:I

.field private mTotalTiltDelta:I

.field final synthetic this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;


# direct methods
.method public constructor <init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)V
    .locals 0

    .line 66
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 60
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mOldTiltDelta:I

    .line 67
    iput p2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mEndTilt:I

    return-void
.end method

.method public static synthetic lambda$null$0(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;Landroid/animation/ValueAnimator;)V
    .locals 9

    .line 79
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mOldTiltDelta:I

    sub-int/2addr v0, v1

    int-to-float v6, v0

    .line 80
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$300(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-virtual/range {v1 .. v8}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->transform(FFFFFFF)V

    .line 81
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$200(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 82
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mOldTiltDelta:I

    return-void
.end method

.method public static synthetic lambda$run$1(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 78
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$200(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$TiltAnimationHelper$TiltRunnable$I55C0NkMnKC2EddhsN43cOZ84Gw;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$TiltAnimationHelper$TiltRunnable$I55C0NkMnKC2EddhsN43cOZ84Gw;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;Landroid/animation/ValueAnimator;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 72
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$000(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 73
    :cond_0
    iget v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mEndTilt:I

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-static {v1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$100(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mTotalTiltDelta:I

    .line 74
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mEndTilt:I

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$102(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)I

    .line 75
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->this$0:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->access$002(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;Z)Z

    const/4 v0, 0x2

    .line 76
    new-array v0, v0, [I

    const/4 v2, 0x0

    aput v2, v0, v2

    iget v2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;->mTotalTiltDelta:I

    aput v2, v0, v1

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    .line 77
    new-instance v1, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$TiltAnimationHelper$TiltRunnable$auBlWg9SsxpFaCZNarFlE0N5aXU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$TiltAnimationHelper$TiltRunnable$auBlWg9SsxpFaCZNarFlE0N5aXU;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 85
    new-instance v1, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable$1;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const-wide/16 v1, 0x12c

    .line 100
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 101
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method
