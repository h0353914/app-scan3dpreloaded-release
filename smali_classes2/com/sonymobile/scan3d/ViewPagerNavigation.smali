.class public Lcom/sonymobile/scan3d/ViewPagerNavigation;
.super Landroid/widget/FrameLayout;
.source "ViewPagerNavigation.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# instance fields
.field private mEndButtons:Landroid/view/View;

.field private mIndicator:Landroid/view/View;

.field private mRTLDirection:Z

.field private mViewPager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/ViewPagerNavigation;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mRTLDirection:Z

    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 2

    .line 30
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    const v0, 0x7f0900bd

    .line 31
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/ViewPagerNavigation;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mEndButtons:Landroid/view/View;

    const v0, 0x7f0900f9

    .line 32
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/ViewPagerNavigation;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mIndicator:Landroid/view/View;

    .line 33
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/ViewPagerNavigation;->getRootView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f09021b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    iput-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 34
    iget-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 37
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mRTLDirection:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/ViewPagerNavigation;->onPageSelected(I)V

    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 4

    .line 46
    iget-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    .line 47
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v0

    .line 48
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mRTLDirection:Z

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    if-nez p1, :cond_1

    goto :goto_0

    :cond_0
    sub-int/2addr v0, v2

    if-ne p1, v0, :cond_1

    goto :goto_0

    :cond_1
    move v2, v3

    :goto_0
    const/16 p1, 0x8

    if-eqz v2, :cond_2

    .line 51
    iget-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mIndicator:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    iget-object p1, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mEndButtons:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 54
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mIndicator:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 55
    iget-object v0, p0, Lcom/sonymobile/scan3d/ViewPagerNavigation;->mEndButtons:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :goto_1
    return-void
.end method
