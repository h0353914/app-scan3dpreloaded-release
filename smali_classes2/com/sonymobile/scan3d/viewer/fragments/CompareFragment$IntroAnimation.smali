.class Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;
.super Ljava/lang/Object;
.source "CompareFragment.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "IntroAnimation"
.end annotation


# static fields
.field private static final SPLIT_SCREEN_ANIMATION_DURATION:I = 0x7d0

.field private static final TEXTURE_ANIMATION_DURATION:I = 0x7d0


# instance fields
.field private mSplitScreenAnimator:Landroid/animation/ValueAnimator;

.field private mTextureAnimator:Landroid/animation/ValueAnimator;

.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)V
    .locals 0

    .line 406
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$1;)V
    .locals 0

    .line 406
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)V

    return-void
.end method


# virtual methods
.method public cancelAnimation()V
    .locals 1

    .line 432
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 433
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1
    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2

    .line 442
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    if-ne p1, v0, :cond_0

    .line 443
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$300(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 444
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$400(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 445
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$502(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;Z)Z

    .line 446
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setEnabled(Z)V

    goto :goto_0

    .line 447
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    if-ne p1, v0, :cond_1

    const/4 p1, 0x2

    .line 448
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    .line 449
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x7d0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 450
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 451
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 452
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_1
    :goto_0
    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 466
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mTextureAnimator:Landroid/animation/ValueAnimator;

    if-ne p1, v0, :cond_0

    .line 467
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$100(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    move-result-object v0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setTextured(F)V

    goto :goto_0

    .line 468
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    if-ne p1, v0, :cond_1

    .line 469
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    move-result-object v0

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setSplitScreenRatio(F)V

    .line 471
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public startAnimation()V
    .locals 3

    .line 421
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$100(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setTextured(F)V

    .line 422
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setEnabled(Z)V

    const/4 v0, 0x2

    .line 423
    new-array v0, v0, [F

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-static {v2}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->maxSplitScreenRatio()F

    move-result v2

    aput v2, v0, v1

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    .line 424
    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->minSplitScreenRatio()F

    move-result v1

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 423
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    .line 425
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x7d0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 426
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 427
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 428
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->mSplitScreenAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method
