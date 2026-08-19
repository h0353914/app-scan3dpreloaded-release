.class public Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;
.super Landroid/widget/ImageView;
.source "UploadIndicator.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# static fields
.field private static final ROTATION_ANGLE:F = 360.0f

.field private static final ROTATION_LAP_DURATION:I = 0x578


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method cancelAnimation()V
    .locals 2

    const/4 v0, 0x0

    .line 109
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setRotation(F)V

    .line 110
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 121
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->startAnimation()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onBound(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V
    .locals 2

    const/16 v0, 0x8

    if-eqz p2, :cond_2

    .line 55
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    .line 67
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setVisibility(I)V

    .line 68
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->cancelAnimation()V

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setVisibility(I)V

    const p1, 0x7f0800e9

    .line 58
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setImageResource(I)V

    .line 59
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->startAnimation()V

    goto :goto_0

    .line 62
    :cond_1
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setVisibility(I)V

    const p1, 0x7f0800d4

    .line 63
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setImageResource(I)V

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->cancelAnimation()V

    goto :goto_0

    .line 72
    :cond_2
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method setRefreshing(ZZF)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    .line 84
    :goto_0
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setVisibility(I)V

    .line 85
    invoke-virtual {p0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->setRotation(F)V

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    .line 88
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->startAnimation()V

    goto :goto_1

    .line 90
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    :goto_1
    return-void
.end method

.method startAnimation()V
    .locals 3

    .line 98
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/UploadIndicator;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    .line 99
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->rotationBy(F)Landroid/view/ViewPropertyAnimator;

    const-wide/16 v1, 0x578

    .line 100
    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 101
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 102
    invoke-virtual {v0, p0}, Landroid/view/ViewPropertyAnimator;->setListener(Landroid/animation/Animator$AnimatorListener;)Landroid/view/ViewPropertyAnimator;

    return-void
.end method
