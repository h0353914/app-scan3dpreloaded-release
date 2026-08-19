.class public Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;
.source "PropsFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/utils/UserInputReducer$InputReducer;


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field private static final KEY_INIT_MESHES:Ljava/lang/String; = "init_meshes"

.field private static final KEY_PROP_ID:Ljava/lang/String; = "prop_id"

.field private static final KEY_SELECTED_PROP:Ljava/lang/String; = "selected_prop"

.field private static final PROP_IDLE_ANIMATION:Ljava/lang/String; = "PropIdle"

.field private static final SHARE_FILE_NAME:Ljava/lang/String; = "prop_mesh.glb.zip"


# instance fields
.field private final LOAD_NO_PROP:I

.field private final NO_PROP_LOADED:I

.field private final TAG:Ljava/lang/String;

.field private final UNLOAD_LAST_PROP:I

.field private final UNLOAD_NO_PROP:I

.field private mInitialMeshVisible:I

.field private mInitialMeshes:I

.field private mIsPaused:Z

.field private mPropId:I

.field private mSelectedProp:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 44
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;-><init>()V

    .line 71
    const-class v0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->TAG:Ljava/lang/String;

    const/4 v0, -0x1

    .line 76
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->UNLOAD_LAST_PROP:I

    .line 81
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->NO_PROP_LOADED:I

    const/4 v1, -0x2

    .line 86
    iput v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->UNLOAD_NO_PROP:I

    const/4 v1, -0x3

    .line 91
    iput v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->LOAD_NO_PROP:I

    .line 96
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    .line 112
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mPropId:I

    const/4 v0, 0x0

    .line 118
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mIsPaused:Z

    return-void
.end method

.method private enableShareButton(Landroid/view/View;Z)V
    .locals 1

    if-eqz p1, :cond_0

    const v0, 0x7f0900bc

    .line 486
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 487
    invoke-virtual {p1, p2}, Landroid/widget/Button;->setEnabled(Z)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$doClick$4(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V
    .locals 2

    .line 310
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mPropId:I

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->unloadProp(II)V

    return-void
.end method

.method public static synthetic lambda$loadProp$6(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V
    .locals 1

    .line 347
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->showStaticMesh()V

    .line 348
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    const/4 v0, -0x2

    .line 349
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->onPropLoadedIntoSphan(I)V

    return-void
.end method

.method public static synthetic lambda$loadProp$8(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;Ljava/lang/String;)V
    .locals 4

    .line 368
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 369
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getInstance()Lcom/sonymobile/scan3d/ZipResourceManager;

    move-result-object v1

    iget-object v1, v1, Lcom/sonymobile/scan3d/ZipResourceManager;->EXPANSION_FILE_PATH:Ljava/lang/String;

    .line 372
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->usingOBB()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 373
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v2, v1, p1, v0, v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->loadZippedContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p1

    goto :goto_0

    .line 375
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "res:expansion/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 376
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, p1, v0, v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->loadContent(Ljava/lang/String;Ljava/lang/String;Z)I

    move-result p1

    .line 378
    :goto_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->onPropLoadedIntoSphan(I)V

    .line 379
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->startAnimationPlayback(I)V

    .line 381
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$null$2(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;ZLjava/io/File;)V
    .locals 0

    .line 284
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->dismissProgressDialog()V

    if-eqz p1, :cond_0

    .line 286
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->openSharingFramework(Ljava/io/File;)V

    .line 291
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->scheduleShareFileDeletion(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic lambda$onActionClick$3(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;Landroid/os/Handler;)V
    .locals 7

    .line 275
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    .line 276
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "prop_mesh.glb.zip"

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getShareFile(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    .line 277
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->exportGlbZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 279
    new-instance v3, Landroid/content/ContentValues;

    const/4 v5, 0x1

    invoke-direct {v3, v5}, Landroid/content/ContentValues;-><init>(I)V

    const-string v5, "prop_mesh_url"

    .line 280
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 281
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v5, v0, v3, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 283
    :cond_0
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;

    invoke-direct {v0, p0, v2, v1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$f8aBYDVWPy8o8yer6QdwKuNFz_0;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;ZLjava/io/File;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static synthetic lambda$onMeshesLoadedIntoSphan$1(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V
    .locals 1

    const/4 v0, 0x0

    .line 258
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->setClickable(Z)V

    .line 259
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->setSelectedProp(I)V

    return-void
.end method

.method public static synthetic lambda$onPause$0(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V
    .locals 2

    .line 196
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 201
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mPropId:I

    if-eq v0, v1, :cond_1

    :cond_0
    const/4 v0, -0x3

    .line 202
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->unloadProp(II)V

    :cond_1
    return-void
.end method

.method public static synthetic lambda$onPropLoadedIntoSphan$5(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V
    .locals 1

    const/4 v0, 0x1

    .line 328
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->setClickable(Z)V

    return-void
.end method

.method public static synthetic lambda$startAnimationPlayback$9(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V
    .locals 3

    .line 390
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const-string v1, "PropIdle"

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v1, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startNamedAnimation(ILjava/lang/String;Z)Z

    .line 391
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$unloadProp$7(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V
    .locals 0

    .line 363
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->onPropUnloaded(I)V

    return-void
.end method

.method private loadProp(I)V
    .locals 1

    const/4 v0, -0x3

    if-ne p1, v0, :cond_0

    return-void

    .line 342
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/PropResources;->fromInt(Landroid/content/Context;I)Lcom/sonymobile/scan3d/PropResources;

    move-result-object p1

    if-nez p1, :cond_1

    .line 346
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$CnGbMwr2MZ19Xvb8Ywm1LRK8MQw;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$CnGbMwr2MZ19Xvb8Ywm1LRK8MQw;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void

    .line 353
    :cond_1
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PropResources;->getContentPath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->loadProp(Ljava/lang/String;)V

    return-void
.end method

.method private loadProp(Ljava/lang/String;)V
    .locals 2

    .line 367
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$XKXT6nqBLUDCHBIpQFHRMSQepBg;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static newInstance()Landroidx/fragment/app/Fragment;
    .locals 2

    .line 126
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;-><init>()V

    .line 127
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 128
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private onPropLoadedIntoSphan(I)V
    .locals 1

    .line 326
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mPropId:I

    .line 328
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$jFE6_EdQf0VvXeBPYHd63SLzyws;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$jFE6_EdQf0VvXeBPYHd63SLzyws;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private onPropUnloaded(I)V
    .locals 1

    const/4 v0, -0x1

    .line 332
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mPropId:I

    .line 333
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->loadProp(I)V

    return-void
.end method

.method private openSharingFramework(Ljava/io/File;)V
    .locals 3

    .line 461
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>()V

    .line 462
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    const/4 v2, 0x1

    .line 463
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->PROPS:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    .line 464
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v1

    .line 465
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 467
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz p1, :cond_0

    .line 468
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setViewMatrix([F)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 471
    :cond_0
    invoke-static {v0}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object p1

    .line 472
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v0

    const v1, 0x7f0900dc

    .line 473
    invoke-virtual {v0, v1, p1}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 474
    const-class p1, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 475
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    return-void
.end method

.method private setClickable(Z)V
    .locals 4

    .line 440
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const v1, 0x7f09010f

    .line 442
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    move v2, v1

    .line 444
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 445
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 446
    invoke-virtual {v3, p1}, Landroid/view/View;->setClickable(Z)V

    if-eqz p1, :cond_0

    .line 448
    invoke-virtual {v3, v1}, Landroid/view/View;->setPressed(Z)V

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private setSelectedProp(I)V
    .locals 5

    .line 314
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    .line 315
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getView()Landroid/view/View;

    move-result-object p1

    const v0, 0x7f09010f

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    const/4 v0, 0x0

    move v1, v0

    .line 316
    :goto_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 317
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 318
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    if-ne v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_1

    :cond_0
    move v3, v0

    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V

    .line 319
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    iget v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    if-ne v3, v4, :cond_1

    .line 320
    invoke-virtual {p1, v2, v2}, Landroid/view/ViewGroup;->requestChildFocus(Landroid/view/View;Landroid/view/View;)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 7

    .line 406
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v2, v1

    .line 408
    :goto_0
    invoke-static {}, Lcom/sonymobile/scan3d/PropResources;->values()[Lcom/sonymobile/scan3d/PropResources;

    move-result-object v3

    array-length v3, v3

    if-ge v2, v3, :cond_2

    .line 409
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3, v2}, Lcom/sonymobile/scan3d/PropResources;->fromInt(Landroid/content/Context;I)Lcom/sonymobile/scan3d/PropResources;

    move-result-object v3

    if-nez v3, :cond_0

    .line 412
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Did not manage to get prop resource "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_0
    const v4, 0x7f0c0091

    .line 415
    invoke-virtual {p1, v4, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v4

    .line 416
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const v5, 0x7f090150

    .line 417
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    .line 418
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/sonymobile/scan3d/PropResources;->getDrawable(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/ImageView;->setImageResource(I)V

    const v5, 0x7f090151

    .line 419
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/TextView;

    .line 420
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v3, v6}, Lcom/sonymobile/scan3d/PropResources;->getNameId(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v5, v3}, Landroid/widget/TextView;->setText(I)V

    .line 421
    iget v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    const/4 v5, 0x1

    if-ne v3, v2, :cond_1

    move v3, v5

    goto :goto_1

    :cond_1
    move v3, v1

    :goto_1
    invoke-virtual {v4, v3}, Landroid/view/View;->setSelected(Z)V

    .line 422
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v4, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 423
    invoke-virtual {v4, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 424
    invoke-virtual {v4, v5}, Landroid/view/View;->setClickable(Z)V

    .line 425
    invoke-virtual {p2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 429
    :cond_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 430
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v2, 0x7f07011e

    invoke-virtual {p2, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    .line 429
    invoke-static {p1, p2, v2}, Lcom/sonymobile/scan3d/viewer/fragments/utils/ViewerUtils;->getAdjustedPickerItemMargin(Landroid/content/Context;FI)I

    move-result p1

    .line 431
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 433
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 434
    invoke-virtual {v2, p1, v1, p1, v1}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 435
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3

    :cond_3
    return-void
.end method

.method private startAnimationPlayback(I)V
    .locals 3

    if-ltz p1, :cond_0

    .line 386
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const-string v1, "PropIdle"

    const/4 v2, 0x1

    .line 387
    invoke-virtual {v0, p1, v1, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startNamedAnimation(ILjava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 389
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qjxqZfYjFlIEEfuAY0brgr3NS2I;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;)V

    goto :goto_0

    .line 394
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;)V

    :goto_0
    return-void
.end method

.method private unloadProp(II)V
    .locals 3

    const/4 v0, -0x2

    if-le p1, v0, :cond_0

    .line 359
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->unload(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 360
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to unload PropId "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 363
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;

    invoke-direct {v0, p0, p2}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$quY_E2-5RQ-WwhvgGDF1E1azb6o;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 2

    .line 302
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->getView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->enableShareButton(Landroid/view/View;Z)V

    .line 304
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 307
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->setClickable(Z)V

    .line 308
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 309
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->setSelectedProp(I)V

    .line 310
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$7n1Y0_KjgLj0BwkgLUKsuAWBjT8;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$7n1Y0_KjgLj0BwkgLUKsuAWBjT8;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c006f

    return v0
.end method

.method public getNavigationDrawable()I
    .locals 1

    const v0, 0x7f0800d1

    return v0
.end method

.method public getTextureViewId()I
    .locals 1

    const v0, 0x7f0900e1

    return v0
.end method

.method protected getTitleId()I
    .locals 1

    const v0, 0x7f10027b

    return v0
.end method

.method protected getToolBarActionText()I
    .locals 1

    const v0, 0x7f100040

    return v0
.end method

.method protected onActionClick()V
    .locals 3

    const v0, 0x7f100102

    const/4 v1, 0x0

    .line 271
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->showProgressDialog(IZ)V

    .line 272
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 273
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$-F_6DZEcpdftp-FV8_Y4YNJCOKM;

    invoke-direct {v2, p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$-F_6DZEcpdftp-FV8_Y4YNJCOKM;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;Landroid/os/Handler;)V

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 134
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p2

    const/4 v0, 0x1

    const v1, 0x7f10024a

    .line 135
    invoke-virtual {p0, v1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->showProgressDialog(IZ)V

    if-eqz p3, :cond_0

    const-string v1, "selected_prop"

    .line 137
    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    const-string v1, "init_meshes"

    .line 138
    invoke-virtual {p3, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshes:I

    :cond_0
    const/4 v1, 0x0

    if-nez p3, :cond_2

    .line 141
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz p3, :cond_2

    .line 142
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result p3

    iput p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshes:I

    .line 143
    iget p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshes:I

    if-le p3, v0, :cond_2

    .line 145
    iget-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p3, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->isMeshVisible(I)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 146
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshVisible:I

    goto :goto_0

    .line 148
    :cond_1
    iput v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshVisible:I

    .line 153
    :cond_2
    :goto_0
    iget p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    const/4 v2, -0x1

    if-eq p3, v2, :cond_3

    goto :goto_1

    :cond_3
    move v0, v1

    :goto_1
    invoke-direct {p0, p2, v0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->enableShareButton(Landroid/view/View;Z)V

    const p3, 0x7f09010f

    .line 156
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/view/ViewGroup;

    .line 157
    invoke-direct {p0, p1, p3}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->setupBottomBar(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    return-object p2
.end method

.method public onMeshesLoadedIntoSphan(ZZ)V
    .locals 0

    .line 251
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mIsPaused:Z

    if-eqz p2, :cond_0

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 255
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz p1, :cond_2

    .line 256
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->dismissProgressDialog()V

    .line 257
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mHandler:Landroid/os/Handler;

    new-instance p2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qc_tD02PFRy-fZeLwC2X3CSZJfI;

    invoke-direct {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$qc_tD02PFRy-fZeLwC2X3CSZJfI;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 261
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->loadProp(I)V

    goto :goto_0

    .line 264
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->handleFailedMesh()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 2

    const/4 v0, 0x1

    .line 192
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mIsPaused:Z

    .line 193
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-eqz v0, :cond_0

    .line 194
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$2bNEEbOY382PmltqSn8J0A9zPQA;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$PropsFragment$2bNEEbOY382PmltqSn8J0A9zPQA;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 207
    :cond_0
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 3

    const/4 v0, 0x0

    .line 176
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mIsPaused:Z

    .line 177
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onResume()V

    .line 178
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mViewMatrix:[F

    if-eqz v1, :cond_0

    .line 179
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mViewMatrix:[F

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setViewerViewMatrix([F)V

    .line 181
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, v0, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    .line 182
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshes:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    .line 183
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 212
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "selected_prop"

    .line 213
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSelectedProp:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "prop_id"

    .line 214
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mPropId:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v0, "init_meshes"

    .line 215
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshes:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method

.method public onStart(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 1

    .line 164
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 165
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setPlainShading(Z)V

    return-void
.end method

.method public onStop(Lcom/sonymobile/scan3d/SimpleLifecycle$SimpleLifecycleOwner;)V
    .locals 2

    .line 170
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshes:I

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->unloadDownTo(I)Z

    .line 171
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/PropsFragment;->mInitialMeshVisible:I

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setMeshVisible(IZ)Z

    return-void
.end method
