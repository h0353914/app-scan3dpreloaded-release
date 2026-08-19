.class public Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;
.super Landroid/widget/FrameLayout;
.source "SphinxProgressBar.java"


# static fields
.field private static final PROPERTY_X:Ljava/lang/String; = "X"

.field private static final THRESHOLD:I = 0x5


# instance fields
.field private mAnimator:Landroid/animation/ObjectAnimator;

.field private final mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field private final mProgressBar:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 61
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 62
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0c00a7

    const/4 v0, 0x1

    invoke-virtual {p1, p2, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    const p1, 0x7f0901b5

    .line 63
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ProgressBar;

    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    const p1, 0x7f0901b4

    .line 64
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    .line 65
    new-instance p1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {p1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method private onProgressChanged(II)V
    .locals 0

    .line 152
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->updateIndicator(II)V

    return-void
.end method

.method private updateIndicator(II)V
    .locals 6

    .line 110
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->setProgressText(I)V

    .line 111
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->getLayoutDirection()I

    move-result v0

    .line 114
    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    .line 116
    iget-object v2, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    iget-object v3, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getY()F

    move-result v3

    iget-object v4, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->getTop()I

    move-result v4

    iget-object v5, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    .line 117
    invoke-virtual {v5}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->getBottom()I

    move-result v5

    sub-int/2addr v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float/2addr v4, v5

    add-float/2addr v3, v4

    iget-object v4, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getPaddingTop()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v3, v4

    .line 116
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->setY(F)V

    .line 118
    iget-object v2, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v2, :cond_0

    .line 119
    invoke-virtual {v2}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    .line 128
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getRight()I

    move-result v0

    iget-object v3, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getLeft()I

    move-result v3

    sub-int/2addr v0, v3

    mul-int/2addr v0, p2

    div-int/2addr v0, v1

    goto :goto_0

    :cond_1
    sub-int v0, v1, p2

    .line 124
    iget-object v3, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getRight()I

    move-result v3

    iget-object v4, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v4}, Landroid/widget/ProgressBar;->getLeft()I

    move-result v4

    sub-int/2addr v3, v4

    mul-int/2addr v0, v3

    div-int/2addr v0, v1

    .line 132
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1}, Landroid/widget/ProgressBar;->getX()F

    move-result v1

    int-to-float v0, v0

    add-float/2addr v1, v0

    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->getRight()I

    move-result v0

    iget-object v3, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    .line 133
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->getLeft()I

    move-result v3

    sub-int/2addr v0, v3

    int-to-float v0, v0

    mul-float/2addr v0, v5

    sub-float/2addr v1, v0

    sub-int/2addr p2, p1

    const/4 p1, 0x5

    if-le p2, p1, :cond_2

    .line 136
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    const-string p2, "X"

    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v3, 0x0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->getX()F

    move-result v4

    aput v4, v0, v3

    aput v1, v0, v2

    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mAnimator:Landroid/animation/ObjectAnimator;

    .line 137
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0xc8

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 138
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mAnimator:Landroid/animation/ObjectAnimator;

    iget-object p2, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 139
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_1

    .line 141
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mIndicator:Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;

    invoke-virtual {p1, v1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->setX(F)V

    :goto_1
    return-void
.end method


# virtual methods
.method public hide()V
    .locals 2

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x8

    .line 98
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->setVisibility(I)V

    .line 99
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f010020

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method

.method public setProgress(I)V
    .locals 2

    .line 74
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v0

    if-eq v0, p1, :cond_0

    .line 76
    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v1, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    .line 77
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->onProgressChanged(II)V

    :cond_0
    return-void
.end method

.method public show()V
    .locals 2

    .line 85
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v1, v0, :cond_0

    const/4 v0, 0x0

    .line 86
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->setVisibility(I)V

    .line 87
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f01001f

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->startAnimation(Landroid/view/animation/Animation;)V

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->mProgressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getProgress()I

    move-result v0

    .line 89
    invoke-direct {p0, v0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressBar;->updateIndicator(II)V

    :cond_0
    return-void
.end method
