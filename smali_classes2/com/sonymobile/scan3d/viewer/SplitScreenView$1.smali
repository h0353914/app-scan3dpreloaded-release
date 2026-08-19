.class Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;
.super Ljava/lang/Object;
.source "SplitScreenView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/SplitScreenView;->init(Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/SplitScreenView;)V
    .locals 0

    .line 173
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 6

    .line 178
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->access$002(Lcom/sonymobile/scan3d/viewer/SplitScreenView;F)F

    .line 179
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->access$000(Lcom/sonymobile/scan3d/viewer/SplitScreenView;)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    return-void

    .line 181
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 182
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v1, 0x0

    .line 183
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 184
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getHeight()I

    move-result v2

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    const/16 v3, 0x8

    .line 185
    new-array v3, v3, [F

    aput v2, v3, v1

    const/4 v4, 0x1

    aput v2, v3, v4

    const/4 v4, 0x2

    aput v2, v3, v4

    const/4 v4, 0x3

    aput v2, v3, v4

    const/4 v5, 0x4

    aput v2, v3, v5

    const/4 v5, 0x5

    aput v2, v3, v5

    const/4 v5, 0x6

    aput v2, v3, v5

    const/4 v5, 0x7

    aput v2, v3, v5

    invoke-virtual {v0, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    const/16 v2, 0x40

    .line 188
    invoke-static {v2, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/4 v1, -0x1

    .line 189
    invoke-virtual {v0, v4, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 190
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 191
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;->this$0:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->access$100(Lcom/sonymobile/scan3d/viewer/SplitScreenView;)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setSplitScreenRatio(F)V

    return-void
.end method
