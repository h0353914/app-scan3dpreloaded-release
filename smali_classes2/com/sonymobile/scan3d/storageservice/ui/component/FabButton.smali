.class public Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;
.super Landroid/widget/FrameLayout;
.source "FabButton.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final DEFAULT_PULSE_REPEATS:I = 0x3

.field private static final PROP_ALPHA:Ljava/lang/String; = "alpha"

.field private static final PROP_SCALE_X:Ljava/lang/String; = "scaleX"

.field private static final PROP_SCALE_Y:Ljava/lang/String; = "scaleY"

.field private static final REVEAL_FEATURE_DESCRIPTION_DURATION:J = 0x2bcL

.field private static final SCALE_TO_INIT:F = 1.3f

.field private static final SCALE_TO_PULSE:F = 1.4f

.field private static final SCALE_TO_SHADOW_PULSE:F = 1.9599999f

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.component.FabButton"


# instance fields
.field private mCurrentAnimation:Landroid/animation/AnimatorSet;

.field private final mFabParent:Landroid/view/ViewGroup;

.field private mNormalButton:Landroid/widget/ImageButton;

.field private final mPulseView:Landroid/view/View;

.field private final mRevealView:Landroid/view/ViewGroup;

.field private mTipButton:Landroid/widget/ImageButton;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 115
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x7f0c0058

    .line 117
    invoke-static {p1, p2, p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0900c9

    .line 118
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mFabParent:Landroid/view/ViewGroup;

    const p1, 0x7f0900c8

    .line 119
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    const p1, 0x7f0900c7

    .line 120
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageButton;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mTipButton:Landroid/widget/ImageButton;

    const p1, 0x7f09016a

    .line 121
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    const p1, 0x7f090165

    .line 122
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mPulseView:Landroid/view/View;

    const/4 p1, 0x0

    .line 125
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->setClipChildren(Z)V

    .line 126
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private cancelAnimation()V
    .locals 1

    .line 233
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 234
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    const/4 v0, 0x0

    .line 235
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    :cond_0
    return-void
.end method

.method private getButtonCenterX()I
    .locals 3

    .line 344
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 345
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getX()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    add-float/2addr v1, v0

    float-to-int v0, v1

    return v0
.end method

.method private getButtonCenterY()I
    .locals 3

    .line 355
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getHeight()I

    move-result v0

    int-to-float v0, v0

    .line 356
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v1}, Landroid/widget/ImageButton;->getY()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    add-float/2addr v1, v0

    float-to-int v0, v1

    return v0
.end method

.method private getButtonLayoutCenterX()I
    .locals 3

    .line 322
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mFabParent:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    int-to-float v0, v0

    .line 323
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mFabParent:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getX()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    add-float/2addr v1, v0

    float-to-int v0, v1

    return v0
.end method

.method private getButtonLayoutCenterY()I
    .locals 3

    .line 333
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mFabParent:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getHeight()I

    move-result v0

    int-to-float v0, v0

    .line 334
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mFabParent:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getY()F

    move-result v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    add-float/2addr v1, v0

    float-to-int v0, v1

    return v0
.end method

.method private getButtonRadius()I
    .locals 1

    .line 366
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method private getRevealRadius()I
    .locals 1

    .line 313
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    return v0
.end method

.method private newPulseAnimator()Landroid/animation/Animator;
    .locals 11

    .line 245
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 246
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mTipButton:Landroid/widget/ImageButton;

    const/4 v2, 0x2

    new-array v3, v2, [Landroid/animation/PropertyValuesHolder;

    const-string v4, "scaleX"

    new-array v5, v2, [F

    fill-array-data v5, :array_0

    .line 247
    invoke-static {v4, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "scaleY"

    new-array v6, v2, [F

    fill-array-data v6, :array_1

    .line 248
    invoke-static {v4, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    const/4 v6, 0x1

    aput-object v4, v3, v6

    .line 246
    invoke-static {v1, v3}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-wide/16 v3, 0x2bc

    .line 249
    invoke-virtual {v1, v3, v4}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 250
    invoke-virtual {v1, v6}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 251
    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 254
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mPulseView:Landroid/view/View;

    new-array v4, v2, [Landroid/animation/PropertyValuesHolder;

    const-string v7, "scaleX"

    new-array v8, v2, [F

    fill-array-data v8, :array_2

    .line 255
    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    aput-object v7, v4, v5

    const-string v7, "scaleY"

    new-array v8, v2, [F

    fill-array-data v8, :array_3

    .line 256
    invoke-static {v7, v8}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v7

    aput-object v7, v4, v6

    .line 254
    invoke-static {v3, v4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v3

    const-wide/16 v7, 0x578

    .line 257
    invoke-virtual {v3, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 258
    invoke-virtual {v3, v6}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    .line 259
    invoke-virtual {v3, v2}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    .line 261
    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mPulseView:Landroid/view/View;

    const-string v9, "alpha"

    new-array v10, v2, [F

    fill-array-data v10, :array_4

    invoke-static {v4, v9, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v4

    .line 262
    invoke-virtual {v4, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    const/4 v7, 0x3

    .line 263
    new-array v7, v7, [Landroid/animation/Animator;

    aput-object v1, v7, v5

    aput-object v3, v7, v6

    aput-object v4, v7, v2

    invoke-virtual {v0, v7}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    return-object v0

    nop

    :array_0
    .array-data 4
        0x3fa66666    # 1.3f
        0x3fb33333    # 1.4f
    .end array-data

    :array_1
    .array-data 4
        0x3fa66666    # 1.3f
        0x3fb33333    # 1.4f
    .end array-data

    :array_2
    .array-data 4
        0x3fa66666    # 1.3f
        0x3ffae147    # 1.9599999f
    .end array-data

    :array_3
    .array-data 4
        0x3fa66666    # 1.3f
        0x3ffae147    # 1.9599999f
    .end array-data

    :array_4
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private newRevealAnimation()Landroid/animation/Animator;
    .locals 8

    .line 273
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getButtonRadius()I

    move-result v0

    .line 274
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getRevealRadius()I

    move-result v1

    .line 275
    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v3, 0x3

    .line 278
    new-array v3, v3, [Landroid/animation/Animator;

    iget-object v4, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    int-to-float v0, v0

    int-to-float v5, v1

    invoke-static {v4, v1, v1, v0, v5}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v0

    const/4 v1, 0x0

    aput-object v0, v3, v1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mTipButton:Landroid/widget/ImageButton;

    const/4 v4, 0x2

    new-array v5, v4, [Landroid/animation/PropertyValuesHolder;

    const-string v6, "scaleX"

    new-array v7, v4, [F

    fill-array-data v7, :array_0

    .line 281
    invoke-static {v6, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v6

    aput-object v6, v5, v1

    const-string v1, "scaleY"

    new-array v6, v4, [F

    fill-array-data v6, :array_1

    .line 282
    invoke-static {v1, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    const/4 v6, 0x1

    aput-object v1, v5, v6

    .line 280
    invoke-static {v0, v5}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v3, v6

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    const-string v1, "alpha"

    new-array v5, v4, [F

    fill-array-data v5, :array_2

    .line 283
    invoke-static {v0, v1, v5}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v3, v4

    .line 278
    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    const-wide/16 v0, 0x2bc

    .line 284
    invoke-virtual {v2, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    return-object v2

    nop

    :array_0
    .array-data 4
        0x0
        0x3fa66666    # 1.3f
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3fa66666    # 1.3f
    .end array-data

    :array_2
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private newUnRevealAnimation()Landroid/animation/Animator;
    .locals 8

    .line 294
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getButtonRadius()I

    move-result v0

    .line 295
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getRevealRadius()I

    move-result v1

    .line 296
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getButtonCenterX()I

    move-result v2

    .line 297
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getButtonCenterY()I

    move-result v3

    .line 299
    new-instance v4, Landroid/animation/AnimatorSet;

    invoke-direct {v4}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v5, 0x3

    .line 300
    new-array v5, v5, [Landroid/animation/Animator;

    iget-object v6, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mTipButton:Landroid/widget/ImageButton;

    int-to-float v0, v0

    const/4 v7, 0x0

    invoke-static {v6, v2, v3, v0, v7}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v5, v3

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    int-to-float v3, v1

    .line 301
    invoke-static {v2, v1, v1, v3, v0}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v5, v1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    .line 302
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    aput-object v0, v5, v2

    .line 300
    invoke-virtual {v4, v5}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    const-wide/16 v0, 0x2bc

    .line 303
    invoke-virtual {v4, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    return-object v4

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public hide()V
    .locals 3

    .line 165
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->cancelAnimation()V

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x43b40000    # 360.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 167
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 194
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 195
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mTipButton:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 196
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mPulseView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 p1, 0x0

    .line 197
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 186
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 187
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mTipButton:Landroid/widget/ImageButton;

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 188
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mPulseView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 180
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->cancelAnimation()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    .line 131
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 132
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->cancelAnimation()V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 137
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 138
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getButtonLayoutCenterX()I

    move-result p1

    .line 139
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getButtonLayoutCenterY()I

    move-result p2

    .line 140
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->getRevealRadius()I

    move-result p3

    .line 142
    iget-object p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    sub-int/2addr p1, p3

    int-to-float p1, p1

    invoke-virtual {p4, p1}, Landroid/view/ViewGroup;->setX(F)V

    .line 143
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mRevealView:Landroid/view/ViewGroup;

    sub-int/2addr p2, p3

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setY(F)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 156
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->TAG:Ljava/lang/String;

    const-string v1, "onPause(): "

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->cancelAnimation()V

    return-void
.end method

.method public final setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1
    .param p1    # Landroid/view/View$OnClickListener;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v0, p1}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public show()V
    .locals 3

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mNormalButton:Landroid/widget/ImageButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->rotation(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    .line 175
    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    return-void
.end method

.method public showTip()V
    .locals 3

    .line 214
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_1

    .line 215
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    const/4 v0, 0x5

    .line 216
    new-array v0, v0, [Landroid/animation/Animator;

    const/4 v1, 0x0

    .line 217
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->newRevealAnimation()Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    :goto_0
    const/4 v2, 0x3

    if-gt v1, v2, :cond_0

    .line 219
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->newPulseAnimator()Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x4

    .line 221
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->newUnRevealAnimation()Landroid/animation/Animator;

    move-result-object v2

    aput-object v2, v0, v1

    .line 222
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 223
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    new-instance v1, Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;

    invoke-direct {v1}, Landroidx/interpolator/view/animation/FastOutSlowInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 224
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 225
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/FabButton;->mCurrentAnimation:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    :cond_1
    return-void
.end method
