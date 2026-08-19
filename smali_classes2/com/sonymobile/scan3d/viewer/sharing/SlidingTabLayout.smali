.class public Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;
.super Landroid/widget/HorizontalScrollView;
.source "SlidingTabLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabClickListener;,
        Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;,
        Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;
    }
.end annotation


# static fields
.field private static final TAB_VIEW_PADDING_DIPS:I = 0x10

.field private static final TAB_VIEW_TEXT_SIZE_SP:I = 0xc

.field private static final TITLE_OFFSET_DIPS:I = 0x18


# instance fields
.field private final mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

.field private mTabViewLayoutId:I

.field private mTabViewTextViewId:I

.field private mTitleOffset:I

.field private mViewPager:Landroidx/viewpager/widget/ViewPager;

.field private mViewPagerPageChangeListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 90
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 94
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 98
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 101
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->setHorizontalScrollBarEnabled(Z)V

    const/4 p2, 0x1

    .line 103
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->setFillViewport(Z)V

    .line 105
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    const/high16 p3, 0x41c00000    # 24.0f

    mul-float/2addr p2, p3

    float-to-int p2, p2

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTitleOffset:I

    .line 107
    new-instance p2, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-direct {p2, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    .line 108
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    const/4 p2, -0x1

    const/4 p3, -0x2

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->addView(Landroid/view/View;II)V

    return-void
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;II)V
    .locals 0

    .line 55
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->scrollToTab(II)V

    return-void
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mViewPagerPageChangeListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    return-object p0
.end method

.method static synthetic access$500(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;)Landroidx/viewpager/widget/ViewPager;
    .locals 0

    .line 55
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    return-object p0
.end method

.method private populateTabStrip()V
    .locals 9

    .line 197
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v0

    .line 198
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabClickListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabClickListener;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$1;)V

    const/4 v3, 0x0

    move v4, v3

    .line 200
    :goto_0
    invoke-virtual {v0}, Landroidx/viewpager/widget/PagerAdapter;->getCount()I

    move-result v5

    if-ge v4, v5, :cond_4

    .line 204
    iget v5, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabViewLayoutId:I

    if-eqz v5, :cond_0

    .line 206
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v5

    iget v6, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabViewLayoutId:I

    iget-object v7, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v5, v6, v7, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 208
    iget v6, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabViewTextViewId:I

    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    goto :goto_1

    :cond_0
    move-object v5, v2

    move-object v6, v5

    :goto_1
    if-nez v5, :cond_1

    .line 212
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->createDefaultTabView(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object v5

    :cond_1
    if-nez v6, :cond_2

    .line 215
    instance-of v7, v5, Landroid/widget/TextView;

    if-eqz v7, :cond_2

    .line 216
    move-object v6, v5

    check-cast v6, Landroid/widget/TextView;

    :cond_2
    if-eqz v6, :cond_3

    .line 218
    invoke-virtual {v0, v4}, Landroidx/viewpager/widget/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 220
    :cond_3
    invoke-virtual {v5, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    new-instance v6, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v7, -0x2

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v6, v3, v7, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 224
    invoke-virtual {v5, v6}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 225
    iget-object v6, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v6, v5}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->addView(Landroid/view/View;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private scrollToTab(II)V
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildCount()I

    move-result v0

    if-eqz v0, :cond_4

    if-ltz p1, :cond_4

    if-lt p1, v0, :cond_0

    goto :goto_0

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 246
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    add-int/2addr v0, p2

    if-gtz p1, :cond_1

    if-lez p2, :cond_2

    .line 250
    :cond_1
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTitleOffset:I

    sub-int/2addr v0, p1

    :cond_2
    const/4 p1, 0x0

    .line 253
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->scrollTo(II)V

    :cond_3
    return-void

    :cond_4
    :goto_0
    return-void
.end method


# virtual methods
.method protected createDefaultTabView(Landroid/content/Context;)Landroid/widget/TextView;
    .locals 4

    .line 179
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x11

    .line 180
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setGravity(I)V

    const/4 p1, 0x2

    const/high16 v1, 0x41400000    # 12.0f

    .line 181
    invoke-virtual {v0, p1, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 182
    sget-object p1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 184
    new-instance p1, Landroid/util/TypedValue;

    invoke-direct {p1}, Landroid/util/TypedValue;-><init>()V

    .line 185
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    const v3, 0x101030e

    invoke-virtual {v1, v3, p1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 187
    iget p1, p1, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 188
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setAllCaps(Z)V

    .line 190
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 v1, 0x41800000    # 16.0f

    mul-float/2addr p1, v1

    float-to-int p1, p1

    .line 191
    invoke-virtual {v0, p1, p1, p1, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object v0
.end method

.method protected onAttachedToWindow()V
    .locals 2

    .line 231
    invoke-super {p0}, Landroid/widget/HorizontalScrollView;->onAttachedToWindow()V

    .line 233
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz v0, :cond_0

    .line 234
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->scrollToTab(II)V

    :cond_0
    return-void
.end method

.method public setCustomTabColorizer(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;)V
    .locals 1

    .line 119
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->setCustomTabColorizer(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;)V

    return-void
.end method

.method public setCustomTabView(II)V
    .locals 0

    .line 156
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabViewLayoutId:I

    .line 157
    iput p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabViewTextViewId:I

    return-void
.end method

.method public varargs setDividerColors([I)V
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->setDividerColors([I)V

    return-void
.end method

.method public setOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V
    .locals 0

    .line 146
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mViewPagerPageChangeListener:Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;

    return-void
.end method

.method public varargs setSelectedIndicatorColors([I)V
    .locals 1

    .line 127
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->setSelectedIndicatorColors([I)V

    return-void
.end method

.method public setViewPager(Landroidx/viewpager/widget/ViewPager;)V
    .locals 2

    .line 165
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mTabStrip:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->removeAllViews()V

    .line 167
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->mViewPager:Landroidx/viewpager/widget/ViewPager;

    if-eqz p1, :cond_0

    .line 169
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$InternalViewPagerListener;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$1;)V

    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Landroidx/viewpager/widget/ViewPager$OnPageChangeListener;)V

    .line 170
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout;->populateTabStrip()V

    :cond_0
    return-void
.end method
