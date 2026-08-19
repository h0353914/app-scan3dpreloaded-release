.class abstract Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.source "BlendActionGLFragment.java"

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
.implements Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;


# static fields
.field protected static final KEY_FIRST_URI:Ljava/lang/String; = "first_uri"

.field protected static final VIEW_Y_DELTA:F = 0.2f


# instance fields
.field protected mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

.field protected mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;-><init>()V

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

.method getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->createOrGetFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object v0

    return-object v0
.end method

.method getMenuResourceId()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 55
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 62
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900e1

    .line 64
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    .line 65
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    const-string p3, "first_uri"

    invoke-virtual {p2, p3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p2

    check-cast p2, Landroid/net/Uri;

    if-eqz p2, :cond_0

    .line 68
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p3

    invoke-static {p3, p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 73
    :goto_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    .line 74
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->createOrGetFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object p3

    sget-object v0, Lcom/sonymobile/scan3d/ScenoID;->SCENO_TEXTURED:Lcom/sonymobile/scan3d/ScenoID;

    invoke-virtual {p2, p3, v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->start(Lcom/sonymobile/scan3d/viewer/FaceBlender;Lcom/sonymobile/scan3d/ScenoID;)V

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    .line 105
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

    .line 170
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->handleFailedMesh()V

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 161
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 164
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->reportFullyDrawn()V

    :cond_0
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 1

    const p1, 0x7f10024a

    const/4 v0, 0x0

    .line 175
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->showProgressDialog(IZ)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 97
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    .line 98
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->onPause()V

    .line 99
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mActivityInterface:Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;

    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/ViewerActivityInterface;->unregisterOnBackPressListener(Lcom/sonymobile/scan3d/OnBackPressListener;)V

    .line 100
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onPause()V

    return-void
.end method

.method onPrepareMenu(Landroid/view/Menu;)V
    .locals 0

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 90
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onResume()V

    .line 91
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->onResume()V

    .line 92
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    return-void
.end method

.method public onSingleTouch()V
    .locals 1

    .line 202
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->requiresFullScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->isFullScreen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->showControls(Z)V

    :cond_0
    return-void
.end method

.method public queueGlEvent(Ljava/lang/Runnable;)V
    .locals 1

    .line 130
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->getFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->queueOnRender(Ljava/lang/Runnable;)V

    return-void
.end method

.method requestRenderGLTextureView()V
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BlendActionGLFragment;->mGLTextureView:Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/BlenderGLTextureView;->requestRender()V

    :cond_0
    return-void
.end method
