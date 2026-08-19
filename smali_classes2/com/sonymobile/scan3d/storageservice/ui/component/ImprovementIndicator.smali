.class public Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;
.super Landroid/widget/ImageView;
.source "ImprovementIndicator.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public onBound(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)V
    .locals 0

    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;->setBackgroundResource(I)V

    const/4 p2, 0x0

    .line 42
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 43
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;->setEnabled(Z)V

    const/16 p1, 0x8

    .line 44
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/ImprovementIndicator;->setVisibility(I)V

    return-void
.end method
