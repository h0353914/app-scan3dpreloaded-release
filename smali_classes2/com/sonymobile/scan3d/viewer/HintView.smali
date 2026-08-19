.class public final Lcom/sonymobile/scan3d/viewer/HintView;
.super Landroid/widget/FrameLayout;
.source "HintView.java"


# instance fields
.field private mCurrentHintResource:I

.field private mHint:Landroid/view/View;


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

    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p2, 0x7f060069

    .line 42
    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/HintView;->setBackgroundColor(I)V

    .line 43
    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/HintView;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    const/16 p1, 0x8

    .line 44
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/HintView;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public addHintLayout(I)Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 56
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mCurrentHintResource:I

    if-ne v0, p1, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    if-nez v0, :cond_1

    .line 57
    :cond_0
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mCurrentHintResource:I

    .line 59
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    .line 61
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 63
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    return-object p1
.end method

.method public hideHint()V
    .locals 2

    .line 70
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->removeAllViews()V

    const/4 v0, 0x0

    .line 71
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    .line 73
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 75
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x10a0001

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/HintView;->setAnimation(Landroid/view/animation/Animation;)V

    const/16 v0, 0x8

    .line 76
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/HintView;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public showHint()V
    .locals 3

    const/4 v0, 0x0

    .line 84
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/HintView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 85
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    if-eqz v2, :cond_1

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 86
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-ne v1, v2, :cond_0

    .line 87
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x10a0000

    invoke-static {v1, v2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/HintView;->setAnimation(Landroid/view/animation/Animation;)V

    .line 88
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/HintView;->setVisibility(I)V

    .line 90
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/HintView;->removeAllViews()V

    .line 91
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/HintView;->mHint:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/HintView;->addView(Landroid/view/View;)V

    :cond_1
    return-void
.end method
