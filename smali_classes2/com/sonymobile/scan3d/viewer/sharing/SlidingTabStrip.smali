.class Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;
.super Landroid/widget/LinearLayout;
.source "SlidingTabStrip.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;
    }
.end annotation


# static fields
.field private static final DEFAULT_BOTTOM_BORDER_COLOR_ALPHA:B = 0x26t

.field private static final DEFAULT_BOTTOM_BORDER_THICKNESS_DIPS:I = 0x2

.field private static final DEFAULT_DIVIDER_COLOR_ALPHA:B = 0x20t

.field private static final DEFAULT_DIVIDER_HEIGHT:F = 0.5f

.field private static final DEFAULT_DIVIDER_THICKNESS_DIPS:I = 0x1

.field private static final DEFAULT_SELECTED_INDICATOR_COLOR:I = -0xcc4a1b

.field private static final SELECTED_INDICATOR_THICKNESS_DIPS:I = 0x4


# instance fields
.field private final mBottomBorderPaint:Landroid/graphics/Paint;

.field private final mBottomBorderThickness:I

.field private mCustomTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;

.field private final mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

.field private final mDividerHeight:F

.field private final mDividerPaint:Landroid/graphics/Paint;

.field private final mSelectedIndicatorPaint:Landroid/graphics/Paint;

.field private final mSelectedIndicatorThickness:I

.field private mSelectedPosition:I

.field private mSelectionOffset:F


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 59
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 5

    .line 63
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 64
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->setWillNotDraw(Z)V

    .line 66
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 68
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 69
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const/4 v2, 0x1

    const v3, 0x1010030

    invoke-virtual {p1, v3, v1, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 70
    iget p1, v1, Landroid/util/TypedValue;->data:I

    .line 72
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    const/4 v3, 0x0

    invoke-direct {v1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;-><init>(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$1;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    .line 73
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    new-array v3, v2, [I

    const v4, -0xcc4a1b

    aput v4, v3, p2

    invoke-virtual {v1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;->setIndicatorColors([I)V

    .line 74
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    new-array v2, v2, [I

    const/16 v3, 0x20

    invoke-static {p1, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->setColorAlpha(IB)I

    move-result v3

    aput v3, v2, p2

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;->setDividerColors([I)V

    const/high16 p2, 0x40000000    # 2.0f

    mul-float/2addr p2, v0

    float-to-int p2, p2

    .line 77
    iput p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mBottomBorderThickness:I

    .line 78
    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mBottomBorderPaint:Landroid/graphics/Paint;

    .line 79
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mBottomBorderPaint:Landroid/graphics/Paint;

    const/16 v1, 0x26

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->setColorAlpha(IB)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setColor(I)V

    const/high16 p1, 0x40800000    # 4.0f

    mul-float/2addr p1, v0

    float-to-int p1, p1

    .line 82
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedIndicatorThickness:I

    .line 83
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    const/high16 p1, 0x3f000000    # 0.5f

    .line 85
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDividerHeight:F

    .line 86
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    .line 87
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float/2addr v0, p2

    float-to-int p2, v0

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method private static blendColors(IIF)I
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p2

    .line 179
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p2

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v0

    add-float/2addr v1, v2

    .line 180
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p2

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v3, v0

    add-float/2addr v2, v3

    .line 181
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    mul-float/2addr p0, p2

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float/2addr p1, v0

    add-float/2addr p0, p1

    float-to-int p1, v1

    float-to-int p2, v2

    float-to-int p0, p0

    .line 182
    invoke-static {p1, p2, p0}, Landroid/graphics/Color;->rgb(III)I

    move-result p0

    return p0
.end method

.method private static setColorAlpha(IB)I
    .locals 2

    .line 168
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    invoke-static {p1, v0, v1, p0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 117
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getHeight()I

    move-result v0

    .line 118
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildCount()I

    move-result v1

    .line 119
    iget v2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDividerHeight:F

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(FF)F

    move-result v2

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {v2, v4}, Ljava/lang/Math;->min(FF)F

    move-result v2

    int-to-float v11, v0

    mul-float/2addr v2, v11

    float-to-int v2, v2

    .line 120
    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mCustomTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;

    if-eqz v5, :cond_0

    goto :goto_0

    :cond_0
    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    :goto_0
    move-object v12, v5

    if-lez v1, :cond_3

    .line 126
    iget v5, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0, v5}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    .line 127
    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v6

    .line 128
    invoke-virtual {v5}, Landroid/view/View;->getRight()I

    move-result v5

    .line 129
    iget v7, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedPosition:I

    invoke-interface {v12, v7}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;->getIndicatorColor(I)I

    move-result v7

    .line 131
    iget v8, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectionOffset:F

    cmpl-float v3, v8, v3

    if-lez v3, :cond_2

    iget v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedPosition:I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildCount()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    if-ge v3, v8, :cond_2

    .line 132
    iget v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedPosition:I

    add-int/lit8 v3, v3, 0x1

    invoke-interface {v12, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;->getIndicatorColor(I)I

    move-result v3

    if-eq v7, v3, :cond_1

    .line 134
    iget v8, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectionOffset:F

    invoke-static {v3, v7, v8}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->blendColors(IIF)I

    move-result v3

    move v7, v3

    .line 138
    :cond_1
    iget v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedPosition:I

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 139
    iget v8, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectionOffset:F

    invoke-virtual {v3}, Landroid/view/View;->getLeft()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v8, v9

    iget v9, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectionOffset:F

    sub-float v10, v4, v9

    int-to-float v6, v6

    mul-float/2addr v10, v6

    add-float/2addr v8, v10

    float-to-int v6, v8

    .line 141
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v9, v3

    iget v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectionOffset:F

    sub-float/2addr v4, v3

    int-to-float v3, v5

    mul-float/2addr v4, v3

    add-float/2addr v9, v4

    float-to-int v5, v9

    .line 145
    :cond_2
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setColor(I)V

    int-to-float v6, v6

    .line 147
    iget v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedIndicatorThickness:I

    sub-int v3, v0, v3

    int-to-float v7, v3

    int-to-float v8, v5

    iget-object v10, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedIndicatorPaint:Landroid/graphics/Paint;

    move-object v5, p1

    move v9, v11

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_3
    const/4 v6, 0x0

    .line 152
    iget v3, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mBottomBorderThickness:I

    sub-int v3, v0, v3

    int-to-float v7, v3

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getWidth()I

    move-result v3

    int-to-float v8, v3

    iget-object v10, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mBottomBorderPaint:Landroid/graphics/Paint;

    move-object v5, p1

    move v9, v11

    invoke-virtual/range {v5 .. v10}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    sub-int/2addr v0, v2

    .line 155
    div-int/lit8 v0, v0, 0x2

    const/4 v3, 0x0

    :goto_1
    add-int/lit8 v4, v1, -0x1

    if-ge v3, v4, :cond_4

    .line 157
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    .line 158
    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    invoke-interface {v12, v3}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;->getDividerColor(I)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 159
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v5

    int-to-float v7, v5

    int-to-float v8, v0

    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    move-result v4

    int-to-float v9, v4

    add-int v4, v0, v2

    int-to-float v10, v4

    iget-object v11, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDividerPaint:Landroid/graphics/Paint;

    move-object v6, p1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    return-void
.end method

.method onViewPagerPageChanged(IF)V
    .locals 0

    .line 110
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectedPosition:I

    .line 111
    iput p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mSelectionOffset:F

    .line 112
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->invalidate()V

    return-void
.end method

.method setCustomTabColorizer(Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;)V
    .locals 0

    .line 91
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mCustomTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;

    .line 92
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->invalidate()V

    return-void
.end method

.method varargs setDividerColors([I)V
    .locals 1

    const/4 v0, 0x0

    .line 104
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mCustomTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;

    .line 105
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;->setDividerColors([I)V

    .line 106
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->invalidate()V

    return-void
.end method

.method varargs setSelectedIndicatorColors([I)V
    .locals 1

    const/4 v0, 0x0

    .line 97
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mCustomTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabLayout$TabColorizer;

    .line 98
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->mDefaultTabColorizer:Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip$SimpleTabColorizer;->setIndicatorColors([I)V

    .line 99
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/SlidingTabStrip;->invalidate()V

    return-void
.end method
