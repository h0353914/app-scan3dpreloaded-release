.class public Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;
.super Landroid/widget/LinearLayout;
.source "SphinxStepIndicator.java"


# instance fields
.field mBulletList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;",
            ">;"
        }
    .end annotation
.end field

.field private mCurrentStep:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mBulletList:Ljava/util/List;

    const/4 p1, -0x1

    .line 30
    iput p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mCurrentStep:I

    const/4 p1, 0x4

    .line 40
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public reset()V
    .locals 1

    const/16 v0, 0x8

    .line 90
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->setVisibility(I)V

    .line 91
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mBulletList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, -0x1

    .line 92
    iput v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mCurrentStep:I

    .line 93
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->removeAllViews()V

    return-void
.end method

.method public selectStep(II)V
    .locals 2

    .line 77
    iget v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mCurrentStep:I

    if-eq p1, v0, :cond_1

    const/4 v1, -0x1

    if-le v0, v1, :cond_0

    .line 79
    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mBulletList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->contractBullet()V

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mBulletList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->expandBullet(I)V

    .line 82
    iput p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mCurrentStep:I

    :cond_1
    return-void
.end method

.method public setNbrOfSteps(I)V
    .locals 5

    .line 52
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mBulletList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eq p1, v0, :cond_2

    .line 53
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->reset()V

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p1, :cond_1

    .line 57
    new-instance v2, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->getContext()Landroid/content/Context;

    move-result-object v3

    if-nez v1, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    move v4, v0

    :goto_1
    invoke-direct {v2, v3, p0, v4}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;-><init>(Landroid/content/Context;Landroid/view/ViewGroup;Z)V

    .line 59
    iget-object v3, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->mBulletList:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 63
    :cond_1
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->setVisibility(I)V

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->getContext()Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x10a0000

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    .line 66
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicator;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_2
    return-void
.end method
