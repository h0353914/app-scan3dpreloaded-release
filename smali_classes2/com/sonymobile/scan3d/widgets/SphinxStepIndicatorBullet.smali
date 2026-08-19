.class public Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;
.super Ljava/lang/Object;
.source "SphinxStepIndicatorBullet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;
    }
.end annotation


# static fields
.field private static final ANIMATION_TIME:I = 0x12c


# instance fields
.field private mBaseWidth:I

.field private mBulletView:Landroid/view/View;

.field private mContext:Landroid/content/Context;

.field private mExpanded:Z

.field private mIndicatorTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/view/ViewGroup;Z)V
    .locals 3

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 116
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0c00b9

    invoke-virtual {v0, v2, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    .line 118
    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mContext:Landroid/content/Context;

    .line 121
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/View;->setSelected(Z)V

    .line 122
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/View;->setEnabled(Z)V

    .line 125
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 126
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p1, v1, v1}, Landroid/view/View;->measure(II)V

    .line 127
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBaseWidth:I

    .line 129
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    const p2, 0x7f0901c6

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mIndicatorTextView:Landroid/widget/TextView;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mExpanded:Z

    return p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/content/Context;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/widget/TextView;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mIndicatorTextView:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/view/View;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)I
    .locals 0

    .line 23
    iget p0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBaseWidth:I

    return p0
.end method


# virtual methods
.method public contractBullet()V
    .locals 3

    const/4 v0, 0x0

    .line 181
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mExpanded:Z

    .line 183
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mContext:Landroid/content/Context;

    const v1, 0x10a0001

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    const-wide/16 v1, 0x12c

    .line 185
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 186
    new-instance v1, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;-><init>(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 207
    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mIndicatorTextView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public expandBullet(I)V
    .locals 2

    const/4 v0, 0x1

    .line 138
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mExpanded:Z

    .line 139
    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 140
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mIndicatorTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 143
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    const/4 v0, 0x0

    .line 144
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 145
    invoke-static {v0, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    .line 143
    invoke-virtual {p1, v1, v0}, Landroid/view/View;->measure(II)V

    .line 146
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBaseWidth:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 150
    new-instance v0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;

    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-direct {v0, v1, p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;-><init>(Landroid/view/View;I)V

    .line 151
    new-instance p1, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;-><init>(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)V

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 174
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->mBulletView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method
