.class public Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;
.super Landroid/widget/LinearLayout;
.source "AnimationMenu.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;
    }
.end annotation


# static fields
.field public static final FIRST:I = 0x0

.field private static final MAX_NUM_MENU_ITEMS:I = 0x2

.field public static final PICKER_ANIMATIONS:I = 0x0

.field public static final PICKER_BACKGROUNDS:I = 0x1

.field public static final SECOND:I = 0x1


# instance fields
.field private final mAnimationDuration:I

.field private final mButtonParent:Landroid/view/ViewGroup;

.field private mListener:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;

.field private mSelectedMenuIndex:I

.field private final mSwitcher:Landroid/widget/ViewSwitcher;

.field private final mTopMenuParent:Landroid/view/ViewGroup;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 136
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 117
    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    const/4 p2, 0x1

    .line 137
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setOrientation(I)V

    const p2, 0x7f0c002b

    .line 139
    invoke-static {p1, p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f09007f

    .line 141
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    const p1, 0x7f090096

    .line 142
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ViewSwitcher;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    .line 144
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    const/high16 p2, 0x60000

    invoke-virtual {p1, p2}, Landroid/widget/ViewSwitcher;->setDescendantFocusability(I)V

    const p1, 0x7f090118

    .line 145
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mTopMenuParent:Landroid/view/ViewGroup;

    .line 146
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0a000f

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mAnimationDuration:I

    .line 152
    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    const/4 p2, 0x4

    .line 153
    invoke-virtual {p1, p2}, Landroid/animation/LayoutTransition;->enableTransitionType(I)V

    .line 154
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    return-void
.end method

.method private addButton(Landroid/view/LayoutInflater;Ljava/lang/String;)V
    .locals 3

    .line 445
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    const v1, 0x7f0c002c

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 447
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06001c

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/Resources;->getColorStateList(ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 448
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 449
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    add-int/lit8 v0, p2, 0x1

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/Button;->setTag(Ljava/lang/Object;)V

    .line 450
    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 451
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method private addPickerMenu(ILjava/lang/String;Ljava/util/ArrayList;I)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;",
            ">;I)V"
        }
    .end annotation

    .line 374
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewSwitcher;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_6

    const/4 v0, 0x0

    move v1, v0

    .line 379
    :goto_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 380
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 381
    invoke-virtual {v2}, Landroid/widget/Button;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 387
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0c0029

    .line 388
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {v1, v2, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f09010f

    .line 389
    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/view/ViewGroup;

    .line 392
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getContext()Landroid/content/Context;

    move-result-object v4

    .line 393
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f07011e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v5

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v6

    .line 392
    invoke-static {v4, v5, v6}, Lcom/sonymobile/scan3d/viewer/fragments/utils/ViewerUtils;->getAdjustedPickerItemMargin(Landroid/content/Context;FI)I

    move-result v4

    move v5, v0

    .line 395
    :goto_1
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_5

    .line 396
    invoke-virtual {p3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    .line 397
    invoke-virtual {v6, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->setWhichPicker(I)V

    const v7, 0x7f090150

    if-eqz p1, :cond_3

    const v8, 0x7f0c002d

    .line 411
    invoke-virtual {v1, v8, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 413
    invoke-virtual {v6}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getDescriptionResourceId()I

    move-result v9

    if-eqz v9, :cond_2

    .line 415
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-virtual {v10, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 417
    :cond_2
    invoke-virtual {v8, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 418
    invoke-virtual {v6}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getImageResource()I

    move-result v9

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_2

    :cond_3
    const v8, 0x7f0c0091

    .line 403
    invoke-virtual {v1, v8, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v8

    .line 404
    invoke-virtual {v8, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 405
    invoke-virtual {v6}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getImageResource()I

    move-result v9

    invoke-virtual {v7, v9}, Landroid/widget/ImageView;->setImageResource(I)V

    const v7, 0x7f090151

    .line 406
    invoke-virtual {v8, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    .line 407
    invoke-virtual {v6}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getName()I

    move-result v9

    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(I)V

    .line 422
    :goto_2
    invoke-virtual {v8}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v7

    check-cast v7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 423
    invoke-virtual {v7, v4, v0, v4, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 424
    invoke-virtual {v8, v7}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    if-ne p4, v5, :cond_4

    const/4 v7, 0x1

    goto :goto_3

    :cond_4
    move v7, v0

    .line 425
    :goto_3
    invoke-virtual {v8, v7}, Landroid/view/View;->setSelected(Z)V

    .line 426
    invoke-virtual {v8, v6}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 427
    invoke-virtual {v8, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 428
    invoke-virtual {v3, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 431
    :cond_5
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 432
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1, v2}, Landroid/widget/ViewSwitcher;->addView(Landroid/view/View;)V

    .line 435
    invoke-direct {p0, v1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addButton(Landroid/view/LayoutInflater;Ljava/lang/String;)V

    return-void

    .line 375
    :cond_6
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Only 2 menu items allowed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getLayoutInflater()Landroid/view/LayoutInflater;
    .locals 1

    .line 551
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public static synthetic lambda$addSettingsMenu$0(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;Landroid/widget/Switch;Landroid/view/View;)V
    .locals 0

    .line 223
    invoke-virtual {p1}, Landroid/widget/Switch;->toggle()V

    .line 224
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mListener:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;

    if-eqz p2, :cond_0

    .line 225
    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    invoke-interface {p2, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;->onAnimateChanged(Z)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$addSettingsMenu$1(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;Landroid/widget/Switch;Landroid/view/View;)V
    .locals 0

    .line 229
    invoke-virtual {p1}, Landroid/widget/Switch;->toggle()V

    .line 230
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mListener:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;

    if-eqz p2, :cond_0

    .line 231
    invoke-virtual {p1}, Landroid/widget/Switch;->isChecked()Z

    move-result p1

    invoke-interface {p2, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;->onRotateChanged(Z)V

    :cond_0
    return-void
.end method

.method private onMenuSelectionChanged(ILandroid/widget/Button;)V
    .locals 4

    .line 495
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 496
    invoke-virtual {p2}, Landroid/widget/Button;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    const v2, 0x7f0900f9

    .line 497
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object v2

    .line 498
    invoke-virtual {p2}, Landroid/widget/Button;->getX()F

    move-result v3

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getX()F

    move-result v1

    sub-float/2addr v3, v1

    .line 500
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    invoke-static {v1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->selectOne(Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 502
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    if-le p1, p2, :cond_0

    .line 504
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    const p2, 0x7f010023

    invoke-virtual {p1, v0, p2}, Landroid/widget/ViewSwitcher;->setInAnimation(Landroid/content/Context;I)V

    .line 505
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    const p2, 0x7f010024

    invoke-virtual {p1, v0, p2}, Landroid/widget/ViewSwitcher;->setOutAnimation(Landroid/content/Context;I)V

    goto :goto_0

    .line 508
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    const p2, 0x7f010022

    invoke-virtual {p1, v0, p2}, Landroid/widget/ViewSwitcher;->setInAnimation(Landroid/content/Context;I)V

    .line 509
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    const p2, 0x7f010025

    invoke-virtual {p1, v0, p2}, Landroid/widget/ViewSwitcher;->setOutAnimation(Landroid/content/Context;I)V

    .line 513
    :goto_0
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    .line 514
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mAnimationDuration:I

    int-to-long v0, p2

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 515
    new-instance p2, Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;

    invoke-direct {p2}, Landroidx/interpolator/view/animation/FastOutLinearInInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 516
    invoke-virtual {p1, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 517
    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    .line 518
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1}, Landroid/widget/ViewSwitcher;->showNext()V

    return-void
.end method

.method private onSelectionChanged(Landroid/view/View;Z)V
    .locals 5

    .line 461
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 463
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    const v2, 0x7f09019b

    .line 465
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x0

    .line 466
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 468
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    sub-int/2addr v3, v4

    .line 470
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getX()F

    move-result v1

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v1, v3

    .line 471
    invoke-virtual {p1}, Landroid/view/View;->getX()F

    move-result v3

    .line 472
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getX()F

    move-result v4

    add-float/2addr v1, v4

    sub-float/2addr v3, v1

    if-eqz p2, :cond_0

    .line 475
    invoke-virtual {v2}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    .line 476
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mAnimationDuration:I

    int-to-long v1, v1

    invoke-virtual {p2, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 477
    new-instance v1, Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;

    invoke-direct {v1}, Landroidx/interpolator/view/animation/LinearOutSlowInInterpolator;-><init>()V

    invoke-virtual {p2, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    .line 478
    invoke-virtual {p2, v3}, Landroid/view/ViewPropertyAnimator;->translationX(F)Landroid/view/ViewPropertyAnimator;

    .line 479
    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_0

    .line 481
    :cond_0
    invoke-virtual {v2, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 485
    :goto_0
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->selectOne(Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method

.method private static selectOne(Landroid/view/ViewGroup;I)V
    .locals 0

    .line 542
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->selectOne(Landroid/view/ViewGroup;Landroid/view/View;)V

    return-void
.end method

.method private static selectOne(Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 5

    .line 528
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    .line 530
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    if-ne p1, v3, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    move v4, v1

    .line 531
    :goto_1
    invoke-virtual {v3, v4}, Landroid/view/View;->setSelected(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public addAnimationMenuListener(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;)V
    .locals 0

    .line 317
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mListener:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;

    return-void
.end method

.method public addPickerMenu(ILjava/util/ArrayList;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;",
            ">;I)V"
        }
    .end annotation

    .line 188
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    packed-switch p1, :pswitch_data_0

    .line 199
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "No such picker id "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :pswitch_0
    const v1, 0x7f100058

    .line 196
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_1
    const v1, 0x7f100057

    .line 193
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 202
    :goto_0
    invoke-direct {p0, p1, v0, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addPickerMenu(ILjava/lang/String;Ljava/util/ArrayList;I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public addSettingsMenu(ZZZ)V
    .locals 6

    .line 209
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewSwitcher;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    .line 212
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0c002a

    .line 213
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f090055

    .line 215
    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f090051

    .line 216
    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Switch;

    const v4, 0x7f09016c

    .line 218
    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f09016b

    .line 219
    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    .line 220
    invoke-virtual {v1, p3}, Landroid/widget/Switch;->setChecked(Z)V

    .line 222
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/component/-$$Lambda$AnimationMenu$CLgB2sY6GGkCibTHRZTS-S-UD_A;

    invoke-direct {p3, p0, v3}, Lcom/sonymobile/scan3d/viewer/fragments/component/-$$Lambda$AnimationMenu$CLgB2sY6GGkCibTHRZTS-S-UD_A;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;Landroid/widget/Switch;)V

    invoke-virtual {v2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 228
    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/component/-$$Lambda$AnimationMenu$DxrU5riEGyyyS7BEUPhjCwbCn8M;

    invoke-direct {p3, p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/component/-$$Lambda$AnimationMenu$DxrU5riEGyyyS7BEUPhjCwbCn8M;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;Landroid/widget/Switch;)V

    invoke-virtual {v4, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setFaceAnimationsSwitchState(ZZ)V

    .line 238
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f100059

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addButton(Landroid/view/LayoutInflater;Ljava/lang/String;)V

    return-void

    .line 210
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Only 2 menu items allowed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public doClick(Landroid/view/View;)V
    .locals 3

    .line 322
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090053

    const/4 v2, 0x1

    if-eq v0, v1, :cond_1

    const v1, 0x7f09014f

    if-eq v0, v1, :cond_0

    goto :goto_1

    .line 332
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    .line 334
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getWhichPicker()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 339
    :pswitch_0
    invoke-direct {p0, p1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->onSelectionChanged(Landroid/view/View;Z)V

    goto :goto_0

    .line 336
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    invoke-static {v1, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->selectOne(Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 347
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mListener:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;

    if-eqz p1, :cond_2

    .line 348
    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;->onItemPicked(Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;)V

    goto :goto_1

    .line 324
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 326
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    if-eq v1, v0, :cond_2

    .line 327
    check-cast p1, Landroid/widget/Button;

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->onMenuSelectionChanged(ILandroid/widget/Button;)V

    .line 328
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewSwitcher;->getChildCount()I

    move-result v0

    rem-int/2addr p1, v0

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    :cond_2
    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getSelectedMenuIndex()I
    .locals 1

    .line 362
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    return v0
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    .line 159
    invoke-super/range {p0 .. p5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    if-eqz p1, :cond_2

    const/4 p1, 0x0

    move p2, p1

    .line 162
    :goto_0
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p3}, Landroid/widget/ViewSwitcher;->getChildCount()I

    move-result p3

    if-ge p2, p3, :cond_2

    .line 163
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p3, p2}, Landroid/widget/ViewSwitcher;->getChildAt(I)Landroid/view/View;

    move-result-object p3

    const p4, 0x7f09010f

    .line 164
    invoke-virtual {p3, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Landroid/view/ViewGroup;

    if-eqz p4, :cond_1

    .line 167
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3

    const/4 p5, 0x1

    if-ne p3, p5, :cond_1

    .line 168
    invoke-virtual {p4}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p3

    move p5, p1

    :goto_1
    if-ge p5, p3, :cond_1

    .line 170
    invoke-virtual {p4, p5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 171
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 172
    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->onSelectionChanged(Landroid/view/View;Z)V

    :cond_0
    add-int/lit8 p5, p5, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setFaceAnimationsSwitchState(ZZ)V
    .locals 6

    const v0, 0x7f090055

    .line 249
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090051

    .line 250
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Switch;

    const v2, 0x7f090056

    .line 251
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    if-eqz p1, :cond_0

    const v3, 0x7f0600c8

    goto :goto_0

    :cond_0
    const v3, 0x106000b

    .line 254
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v3, v5}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    const v2, 0x7f090050

    .line 256
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    const/4 v3, 0x0

    if-eqz p1, :cond_1

    move v4, v3

    goto :goto_1

    :cond_1
    const/16 v4, 0x8

    .line 258
    :goto_1
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setVisibility(I)V

    xor-int/lit8 v2, p1, 0x1

    .line 260
    invoke-virtual {v1, v2}, Landroid/widget/Switch;->setEnabled(Z)V

    const/4 v2, 0x1

    if-nez p1, :cond_2

    if-eqz p2, :cond_2

    move v3, v2

    .line 261
    :cond_2
    invoke-virtual {v1, v3}, Landroid/widget/Switch;->setChecked(Z)V

    xor-int/2addr p1, v2

    .line 262
    invoke-virtual {v0, p1}, Landroid/view/View;->setClickable(Z)V

    return-void
.end method

.method public setup(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 308
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setup(II)V

    return-void
.end method

.method public setup(II)V
    .locals 4
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x0L
            to = 0x1L
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ltz p1, :cond_0

    if-le p1, v0, :cond_1

    :cond_0
    move p1, v1

    :cond_1
    const v2, 0x7f06001e

    if-ne p2, v2, :cond_2

    goto :goto_0

    :cond_2
    const p2, 0x7f06001d

    .line 285
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {v2, p2, v3}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setBackgroundColor(I)V

    .line 287
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p2}, Landroid/widget/ViewSwitcher;->getChildCount()I

    move-result p2

    if-ne p2, v0, :cond_3

    .line 288
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mTopMenuParent:Landroid/view/ViewGroup;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setVisibility(I)V

    goto :goto_1

    .line 290
    :cond_3
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mTopMenuParent:Landroid/view/ViewGroup;

    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 291
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    .line 292
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mButtonParent:Landroid/view/ViewGroup;

    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->selectOne(Landroid/view/ViewGroup;I)V

    .line 293
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1}, Landroid/widget/ViewSwitcher;->getCurrentView()Landroid/view/View;

    move-result-object p1

    .line 295
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSelectedMenuIndex:I

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {v0, p1}, Landroid/widget/ViewSwitcher;->indexOfChild(Landroid/view/View;)I

    move-result p1

    if-eq p2, p1, :cond_4

    .line 296
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->mSwitcher:Landroid/widget/ViewSwitcher;

    invoke-virtual {p1}, Landroid/widget/ViewSwitcher;->showNext()V

    :cond_4
    :goto_1
    return-void
.end method
