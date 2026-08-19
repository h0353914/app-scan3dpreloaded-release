.class Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;
.super Ljava/lang/Object;
.source "ToastAnimationSet.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->execute(Lcom/sonymobile/scan3d/ToastAnimationSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

.field final synthetic val$toastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;Lcom/sonymobile/scan3d/ToastAnimationSet;)V
    .locals 0

    .line 192
    iput-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->this$0:Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

    iput-object p2, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->val$toastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    const/4 v0, 0x0

    .line 208
    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 209
    iget-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->val$toastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->this$0:Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

    invoke-static {v0}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->access$400(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->this$0:Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

    invoke-static {v1}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->access$500(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/ToastAnimationSet;->access$700(Lcom/sonymobile/scan3d/ToastAnimationSet;Landroid/view/View;Landroid/view/animation/Animation;)V

    .line 210
    iget-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->val$toastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    invoke-static {p1}, Lcom/sonymobile/scan3d/ToastAnimationSet;->access$800(Lcom/sonymobile/scan3d/ToastAnimationSet;)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 2

    .line 199
    iget-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->val$toastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->this$0:Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

    invoke-static {v0}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->access$400(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction$1;->this$0:Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;

    invoke-static {v1}, Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;->access$500(Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/ToastAnimationSet;->access$600(Lcom/sonymobile/scan3d/ToastAnimationSet;Landroid/view/View;Landroid/view/animation/Animation;)V

    return-void
.end method
