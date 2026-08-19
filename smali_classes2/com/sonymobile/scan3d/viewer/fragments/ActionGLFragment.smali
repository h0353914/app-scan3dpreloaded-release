.class abstract Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.source "ActionGLFragment.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
.implements Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;


# static fields
.field protected static final VIEW_Y_DELTA:F = 0.2f


# instance fields
.field private mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

.field mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPopupMenu:Landroid/widget/PopupMenu;

.field private mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;-><init>()V

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;Landroid/widget/ToggleButton;Landroid/view/View;)V
    .locals 0

    .line 89
    invoke-virtual {p1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 90
    invoke-virtual {p1}, Landroid/widget/ToggleButton;->isChecked()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/ScenoID;->SCENO_TEXTURED:Lcom/sonymobile/scan3d/ScenoID;

    .line 91
    :goto_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    .line 92
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;ILandroid/view/View;)V
    .locals 2

    .line 101
    new-instance v0, Landroid/widget/PopupMenu;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p2}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mPopupMenu:Landroid/widget/PopupMenu;

    .line 102
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {p2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p2

    .line 103
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    .line 104
    invoke-virtual {v0, p1, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 105
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {p1, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 106
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {p1}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->onPrepareMenu(Landroid/view/Menu;)V

    .line 107
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mPopupMenu:Landroid/widget/PopupMenu;

    invoke-virtual {p1}, Landroid/widget/PopupMenu;->show()V

    return-void
.end method


# virtual methods
.method public allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c005e

    return v0
.end method

.method getMenuResourceId()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method getRenderer()Lcom/sonymobile/scan3d/viewer/MeshRenderer;
    .locals 1

    .line 143
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 67
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreate(Landroid/os/Bundle;)V

    .line 68
    new-instance p1, Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 74
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p2

    const p3, 0x7f0900e1

    .line 76
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    .line 77
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-static {p3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p3

    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 78
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p3, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    .line 79
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    sget-object v1, Lcom/sonymobile/scan3d/ScenoID;->SCENO_TEXTURED:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {p3, v0, v1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->start(Lcom/sonymobile/scan3d/viewer/MeshRenderer;Lcom/sonymobile/scan3d/ScenoID;)V

    const p3, 0x7f09005f

    .line 81
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    if-eqz p3, :cond_0

    .line 83
    invoke-virtual {p0, p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    :cond_0
    const p1, 0x7f0901e5

    .line 86
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ToggleButton;

    if-eqz p1, :cond_1

    const p3, 0x7f0901e6

    .line 88
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ActionGLFragment$mGXqL8RC5hZmGvSc0Nqc5tY2Y34;

    invoke-direct {v0, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ActionGLFragment$mGXqL8RC5hZmGvSc0Nqc5tY2Y34;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;Landroid/widget/ToggleButton;)V

    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    const p1, 0x7f090140

    .line 95
    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 97
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getMenuResourceId()I

    move-result p3

    const/4 v0, -0x1

    if-eq p3, v0, :cond_2

    .line 99
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ActionGLFragment$1fwxjcGlDcTwX6r5VoLj9JxwQiM;

    invoke-direct {v0, p0, p3}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$ActionGLFragment$1fwxjcGlDcTwX6r5VoLj9JxwQiM;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;I)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    return-object p2
.end method

.method public onDestroy()V
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->release()V

    const/4 v0, 0x0

    .line 133
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mRenderer:Lcom/sonymobile/scan3d/viewer/MeshRenderer;

    .line 134
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onDestroy()V

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    .line 209
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->handleFailedMesh()V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 194
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 195
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mModelContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 196
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getView()Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0901e5

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ToggleButton;

    .line 197
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScenography()Lcom/sonymobile/scan3d/ScenoID;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    if-eqz p1, :cond_1

    .line 199
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScenography()Lcom/sonymobile/scan3d/ScenoID;

    move-result-object p2

    sget-object v0, Lcom/sonymobile/scan3d/ScenoID;->SCENO_SOLID:Lcom/sonymobile/scan3d/ScenoID;

    if-ne p2, v0, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1, p2}, Landroid/widget/ToggleButton;->setChecked(Z)V

    .line 203
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->reportFullyDrawn()V

    :cond_2
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 1

    const p1, 0x7f10024a

    const/4 v0, 0x1

    .line 214
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 123
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->onStopFling()V

    .line 124
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    .line 125
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->onPause()V

    .line 126
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;->unregisterOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V

    .line 127
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onPause()V

    return-void
.end method

.method onPrepareMenu(Landroid/view/Menu;)V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 116
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onResume()V

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->onResume()V

    .line 118
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    return-void
.end method

.method public onScenographyChanged(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->setScenography(Lcom/sonymobile/scan3d/ScenoID;)V

    return-void
.end method

.method public onSingleTouch()V
    .locals 1

    .line 241
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->requiresFullScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 243
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->isFullScreen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->showControls(Z)V

    :cond_0
    return-void
.end method

.method requestRenderGLTextureView()V
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 151
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/ActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ViewerGLTextureView;->requestRender()V

    :cond_0
    return-void
.end method

.method setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 0

    return-void
.end method
