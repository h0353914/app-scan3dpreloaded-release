.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->addDevOptions()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)V
    .locals 0

    .line 1571
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    .line 1574
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v1, 0x7f0900aa

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    .line 1575
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 1576
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v2, 0x7f0901b2

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    .line 1578
    invoke-virtual {v3, v1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    iget-object v3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$11;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const v4, 0x7f0900ec

    invoke-virtual {v3, v4}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 1579
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    move-result v3

    sub-int/2addr v1, v3

    const/4 v3, -0x1

    invoke-direct {v2, v3, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1576
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method
