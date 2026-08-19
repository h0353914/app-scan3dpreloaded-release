.class public abstract Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.source "BaseAnimationFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;
.implements Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;
.implements Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;


# static fields
.field private static final KEY_USE_UNTEXTUREDSHADING:Ljava/lang/String; = "use_untexturedshading"

.field private static final KEY_VIEW_MATRIX:Ljava/lang/String; = "view_matrix"


# instance fields
.field mHandler:Landroid/os/Handler;

.field mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

.field mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

.field mUseUntexturedShading:Z

.field mViewMatrix:[F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 33
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;-><init>()V

    .line 64
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public static synthetic lambda$loadMeshes$5(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 3

    .line 240
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mUseUntexturedShading:Z

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setUntexturedShading(Z)V

    .line 241
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopFling()V

    .line 243
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mViewMatrix:[F

    if-eqz v0, :cond_0

    .line 244
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setViewMatrix([FI)V

    goto :goto_0

    .line 246
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 248
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 267
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$UvDVbvh08Afjhz7zHTev0K-ESFg;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$UvDVbvh08Afjhz7zHTev0K-ESFg;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 260
    :pswitch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRiggable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 261
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->loadRiggedMesh()V

    goto :goto_1

    .line 251
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->loadMeshIntoSphan()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 252
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->loadRiggedMesh()V

    goto :goto_1

    .line 255
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$WRkaSxfWOLaBM9vaL1hwGv9uyrU;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$WRkaSxfWOLaBM9vaL1hwGv9uyrU;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

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

.method public static synthetic lambda$loadRiggedMesh$6(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 1

    const/4 v0, 0x1

    .line 280
    invoke-virtual {p0, v0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onMeshesLoadedIntoSphan(ZZ)V

    return-void
.end method

.method public static synthetic lambda$loadRiggedMesh$7(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 285
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onMeshesLoadedIntoSphan(ZZ)V

    return-void
.end method

.method public static synthetic lambda$null$1(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;Z)V
    .locals 1

    .line 199
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->isVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 200
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onMeshesLoadedIntoSphan(ZZ)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$null$3(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 1

    const/4 v0, 0x0

    .line 255
    invoke-virtual {p0, v0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onMeshesLoadedIntoSphan(ZZ)V

    return-void
.end method

.method public static synthetic lambda$null$4(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 3

    .line 267
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 268
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-lt v0, v2, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 267
    :goto_0
    invoke-virtual {p0, v1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onMeshesLoadedIntoSphan(ZZ)V

    return-void
.end method

.method public static synthetic lambda$onConversionDone$2(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 3

    .line 188
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->loadRiggedMesh()Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    move-result-object v0

    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    .line 190
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopEffect()V

    .line 193
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mUseUntexturedShading:Z

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setUntexturedShading(Z)V

    .line 194
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mHandler:Landroid/os/Handler;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$LTISnbt0aPeNCUBfxR4XZUcqtA0;

    invoke-direct {v2, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$LTISnbt0aPeNCUBfxR4XZUcqtA0;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;Z)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic lambda$onCreateView$0(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V
    .locals 2

    .line 94
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getLifecycle()Lcom/sonymobile/scan3d/SimpleLifecycle;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/SimpleLifecycle;->onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V

    .line 95
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getLifecycle()Lcom/sonymobile/scan3d/SimpleLifecycle;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/SimpleLifecycle;->removeObserver(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;)V

    .line 96
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    return-void
.end method

.method private loadMeshes()V
    .locals 2

    .line 239
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$7GH-NPyDV_xlnJ3yNJuYShGtS7k;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$7GH-NPyDV_xlnJ3yNJuYShGtS7k;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private loadRiggedMesh()V
    .locals 2

    .line 278
    sget-object v0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadRiggedMeshState:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->loadRiggedMesh()Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 285
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$UpO6q1FfUwfDlNmbjFkzLa00Utc;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$UpO6q1FfUwfDlNmbjFkzLa00Utc;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 280
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$rbvgoW9QzrgAmLlecejXUUTro6g;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$rbvgoW9QzrgAmLlecejXUUTro6g;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method


# virtual methods
.method public allowMotion(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public abstract getTextureViewId()I
.end method

.method public onBackPressed()Z
    .locals 3

    .line 145
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 146
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    .line 147
    invoke-static {}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getInstance()Lcom/sonymobile/scan3d/animation/RigModelManager;

    move-result-object v1

    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/animation/RigModelManager;->isRigging(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 149
    invoke-virtual {v1, v0, p0}, Lcom/sonymobile/scan3d/animation/RigModelManager;->removeListener(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    .line 152
    :cond_0
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onBackPressed()Z

    move-result v0

    return v0
.end method

.method public onConversionDone(Landroid/net/Uri;)V
    .locals 1

    .line 187
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$Stze0lkcZrO_3rEF8Wng3piKp_M;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$Stze0lkcZrO_3rEF8Wng3piKp_M;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onConversionFailed(Landroid/net/Uri;)V
    .locals 0

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .line 79
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    if-eqz p3, :cond_0

    const-string p2, "view_matrix"

    .line 82
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getFloatArray(Ljava/lang/String;)[F

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mViewMatrix:[F

    const-string p2, "use_untexturedshading"

    .line 83
    invoke-virtual {p3, p2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p2

    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mUseUntexturedShading:Z

    .line 86
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 87
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->getTextureViewId()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    .line 89
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->createSphanRenderer(Landroid/content/Context;)Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 90
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getLifecycle()Lcom/sonymobile/scan3d/SimpleLifecycle;

    move-result-object p2

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/SimpleLifecycle;->addObserver(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleObserver;)V

    .line 91
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->acquire()V

    .line 92
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getLifecycle()Lcom/sonymobile/scan3d/SimpleLifecycle;

    move-result-object p2

    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/SimpleLifecycle;->onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V

    .line 93
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$ChTE6xNEaT503cxa0CjyzrJHwGc;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$BaseAnimationFragment$ChTE6xNEaT503cxa0CjyzrJHwGc;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;)V

    invoke-virtual {p2, p3, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->start(Lcom/sonymobile/scan3d/viewer/SphanRenderer;Ljava/lang/Runnable;)V

    return-object p1
.end method

.method public abstract onMeshesLoadedIntoSphan(ZZ)V
.end method

.method public onPause()V
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 134
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mViewMatrix:[F

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    .line 137
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->onPause()V

    .line 139
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 3

    .line 114
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onResume()V

    .line 117
    invoke-static {}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getInstance()Lcom/sonymobile/scan3d/animation/RigModelManager;

    move-result-object v0

    .line 118
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 120
    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 121
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->isRigging(Landroid/net/Uri;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 122
    invoke-virtual {v0, v1, p0}, Lcom/sonymobile/scan3d/animation/RigModelManager;->addListener(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    .line 126
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->loadMeshes()V

    .line 127
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->onResume()V

    .line 128
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 157
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 158
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mViewMatrix:[F

    if-eqz v0, :cond_0

    const-string v1, "view_matrix"

    .line 159
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putFloatArray(Ljava/lang/String;[F)V

    :cond_0
    const-string v0, "use_untexturedshading"

    .line 161
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mUseUntexturedShading:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onSingleTouch()V
    .locals 1

    .line 166
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->requiresFullScreen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->isFullScreen()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->showControls(Z)V

    :cond_0
    return-void
.end method

.method public onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 1

    .line 104
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 105
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setPlainShading(Z)V

    return-void
.end method

.method public onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 0

    return-void
.end method
