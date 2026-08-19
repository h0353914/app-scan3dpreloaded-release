.class public Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;
.super Landroid/widget/FrameLayout;
.source "SphinxProgressIndicator.java"


# instance fields
.field private mTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 1

    .line 49
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    const v0, 0x7f0901b6

    .line 50
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->mTextView:Landroid/widget/TextView;

    return-void
.end method

.method public setProgressText(I)V
    .locals 5

    .line 42
    iget-object v0, p0, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->mTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    .line 43
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/widgets/SphinxProgressIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f10019e

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    invoke-virtual {v1, v2, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
