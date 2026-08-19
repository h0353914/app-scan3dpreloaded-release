.class public Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;
.source "OnBoardingIndicatorControl.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# instance fields
.field private mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

.field private mNext:Landroid/widget/TextView;

.field private mPrevious:Landroid/widget/TextView;

.field private mRTLDirection:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 50
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 52
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p2, v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mRTLDirection:Z

    .line 54
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0c008f

    .line 55
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    .line 56
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    const v2, 0x7f10037e

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    .line 57
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    const v2, 0x800015

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 58
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    invoke-virtual {p1, p2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    .line 61
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    const p2, 0x7f10037f

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 62
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    const p2, 0x800013

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setGravity(I)V

    .line 63
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mRTLDirection:Z

    if-eqz p1, :cond_1

    .line 67
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->addView(Landroid/view/View;I)V

    .line 69
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->addView(Landroid/view/View;)V

    goto :goto_1

    .line 73
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->addView(Landroid/view/View;I)V

    .line 75
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->addView(Landroid/view/View;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 6

    .line 90
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    .line 91
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    .line 92
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

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

    .line 96
    :cond_1
    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    if-ne p1, v5, :cond_3

    if-eqz v0, :cond_2

    .line 98
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;->onClose()V

    goto :goto_1

    .line 100
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {p1, v2, v4}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    goto :goto_1

    .line 102
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    if-ne p1, v0, :cond_5

    if-eqz v3, :cond_4

    .line 105
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;->onClose()V

    goto :goto_1

    .line 107
    :cond_4
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    sub-int/2addr v1, v4

    invoke-virtual {p1, v1, v4}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(IZ)V

    :cond_5
    :goto_1
    return-void
.end method

.method public getPagerIndicator()I
    .locals 1

    const v0, 0x7f080115

    return v0
.end method

.method public onPageSelected(I)V
    .locals 7

    .line 119
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->onPageSelected(I)V

    .line 120
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 121
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v1

    .line 129
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mRTLDirection:Z

    const v3, 0x7f10037d

    const v4, 0x7f10037e

    const v5, 0x7f10037f

    const/4 v6, 0x0

    if-eqz v2, :cond_2

    .line 130
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    if-nez p1, :cond_0

    invoke-virtual {v0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    .line 131
    :cond_0
    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 130
    :goto_0
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 132
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_1

    .line 133
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 132
    :cond_1
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 135
    :cond_2
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mPrevious:Landroid/widget/TextView;

    if-nez p1, :cond_3

    .line 136
    invoke-virtual {v0, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 135
    :cond_3
    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 137
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mNext:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ne p1, v1, :cond_4

    goto :goto_1

    :cond_4
    move v3, v4

    :goto_1
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(I)V

    :goto_2
    return-void
.end method

.method public setOnCloseListener(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/component/OnBoardingIndicatorControl;->mCloseListener:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/OnCloseListener;

    return-void
.end method
