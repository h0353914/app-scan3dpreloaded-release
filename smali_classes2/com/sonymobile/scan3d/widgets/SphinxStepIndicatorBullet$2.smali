.class Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;
.super Ljava/lang/Object;
.source "SphinxStepIndicatorBullet.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->contractBullet()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)V
    .locals 0

    .line 186
    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    .line 194
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$200(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/widget/TextView;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 197
    new-instance p1, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;

    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$300(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    .line 198
    invoke-static {v1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$400(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)I

    move-result v1

    invoke-direct {p1, v0, v1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$ResizeWidthAnimation;-><init>(Landroid/view/View;I)V

    .line 199
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$2;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$300(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
