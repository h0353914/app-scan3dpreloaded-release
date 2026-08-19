.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$9;
.super Ljava/lang/Object;
.source "FaceMimicActivity.java"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


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

    .line 1523
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$9;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    int-to-float p1, p2

    const/high16 p2, 0x42480000    # 50.0f

    div-float/2addr p1, p2

    .line 1528
    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$9;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const p3, 0x7f090156

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v0, "%.2f"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 1529
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p3, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1531
    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$9;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p2

    const-string p3, "/ceres/pos_reg"

    invoke-interface {p2, p3, p1}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setProperty(Ljava/lang/String;F)V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
