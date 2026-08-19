.class public Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.source "KeepDiscardFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment$OnYesNoListener;
.implements Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;
.implements Lcom/sonymobile/scan3d/viewer/TipDialog$ITipDialogListener;


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog_tag"

.field private static final KEY_ENV_ERROR:Ljava/lang/String; = "env_error"

.field private static final KEY_LONG_SCAN:Ljava/lang/String; = "long_scan"

.field private static final KEY_SCAN_DELETED:Ljava/lang/String; = "scan_deleted"

.field private static final KEY_SHORT_SCAN:Ljava/lang/String; = "short_scan"

.field public static final POLICY_MODE:Ljava/lang/String; = "policy_mode"

.field private static final QUESTION_ID_DELETE:I = 0x0

.field private static final WIZARD_DIALOG_TAG:Ljava/lang/String; = "wizard_tag"


# instance fields
.field private mScanDeleted:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 58
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;-><init>()V

    return-void
.end method

.method private getData()Landroid/net/Uri;
    .locals 1

    .line 403
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private getPriorityTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 7

    .line 412
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 413
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "env_error"

    .line 414
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v2

    if-eqz v2, :cond_0

    const-string v2, "env_error"

    .line 420
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;

    .line 419
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->newInstance(Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const-string v2, "short_scan"

    .line 421
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 426
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->SHORT_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->getAsTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v2, "long_scan"

    .line 427
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 432
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->LONG_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->getAsTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 435
    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    if-nez v0, :cond_4

    .line 440
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v2, 0x7f1001d8

    .line 441
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 442
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0a0012

    .line 443
    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    if-le v3, v5, :cond_3

    .line 445
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 446
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 447
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->RESTORE:Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->getAsTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 450
    :cond_3
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 451
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    add-int/2addr v3, v4

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 452
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 457
    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 458
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v2, 0x7f1001cf

    .line 459
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 461
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 462
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 463
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getShortDescription()I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v4

    .line 464
    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_5

    return-object v3

    :cond_6
    const/4 v0, 0x0

    return-object v0
.end method

.method private gotoViewer()V
    .locals 3

    .line 386
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 387
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1003

    .line 388
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const/4 v1, 0x1

    .line 389
    invoke-static {v1}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->newInstance(Z)Landroidx/fragment/app/Fragment;

    move-result-object v1

    const v2, 0x7f0900dc

    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 390
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;Landroid/view/View;)V
    .locals 0

    .line 125
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->onNavigationClick()V

    return-void
.end method

.method public static synthetic lambda$setupBottomBar$1(Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;Landroid/view/View;)V
    .locals 1

    .line 153
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0900b5

    if-eq p1, v0, :cond_1

    const v0, 0x7f090103

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 155
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showEditNameDialog()V

    goto :goto_0

    .line 158
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showDiscardDialog()V

    :goto_0
    return-void
.end method

.method public static newInstance(ZZLcom/sonymobile/scan3d/EnvironmentError$ErrorType;)Landroidx/fragment/app/Fragment;
    .locals 2

    .line 99
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "short_scan"

    .line 100
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "long_scan"

    .line 101
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "env_error"

    .line 102
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    .line 104
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;-><init>()V

    .line 105
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private openSharingFramework(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)V
    .locals 1

    .line 479
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->gotoViewer()V

    .line 481
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->getViewM()[F

    move-result-object v0

    invoke-static {p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;[FLcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object p1

    .line 482
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p2

    const/16 v0, 0x1003

    .line 483
    invoke-virtual {p2, v0}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    const v0, 0x7f0900dc

    .line 484
    invoke-virtual {p2, v0, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 485
    const-class p1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 486
    invoke-virtual {p2}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private purgeTips(Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;",
            ">;"
        }
    .end annotation

    .line 367
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001cf

    .line 368
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 371
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 372
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 373
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 374
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;

    .line 375
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->getTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v3

    .line 376
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getShortDescription()I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object v3

    .line 377
    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 378
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    return-object p1
.end method

.method private showDiscardDialog()V
    .locals 4

    .line 309
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f1000c9

    const v3, 0x7f1002ad

    .line 311
    invoke-static {v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->newInstance(III)Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;

    move-result-object v2

    .line 314
    invoke-virtual {v2, p0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    const-string v1, "dialog_tag"

    .line 315
    invoke-virtual {v2, v0, v1}, Lcom/sonymobile/scan3d/viewer/YesNoQuestionFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showEditNameDialog()V
    .locals 3

    .line 397
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 398
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-static {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->newInstance(Landroid/net/Uri;Landroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;

    move-result-object v1

    const-string v2, "dialog_tag"

    .line 399
    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/ScanAddedFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showMesh()V
    .locals 4

    .line 294
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanPolicyMode()I

    move-result v0

    .line 295
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result v1

    if-eqz v0, :cond_0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    :cond_0
    const/16 v0, 0x100

    if-eq v1, v0, :cond_1

    const/16 v0, 0x101

    if-eq v1, v0, :cond_1

    .line 298
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0900e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 301
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    sget-object v2, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    sget-object v3, Lcom/sonymobile/scan3d/MeshType;->TYPE_ORIGINAL:Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V

    .line 302
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->requestRenderGLTextureView()V

    return-void
.end method

.method private showTipDialog(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Z)V
    .locals 2

    .line 349
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f0900e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    .line 350
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 352
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 353
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    .line 354
    invoke-static {p2, p1, p3}, Lcom/sonymobile/scan3d/viewer/TipDialog;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Z)Lcom/sonymobile/scan3d/viewer/TipDialog;

    move-result-object p1

    const/4 p2, 0x0

    .line 355
    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/viewer/TipDialog;->setTargetFragment(Landroidx/fragment/app/Fragment;I)V

    .line 356
    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->show(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    const-string p2, "wizard_tag"

    .line 357
    invoke-virtual {p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/TipDialog;->show(Landroidx/fragment/app/FragmentTransaction;Ljava/lang/String;)I

    return-void
.end method

.method private showTipDialog(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;",
            ">;Z)V"
        }
    .end annotation

    .line 324
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 325
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 326
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    .line 327
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;

    .line 328
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->getTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser$TipPair;->getCategory()Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    move-result-object p1

    invoke-direct {p0, v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showTipDialog(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Z)V

    goto :goto_0

    .line 334
    :cond_0
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    if-eqz p1, :cond_1

    .line 335
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 337
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->gotoViewer()V

    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 58
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic getContentLayout()I
    .locals 1

    .line 58
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getContentLayout()I

    move-result v0

    return v0
.end method

.method public getNavigationAccessibility()I
    .locals 1

    const v0, 0x7f10002b

    return v0
.end method

.method public getNavigationDrawable()I
    .locals 1

    const v0, 0x7f0800d1

    return v0
.end method

.method public onBackPressed()Z
    .locals 1

    .line 179
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showDiscardDialog()V

    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 112
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "scan_deleted"

    .line 114
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    :cond_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 120
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p2

    const p3, 0x7f09012f

    .line 122
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    const/4 v0, 0x0

    .line 123
    invoke-virtual {p3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 125
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$KeepDiscardFragment$wCVWC4Oi_QVoUkLFKaVtd8ZiGKA;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$KeepDiscardFragment$wCVWC4Oi_QVoUkLFKaVtd8ZiGKA;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;)V

    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f09012e

    .line 127
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    .line 128
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getNavigationDrawable()I

    move-result v0

    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 129
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getNavigationAccessibility()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    const p3, 0x7f0900e8

    .line 132
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/FrameLayout;

    const v0, 0x7f0c0037

    .line 133
    invoke-virtual {p1, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    return-object p2
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 58
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroy()V

    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 58
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 58
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 170
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 171
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 172
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showMesh()V

    .line 173
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->dismissProgressDialog()V

    :cond_0
    return-void
.end method

.method public bridge synthetic onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    .line 58
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method public onNameChanged(Ljava/lang/String;)V
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setName(Ljava/lang/String;)V

    .line 247
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "policy_mode"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 248
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_SAVED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 250
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getPriorityTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 252
    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showTipDialog(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Z)V

    goto :goto_0

    .line 254
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 255
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanPolicyMode()I

    move-result v1

    .line 254
    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getScanKeptTips(Landroid/content/Context;II)Ljava/util/List;

    move-result-object p1

    .line 256
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->purgeTips(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showTipDialog(Ljava/util/List;Z)V

    :goto_0
    return-void
.end method

.method protected onNavigationClick()V
    .locals 0

    .line 185
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showDiscardDialog()V

    return-void
.end method

.method public onNegativeAnswer(ILandroid/os/Parcelable;)V
    .locals 0

    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .line 58
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPause()V

    return-void
.end method

.method public onPositiveAnswer(ILandroid/os/Parcelable;)V
    .locals 2

    if-nez p1, :cond_1

    .line 212
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getData()Landroid/net/Uri;

    move-result-object p2

    const/4 v0, 0x1

    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 213
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    .line 216
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string p2, "policy_mode"

    const/4 v1, -0x1

    invoke-virtual {p1, p2, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    .line 217
    sget-object p2, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_DISCARDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p2, v1, p1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 218
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getPriorityTip()Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p2, 0x0

    .line 221
    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showTipDialog(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Z)V

    goto :goto_0

    .line 223
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 224
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result p2

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanPolicyMode()I

    move-result v0

    .line 223
    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getScanDiscardedTips(Landroid/content/Context;II)Ljava/util/List;

    move-result-object p1

    .line 225
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->purgeTips(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->showTipDialog(Ljava/util/List;Z)V

    :goto_0
    return-void

    .line 229
    :cond_1
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "YesNoDialog with id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is not supported"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public bridge synthetic onResume()V
    .locals 0

    .line 58
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onResume()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 140
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "scan_deleted"

    .line 141
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public bridge synthetic onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 58
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public bridge synthetic onSingleTouch()V
    .locals 0

    .line 58
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSingleTouch()V

    return-void
.end method

.method public onTipNegative()V
    .locals 1

    .line 286
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    if-eqz v0, :cond_0

    .line 287
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 289
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->gotoViewer()V

    :goto_0
    return-void
.end method

.method public onTipPositive(Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 1

    .line 266
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getPositiveAction()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 275
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mScanDeleted:Z

    if-eqz p1, :cond_0

    .line 276
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 268
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/WizardActivity;->showWizard(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V

    .line 269
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 272
    :pswitch_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    sget-object p2, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;->SHARE:Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->openSharingFramework(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment$Tab;)V

    goto :goto_0

    .line 278
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;->gotoViewer()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x7f1002d7
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 1

    const v0, 0x7f0c007c

    .line 150
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 152
    new-instance p1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$KeepDiscardFragment$ld5zz4bP6iRpIbmJo0K0B4hx7Qs;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$KeepDiscardFragment$ld5zz4bP6iRpIbmJo0K0B4hx7Qs;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/KeepDiscardFragment;)V

    const v0, 0x7f090103

    .line 164
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0900b5

    .line 165
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
