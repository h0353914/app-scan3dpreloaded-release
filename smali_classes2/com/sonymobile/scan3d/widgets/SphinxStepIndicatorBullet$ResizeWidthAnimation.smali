.class Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;
.super Landroid/view/animation/Animation;
.source "SphinxStepIndicatorBullet.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ResizeWidthAnimation"
.end annotation


# instance fields
.field private mEndWidth:I

.field private mStartWidth:I

.field private mView:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 0

    .line 82
    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    .line 83
    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mView:Landroid/view/View;

    .line 84
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mStartWidth:I

    .line 85
    iput p2, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mEndWidth:I

    const-wide/16 p1, 0x12c

    .line 86
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->setDuration(J)V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 1

    .line 95
    iget p2, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mStartWidth:I

    iget v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mEndWidth:I

    sub-int/2addr v0, p2

    int-to-float v0, v0

    mul-float/2addr v0, p1

    float-to-int p1, v0

    add-int/2addr p2, p1

    .line 96
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 97
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;->mView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public willChangeBounds()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
