.class public Lcom/sonymobile/scan3d/viewer/SplitScreenView;
.super Landroid/widget/TextView;
.source "SplitScreenView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;
    }
.end annotation


# static fields
.field private static final KEY_RATIO:Ljava/lang/String; = "ratio"

.field private static final KEY_SUPER_STATE:Ljava/lang/String; = "superState"


# instance fields
.field private mCompoundDrawable:I

.field private mCurrentText:Ljava/lang/String;

.field private mLeftTextWidth:I

.field private mListener:Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;

.field private mMinWidth:F

.field private mOffset:I

.field private mPaddingEnd:I

.field private mPaddingStart:I

.field private mRightTextWidth:I

.field private mScreenSplitRatio:F

.field private mScreenWidth:I

.field private mTextLeft:Ljava/lang/String;

.field private mTextRight:Ljava/lang/String;

.field private mTouchEventPrevX:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 120
    invoke-direct {p0, p1, p2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 121
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->init(Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 125
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 126
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->init(Landroid/util/AttributeSet;)V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/viewer/SplitScreenView;)F
    .locals 0

    .line 28
    iget p0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    return p0
.end method

.method static synthetic access$002(Lcom/sonymobile/scan3d/viewer/SplitScreenView;F)F
    .locals 0

    .line 28
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    return p1
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/SplitScreenView;)F
    .locals 0

    .line 28
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getSplitScreenRatio()F

    move-result p0

    return p0
.end method

.method private getSplitScreenRatio()F
    .locals 1

    .line 217
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenSplitRatio:F

    return v0
.end method

.method private init(Landroid/util/AttributeSet;)V
    .locals 2

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/R$styleable;->SplitScreenView:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 153
    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mOffset:I

    const/4 v1, 0x4

    .line 154
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTextLeft:Ljava/lang/String;

    const/4 v1, 0x5

    .line 155
    invoke-virtual {p1, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTextRight:Ljava/lang/String;

    .line 156
    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCompoundDrawable:I

    const/4 v1, 0x3

    .line 157
    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingStart:I

    const/4 v1, 0x2

    .line 158
    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingEnd:I

    .line 159
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 161
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "window"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 162
    new-instance v0, Landroid/graphics/Point;

    invoke-direct {v0}, Landroid/graphics/Point;-><init>()V

    .line 163
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 164
    iget p1, v0, Landroid/graphics/Point;->x:I

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenWidth:I

    .line 166
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCompoundDrawable:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    .line 167
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getCompoundDrawablePadding()I

    move-result v0

    add-int/2addr p1, v0

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingStart:I

    add-int/2addr p1, v0

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingEnd:I

    add-int/2addr p1, v0

    int-to-float p1, p1

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTextLeft:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    add-float/2addr v0, p1

    float-to-int v0, v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mLeftTextWidth:I

    .line 169
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getPaint()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTextRight:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;)F

    move-result v0

    add-float/2addr p1, v0

    float-to-int p1, p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mRightTextWidth:I

    .line 171
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    .line 172
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 173
    new-instance v0, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView$1;-><init>(Lcom/sonymobile/scan3d/viewer/SplitScreenView;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    return-void
.end method

.method private setLeftTextIfNeeded()V
    .locals 4

    .line 277
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCurrentText:Ljava/lang/String;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTextLeft:Ljava/lang/String;

    if-eq v0, v1, :cond_0

    .line 278
    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCurrentText:Ljava/lang/String;

    .line 279
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setText(Ljava/lang/CharSequence;)V

    .line 280
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCompoundDrawable:I

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v1, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 281
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingStart:I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingEnd:I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setPadding(IIII)V

    :cond_0
    return-void
.end method

.method private setRightTextIfNeeded()V
    .locals 4

    .line 268
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCurrentText:Ljava/lang/String;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTextRight:Ljava/lang/String;

    if-eq v0, v1, :cond_0

    .line 269
    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCurrentText:Ljava/lang/String;

    .line 270
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setText(Ljava/lang/CharSequence;)V

    .line 271
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mCompoundDrawable:I

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v1, v0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 272
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingEnd:I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getPaddingTop()I

    move-result v1

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mPaddingStart:I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getPaddingBottom()I

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setPadding(IIII)V

    :cond_0
    return-void
.end method


# virtual methods
.method public maxSplitScreenRatio()F
    .locals 2

    .line 231
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->minSplitScreenRatio()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    return v1
.end method

.method public minSplitScreenRatio()F
    .locals 3

    .line 224
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mOffset:I

    int-to-float v0, v0

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenWidth:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    .line 143
    instance-of v0, p1, Landroid/os/Bundle;

    if-eqz v0, :cond_0

    .line 144
    check-cast p1, Landroid/os/Bundle;

    const-string v0, "ratio"

    .line 145
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getFloat(Ljava/lang/String;)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setSplitScreenRatio(F)V

    const-string v0, "superState"

    .line 146
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    .line 148
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/TextView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void
.end method

.method public onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    .line 135
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "superState"

    .line 136
    invoke-super {p0}, Landroid/widget/TextView;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string v1, "ratio"

    .line 137
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getSplitScreenRatio()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putFloat(Ljava/lang/String;F)V

    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 199
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->isEnabled()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    return v1

    .line 201
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    if-eqz v0, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    goto :goto_0

    .line 206
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getSplitScreenRatio()F

    move-result v0

    .line 207
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result v2

    iget v3, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTouchEventPrevX:F

    sub-float/2addr v2, v3

    iget v3, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenWidth:I

    int-to-float v3, v3

    div-float/2addr v2, v3

    add-float/2addr v0, v2

    .line 206
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setSplitScreenRatio(F)V

    .line 208
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTouchEventPrevX:F

    goto :goto_0

    .line 203
    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mTouchEventPrevX:F

    :goto_0
    return v1
.end method

.method public setOnSplitScreenViewListener(Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;)V
    .locals 0

    .line 130
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mListener:Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;

    return-void
.end method

.method public setSplitScreenRatio(F)V
    .locals 7

    .line 242
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->maxSplitScreenRatio()F

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->minSplitScreenRatio()F

    move-result v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 243
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenSplitRatio:F

    .line 244
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    const/high16 v1, 0x3f000000    # 0.5f

    cmpg-float v2, p1, v1

    const/high16 v3, 0x40000000    # 2.0f

    const v4, 0x3f99999a    # 1.2f

    if-gez v2, :cond_0

    .line 248
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setLeftTextIfNeeded()V

    const/high16 v2, 0x3f800000    # 1.0f

    .line 249
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->minSplitScreenRatio()F

    move-result v5

    sub-float v5, p1, v5

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->minSplitScreenRatio()F

    move-result v6

    sub-float/2addr v1, v6

    div-float/2addr v5, v1

    sub-float/2addr v2, v5

    .line 250
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    iget v5, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mLeftTextWidth:I

    int-to-float v6, v5

    sub-float/2addr v6, v1

    mul-float/2addr v6, v2

    mul-float/2addr v6, v4

    add-float/2addr v1, v6

    int-to-float v4, v5

    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 253
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    iget v4, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    div-float/2addr v4, v3

    sub-float/2addr v1, v4

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setX(F)V

    goto :goto_0

    .line 255
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setRightTextIfNeeded()V

    sub-float v2, p1, v1

    .line 256
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->maxSplitScreenRatio()F

    move-result v5

    sub-float/2addr v5, v1

    div-float/2addr v2, v5

    .line 257
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    iget v5, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mRightTextWidth:I

    int-to-float v6, v5

    sub-float/2addr v6, v1

    mul-float/2addr v6, v2

    mul-float/2addr v6, v4

    add-float/2addr v1, v6

    int-to-float v4, v5

    invoke-static {v1, v4}, Ljava/lang/Math;->min(FF)F

    move-result v1

    float-to-int v1, v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 260
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mScreenWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    iget v4, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v4, v4

    sub-float/2addr v1, v4

    iget v4, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mMinWidth:F

    div-float/2addr v4, v3

    add-float/2addr v1, v4

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setX(F)V

    :goto_0
    const/high16 v1, 0x437f0000    # 255.0f

    mul-float/2addr v2, v1

    float-to-int v1, v2

    const/16 v2, 0xff

    .line 262
    invoke-static {v1, v2, v2, v2}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setTextColor(I)V

    .line 263
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 264
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->mListener:Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;

    if-eqz v0, :cond_1

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;->onSplitScreenRatioChanged(F)V

    :cond_1
    return-void
.end method
