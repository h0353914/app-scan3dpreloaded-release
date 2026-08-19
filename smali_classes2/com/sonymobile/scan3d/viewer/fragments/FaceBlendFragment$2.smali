.class Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;
.super Ljava/lang/Object;
.source "FaceBlendFragment.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->setSaveAsContainerVisibility(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

.field final synthetic val$visible:Z


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;Z)V
    .locals 0

    .line 871
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->val$visible:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    .line 885
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->val$visible:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 886
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f09009c

    .line 887
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 1

    .line 876
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->val$visible:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->access$200(Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;)Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    move-result-object p1

    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;->IDLE:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$SaveState;

    if-ne p1, v0, :cond_0

    .line 877
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment$2;->this$0:Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/FaceBlendFragment;->getView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f09009c

    .line 878
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
