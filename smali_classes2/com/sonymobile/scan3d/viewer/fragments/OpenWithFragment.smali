.class public Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.source "OpenWithFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/OnNameChangedListener;


# static fields
.field private static final DIALOG_TAG:Ljava/lang/String; = "dialog_tag"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;-><init>()V

    return-void
.end method

.method private getData()Landroid/net/Uri;
    .locals 1

    .line 98
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private gotoViewer()V
    .locals 3

    .line 80
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    .line 81
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const/16 v1, 0x1003

    .line 82
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentTransaction;->setTransition(I)Landroidx/fragment/app/FragmentTransaction;

    .line 83
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerFragment;->newInstance()Landroidx/fragment/app/Fragment;

    move-result-object v1

    const v2, 0x7f0900dc

    invoke-virtual {v0, v2, v1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 84
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method public static synthetic lambda$setupBottomBar$0(Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;Landroid/view/View;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->showEditNameDialog()V

    return-void
.end method

.method public static newInstance()Landroidx/fragment/app/Fragment;
    .locals 1

    .line 38
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;-><init>()V

    return-object v0
.end method

.method private showEditNameDialog()V
    .locals 3

    .line 91
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f1000ca

    .line 92
    invoke-static {v1, v2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->newInstance(Ljava/lang/String;ILandroidx/fragment/app/Fragment;)Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;

    move-result-object v1

    const-string v2, "dialog_tag"

    .line 94
    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/fragments/EditNameFragment;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showMesh()V
    .locals 4

    .line 75
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    sget-object v2, Lcom/sonymobile/scan3d/MeshVariant;->MESH_VARIANT_ORIGINAL:Lcom/sonymobile/scan3d/MeshVariant;

    sget-object v3, Lcom/sonymobile/scan3d/MeshType;->TYPE_ORIGINAL:Lcom/sonymobile/scan3d/MeshType;

    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->addMesh(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/MeshVariant;Lcom/sonymobile/scan3d/MeshType;)V

    .line 76
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->requestRenderGLTextureView()V

    return-void
.end method


# virtual methods
.method public bridge synthetic allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->allowMotion(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic getContentLayout()I
    .locals 1

    .line 30
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getContentLayout()I

    move-result v0

    return v0
.end method

.method public onBackPressed()Z
    .locals 3

    .line 63
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getData()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 64
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return v2
.end method

.method public bridge synthetic onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public bridge synthetic onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    .line 30
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 30
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onDestroy()V

    return-void
.end method

.method public bridge synthetic onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 2

    .line 50
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 52
    new-instance p1, Landroid/content/ContentValues;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/content/ContentValues;-><init>(I)V

    const-string v0, "scan_type"

    .line 53
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getScanType()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 54
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getData()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {p2, v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->update(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;Z)V

    .line 55
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 56
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->showMesh()V

    .line 57
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->dismissProgressDialog()V

    :cond_0
    return-void
.end method

.method public bridge synthetic onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method public onNameChanged(Ljava/lang/String;)V
    .locals 1

    .line 103
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setName(Ljava/lang/String;)V

    .line 104
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->gotoViewer()V

    return-void
.end method

.method protected onNavigationClick()V
    .locals 3

    .line 70
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getData()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->deleteFileSet(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 71
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public bridge synthetic onPause()V
    .locals 0

    .line 30
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPause()V

    return-void
.end method

.method public bridge synthetic onResume()V
    .locals 0

    .line 30
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onResume()V

    return-void
.end method

.method public bridge synthetic onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 30
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public bridge synthetic onSingleTouch()V
    .locals 0

    .line 30
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onSingleTouch()V

    return-void
.end method

.method protected setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 1

    const v0, 0x7f0c008e

    .line 44
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f090172

    .line 45
    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$OpenWithFragment$4jerTDvO6ejRfKfjw46SG5chiz4;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$OpenWithFragment$4jerTDvO6ejRfKfjw46SG5chiz4;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/OpenWithFragment;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected showToolbar()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
