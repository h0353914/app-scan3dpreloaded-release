.class public Lcom/sonymobile/scan3d/SphinxToastView;
.super Landroid/widget/LinearLayout;
.source "SphinxToastView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;
    }
.end annotation


# static fields
.field private static final MESSAGE_MIN_DISPLAY_TIME:I = 0x7d0


# instance fields
.field private mCurrentTextResource:I

.field private mInAnimation:Landroid/view/animation/Animation;

.field private mLayoutInflater:Landroid/view/LayoutInflater;

.field private mOutAnimation:Landroid/view/animation/Animation;

.field private mTextAnimation:Landroid/view/animation/Animation;

.field private mToastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 81
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    .line 36
    iput v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    .line 82
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/SphinxToastView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 92
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, -0x1

    .line 36
    iput p2, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    .line 93
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/SphinxToastView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 104
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, -0x1

    .line 36
    iput p2, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    .line 105
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/SphinxToastView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/SphinxToastView;)Landroid/view/animation/Animation;
    .locals 0

    .line 28
    iget-object p0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mInAnimation:Landroid/view/animation/Animation;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/SphinxToastView;Z[Landroid/view/View;)V
    .locals 0

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/SphinxToastView;->updateMessage(Z[Landroid/view/View;)V

    return-void
.end method

.method private createToastMessageView(II)Landroid/widget/TextView;
    .locals 3

    .line 283
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mLayoutInflater:Landroid/view/LayoutInflater;

    const v1, 0x7f0c0040

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 285
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxToastView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setVisibility(I)V

    return-object v0
.end method

.method private init(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x1

    .line 120
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/SphinxToastView;->setOrientation(I)V

    const-string v0, "layout_inflater"

    .line 121
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/LayoutInflater;

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mLayoutInflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method private varargs updateMessage(Z[Landroid/view/View;)V
    .locals 3

    const/4 v0, 0x0

    .line 224
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/SphinxToastView;->setVisibility(I)V

    .line 227
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxToastView;->removeAllViews()V

    .line 230
    array-length v1, p2

    :goto_0
    if-ge v0, v1, :cond_0

    aget-object v2, p2, v0

    .line 231
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/SphinxToastView;->addView(Landroid/view/View;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    .line 235
    sget-object p2, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    :goto_1
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/SphinxToastView;->setBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V

    if-eqz p1, :cond_2

    .line 237
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxToastView;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0600ab

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1

    .line 238
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/SphinxToastView;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public hide()V
    .locals 3

    .line 246
    iget v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 248
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mOutAnimation:Landroid/view/animation/Animation;

    new-instance v2, Lcom/sonymobile/scan3d/SphinxToastView$2;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/SphinxToastView$2;-><init>(Lcom/sonymobile/scan3d/SphinxToastView;)V

    invoke-virtual {v0, v2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 266
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/SphinxToastView;->startAnimation(Landroid/view/animation/Animation;)V

    .line 268
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mToastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->cancel()V

    .line 270
    iput v1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    :cond_0
    return-void
.end method

.method public setAnimations(III)V
    .locals 1

    .line 109
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxToastView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 110
    invoke-static {v0, p1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mInAnimation:Landroid/view/animation/Animation;

    .line 111
    invoke-static {v0, p2}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mOutAnimation:Landroid/view/animation/Animation;

    .line 112
    invoke-static {v0, p3}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mTextAnimation:Landroid/view/animation/Animation;

    return-void
.end method

.method public show([IZLcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;)V
    .locals 6

    .line 137
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mInAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mOutAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mTextAnimation:Landroid/view/animation/Animation;

    if-eqz v0, :cond_4

    .line 141
    new-instance v0, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;-><init>()V

    .line 143
    iget v1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 145
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mOutAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->addAnimation(Landroid/view/View;Landroid/view/animation/Animation;)Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;

    .line 149
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mInAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->addAnimation(Landroid/view/View;Landroid/view/animation/Animation;)Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;

    .line 152
    array-length v1, p1

    new-array v1, v1, [Landroid/view/View;

    const/4 v2, 0x0

    move v3, v2

    .line 153
    :goto_0
    array-length v4, p1

    if-ge v3, v4, :cond_3

    if-nez v3, :cond_1

    .line 157
    aget v4, p1, v3

    invoke-direct {p0, v4, v2}, Lcom/sonymobile/scan3d/SphinxToastView;->createToastMessageView(II)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v1, v3

    goto :goto_1

    .line 159
    :cond_1
    aget v4, p1, v3

    const/4 v5, 0x4

    invoke-direct {p0, v4, v5}, Lcom/sonymobile/scan3d/SphinxToastView;->createToastMessageView(II)Landroid/widget/TextView;

    move-result-object v4

    aput-object v4, v1, v3

    .line 160
    aget-object v4, v1, v3

    iget-object v5, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mTextAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v4, v5}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->addAnimation(Landroid/view/View;Landroid/view/animation/Animation;)Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;

    .line 164
    :goto_1
    array-length v4, p1

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_2

    const-wide/16 v4, 0x7d0

    .line 165
    invoke-virtual {v0, v4, v5}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->addDelay(J)Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 170
    :cond_3
    new-instance v3, Lcom/sonymobile/scan3d/SphinxToastView$1;

    invoke-direct {v3, p0, p2, v1, p3}, Lcom/sonymobile/scan3d/SphinxToastView$1;-><init>(Lcom/sonymobile/scan3d/SphinxToastView;Z[Landroid/view/View;Lcom/sonymobile/scan3d/SphinxToastView$ISphinxToastListener;)V

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->setListener(Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;)V

    .line 207
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/SphinxToastView;->setVisibility(I)V

    .line 210
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;->build()Lcom/sonymobile/scan3d/ToastAnimationSet;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mToastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    .line 211
    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mToastAnimationSet:Lcom/sonymobile/scan3d/ToastAnimationSet;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/ToastAnimationSet;->execute()V

    .line 213
    aget p1, p1, v2

    iput p1, p0, Lcom/sonymobile/scan3d/SphinxToastView;->mCurrentTextResource:I

    return-void

    .line 138
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Animations must be set before showing toast view!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
