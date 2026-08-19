.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$7;
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

    .line 1488
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$7;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    .line 1491
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$7;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const p3, 0x7f0900ae

    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    sget-object p3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    const-string v0, "%d%%"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 1492
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p3, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1493
    iget-object p1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$7;->this$0:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    const p3, 0x7f0900ab

    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    rsub-int/lit8 p2, p2, 0x64

    mul-int/lit16 p2, p2, 0xff

    div-int/lit8 p2, p2, 0x64

    shl-int/lit8 p2, p2, 0x18

    .line 1494
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

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
