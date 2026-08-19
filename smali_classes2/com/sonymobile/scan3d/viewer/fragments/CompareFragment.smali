.class public Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.source "CompareFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;
    }
.end annotation


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "com.sonymobile.scan3d.viewer.fragments.CompareFragment"

.field private static final KEY_ANIMATION_COMPLETED:Ljava/lang/String; = "KEY_ANIMATION_COMPLETED"

.field private static final KEY_IMPROVEMENT:Ljava/lang/String; = "KEY_IMPROVEMENTS"

.field private static final KEY_SHOW_IMPROVED:Ljava/lang/String; = "KEY_SHOW_IMPROVED"

.field private static final QUESTION_DISCARD_IMPROVEMENT_ID:I


# instance fields
.field private mAnimationCompleted:Z

.field private mBottomBar:Landroid/view/View;

.field private mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

.field private mImprovedMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field private mImprovedModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mIntroAnimation:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;

.field private mKnobButton:Landroid/widget/ToggleButton;

.field private mKnobButtonParent:Landroid/view/View;

.field private mOriginalMeshFailedToLoad:Z

.field private mScreenWidth:I

.field private mShowImproved:Z

.field private mSplitLine:Landroid/view/View;

.field private mSplitScreenView:Lcom/sonymobile/scan3d/viewer/SplitScreenView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;-><init>()V

    const/4 v0, 0x1

    .line 77
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mShowImproved:Z

    const/4 v0, 0x0

    .line 107
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Lcom/sonymobile/scan3d/viewer/SplitScreenView;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitScreenView:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Landroid/view/View;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButtonParent:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)Landroid/view/View;
    .locals 0

    .line 41
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mBottomBar:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$502(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;Z)Z
    .locals 0

    .line 41
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    return p1
.end method

.method private getImprovedUri()Landroid/net/Uri;
    .locals 2

    .line 392
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_IMPROVEMENTS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 393
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private getOriginalUri()Landroid/net/Uri;
    .locals 2

    .line 402
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_IMPROVEMENTS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 403
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getParentUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private gotoViewer()V
    .locals 3

    .line 379
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 380
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1003

    .line 381
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    .line 382
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->newInstance()Landroidx/fragment/app/Fragment;

    move-result-object v1

    const v2, 0x7f0900dc

    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 383
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;Landroid/view/View;)V
    .locals 1

    .line 183
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {p1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 184
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setTextured(F)V

    .line 185
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public static synthetic lambda$setupBottomBar$1(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;Landroid/view/View;)V
    .locals 1

    .line 252
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0900b5

    if-eq p1, v0, :cond_1

    const v0, 0x7f090103

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 254
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->showEditNameDialog()V

    goto :goto_0

    .line 257
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->showDiscardDialog()V

    :goto_0
    return-void
.end method

.method public static synthetic lambda$updateUi$2(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;F)V
    .locals 2

    .line 321
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitLine:Landroid/view/View;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mScreenWidth:I

    int-to-float v1, v1

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setX(F)V

    .line 322
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setSplitRatio(F)V

    .line 323
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;
    .locals 2

    .line 128
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "KEY_IMPROVEMENTS"

    .line 129
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 131
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;-><init>()V

    .line 132
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private showDiscardDialog()V
    .locals 4

    .line 366
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f1000c9

    const v3, 0x7f1002ad

    .line 368
    invoke-static {v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(III)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object v2

    .line 371
    invoke-virtual {v2, p0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 372
    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->DIALOG_TAG:Ljava/lang/String;

    invoke-virtual {v2, v0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showEditNameDialog()V
    .locals 3

    .line 355
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "KEY_IMPROVEMENTS"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 356
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    .line 357
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetUri()Landroid/net/Uri;

    move-result-object v2

    .line 358
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getName()Ljava/lang/String;

    move-result-object v0

    .line 357
    invoke-static {v2, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->newInstance(Landroid/net/Uri;Landroidx/fragment/app/Fragment;Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;

    move-result-object v0

    .line 359
    sget-object v2, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->DIALOG_TAG:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private updateUi()V
    .locals 8

    .line 312
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 313
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_1

    .line 315
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->dismissProgressDialog()V

    .line 316
    new-instance v0, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v6, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 318
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v7

    invoke-direct {v0, v5, v6, v7}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;-><init>(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/MeshRenderer;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    .line 319
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->requestRenderGLTextureView()V

    .line 320
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitScreenView:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    new-instance v5, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$CompareFragment$cuLD0sGd3ixEYVpuAoY-RB7a7Tk;

    invoke-direct {v5, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$CompareFragment$cuLD0sGd3ixEYVpuAoY-RB7a7Tk;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)V

    invoke-virtual {v0, v5}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setOnSplitScreenViewListener(Lcom/sonymobile/scan3d/viewer/SplitScreenView$OnSplitScreenViewListener;)V

    .line 326
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitScreenView:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    invoke-virtual {v0, v4}, Lcom/sonymobile/scan3d/viewer/SplitScreenView;->setVisibility(I)V

    .line 327
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitLine:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 328
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {v4}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_0
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setTextured(F)V

    .line 330
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    if-nez v0, :cond_3

    .line 331
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;

    invoke-direct {v0, p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$1;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mIntroAnimation:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;

    .line 332
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mIntroAnimation:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->startAnimation()V

    goto :goto_2

    .line 334
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mOriginalMeshFailedToLoad:Z

    if-eqz v0, :cond_3

    .line 336
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->dismissProgressDialog()V

    const/4 v0, 0x1

    .line 337
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    .line 338
    new-instance v0, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 341
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v6

    invoke-direct {v0, v2, v5, v6}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;-><init>(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/MeshRenderer;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    .line 342
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {v2}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_1

    :cond_2
    move v1, v3

    :goto_1
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setTextured(F)V

    .line 343
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setSplitRatio(F)V

    .line 344
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->requestRenderGLTextureView()V

    .line 345
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButtonParent:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 346
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mBottomBar:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    :goto_2
    return-void
.end method


# virtual methods
.method public bridge synthetic allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 41
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c0062

    return v0
.end method

.method public bridge synthetic onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 41
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 161
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    .line 165
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 166
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getOriginalUri()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 168
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    if-eqz p3, :cond_0

    const-string p2, "KEY_SHOW_IMPROVED"

    const/4 v0, 0x1

    .line 171
    invoke-virtual {p3, p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mShowImproved:Z

    const-string p2, "KEY_ANIMATION_COMPLETED"

    const/4 v0, 0x0

    .line 172
    invoke-virtual {p3, p2, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    :cond_0
    const p2, 0x7f0901e5

    .line 175
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ToggleButton;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    const p2, 0x7f0901e6

    .line 176
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButtonParent:Landroid/view/View;

    const p2, 0x7f09005f

    .line 178
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mBottomBar:Landroid/view/View;

    const p2, 0x7f0901b9

    .line 179
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitScreenView:Lcom/sonymobile/scan3d/viewer/SplitScreenView;

    const p2, 0x7f09010c

    .line 180
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mSplitLine:Landroid/view/View;

    .line 182
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButtonParent:Landroid/view/View;

    new-instance p3, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$CompareFragment$Iim0xkJ2OcS3WZYk9omdxAg08Rc;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$CompareFragment$Iim0xkJ2OcS3WZYk9omdxAg08Rc;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 188
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const-string p3, "window"

    invoke-virtual {p2, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/WindowManager;

    .line 189
    new-instance p3, Landroid/graphics/Point;

    invoke-direct {p3}, Landroid/graphics/Point;-><init>()V

    .line 190
    invoke-interface {p2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/view/Display;->getSize(Landroid/graphics/Point;)V

    .line 191
    iget p2, p3, Landroid/graphics/Point;->x:I

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mScreenWidth:I

    return-object p1
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 41
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .line 197
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mIntroAnimation:Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment$IntroAnimation;->cancelAnimation()V

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->release()V

    .line 199
    :cond_1
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroyView()V

    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 41
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 1

    .line 223
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 224
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getOriginalUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 225
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mOriginalMeshFailedToLoad:Z

    .line 226
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->updateUi()V

    goto :goto_0

    .line 228
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->handleFailedMesh()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 211
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 212
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getImprovedUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 213
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    goto :goto_0

    .line 215
    :cond_0
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 217
    :goto_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->updateUi()V

    :cond_1
    return-void
.end method

.method public bridge synthetic onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    .line 41
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method public onNameChanged(Ljava/lang/String;)V
    .locals 4

    .line 273
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mImprovedMeshHolder:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setName(Ljava/lang/String;)V

    .line 274
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "KEY_IMPROVEMENTS"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 276
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->delete(Landroid/content/Context;Landroid/net/Uri;)V

    .line 278
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "sync_state"

    const/4 v2, 0x0

    .line 279
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "is_improvement"

    const/4 v2, 0x1

    .line 280
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 281
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getFileSetUri()Landroid/net/Uri;

    move-result-object p1

    invoke-static {v1, p1, v0, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V

    .line 283
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->IMPROVEMENT_KEPT:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-wide/16 v1, 0x1

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 284
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->gotoViewer()V

    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .line 41
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPause()V

    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 2

    .line 293
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "KEY_IMPROVEMENTS"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 294
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteImprovement(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)V

    .line 296
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->IMPROVEMENT_DISCARDED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    const-wide/16 v0, 0x1

    invoke-virtual {p1, p2, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 297
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public bridge synthetic onResume()V
    .locals 0

    .line 41
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onResume()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 204
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "KEY_SHOW_IMPROVED"

    .line 205
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mShowImproved:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "KEY_ANIMATION_COMPLETED"

    .line 206
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public bridge synthetic onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 41
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public bridge synthetic onSingleTouch()V
    .locals 0

    .line 41
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSingleTouch()V

    return-void
.end method

.method public onStart()V
    .locals 2

    .line 147
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onStart()V

    .line 148
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mAnimationCompleted:Z

    if-eqz v0, :cond_2

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mCompareImprovedMeshViewer:Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;

    if-eqz v0, :cond_1

    .line 150
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {v1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v1

    if-eqz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->setTextured(F)V

    .line 151
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->requestRenderGLTextureView()V

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButtonParent:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 154
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mBottomBar:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    return-void
.end method

.method public onViewStateRestored(Landroid/os/Bundle;)V
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {v0}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result v0

    .line 141
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onViewStateRestored(Landroid/os/Bundle;)V

    .line 142
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;->mKnobButton:Landroid/widget/ToggleButton;

    invoke-virtual {p1, v0}, Landroid/widget/ToggleButton;->setChecked(Z)V

    return-void
.end method

.method setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 1

    const v0, 0x7f0c0030

    .line 249
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 251
    new-instance p1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$CompareFragment$vZa2ooGu6fmtAqtlB03zmdNMS3g;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$CompareFragment$vZa2ooGu6fmtAqtlB03zmdNMS3g;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/CompareFragment;)V

    const v0, 0x7f090103

    .line 263
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0900b5

    .line 264
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected showToolbar()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
