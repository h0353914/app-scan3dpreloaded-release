.class Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;
.super Ljava/lang/Object;
.source "SphinxStepIndicatorBullet.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->expandBullet(I)V
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

    .line 151
    iput-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    .line 160
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$000(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 162
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {p1}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$100(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/content/Context;

    move-result-object p1

    const/high16 v0, 0x10a0000

    invoke-static {p1, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    const-wide/16 v0, 0x12c

    .line 164
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 165
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$200(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/widget/TextView;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet$1;->this$0:Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;

    invoke-static {v0}, Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;->access$200(Lcom/sonymobile/scan3d/widgets/SphinxStepIndicatorBullet;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

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
