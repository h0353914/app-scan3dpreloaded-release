.class public Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.source "PrintEditFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;


# static fields
.field private static final ARG_PRINT_MESH_COMPUTED:Ljava/lang/String; = "arg_mesh_computed"

.field private static final DIALOG_TAG:Ljava/lang/String; = "PrintEditFragmentDialog"

.field private static final SCALE_FACTOR:F = 0.9f

.field public static final TAG:Ljava/lang/String; = "PrintEditFragment"


# instance fields
.field private mPrintEditMesh:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field private mSeekBarChanged:Z

.field private mSeekbar:Landroid/widget/SeekBar;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 34
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekBarChanged:Z

    return-void
.end method

.method static synthetic access$002(Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;Z)Z
    .locals 0

    .line 34
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekBarChanged:Z

    return p1
.end method

.method private cancelPrintEdit()V
    .locals 2

    .line 201
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "arg_mesh_computed"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 204
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->resetPendingPrintSelection()V

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    if-eqz v0, :cond_1

    .line 210
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditorSeek(I)V

    .line 212
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    return-void
.end method

.method private handlePrintMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 4

    .line 63
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    .line 65
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeMeshes()V

    .line 66
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintEditMesh:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 67
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPendingPrintSelection()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object v1

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 68
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v1

    .line 69
    sget-object v2, Lcom/sonymobile/scan3d/PrintType;->TYPE_TABLE_STAND:Lcom/sonymobile/scan3d/PrintType;

    const/4 v3, 0x1

    if-eq v1, v2, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->set180Mode(Z)V

    .line 70
    sget-object v1, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    sget-object v2, Lcom/sonymobile/scan3d/MeshType;->TYPE_PRINT_CUT:Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {v0, p1, v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V

    .line 72
    sget-object v1, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    sget-object v2, Lcom/sonymobile/scan3d/MeshType;->TYPE_CYLINDER:Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {v0, p2, v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V

    .line 74
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->resetInitView()V

    .line 75
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->reset()V

    .line 76
    invoke-virtual {v0, v3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->setEditMode(Z)V

    const p2, 0x3f666666    # 0.9f

    .line 77
    invoke-virtual {v0, p2, v3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->adjustViewToMesh(FZ)V

    .line 79
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PrintSelection;->getTransform()[F

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->setTransform([F)V

    .line 80
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->is180Scan()Z

    move-result p1

    if-nez p1, :cond_1

    const p1, 0x3e4ccccd    # 0.2f

    const/4 p2, 0x0

    .line 82
    invoke-virtual {v0, p2, p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->translateView(FFF)V

    .line 85
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    if-nez p1, :cond_2

    .line 86
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getMax()I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->getSeekDefault()F

    move-result v0

    mul-float/2addr p2, v0

    float-to-int p2, p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    goto :goto_1

    .line 89
    :cond_2
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->getProgress()I

    move-result p1

    int-to-float p1, p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {p2}, Landroid/widget/SeekBar;->getMax()I

    move-result p2

    int-to-float p2, p2

    div-float/2addr p1, p2

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSeek(F)Z

    .line 91
    :goto_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->requestRenderGLTextureView()V

    .line 93
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->dismissProgressDialog()V

    :cond_3
    return-void
.end method

.method public static newInstance(Z)Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;
    .locals 3

    .line 47
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;-><init>()V

    .line 48
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "arg_mesh_computed"

    .line 49
    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 50
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public bridge synthetic allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 34
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic getContentLayout()I
    .locals 1

    .line 34
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getContentLayout()I

    move-result v0

    return v0
.end method

.method public getNavigationDrawable()I
    .locals 1

    const v0, 0x7f0800d1

    return v0
.end method

.method protected getTitleId()I
    .locals 1

    const v0, 0x7f1000ee

    return v0
.end method

.method protected getToolBarActionText()I
    .locals 1

    const v0, 0x7f1000ed

    return v0
.end method

.method protected onActionClick()V
    .locals 4

    .line 172
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getProgress()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditorSeek(I)V

    .line 173
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setNotLoaded()V

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintEditMesh:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getTransform()[F

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/PrintSelection;->setTransform([F)V

    .line 175
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_MODEL_EDIT_DONE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 176
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/PrintType;->ordinal()I

    move-result v2

    int-to-long v2, v2

    .line 175
    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 177
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    return-void
.end method

.method public onBackPressed()Z
    .locals 4

    .line 182
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekBarChanged:Z

    if-eqz v0, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const v1, 0x7f1000c8

    const v2, 0x7f1000ea

    const/4 v3, 0x0

    .line 184
    invoke-static {v3, v1, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(III)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object v1

    .line 186
    invoke-virtual {v1, p0, v3}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string v2, "PrintEditFragmentDialog"

    .line 187
    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    goto :goto_0

    .line 189
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->cancelPrintEdit()V

    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 34
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public bridge synthetic onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    .line 34
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 34
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroy()V

    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 34
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 34
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 56
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 57
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 58
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->computePrintMesh(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)Z

    :cond_0
    return-void
.end method

.method public bridge synthetic onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    .line 34
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method protected onNavigationClick()V
    .locals 0

    .line 221
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->onBackPressed()Z

    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .line 34
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPause()V

    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    .line 196
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->cancelPrintEdit()V

    return-void
.end method

.method public onPrintMeshComputed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 100
    invoke-direct {p0, p3, p4}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->handlePrintMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    return-void
.end method

.method public onPrintMeshFailed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;)V
    .locals 0

    .line 110
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    .line 111
    invoke-virtual {p4}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_0

    .line 112
    invoke-direct {p0, p3, p4}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->handlePrintMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    goto :goto_0

    .line 114
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->cancelPrintEdit()V

    :goto_0
    return-void
.end method

.method public onPrintMeshLoading()V
    .locals 2

    const v0, 0x7f10024a

    const/4 v1, 0x1

    .line 120
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public bridge synthetic onResume()V
    .locals 0

    .line 34
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onResume()V

    return-void
.end method

.method public bridge synthetic onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 34
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public bridge synthetic onSingleTouch()V
    .locals 0

    .line 34
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSingleTouch()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 154
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 155
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v0, v1

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->onSeek(F)Z

    const p2, 0x7f0901e6

    .line 156
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 157
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScenography()Lcom/sonymobile/scan3d/ScenoID;

    move-result-object p1

    sget-object p2, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    if-eq p1, p2, :cond_0

    .line 158
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object p2, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    .line 159
    sget-object p1, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    .line 161
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 1

    const v0, 0x7f0c00a2

    .line 125
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f09018f

    .line 126
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/SeekBar;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    .line 127
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPrintEditorSeek()I

    move-result p1

    if-ltz p1, :cond_0

    .line 128
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPrintEditorSeek()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 131
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->mSeekbar:Landroid/widget/SeekBar;

    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;)V

    invoke-virtual {p1, p2}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    return-void
.end method
