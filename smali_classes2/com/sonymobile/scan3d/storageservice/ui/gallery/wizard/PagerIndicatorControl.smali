.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;
.source "PagerIndicatorControl.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

.field private mNext:Landroid/widget/TextView;

.field private mPrevious:Landroid/widget/TextView;

.field private mRTLDirection:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 49
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mRTLDirection:Z

    const p1, 0x7f0c008f

    .line 53
    invoke-virtual {p2, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    .line 54
    invoke-virtual {p2, p1, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    .line 56
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 57
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    const p2, 0x800015

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 59
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    const p2, 0x800013

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 61
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mRTLDirection:Z

    if-eqz p1, :cond_1

    .line 62
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->addView(Landroid/view/View;I)V

    .line 63
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->addView(Landroid/view/View;)V

    goto :goto_1

    .line 65
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->addView(Landroid/view/View;I)V

    .line 66
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->addView(Landroid/view/View;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 6

    .line 81
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    .line 82
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    .line 83
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, v0, :cond_0

    move v0, v4

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-nez v1, :cond_1

    move v3, v4

    .line 87
    :cond_1
    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    if-ne p1, v5, :cond_3

    if-eqz v0, :cond_2

    .line 89
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;->onClose()V

    goto :goto_1

    .line 91
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1, v2, v4}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    goto :goto_1

    .line 93
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    if-ne p1, v0, :cond_5

    if-eqz v3, :cond_4

    .line 96
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;->onClose()V

    goto :goto_1

    .line 98
    :cond_4
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    sub-int/2addr v1, v4

    invoke-virtual {p1, v1, v4}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_5
    :goto_1
    return-void
.end method

.method public onPageSelected(I)V
    .locals 6

    .line 105
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->onPageSelected(I)V

    .line 107
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    .line 108
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    add-int/lit8 v1, p1, 0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v1, v0, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v3

    :goto_0
    if-nez p1, :cond_1

    goto :goto_1

    :cond_1
    move v2, v3

    :goto_1
    const p1, 0x7f10037c

    const v1, 0x7f10037d

    const v4, 0x7f080178

    const/4 v5, 0x0

    if-eqz v0, :cond_3

    .line 113
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {v0, v4, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 116
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mRTLDirection:Z

    if-eqz v0, :cond_2

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_2

    .line 119
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 121
    :goto_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, v3, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    goto :goto_4

    :cond_3
    const v0, 0x7f080179

    if-eqz v2, :cond_5

    .line 123
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mRTLDirection:Z

    if-eqz v2, :cond_4

    .line 124
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_3

    .line 126
    :cond_4
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(I)V

    .line 128
    :goto_3
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p1, v3, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 129
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 130
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, v3, v3, v0, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    goto :goto_4

    .line 133
    :cond_5
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p1, v4, v3, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    .line 136
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p1, v3, v3, v0, v3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(IIII)V

    :goto_4
    return-void
.end method

.method public setOnCloseListener(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicatorControl;->mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

    return-void
.end method
