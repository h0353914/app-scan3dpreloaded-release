.class public Lcom/sonymobile/scan3d/editor/EditorFragment;
.super Landroidx/fragment/app/Fragment;
.source "EditorFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/OnBackPressListener;
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
.implements Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;
    }
.end annotation


# static fields
.field private static final ARGS_FACE_DETECTED:Ljava/lang/String; = "param_face_detected"

.field private static final ARGS_MODEL:Ljava/lang/String; = "param_model"

.field private static final ARGS_NAME:Ljava/lang/String; = "param_name"

.field private static final DIALOG_TAG:Ljava/lang/String; = "editor_discard_dialog"

.field private static final EDITOR_PREFERENCE_DISMISSED:Ljava/lang/String; = "editor_preference_dismissed"

.field private static final ID_CANCEL_EFFECT:I = 0x2

.field private static final ID_CANCEL_PARAM:I = 0x3

.field private static final ID_EXIT:I = 0x1

.field private static final TAG:Ljava/lang/String; = "EditorFragment"

.field private static final TOOLBAR_ACTION_BUTTON_ID:I = 0x0

.field private static final TOOLBAR_ACTION_IMAGE_ID:I = 0x1


# instance fields
.field private mBeginCalled:Z

.field private mBottomBarAction:Landroid/view/ViewGroup;

.field private mBottomBarCurrent:Landroid/view/ViewGroup;

.field private mBottomBarMain:Landroid/view/ViewGroup;

.field private mBottomBarParameters:Landroid/view/ViewGroup;

.field private mBottomBarSlider:Landroid/view/ViewGroup;

.field private mBottomBarSliderLabel:Landroid/widget/TextView;

.field private mBottomBarSliderValue:Landroid/widget/SeekBar;

.field private mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

.field private mCurrentParam:I

.field private mEffectGroups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

.field private mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

.field private mHandler:Landroid/os/Handler;

.field private mIsChanged:Z

.field private mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mModelOrig:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mParamIcons:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

.field private mUiActionPending:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 89
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 122
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 130
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mUiActionPending:Z

    .line 146
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    .line 215
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mEffectGroups:Ljava/util/List;

    .line 220
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mParamIcons:Ljava/util/List;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/editor/EditorFragment;)Landroid/view/ViewGroup;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarParameters:Landroid/view/ViewGroup;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/editor/EditorFragment;)Ljava/util/List;
    .locals 0

    .line 89
    iget-object p0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mParamIcons:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;IIZ)V
    .locals 0

    .line 89
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showParam(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;IIZ)V

    return-void
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 0

    .line 89
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->endUIGLAction()V

    return-void
.end method

.method private applyParam()V
    .locals 1

    .line 779
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    if-nez v0, :cond_0

    return-void

    .line 780
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->paramClosed()V

    return-void
.end method

.method private beginUIGLAction()Z
    .locals 2

    .line 937
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mUiActionPending:Z

    if-eqz v0, :cond_0

    .line 938
    sget-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment;->TAG:Ljava/lang/String;

    const-string v1, "beginUIGLAction ignored, mUiActionPending==true!"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    .line 941
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mUiActionPending:Z

    return v0
.end method

.method private cancelEffectGroup()V
    .locals 2

    .line 712
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->beginUIGLAction()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 713
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    .line 714
    new-instance v0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$Nu4Ik2Ihu-c1P4zkRwv1nW7ArZc;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$Nu4Ik2Ihu-c1P4zkRwv1nW7ArZc;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$RYZdJUgTbGk2S_6B4PIcHlPrNpg;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$RYZdJUgTbGk2S_6B4PIcHlPrNpg;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->runOnGLThenUIThread(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method private cancelParam()V
    .locals 1

    .line 784
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    if-nez v0, :cond_0

    return-void

    .line 785
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/editor/FxManager;->restoreParams()V

    .line 786
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->paramClosed()V

    return-void
.end method

.method private createAdjustEffectsGroup()Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;
    .locals 7

    .line 619
    new-instance v6, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    sget-object v5, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_ADJUST:Lcom/sonymobile/scan3d/FxManagerEffects;

    const v2, 0x7f1000f0

    const v3, 0x7f0800aa

    const/4 v4, 0x0

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;IIILcom/sonymobile/scan3d/FxManagerEffects;)V

    .line 622
    sget-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_BRIGHTNESS:Lcom/sonymobile/scan3d/FxAdjustType;

    const/4 v1, 0x1

    const v2, 0x7f1000f1

    const v3, 0x7f0800ab

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 624
    sget-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_CONTRAST:Lcom/sonymobile/scan3d/FxAdjustType;

    const v2, 0x7f1000f2

    const v3, 0x7f0800ac

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 626
    sget-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_SHADOWS:Lcom/sonymobile/scan3d/FxAdjustType;

    const v2, 0x7f1000f4

    const v3, 0x7f0800ae

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 628
    sget-object v0, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_SMOOTH:Lcom/sonymobile/scan3d/FxAdjustType;

    const v2, 0x7f1000f5

    const v3, 0x7f0800af

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 630
    sget-object v1, Lcom/sonymobile/scan3d/FxAdjustType;->ADJUST_EYES:Lcom/sonymobile/scan3d/FxAdjustType;

    .line 631
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "param_face_detected"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v5

    const v2, 0x7f1000f3

    const v3, 0x7f1000fb

    const v4, 0x7f0800ad

    move-object v0, v6

    .line 630
    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIIZ)V

    return-object v6
.end method

.method private createCropEffectsGroup()Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;
    .locals 7

    .line 614
    new-instance v6, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    sget-object v5, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_CUT:Lcom/sonymobile/scan3d/FxManagerEffects;

    const v2, 0x7f1000f6

    const v3, 0x7f0800b0

    const v4, 0x7f1000f7

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;IIILcom/sonymobile/scan3d/FxManagerEffects;)V

    return-object v6
.end method

.method private createMainBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 5

    .line 656
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mEffectGroups:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    const v2, 0x7f0c0054

    const/4 v3, 0x0

    .line 658
    invoke-virtual {p1, v2, p2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 659
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->getDrawable()I

    move-result v4

    invoke-virtual {v2, v3, v4, v3, v3}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(IIII)V

    .line 660
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->getText()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    .line 661
    invoke-virtual {v2, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v3, 0x7f090006

    .line 662
    invoke-virtual {v2, v3, v1}, Landroid/widget/TextView;->setTag(ILjava/lang/Object;)V

    .line 663
    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private createMorphEffectsGroup()Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;
    .locals 7

    .line 636
    new-instance v6, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    sget-object v5, Lcom/sonymobile/scan3d/FxManagerEffects;->EFFECT_SCALE:Lcom/sonymobile/scan3d/FxManagerEffects;

    const v2, 0x7f1000fd

    const v3, 0x7f0800b1

    const/4 v4, 0x0

    move-object v0, v6

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;IIILcom/sonymobile/scan3d/FxManagerEffects;)V

    .line 639
    sget-object v0, Lcom/sonymobile/scan3d/FxScaleType;->SCALE_ALIEN:Lcom/sonymobile/scan3d/FxScaleType;

    const/4 v1, 0x1

    const v2, 0x7f1000fe

    const v3, 0x7f0800b2

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 640
    sget-object v0, Lcom/sonymobile/scan3d/FxScaleType;->SCALE_BRUTE:Lcom/sonymobile/scan3d/FxScaleType;

    const v2, 0x7f1000ff

    const v3, 0x7f0800b3

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 641
    sget-object v0, Lcom/sonymobile/scan3d/FxScaleType;->SCALE_ROUND:Lcom/sonymobile/scan3d/FxScaleType;

    const v2, 0x7f100100

    const v3, 0x7f0800b4

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    .line 642
    sget-object v0, Lcom/sonymobile/scan3d/FxScaleType;->SCALE_SLIM:Lcom/sonymobile/scan3d/FxScaleType;

    const v2, 0x7f100101

    const v3, 0x7f0800b5

    invoke-virtual {v6, v0, v2, v3, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->add(Ljava/lang/Enum;IIZ)V

    return-object v6
.end method

.method private endUIGLAction()V
    .locals 1

    const/4 v0, 0x0

    .line 951
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mUiActionPending:Z

    return-void
.end method

.method private fadeIn(Landroid/view/ViewGroup;Z)V
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    .line 842
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 843
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 845
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 846
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    const v0, 0x7f01001e

    invoke-static {p2, v0}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object p2

    .line 847
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method private fadeOut(Landroid/view/ViewGroup;)V
    .locals 3

    const/4 v0, 0x0

    move v1, v0

    .line 833
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 834
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/view/View;->setEnabled(Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    .line 836
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 837
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f01001d

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    .line 838
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method private gotoEffectGroup(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V
    .locals 2

    .line 751
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->beginUIGLAction()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 752
    :cond_0
    new-instance v0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;

    invoke-direct {v0, p0, p1}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$9Rbw_EM5OyHXQR64vdXnRHzZCJs;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$SrKPplVloUguDP05fjMhLy1QTxo;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$SrKPplVloUguDP05fjMhLy1QTxo;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->runOnGLThenUIThread(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method private gotoMainView()V
    .locals 2

    .line 744
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarMain:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showBottomBar(Landroid/view/ViewGroup;Z)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 745
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateToolbar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Z)V

    .line 746
    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    .line 747
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public static synthetic lambda$0EqwdOWIBzhiZO_GlS2sL5MG-XU(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->gotoMainView()V

    return-void
.end method

.method public static synthetic lambda$cancelEffectGroup$10(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 2

    .line 715
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/editor/FxManager;->end(Z)V

    return-void
.end method

.method public static synthetic lambda$cancelEffectGroup$11(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 0

    .line 717
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->gotoMainView()V

    .line 718
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->endUIGLAction()V

    return-void
.end method

.method public static synthetic lambda$gotoEffectGroup$12(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V
    .locals 1

    .line 753
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->getEffectId()Lcom/sonymobile/scan3d/FxManagerEffects;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/editor/FxManager;->begin(Lcom/sonymobile/scan3d/FxManagerEffects;)V

    return-void
.end method

.method public static synthetic lambda$gotoEffectGroup$13(Lcom/sonymobile/scan3d/editor/EditorFragment;Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V
    .locals 2

    .line 755
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->loadEffectsBottomBar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)Landroid/view/ViewGroup;

    move-result-object v0

    const/4 v1, 0x1

    .line 756
    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showBottomBar(Landroid/view/ViewGroup;Z)V

    const/4 v0, 0x0

    .line 757
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateToolbar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Z)V

    .line 758
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    .line 759
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->endUIGLAction()V

    return-void
.end method

.method public static synthetic lambda$null$2(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 0

    .line 484
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->requestRenderGLTextureView()V

    .line 485
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->endUIGLAction()V

    return-void
.end method

.method public static synthetic lambda$null$5(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 2

    .line 679
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/editor/FxManager;->isChanged()Z

    move-result v1

    or-int/2addr v0, v1

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    .line 680
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/editor/FxManager;->end(Z)V

    return-void
.end method

.method public static synthetic lambda$null$6(Lcom/sonymobile/scan3d/editor/EditorFragment;)V
    .locals 0

    .line 682
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->gotoMainView()V

    .line 683
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->endUIGLAction()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/view/View;)V
    .locals 0

    .line 472
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->applyParam()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/view/View;)V
    .locals 0

    .line 474
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->cancelParam()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$3(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/view/View;)V
    .locals 1

    .line 480
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->beginUIGLAction()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 481
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/sonymobile/scan3d/editor/-$$Lambda$COVJOEmZXtOt48FPsNym42qJbDE;

    invoke-direct {v0, p1}, Lcom/sonymobile/scan3d/editor/-$$Lambda$COVJOEmZXtOt48FPsNym42qJbDE;-><init>(Lcom/sonymobile/scan3d/editor/FxManager;)V

    new-instance p1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$e2J24AtWNXoPzQyRJMqXuAJFtDU;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$e2J24AtWNXoPzQyRJMqXuAJFtDU;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->runOnGLThenUIThread(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$onCreateView$4(Landroid/content/SharedPreferences;Landroid/widget/LinearLayout;Landroid/view/View;)V
    .locals 1

    .line 495
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p2, "editor_preference_dismissed"

    const/4 v0, 0x1

    .line 496
    invoke-interface {p0, p2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 497
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    const/16 p0, 0x8

    .line 498
    invoke-virtual {p1, p0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    return-void
.end method

.method public static synthetic lambda$runOnGLThenUIThread$15(Lcom/sonymobile/scan3d/editor/EditorFragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 0

    .line 961
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 962
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic lambda$saveModel$14(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 7

    .line 885
    new-instance v6, Lcom/sonymobile/scan3d/editor/EditorFragment$1;

    iget-object v3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-object v0, v6

    move-object v1, p0

    move-object v2, p1

    move-object v4, p2

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/editor/EditorFragment$1;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;Landroid/app/Activity;)V

    const/4 p1, 0x0

    .line 920
    new-array p2, p1, [Ljava/lang/Void;

    invoke-virtual {v6, p2}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 921
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    const/4 p2, 0x0

    .line 922
    invoke-direct {p0, p2, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateToolbar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Z)V

    return-void
.end method

.method public static synthetic lambda$setupToolbar$7(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/view/View;)V
    .locals 1

    .line 676
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->beginUIGLAction()Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 p1, 0x0

    .line 677
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    .line 678
    new-instance p1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$8EvvoOMz4gq9VGLfRaEw0aNk_R4;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$8EvvoOMz4gq9VGLfRaEw0aNk_R4;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    new-instance v0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$bSgaTcqinW5PaHeQBRLJwBrtNYo;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$bSgaTcqinW5PaHeQBRLJwBrtNYo;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->runOnGLThenUIThread(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method public static synthetic lambda$setupToolbar$8(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/view/View;)V
    .locals 2

    .line 689
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    .line 691
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "param_name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f1000ca

    .line 690
    invoke-static {v0, v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->newInstance(Ljava/lang/String;ILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;

    move-result-object v0

    const-string v1, "editor_discard_dialog"

    .line 693
    invoke-virtual {v0, p1, v1}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic lambda$setupToolbar$9(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/view/View;)V
    .locals 0

    .line 697
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->onBackPressed()Z

    move-result p1

    if-nez p1, :cond_0

    .line 698
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finishAfterTransition()V

    :cond_0
    return-void
.end method

.method private loadEffectsBottomBar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)Landroid/view/ViewGroup;
    .locals 2

    .line 764
    sget-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment$2;->$SwitchMap$com$sonymobile$scan3d$FxType:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/editor/FxManager;->getType()Lcom/sonymobile/scan3d/FxType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/FxType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    const/4 p1, 0x0

    return-object p1

    .line 771
    :pswitch_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->access$300(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V

    .line 772
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarParameters:Landroid/view/ViewGroup;

    return-object p1

    .line 766
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarAction:Landroid/view/ViewGroup;

    const v1, 0x7f09006d

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 767
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->getButtonLabel()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setText(I)V

    .line 768
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarAction:Landroid/view/ViewGroup;

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;Z)Landroidx/fragment/app/Fragment;
    .locals 3

    .line 372
    new-instance v0, Lcom/sonymobile/scan3d/editor/EditorFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;-><init>()V

    .line 373
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "param_model"

    .line 374
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    const-string p0, "param_name"

    .line 375
    invoke-virtual {v1, p0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "param_face_detected"

    .line 376
    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 377
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private paramClosed()V
    .locals 3

    .line 790
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateParamViews()V

    .line 791
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateToolbar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Z)V

    .line 792
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->EDIT_APPLY:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->getEffectId()Lcom/sonymobile/scan3d/FxManagerEffects;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/FxManagerEffects;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    .line 793
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarParameters:Landroid/view/ViewGroup;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showBottomBar(Landroid/view/ViewGroup;Z)V

    .line 794
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method private requestRenderGLTextureView()V
    .locals 1

    .line 704
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 705
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    :cond_0
    return-void
.end method

.method private runOnGLThenUIThread(Ljava/lang/Runnable;Ljava/lang/Runnable;)V
    .locals 2

    .line 960
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;

    invoke-direct {v1, p0, p1, p2}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$-aousJgreI-ANVVPJ8LVNwonCzA;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private saveModel(Ljava/lang/String;)V
    .locals 3

    .line 879
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    .line 881
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->beginUIGLAction()Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 882
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lcom/sonymobile/scan3d/editor/-$$Lambda$prnij-wNDjfE2OXCIG3regP2Vs0;

    invoke-direct {v2, v1}, Lcom/sonymobile/scan3d/editor/-$$Lambda$prnij-wNDjfE2OXCIG3regP2Vs0;-><init>(Lcom/sonymobile/scan3d/editor/FxManager;)V

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;

    invoke-direct {v1, p0, v0, p1}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$EJvvlDPRTnpin_eb1xDRjNa7N78;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-direct {p0, v2, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->runOnGLThenUIThread(Ljava/lang/Runnable;Ljava/lang/Runnable;)V

    return-void
.end method

.method private setNoFaceDetectedMessageVisibility(Z)V
    .locals 2

    .line 824
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const v1, 0x7f090134

    .line 826
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/16 p1, 0x8

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private setupOrientation(I)V
    .locals 1

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    .line 649
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarAction:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    const v0, 0x800005

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setHorizontalGravity(I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 651
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarAction:Landroid/view/ViewGroup;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setHorizontalGravity(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private setupToolbar(Landroid/view/View;)V
    .locals 2

    const v0, 0x7f0901f8

    .line 668
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Toolbar;

    const v0, 0x7f0901f9

    .line 670
    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ViewSwitcher;

    const/4 v1, 0x0

    .line 671
    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 672
    invoke-virtual {v0, v1}, Landroid/widget/ViewSwitcher;->setEnabled(Z)V

    const v0, 0x7f090057

    .line 674
    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 675
    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$FBUnPOwpuYZFBkDlY8NsW6Dnovk;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$FBUnPOwpuYZFBkDlY8NsW6Dnovk;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f090173

    .line 687
    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 688
    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$DsYybhN2Yv98S1NWGG7rpdN7QJI;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$DsYybhN2Yv98S1NWGG7rpdN7QJI;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 696
    new-instance v0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$xdqkKDKOUYaAIFnRq6opxoDWU7s;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$xdqkKDKOUYaAIFnRq6opxoDWU7s;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/Toolbar;->setNavigationOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showBottomBar(Landroid/view/ViewGroup;Z)V
    .locals 1

    .line 734
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarCurrent:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    .line 735
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->fadeOut(Landroid/view/ViewGroup;)V

    :cond_0
    if-eqz p1, :cond_1

    .line 738
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/editor/EditorFragment;->fadeIn(Landroid/view/ViewGroup;Z)V

    .line 740
    :cond_1
    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarCurrent:Landroid/view/ViewGroup;

    return-void
.end method

.method private showDiscardDialog(I)V
    .locals 7

    .line 723
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v2, 0x0

    const v3, 0x7f1000fa

    const v4, 0x7f1000f8

    const v5, 0x7f1000f9

    const/4 v6, 0x0

    move v1, p1

    .line 725
    invoke-static/range {v1 .. v6}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(IIIIILandroid/os/Parcelable;)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object p1

    const/4 v1, 0x0

    .line 729
    invoke-virtual {p1, p0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string v1, "editor_discard_dialog"

    .line 730
    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showParam(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;IIZ)V
    .locals 1

    .line 805
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    if-ne v0, p1, :cond_0

    .line 806
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/editor/FxManager;->saveParams()V

    .line 807
    iput p3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentParam:I

    .line 808
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderLabel:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(I)V

    .line 809
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderValue:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p2

    int-to-float p2, p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v0, p3}, Lcom/sonymobile/scan3d/editor/FxManager;->getParamValue(I)F

    move-result p3

    mul-float/2addr p2, p3

    float-to-int p2, p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 810
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateParamFromSeekBar()V

    .line 811
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateToolbar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Z)V

    xor-int/lit8 p1, p4, 0x1

    .line 812
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->setNoFaceDetectedMessageVisibility(Z)V

    .line 813
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    invoke-direct {p0, p1, p4}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showBottomBar(Landroid/view/ViewGroup;Z)V

    :cond_0
    return-void
.end method

.method private updateParamFromSeekBar()V
    .locals 3

    .line 818
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderValue:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderValue:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    .line 819
    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    iget v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentParam:I

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/editor/FxManager;->setParamValue(IF)V

    .line 820
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method private updateParamViews()V
    .locals 4

    const/4 v0, 0x0

    move v1, v0

    .line 798
    :goto_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/editor/FxManager;->getParamCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 799
    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mParamIcons:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    const v3, 0x7f09008d

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    .line 800
    iget-object v3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v3, v1}, Lcom/sonymobile/scan3d/editor/FxManager;->isParamChanged(I)Z

    move-result v3

    if-eqz v3, :cond_0

    move v3, v0

    goto :goto_1

    :cond_0
    const/16 v3, 0x8

    :goto_1
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private updateToolbar(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;Z)V
    .locals 4

    .line 851
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0901f8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Toolbar;

    const v1, 0x7f0901f9

    .line 852
    invoke-virtual {v0, v1}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ViewSwitcher;

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    .line 854
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;->getText()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitle(I)V

    const p1, 0x7f0800d1

    .line 855
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    const p1, 0x7f10002b

    .line 856
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    const/4 p1, 0x1

    .line 857
    invoke-virtual {v1, p1}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    if-eqz p2, :cond_0

    const/16 v2, 0x8

    .line 858
    :cond_0
    invoke-virtual {v1, v2}, Landroid/widget/ViewSwitcher;->setVisibility(I)V

    .line 859
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f060058

    .line 860
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p1

    .line 859
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setBackgroundColor(I)V

    goto :goto_0

    :cond_1
    const p1, 0x7f0800cb

    .line 862
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    const p1, 0x7f10002a

    .line 863
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    const p1, 0x7f100103

    .line 864
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitle(I)V

    .line 866
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f06005a

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v3}, Landroidx/fragment/app/FragmentActivity;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    invoke-virtual {p1, p2, v3}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p1

    .line 865
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setBackgroundColor(I)V

    .line 868
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    invoke-virtual {v1, p1}, Landroid/widget/ViewSwitcher;->setEnabled(Z)V

    const p1, 0x7f090173

    .line 870
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object p1

    .line 871
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    .line 873
    invoke-virtual {v1, v2}, Landroid/widget/ViewSwitcher;->setDisplayedChild(I)V

    .line 874
    invoke-virtual {v1, v2}, Landroid/widget/ViewSwitcher;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    .line 554
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const v0, 0x7f090006

    .line 555
    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    if-eqz p1, :cond_1

    .line 557
    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    .line 558
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->gotoEffectGroup(Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;)V

    .line 559
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->requestRenderGLTextureView()V

    :cond_1
    return-void
.end method

.method public isUiActionPending()Z
    .locals 1

    .line 610
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mUiActionPending:Z

    return v0
.end method

.method public onBackPressed()Z
    .locals 4

    .line 506
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mUiActionPending:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 507
    sget-object v0, Lcom/sonymobile/scan3d/editor/EditorFragment;->TAG:Ljava/lang/String;

    const-string v2, "onBackPressed ignored, mUiActionPending==true!"

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    .line 512
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarCurrent:Landroid/view/ViewGroup;

    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    const/4 v3, 0x0

    if-ne v0, v2, :cond_2

    .line 514
    invoke-direct {p0, v3}, Lcom/sonymobile/scan3d/editor/EditorFragment;->setNoFaceDetectedMessageVisibility(Z)V

    .line 515
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    iget v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentParam:I

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/editor/FxManager;->isParamChanged(I)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    .line 516
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showDiscardDialog(I)V

    goto :goto_0

    .line 518
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->cancelParam()V

    :goto_0
    return v1

    .line 525
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mCurrentEffectGroup:Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    if-eqz v0, :cond_4

    .line 526
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/editor/FxManager;->isChanged()Z

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x2

    .line 527
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showDiscardDialog(I)V

    goto :goto_1

    .line 529
    :cond_3
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->cancelEffectGroup()V

    :goto_1
    return v1

    .line 536
    :cond_4
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    if-eqz v0, :cond_5

    .line 537
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->showDiscardDialog(I)V

    return v1

    :cond_5
    return v3
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 547
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 548
    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->setupOrientation(I)V

    .line 549
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 383
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 384
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "param_model"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModelOrig:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 386
    new-instance p1, Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    .line 388
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mEffectGroups:Ljava/util/List;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->createAdjustEffectsGroup()Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 389
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mEffectGroups:Ljava/util/List;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->createCropEffectsGroup()Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 390
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mEffectGroups:Ljava/util/List;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->createMorphEffectsGroup()Lcom/sonymobile/scan3d/editor/EditorFragment$EffectGroup;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 392
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModelOrig:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 393
    sget-object p1, Lcom/sonymobile/scan3d/editor/EditorFragment;->TAG:Ljava/lang/String;

    const-string v0, "Model is missing, closing activity! (probably process was restarted)"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 394
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    const/4 p3, 0x0

    const v0, 0x7f0c0065

    .line 459
    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f0900e1

    .line 460
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    .line 462
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    sget-object v2, Lcom/sonymobile/scan3d/ScenoID;->SCENO_TEXTURED:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->start(Lcom/sonymobile/scan3d/viewer/MeshRenderer;Lcom/sonymobile/scan3d/ScenoID;)V

    .line 463
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->addSurfaceListener(Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView$SurfaceListener;)V

    .line 465
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/editor/EditorFragment;->setupToolbar(Landroid/view/View;)V

    const v0, 0x7f090060

    .line 466
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarAction:Landroid/view/ViewGroup;

    const v0, 0x7f090063

    .line 467
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    .line 468
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    const v1, 0x7f090066

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderLabel:Landroid/widget/TextView;

    .line 469
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    const v1, 0x7f090067

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderValue:Landroid/widget/SeekBar;

    .line 470
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSliderValue:Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 471
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    const v1, 0x7f090064

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$4s4PRuDSN6uNi6IYLlE0kXgznBU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$4s4PRuDSN6uNi6IYLlE0kXgznBU;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 473
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarSlider:Landroid/view/ViewGroup;

    const v1, 0x7f090065

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$t5l6-Qi0MGKZ1KXfJFpLe4abHdU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$t5l6-Qi0MGKZ1KXfJFpLe4abHdU;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f090062

    .line 475
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarParameters:Landroid/view/ViewGroup;

    const v0, 0x7f090061

    .line 476
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarMain:Landroid/view/ViewGroup;

    .line 477
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarMain:Landroid/view/ViewGroup;

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->createMainBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    .line 479
    iget-object p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBottomBarAction:Landroid/view/ViewGroup;

    const v0, 0x7f09006d

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$5GgvuKY1_Jnqi3u31108g2-RAxs;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$5GgvuKY1_Jnqi3u31108g2-RAxs;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 489
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->setupOrientation(I)V

    .line 490
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    const-string v0, "editor_preference_dismissed"

    .line 491
    invoke-interface {p1, v0, p3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f0900e9

    .line 492
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 493
    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    const p3, 0x7f0900e3

    .line 494
    invoke-virtual {v0, p3}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object p3

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;

    invoke-direct {v1, p1, v0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$oD6IqBGLpMSWOLr-BwIpykW6Gqg;-><init>(Landroid/content/SharedPreferences;Landroid/widget/LinearLayout;)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-object p2
.end method

.method public onDestroy()V
    .locals 1

    .line 400
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->release()V

    const/4 v0, 0x0

    .line 401
    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    .line 402
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onNameChanged(Ljava/lang/String;)V
    .locals 0

    .line 587
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/editor/EditorFragment;->saveModel(Ljava/lang/String;)V

    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 446
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    .line 447
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->onPause()V

    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 2

    packed-switch p1, :pswitch_data_0

    .line 576
    new-instance p2, Ljava/lang/RuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown id "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 567
    :pswitch_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->cancelParam()V

    goto :goto_0

    .line 570
    :pswitch_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->cancelEffectGroup()V

    goto :goto_0

    .line 573
    :pswitch_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finishAfterTransition()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    .line 592
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    if-nez p1, :cond_0

    return-void

    .line 593
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->updateParamFromSeekBar()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 440
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 441
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->onResume()V

    return-void
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 2

    .line 452
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/editor/EditorFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const-string v1, "editor_discard_dialog"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/DialogFragment;

    if-eqz v0, :cond_0

    .line 453
    invoke-virtual {v0}, Landroidx/fragment/app/DialogFragment;->dismissAllowingStateLoss()V

    .line 454
    :cond_0
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onSurfaceChanged(II)V
    .locals 0

    return-void
.end method

.method public onSurfaceCreated()V
    .locals 3

    .line 407
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModelOrig:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copy()Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 408
    new-instance v0, Lcom/sonymobile/scan3d/editor/FxManager;

    iget-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/editor/FxManager;-><init>(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/MeshRenderer;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    .line 409
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$0EqwdOWIBzhiZO_GlS2sL5MG-XU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/editor/-$$Lambda$EditorFragment$0EqwdOWIBzhiZO_GlS2sL5MG-XU;-><init>(Lcom/sonymobile/scan3d/editor/EditorFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onSurfaceDestroyed()V
    .locals 4

    .line 420
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 421
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_0

    .line 422
    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/editor/FxManager;->end(Z)V

    .line 423
    iput-boolean v3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mBeginCalled:Z

    .line 425
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeMeshes()V

    .line 426
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/editor/FxManager;->release()V

    .line 427
    iput-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mFxManager:Lcom/sonymobile/scan3d/editor/FxManager;

    .line 429
    iput-boolean v3, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mIsChanged:Z

    .line 432
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_2

    .line 433
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 434
    iput-object v1, p0, Lcom/sonymobile/scan3d/editor/EditorFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    :cond_2
    return-void
.end method
