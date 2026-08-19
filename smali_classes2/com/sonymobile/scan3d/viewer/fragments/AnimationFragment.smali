.class public Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;
.source "AnimationFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;
.implements Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$ErrorDialog$ErrorDialogListener;
.implements Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;
.implements Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;,
        Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;
    }
.end annotation


# static fields
.field private static final KEY_ANIMATION_INDEX:Ljava/lang/String; = "ANIMATION_INDEX"

.field public static final KEY_CLOSE_AFTER_SHARE:Ljava/lang/String; = "CLOSE_AFTER_SHARE"

.field private static final KEY_DONT_SHOW_AGAIN:Ljava/lang/String; = "FileShareDialog_dontShowAgain"

.field public static final KEY_PICKER_INTENT:Ljava/lang/String; = "PICKER_INTENT"

.field public static final KEY_SHAREABLE:Ljava/lang/String; = "SHAREABLE"

.field public static final KEY_SHARE_INSTANTLY:Ljava/lang/String; = "SHARE_INSTANTLY"

.field public static final KEY_TEXTURE_SIZE:Ljava/lang/String; = "TEXTURE_SIZE"

.field private static final NO_ANIMATION_ID:I = -0x1


# instance fields
.field private mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

.field private mHandler:Landroid/os/Handler;

.field private mNewInstance:Z

.field private mOngoingAnimation:Landroid/view/View;

.field private mSelectedAnimation:I

.field private mToolBar:Landroid/widget/Toolbar;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 68
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;-><init>()V

    const/4 v0, 0x0

    .line 124
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    .line 126
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method private getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;
    .locals 3

    .line 782
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "SHAREABLE"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public static synthetic lambda$onConversionFailed$2(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 1

    .line 556
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->isEffectActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 557
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopEffect()V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onDestroyView$1(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 1

    .line 244
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextDestroyed()V

    .line 246
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopEffect()V

    .line 247
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextCreated()V

    .line 249
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$onPause$0(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 1

    .line 226
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 227
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextDestroyed()V

    .line 228
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopEffect()V

    .line 229
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextCreated()V

    .line 231
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$onRiggedMeshMissing$3(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 1

    .line 608
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->isEffectActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 610
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->stopEffect()V

    .line 612
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startProgressEffect()V

    return-void
.end method

.method public static synthetic lambda$populateAnimationMenu$4(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;)Z
    .locals 1

    .line 666
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getIdentifier()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public static synthetic lambda$showStaticMesh$5(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 1

    .line 690
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->showStaticMesh()V

    return-void
.end method

.method public static synthetic lambda$startAnimationPlayback$6(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V
    .locals 2

    .line 700
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(I)Z

    .line 701
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method public static synthetic lambda$updateToolbar$7(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;Landroid/view/View;)V
    .locals 0

    .line 730
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->onActionClick()V

    return-void
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Z)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;
    .locals 1

    const/4 v0, 0x1

    .line 148
    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;ZZ)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;ZZ)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;
    .locals 2

    .line 163
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    if-nez p0, :cond_0

    .line 165
    new-instance p0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>()V

    .line 166
    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    :cond_0
    const-string v1, "SHAREABLE"

    .line 168
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->toBundle()Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    const-string p0, "SHARE_INSTANTLY"

    .line 169
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "CLOSE_AFTER_SHARE"

    .line 170
    invoke-virtual {v0, p0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 172
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;-><init>()V

    .line 173
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method public static newInstance(ZI)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;
    .locals 2

    .line 185
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "PICKER_INTENT"

    .line 186
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p0, "TEXTURE_SIZE"

    .line 187
    invoke-virtual {v0, p0, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 188
    new-instance p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;-><init>()V

    .line 190
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->setArguments(Landroid/os/Bundle;)V

    return-object p0
.end method

.method private onRiggedMeshMissing()V
    .locals 4

    .line 607
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$PYhP0I62GJ7rqu40q0gSsBQDNAw;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$PYhP0I62GJ7rqu40q0gSsBQDNAw;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 614
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 616
    invoke-static {}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getInstance()Lcom/sonymobile/scan3d/animation/RigModelManager;

    move-result-object v1

    .line 617
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, v2, v3, v0, p0}, Lcom/sonymobile/scan3d/animation/RigModelManager;->rigModel(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/SphanRenderer;Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    :cond_0
    return-void
.end method

.method private populateAnimationMenu()Z
    .locals 10

    .line 630
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 634
    :cond_0
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "SHAREABLE"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v0, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 636
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getNumAnimations()I

    move-result v2

    .line 637
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    if-nez v3, :cond_1

    return v1

    .line 643
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 645
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v0

    sget-object v5, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    const/4 v6, -0x1

    if-ne v0, v5, :cond_2

    .line 647
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    sget-object v7, Lcom/sonymobile/scan3d/animation/AnimationResources;->NONE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    invoke-virtual {v7, v3}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getDrawable(Landroid/content/Context;)I

    move-result v7

    sget-object v8, Lcom/sonymobile/scan3d/animation/AnimationResources;->NONE:Lcom/sonymobile/scan3d/animation/AnimationResources;

    .line 648
    invoke-virtual {v8, v3}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getNameId(Landroid/content/Context;)I

    move-result v8

    invoke-direct {v0, v5, v7, v8, v1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;III)V

    .line 649
    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 650
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 651
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v5, 0x7f090195

    invoke-virtual {v0, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 652
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    move v0, v1

    :goto_0
    if-ge v0, v2, :cond_4

    .line 656
    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v5, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getAnimationName(I)Ljava/lang/String;

    move-result-object v5

    .line 657
    invoke-static {v3, v5}, Lcom/sonymobile/scan3d/animation/AnimationResources;->fromString(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/animation/AnimationResources;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 659
    new-instance v7, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v5, v3}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getDrawable(Landroid/content/Context;)I

    move-result v9

    .line 660
    invoke-virtual {v5, v3}, Lcom/sonymobile/scan3d/animation/AnimationResources;->getNameId(Landroid/content/Context;)I

    move-result v5

    invoke-direct {v7, v8, v9, v5, v1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;III)V

    .line 659
    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 665
    :cond_4
    invoke-virtual {v4}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    move-result-object v0

    new-instance v2, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YUHC9KKqWFzANjAMlyYu-cMPAXA;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YUHC9KKqWFzANjAMlyYu-cMPAXA;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    .line 666
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v0

    .line 667
    invoke-interface {v0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    move-result-object v0

    .line 669
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-nez v2, :cond_5

    return v1

    .line 672
    :cond_5
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    .line 673
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 672
    invoke-virtual {v2, v1, v4, v0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addPickerMenu(ILjava/util/ArrayList;I)V

    .line 674
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    const v1, 0x7f06001d

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setup(I)V

    .line 677
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    if-ne v0, v6, :cond_6

    .line 678
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->showStaticMesh()V

    goto :goto_1

    .line 680
    :cond_6
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->startAnimationPlayback()V

    :goto_1
    const/4 v0, 0x1

    return v0
.end method

.method private showAllAnimationsWillBeSharedDialog(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V
    .locals 2

    const-string v0, "ShareAnimationsConfirmDialog_dontShowAgain"

    .line 369
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;

    move-result-object p1

    .line 370
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$ShareAllAnimationsConfirmDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method private showStaticMesh()V
    .locals 2

    .line 689
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->removeAnimationListener()V

    .line 690
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$opW86Y_WTENiNPQdKbOHpQ_OGEg;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$opW86Y_WTENiNPQdKbOHpQ_OGEg;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private startAnimationPlayback()V
    .locals 2

    .line 698
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->hasAnimationListener()Z

    move-result v0

    if-nez v0, :cond_0

    .line 699
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$JT_Js387Rzr_spEL5LfUidVqgh4;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$JT_Js387Rzr_spEL5LfUidVqgh4;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setAnimationListener(Lcom/sonymobile/scan3d/viewer/SphanGLTextureView$AnimationListener;)V

    .line 704
    :cond_0
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 706
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    .line 707
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->showRiggedMesh()V

    .line 711
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(I)Z

    .line 712
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method private updateToolbar(Z)V
    .locals 6

    .line 721
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    const v1, 0x7f0900bc

    invoke-virtual {v0, v1}, Landroid/widget/Toolbar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    const/4 v1, 0x0

    const/16 v2, 0x8

    if-eqz p1, :cond_0

    .line 723
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    const v4, 0x7f0800d1

    invoke-virtual {v3, v4}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    .line 724
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    const v4, 0x7f10002b

    invoke-virtual {p0, v4}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 725
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0600c9

    invoke-virtual {v4, v5}, Landroid/content/Context;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Toolbar;->setBackgroundColor(I)V

    const v3, 0x7f100280

    .line 727
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setText(I)V

    .line 728
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 729
    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 730
    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$5Y6P9fMOO7TtisW8KPwV5Kixo_U;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$5Y6P9fMOO7TtisW8KPwV5Kixo_U;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 732
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mOngoingAnimation:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 734
    :cond_0
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    const v4, 0x7f0800cb

    invoke-virtual {v3, v4}, Landroid/widget/Toolbar;->setNavigationIcon(I)V

    .line 735
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    const v4, 0x7f10002a

    invoke-virtual {p0, v4}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/Toolbar;->setNavigationContentDescription(Ljava/lang/CharSequence;)V

    .line 736
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x106000d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getColor(I)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/widget/Toolbar;->setBackgroundColor(I)V

    .line 738
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 740
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mOngoingAnimation:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 742
    :goto_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->updateToolbarTitle(Z)V

    return-void
.end method

.method private updateToolbarTitle(Z)V
    .locals 2

    .line 757
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    const v1, 0x7f0901f8

    .line 759
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Toolbar;

    if-eqz p1, :cond_2

    .line 761
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p1

    .line 763
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p1

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    if-ne p1, v1, :cond_1

    .line 764
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    const p1, 0x7f100283

    goto :goto_0

    :cond_0
    const p1, 0x7f100270

    :goto_0
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitle(I)V

    goto :goto_1

    :cond_1
    const p1, 0x7f10005a

    .line 768
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitle(I)V

    goto :goto_1

    :cond_2
    const-string p1, ""

    .line 771
    invoke-virtual {v0, p1}, Landroid/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c005f

    return v0
.end method

.method public getNavigationDrawable()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getTextureViewId()I
    .locals 1

    const v0, 0x7f0900e1

    return v0
.end method

.method protected getTitleId()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getTitleText()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    .line 394
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 405
    :pswitch_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    goto :goto_0

    .line 399
    :pswitch_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_0

    .line 396
    :pswitch_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Landroid/net/Uri;

    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v0, v1, p1}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->finishWithResult(Landroid/net/Uri;I)V

    :goto_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onActionClick()V
    .locals 8

    .line 312
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "FileShareDialog_dontShowAgain"

    const/4 v2, 0x0

    .line 313
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "ShareAnimationsConfirmDialog_dontShowAgain"

    .line 314
    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 316
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v3

    .line 317
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getShareable()Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v4

    .line 319
    iget v5, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    const/4 v6, 0x1

    const/4 v7, -0x1

    if-eq v5, v7, :cond_0

    move v2, v6

    .line 322
    :cond_0
    invoke-virtual {v4, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setFileSet(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v5

    if-eqz v2, :cond_1

    sget-object v7, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    goto :goto_0

    :cond_1
    sget-object v7, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->DEFAULT:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    .line 323
    :goto_0
    invoke-virtual {v5, v7}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v5

    if-eqz v2, :cond_2

    .line 324
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_2
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-virtual {v5, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setUrl(Ljava/lang/String;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v3

    .line 325
    invoke-virtual {v3, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v5, 0x0

    if-nez v3, :cond_3

    move-object v3, v5

    goto :goto_2

    :cond_3
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 327
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object v3

    :goto_2
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setViewMatrix([F)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 330
    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getRecipient()Ljava/lang/Object;

    move-result-object v2

    if-nez v2, :cond_6

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->isRecipientRequired()Z

    move-result v2

    if-nez v2, :cond_4

    goto :goto_3

    .line 355
    :cond_4
    sget-object v1, Lcom/sonymobile/scan3d/analytics/HitEvent;->ANIMATION_SHARE_BUTTON_CLICKED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    if-eqz v0, :cond_5

    .line 357
    invoke-static {v4}, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;->newInstance(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    move-result-object v0

    .line 358
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object v1

    const v2, 0x7f0900dc

    .line 359
    invoke-virtual {v1, v2, v0}, Landroidx/fragment/app/FragmentTransaction;->replace(ILandroidx/fragment/app/Fragment;)Landroidx/fragment/app/FragmentTransaction;

    .line 360
    const-class v0, Lcom/sonymobile/scan3d/viewer/sharing/SharingFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentTransaction;->addToBackStack(Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 361
    invoke-virtual {v1}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    goto :goto_4

    .line 363
    :cond_5
    invoke-direct {p0, v4}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->showAllAnimationsWillBeSharedDialog(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    goto :goto_4

    :cond_6
    :goto_3
    if-eqz v1, :cond_9

    .line 334
    sget-object v1, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {v4}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result v2

    aget v1, v1, v2

    if-eq v1, v6, :cond_7

    .line 347
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_4

    :cond_7
    if-eqz v0, :cond_8

    .line 339
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v4, v0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;)V

    goto :goto_4

    .line 341
    :cond_8
    invoke-direct {p0, v4}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->showAllAnimationsWillBeSharedDialog(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    goto :goto_4

    :cond_9
    const-string v0, "FileShareDialog_dontShowAgain"

    .line 351
    invoke-static {v0, v4}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->newInstance(Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;

    move-result-object v0

    .line 352
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v0, v1, v5}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment$FileShareDialog;->show(Landroidx/fragment/app/FragmentManager;Ljava/lang/String;)V

    :goto_4
    return-void
.end method

.method public onConversionDone(Landroid/net/Uri;)V
    .locals 3

    .line 531
    const-class v0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onConversionDone()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 532
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    .line 533
    new-instance v1, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string v2, "SHAREABLE"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    const-string v2, "SHARE_INSTANTLY"

    .line 534
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 p1, 0x1

    .line 535
    invoke-virtual {v1, p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setScanFormat(I)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    move-result-object p1

    sget-object v2, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ANIMATION:Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    invoke-virtual {p1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->setShareType(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;)Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    .line 536
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1, p1, v2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->share(Landroid/content/Context;Landroid/os/Handler;)V

    const-string p1, "CLOSE_AFTER_SHARE"

    .line 537
    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 538
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStack()V

    goto :goto_0

    :cond_0
    const-string v2, "PICKER_INTENT"

    .line 540
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 541
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    .line 542
    instance-of v0, v0, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    if-eqz v0, :cond_2

    .line 543
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getTextureSize()I

    move-result v1

    invoke-static {v0, v2, p1, v1}, Lcom/sonymobile/scan3d/utils/SharingUtil;->shareRiggedFile(Landroid/content/Context;Landroid/os/Handler;Landroid/net/Uri;I)V

    goto :goto_0

    .line 546
    :cond_1
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onConversionDone(Landroid/net/Uri;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onConversionFailed(Landroid/net/Uri;)V
    .locals 2

    .line 552
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 553
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mOngoingAnimation:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 554
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-static {p0, v0, p1}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;->showConversionFailedDialog(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/FragmentManager;Landroid/net/Uri;)V

    .line 555
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$_gw_BfdFJyrxgfjCgB8Cz1WChas;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$_gw_BfdFJyrxgfjCgB8Cz1WChas;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onConvertErrorDialogDismiss(Landroidx/fragment/app/DialogFragment;Landroid/net/Uri;)V
    .locals 1

    .line 565
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "PICKER_INTENT"

    .line 566
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 567
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    .line 568
    instance-of v0, p1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    if-eqz v0, :cond_0

    .line 569
    check-cast p1, Lcom/sonymobile/scan3d/viewer/ViewerActivity;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/ViewerActivity;->pickRiggedFileFailed(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_0

    .line 571
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    goto :goto_0

    .line 574
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentManager;->popBackStackImmediate()Z

    :goto_0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    .line 196
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    .line 198
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p2

    invoke-static {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 199
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    const p2, 0x7f090052

    .line 201
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    .line 202
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addAnimationMenuListener(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;)V

    const p2, 0x7f0901f8

    .line 204
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/Toolbar;

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    .line 205
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mToolBar:Landroid/widget/Toolbar;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x106000d

    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-virtual {p2, v0}, Landroid/widget/Toolbar;->setBackgroundColor(I)V

    const p2, 0x7f090054

    .line 207
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mOngoingAnimation:Landroid/view/View;

    if-eqz p3, :cond_0

    const-string p2, "ANIMATION_INDEX"

    const/4 v0, -0x1

    .line 210
    invoke-virtual {p3, p2, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    iput p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    .line 212
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->syncFileSet()V

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    .line 214
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mNewInstance:Z

    :goto_0
    return-object p1
.end method

.method public onDestroyView()V
    .locals 2

    .line 238
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onDestroyView()V

    .line 240
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->isEffectActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 241
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YKuwShBzn9xbm02xNV78SqUg1jQ;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$YKuwShBzn9xbm02xNV78SqUg1jQ;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onItemPicked(Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;)V
    .locals 4

    .line 584
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getWhichPicker()I

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 586
    :cond_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getIdentifier()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    .line 587
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->ANIMATION_SELECTED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    .line 588
    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getAnimationName(I)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    int-to-long v2, v2

    .line 587
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;J)V

    .line 590
    iget p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_1

    .line 591
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->showStaticMesh()V

    goto :goto_0

    .line 593
    :cond_1
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->startAnimationPlayback()V

    :goto_0
    const/4 p1, 0x1

    .line 599
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->updateToolbarTitle(Z)V

    return-void
.end method

.method public onMeshLoadFailed(Landroid/net/Uri;)V
    .locals 0

    return-void
.end method

.method public onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 376
    invoke-static {}, Lcom/sonymobile/scan3d/animation/RigModelManager;->getInstance()Lcom/sonymobile/scan3d/animation/RigModelManager;

    move-result-object p2

    if-eqz p1, :cond_0

    .line 377
    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/animation/RigModelManager;->isRigging(Landroid/net/Uri;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 378
    invoke-virtual {p2, p1, p0}, Lcom/sonymobile/scan3d/animation/RigModelManager;->addListener(Landroid/net/Uri;Lcom/sonymobile/scan3d/animation/ObjToGltfConverter$GltfConversionListener;)V

    :cond_0
    return-void
.end method

.method public onMeshLoading(Landroid/net/Uri;)V
    .locals 0

    return-void
.end method

.method public onMeshesLoadedIntoSphan(ZZ)V
    .locals 0

    if-nez p2, :cond_0

    const/4 p1, 0x0

    .line 268
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->updateToolbar(Z)V

    .line 269
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->onRiggedMeshMissing()V

    goto :goto_0

    .line 271
    :cond_0
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mNewInstance:Z

    if-eqz p1, :cond_1

    .line 272
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->ANIMATION_SCREEN_ENTERED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;)V

    :cond_1
    const/4 p1, 0x1

    .line 274
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->updateToolbar(Z)V

    .line 275
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->populateAnimationMenu()Z

    move-result p1

    if-nez p1, :cond_2

    .line 277
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->getFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p1

    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mMeshHolderFragment:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 278
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p2

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p2

    .line 277
    invoke-static {p0, p1, p2}, Lcom/sonymobile/scan3d/animation/ObjToGltfConverter;->showConversionFailedDialog(Landroidx/fragment/app/Fragment;Landroidx/fragment/app/FragmentManager;Landroid/net/Uri;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onPause()V
    .locals 2

    .line 221
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onPause()V

    .line 222
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->removeAnimationListener()V

    .line 223
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->isEffectActive()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mTextureView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$qHT7wgSXmZCewJdAbuPKAQMaai4;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/-$$Lambda$AnimationFragment$qHT7wgSXmZCewJdAbuPKAQMaai4;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 256
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseAnimationFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "ANIMATION_INDEX"

    .line 257
    iget v1, p0, Lcom/sonymobile/scan3d/viewer/fragments/AnimationFragment;->mSelectedAnimation:I

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-void
.end method
