.class public Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;
.super Landroid/app/AlertDialog;
.source "SphinxProgressDialog.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;IZ)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1}, Landroid/app/AlertDialog;-><init>(Landroid/content/Context;)V

    .line 37
    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setContent(Landroid/content/Context;IZ)V

    return-void
.end method


# virtual methods
.method public setContent(Landroid/content/Context;IZ)V
    .locals 3
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 64
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c00b7

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09015e

    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 66
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(I)V

    const p2, 0x7f0900b0

    .line 67
    invoke-virtual {v0, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    if-eqz p3, :cond_0

    const p3, 0x106000d

    .line 71
    invoke-virtual {p1, p3}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->setBackgroundColor(I)V

    goto :goto_0

    :cond_0
    const p3, 0x7f080120

    .line 73
    invoke-virtual {p1, p3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 75
    :goto_0
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setView(Landroid/view/View;)V

    return-void
.end method

.method public show()V
    .locals 3

    .line 43
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 46
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v2, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v2}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 v2, 0x2

    .line 48
    invoke-virtual {v0, v2}, Landroid/view/Window;->clearFlags(I)V

    .line 50
    :cond_0
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/widgets/SphinxProgressDialog;->setCanceledOnTouchOutside(Z)V

    .line 51
    invoke-super {p0}, Landroid/app/AlertDialog;->show()V

    return-void
.end method
