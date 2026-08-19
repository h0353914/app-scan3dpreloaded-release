.class public Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.source "PrintPreviewFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;
.implements Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog_tag"

.field private static final SCALE_FACTOR:F = 0.7f

.field public static final TAG:Ljava/lang/String; = "PrintPreviewFragment"


# instance fields
.field private mBottomBarBinding:Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

.field private mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;-><init>()V

    return-void
.end method

.method private getPrintTypeId()I
    .locals 1

    .line 160
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintType;->ordinal()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public static synthetic lambda$setupBottomBar$0(Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;Landroid/view/View;)V
    .locals 3

    const/4 p1, 0x1

    .line 121
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->startPrintEdit(Z)V

    .line 122
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_MODEL_EDIT_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getPrintTypeId()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void
.end method

.method public static synthetic lambda$setupBottomBar$1(Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;Landroid/view/View;)V
    .locals 3

    const/4 p1, 0x0

    .line 126
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->showEditNameDialog(I)V

    .line 127
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_TEXT_EDIT_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getPrintTypeId()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    return-void
.end method

.method public static synthetic lambda$setupBottomBar$2(Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;Landroid/view/View;)V
    .locals 3

    .line 131
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    if-eqz p1, :cond_1

    .line 133
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/sonymobile/scan3d/PrintType;->TYPE_TABLE_STAND:Lcom/sonymobile/scan3d/PrintType;

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    .line 132
    :goto_0
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/PrintSelection;->setPrintType(Lcom/sonymobile/scan3d/PrintType;)V

    .line 137
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeMeshes()V

    .line 138
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 139
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintSelection;->resetTransform()V

    .line 140
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditorSeek(I)V

    .line 141
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->loadPrintPreviewIfNeeded()V

    .line 142
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_SOCLE_EDITED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getPrintTypeId()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    :cond_1
    return-void
.end method

.method private loadPrintPreviewIfNeeded()V
    .locals 1

    .line 272
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->computePrintMesh(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 274
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 275
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeMeshes()V

    :cond_0
    return-void
.end method

.method public static newInstance()Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;
    .locals 2

    .line 53
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 54
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;-><init>()V

    .line 55
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v1
.end method

.method private show3rdPartyPrinterPlugins()V
    .locals 3

    .line 261
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 262
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;->newInstance(Lcom/sonymobile/scan3d/PrintSelection;)Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;

    move-result-object v1

    .line 264
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v2, 0x1003

    .line 265
    invoke-virtual {v0, v2}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v2, 0x7f0900dc

    .line 266
    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 267
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 268
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private showEditNameDialog(I)V
    .locals 3

    .line 251
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 252
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/PrintSelection;->getTextOverride()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 253
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 254
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    if-lez p1, :cond_1

    const v2, 0x7f1000cc

    goto :goto_1

    :cond_1
    const v2, 0x7f1000cb

    .line 253
    :goto_1
    invoke-static {v1, v2, p1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->newInstance(Ljava/lang/String;IILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;

    move-result-object p1

    const-string v1, "dialog_tag"

    .line 257
    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private startPrintEdit(Z)V
    .locals 2

    .line 236
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 237
    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->newInstance(Z)Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;

    move-result-object p1

    const/4 v1, 0x0

    .line 238
    invoke-virtual {p1, p0, v1}, Landroidx/fragment/app/Fragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 240
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1003

    .line 241
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v1, 0x7f0900dc

    .line 242
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 243
    sget-object p1, Lcom/sonymobile/scan3d/viewer/fragments/PrintEditFragment;->TAG:Ljava/lang/String;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 244
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private updateToggleSocleDrawable()V
    .locals 4

    .line 227
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    if-ne v0, v1, :cond_0

    const v0, 0x7f0800f0

    goto :goto_0

    :cond_0
    const v0, 0x7f0800ef

    .line 229
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mBottomBarBinding:Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->setSocleDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 36
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic getContentLayout()I
    .locals 1

    .line 36
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getContentLayout()I

    move-result v0

    return v0
.end method

.method protected getTitleId()I
    .locals 1

    const v0, 0x7f10030e

    return v0
.end method

.method protected getToolBarActionText()I
    .locals 1

    const v0, 0x7f10017d

    return v0
.end method

.method protected onActionClick()V
    .locals 4

    .line 103
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getTextLimit()I

    move-result v0

    if-lez v0, :cond_0

    .line 104
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getTextLimit()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->showEditNameDialog(I)V

    goto :goto_0

    .line 106
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->PRINTING_EDIT_DONE:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getPrintTypeId()I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 107
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->show3rdPartyPrinterPlugins()V

    :goto_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 2

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintSelection;->resetTransform()V

    .line 152
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditorSeek(I)V

    .line 153
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 36
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public bridge synthetic onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    .line 36
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 36
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroy()V

    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 36
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 36
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 73
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 74
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 75
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPendingPrintSelection()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 76
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getView()Landroid/view/View;

    move-result-object p1

    .line 77
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result p2

    const/16 v0, 0x100

    if-eq p2, v0, :cond_0

    if-eqz p1, :cond_0

    const p2, 0x7f090044

    .line 78
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 79
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->updateToggleSocleDrawable()V

    .line 81
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    sget-object p2, Lcom/sonymobile/scan3d/utils/PrintMaterial;->SANDSTONE_COLOUR:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/PrintSelection;->setMaterial(Lcom/sonymobile/scan3d/utils/PrintMaterial;)V

    .line 82
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object p1

    if-nez p1, :cond_2

    .line 83
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result p1

    if-eq p1, v0, :cond_1

    .line 88
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    sget-object p2, Lcom/sonymobile/scan3d/PrintType;->TYPE_TABLE_STAND:Lcom/sonymobile/scan3d/PrintType;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/PrintSelection;->setPrintType(Lcom/sonymobile/scan3d/PrintType;)V

    goto :goto_0

    .line 85
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    sget-object p2, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/PrintSelection;->setPrintType(Lcom/sonymobile/scan3d/PrintType;)V

    .line 90
    :goto_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/PrintSelection;->setTextOverride(Ljava/lang/String;)V

    .line 92
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->loadPrintPreviewIfNeeded()V

    :cond_3
    return-void
.end method

.method public bridge synthetic onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    .line 36
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method public onNameChanged(Ljava/lang/String;)V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/PrintSelection;->setTextOverride(Ljava/lang/String;)V

    .line 170
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->loadPrintPreviewIfNeeded()V

    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .line 36
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPause()V

    return-void
.end method

.method public onPrintMeshComputed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 180
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->dismissProgressDialog()V

    .line 181
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p2

    if-eqz p2, :cond_1

    .line 182
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->updateToggleSocleDrawable()V

    .line 183
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PrintSelection;->getPrintType()Lcom/sonymobile/scan3d/PrintType;

    move-result-object p2

    .line 184
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p3

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->removeMeshes()V

    .line 185
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p3

    sget-object p4, Lcom/sonymobile/scan3d/PrintType;->TYPE_WALL_MOUNT:Lcom/sonymobile/scan3d/PrintType;

    const/4 v0, 0x1

    if-ne p2, p4, :cond_0

    move p2, v0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p3, p2}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->set180Mode(Z)V

    .line 186
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p2

    sget-object p3, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    sget-object p4, Lcom/sonymobile/scan3d/MeshType;->TYPE_PRINT_PREVIEW:Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {p2, p1, p3, p4}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V

    .line 187
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object p1

    const p2, 0x3f333333    # 0.7f

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->adjustViewToMesh(FZ)V

    .line 188
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->requestRenderGLTextureView()V

    :cond_1
    return-void
.end method

.method public onPrintMeshFailed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;)V
    .locals 0

    .line 196
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 197
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->dismissProgressDialog()V

    .line 201
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPrintEditorSeek()I

    move-result p2

    const/4 p3, 0x1

    if-ltz p2, :cond_1

    sget-object p2, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_EMPTY_MODEL:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    if-ne p5, p2, :cond_1

    if-eqz p1, :cond_0

    .line 204
    invoke-virtual {p5, p1}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 206
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditorSeek(I)V

    .line 207
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    goto :goto_0

    .line 210
    :cond_1
    sget-object p2, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->FAIL_EMPTY_MODEL:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    if-eq p5, p2, :cond_2

    if-eqz p1, :cond_2

    .line 211
    invoke-virtual {p5, p1}, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->getString(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2, p3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_2
    const/4 p1, 0x0

    .line 213
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->startPrintEdit(Z)V

    :goto_0
    return-void
.end method

.method public onPrintMeshLoading()V
    .locals 2

    const v0, 0x7f10024a

    const/4 v1, 0x1

    .line 219
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public bridge synthetic onResume()V
    .locals 0

    .line 36
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onResume()V

    return-void
.end method

.method public bridge synthetic onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 36
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public bridge synthetic onSingleTouch()V
    .locals 0

    .line 36
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSingleTouch()V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2

    .line 61
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0901e6

    .line 63
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    const/16 v0, 0x8

    invoke-virtual {p2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 64
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScenography()Lcom/sonymobile/scan3d/ScenoID;

    move-result-object p2

    sget-object v1, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    if-eq p2, v1, :cond_0

    .line 65
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    sget-object v1, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {p2, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    .line 66
    sget-object p2, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    :cond_0
    const p2, 0x7f090036

    .line 68
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method protected setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 1

    const/4 v0, 0x1

    .line 118
    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;->inflate(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Z)Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;->mBottomBarBinding:Lcom/sonymobile/scan3d/databinding/PrintPreviewBarBinding;

    const p1, 0x7f09003e

    .line 119
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PrintPreviewFragment$Pwey_4kLE7n6WVnhyCEzaR32Alg;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PrintPreviewFragment$Pwey_4kLE7n6WVnhyCEzaR32Alg;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090036

    .line 125
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PrintPreviewFragment$v4ojvRFpsuT_rMOze0Sx4qC3adk;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PrintPreviewFragment$v4ojvRFpsuT_rMOze0Sx4qC3adk;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f090044

    .line 130
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PrintPreviewFragment$D474eg98ZngMvoVXmMqt5UTUMDg;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PrintPreviewFragment$D474eg98ZngMvoVXmMqt5UTUMDg;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PrintPreviewFragment;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
