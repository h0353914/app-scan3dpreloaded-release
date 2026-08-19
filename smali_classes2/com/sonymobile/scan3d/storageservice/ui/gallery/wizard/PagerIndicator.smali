.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;
.super Landroid/widget/LinearLayout;
.source "PagerIndicator.java"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;
.implements Landroidx/viewpager/widget/ViewPager$OnAdapterChangeListener;


# instance fields
.field private mIconLayout:Landroid/widget/LinearLayout;

.field protected mViewPager:Landroidx/viewpager/widget/ViewPager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 48
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 49
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->setHorizontalScrollBarEnabled(Z)V

    .line 50
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const v0, 0x7f0c0079

    .line 52
    invoke-virtual {p1, v0, p0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    .line 53
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->addView(Landroid/view/View;)V

    return-void
.end method

.method private getStateListAnim()Landroid/animation/StateListAnimator;
    .locals 2

    .line 135
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getPagerIndicator()I

    move-result v1

    invoke-static {v0, v1}, Landroid/animation/AnimatorInflater;->loadStateListAnimator(Landroid/content/Context;I)Landroid/animation/StateListAnimator;

    move-result-object v0

    return-object v0
.end method

.method private updateAdapter(Landroidx/viewpager/widget/PagerAdapter;)V
    .locals 6

    .line 144
    invoke-virtual {p1}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result p1

    const/4 v0, 0x1

    if-le p1, v0, :cond_1

    .line 147
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 148
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    .line 150
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, p1, :cond_0

    const v4, 0x7f0c0041

    .line 153
    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    .line 154
    invoke-virtual {v1, v4, v5, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    .line 155
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getPagerIndicator()I

    move-result v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 156
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getStateListAnim()Landroid/animation/StateListAnimator;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 157
    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v5, v4}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 160
    :cond_0
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->onPageSelected(I)V

    goto :goto_1

    :cond_1
    const/4 p1, 0x4

    .line 163
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->setVisibility(I)V

    :goto_1
    return-void
.end method


# virtual methods
.method public getPagerIndicator()I
    .locals 1

    const v0, 0x7f080117

    return v0
.end method

.method public onAdapterChanged(Landroidx/viewpager/widget/ViewPager;Landroidx/viewpager/widget/PagerAdapter;Landroidx/viewpager/widget/PagerAdapter;)V
    .locals 0
    .param p1    # Landroidx/viewpager/widget/ViewPager;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroidx/viewpager/widget/PagerAdapter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroidx/viewpager/widget/PagerAdapter;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 58
    invoke-direct {p0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->updateAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 63
    invoke-super {p0}, Landroid/widget/LinearLayout;->onAttachedToWindow()V

    .line 65
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getRootView()Landroid/view/View;

    move-result-object v0

    .line 67
    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_2

    .line 68
    check-cast v0, Landroid/view/ViewGroup;

    const v1, 0x7f09021b

    .line 69
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager/widget/ViewPager;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    .line 70
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_1

    .line 73
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    if-nez v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->addOnAdapterChangeListener(Landroidx/viewpager/widget/ViewPager$OnAdapterChangeListener;)V

    goto :goto_0

    .line 77
    :cond_0
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->updateAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    goto :goto_0

    .line 71
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Could not find view pager."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_0
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 84
    invoke-super {p0}, Landroid/widget/LinearLayout;->onDetachedFromWindow()V

    .line 85
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->removeOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 89
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

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
    .locals 5

    const/4 v0, 0x0

    move v1, v0

    .line 100
    :goto_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 101
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 103
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 104
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/PagerIndicator;->mIconLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v3}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v3

    sub-int/2addr v3, v4

    sub-int/2addr v3, p1

    if-ne v1, v3, :cond_0

    goto :goto_1

    :cond_0
    move v4, v0

    :goto_1
    invoke-virtual {v2, v4}, Landroid/view/View;->setSelected(Z)V

    goto :goto_3

    :cond_1
    if-ne v1, p1, :cond_2

    goto :goto_2

    :cond_2
    move v4, v0

    .line 106
    :goto_2
    invoke-virtual {v2, v4}, Landroid/view/View;->setSelected(Z)V

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method
