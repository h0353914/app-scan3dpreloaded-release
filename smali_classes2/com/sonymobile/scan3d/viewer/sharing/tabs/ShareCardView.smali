.class public Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;
.super Landroidx/cardview/widget/CardView;
.source "ShareCardView.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 31
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->isEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f08008f

    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const p2, 0x57ffffff

    invoke-direct {p1, p2}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    :goto_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public addProgressBar()V
    .locals 3

    const/4 v0, 0x0

    .line 49
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    .line 50
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c00b1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->addView(Landroid/view/View;)V

    return-void
.end method

.method public removeProgressBar()V
    .locals 1

    const v0, 0x7f09015c

    .line 56
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->removeView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setEnabled(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 38
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->removeProgressBar()V

    :cond_0
    if-eqz p1, :cond_1

    .line 40
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f08008f

    invoke-virtual {p1, v0}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_0

    :cond_1
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const v0, 0x57ffffff

    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    :goto_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/ShareCardView;->setForeground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
