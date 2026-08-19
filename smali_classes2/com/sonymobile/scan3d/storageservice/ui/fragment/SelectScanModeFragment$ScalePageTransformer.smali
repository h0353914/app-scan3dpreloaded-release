.class Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScalePageTransformer;
.super Ljava/lang/Object;
.source "SelectScanModeFragment.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$PageTransformer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScalePageTransformer"
.end annotation


# static fields
.field private static final MIN_SCALE:F = 0.8f


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 387
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$1;)V
    .locals 0

    .line 387
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScalePageTransformer;-><init>()V

    return-void
.end method


# virtual methods
.method public transformPage(Landroid/view/View;F)V
    .locals 3

    const/high16 v0, -0x40800000    # -1.0f

    cmpl-float v0, p2, v0

    const v1, 0x3f4ccccd    # 0.8f

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v2, p2, v0

    if-gtz v2, :cond_0

    const v2, 0x3e4ccccc    # 0.19999999f

    .line 395
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    sub-float/2addr v0, p2

    mul-float/2addr v0, v2

    add-float/2addr v1, v0

    .line 400
    :cond_0
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleX(F)V

    .line 401
    invoke-virtual {p1, v1}, Landroid/view/View;->setScaleY(F)V

    return-void
.end method
