.class Lcom/sonymobile/scan3d/SphinxToastView$1;
.super Ljava/lang/Object;
.source "SphinxToastView.java"

# interfaces
.implements Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/SphinxToastView;->show([IZLcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/SphinxToastView;

.field final synthetic val$messageViews:[Landroid/view/View;

.field final synthetic val$toastListener:Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;

.field final synthetic val$warning:Z


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/SphinxToastView;Z[Landroid/view/View;Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;)V
    .locals 0

    .line 170
    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->this$0:Lcom/sonymobile/scan3d/SphinxToastView;

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->val$warning:Z

    iput-object p3, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->val$messageViews:[Landroid/view/View;

    iput-object p4, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->val$toastListener:Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllAnimationsComplete(Lcom/sonymobile/scan3d/ToastAnimationSet;)V
    .locals 0

    .line 200
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->val$toastListener:Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;

    if-eqz p1, :cond_0

    .line 201
    invoke-interface {p1}, Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;->onToastShown()V

    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 1

    const/4 v0, 0x0

    .line 193
    invoke-virtual {p2, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    const/4 p2, 0x0

    .line 194
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onAnimationStart(Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->this$0:Lcom/sonymobile/scan3d/SphinxToastView;

    invoke-static {v0}, Lcom/sonymobile/scan3d/SphinxToastView;->access$000(Lcom/sonymobile/scan3d/SphinxToastView;)Landroid/view/animation/Animation;

    move-result-object v0

    if-ne p2, v0, :cond_0

    .line 176
    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->this$0:Lcom/sonymobile/scan3d/SphinxToastView;

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->val$warning:Z

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxToastView$1;->val$messageViews:[Landroid/view/View;

    invoke-static {p2, v0, v1}, Lcom/sonymobile/scan3d/SphinxToastView;->access$100(Lcom/sonymobile/scan3d/SphinxToastView;Z[Landroid/view/View;)V

    .line 179
    :cond_0
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_1

    .line 180
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/widget/LinearLayout;

    if-eqz p2, :cond_1

    .line 181
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    invoke-interface {p2}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/widget/ScrollView;

    if-eqz p2, :cond_1

    .line 182
    check-cast p1, Landroid/widget/TextView;

    .line 183
    invoke-virtual {p1}, Landroid/widget/TextView;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/widget/LinearLayout;

    .line 184
    invoke-virtual {p2}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/widget/ScrollView;

    .line 185
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 186
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->getHitRect(Landroid/graphics/Rect;)V

    const/4 p1, 0x0

    .line 187
    invoke-virtual {v0, p2, v1, p1}, Landroid/widget/ScrollView;->requestChildRectangleOnScreen(Landroid/view/View;Landroid/graphics/Rect;Z)Z

    :cond_1
    return-void
.end method
