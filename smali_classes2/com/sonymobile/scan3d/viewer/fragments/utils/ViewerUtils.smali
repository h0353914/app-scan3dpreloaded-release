.class public Lcom/sonymobile/scan3d/viewer/fragments/utils/ViewerUtils;
.super Ljava/lang/Object;
.source "ViewerUtils.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAdjustedPickerItemMargin(Landroid/content/Context;FI)I
    .locals 2

    const-string v0, "window"

    .line 30
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/WindowManager;

    if-eqz p0, :cond_1

    .line 33
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 34
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 37
    iget p0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    int-to-float p0, p0

    div-float/2addr p0, p1

    float-to-int p0, p0

    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    move-result p0

    .line 41
    iget p2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    float-to-int v0, p1

    rem-int/2addr p2, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    int-to-float p2, p2

    cmpg-float v1, p2, p1

    if-gez v1, :cond_0

    add-float/2addr p2, p1

    goto :goto_0

    :cond_0
    sub-float/2addr p2, p1

    :goto_0
    int-to-float p0, p0

    div-float/2addr p2, p0

    div-float/2addr p2, v0

    float-to-int p0, p2

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    :goto_1
    return p0
.end method
