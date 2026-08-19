.class Lcom/sonymobile/scan3d/SphinxToastView$2;
.super Ljava/lang/Object;
.source "SphinxToastView.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/SphinxToastView;->hide()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/SphinxToastView;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/SphinxToastView;)V
    .locals 0

    .line 248
    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView$2;->this$0:Lcom/sonymobile/scan3d/SphinxToastView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2

    .line 257
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView$2;->this$0:Lcom/sonymobile/scan3d/SphinxToastView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/SphinxToastView;->setVisibility(I)V

    const/4 v0, 0x0

    .line 258
    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

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
