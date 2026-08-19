.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$8;
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

    .line 1506
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$8;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .line 1509
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$8;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const p3, 0x7f090223

    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v0, "%d%%"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 1510
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p3, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1511
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$8;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$400(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;)Lcom/sonymobile/scan3d/sfmc/MimickingEngine;

    move-result-object p1

    const-string p3, "/debug/camera/viewfinder_scale"

    int-to-float p2, p2

    const/high16 v0, 0x42c80000    # 100.0f

    div-float/2addr p2, v0

    invoke-interface {p1, p3, p2}, Lcom/sonymobile/scan3d/sfmc/MimickingEngine;->setProperty(Ljava/lang/String;F)V

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
