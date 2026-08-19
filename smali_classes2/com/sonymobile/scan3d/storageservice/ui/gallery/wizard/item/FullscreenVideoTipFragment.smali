.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;
.source "FullscreenVideoTipFragment.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/FirstTimeActivity$PageListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;
    }
.end annotation


# static fields
.field static final KEY_TIP:Ljava/lang/String; = "tip"

.field static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.gallery.wizard.item.FullscreenVideoTipFragment"


# instance fields
.field private mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

.field private mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 27
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;-><init>()V

    .line 41
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$1;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;
    .locals 0

    .line 27
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    return-object p0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;
    .locals 2

    .line 50
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "tip"

    .line 51
    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 52
    new-instance p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;-><init>()V

    .line 53
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->setArguments(Landroid/os/Bundle;)V

    .line 54
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-object p0
.end method


# virtual methods
.method public onAttach(Landroid/content/Context;)V
    .locals 1

    .line 60
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onAttach(Landroid/content/Context;)V

    .line 61
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    if-eqz v0, :cond_0

    .line 64
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "Activity must implement VideoTipFragmentOwner"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const p3, 0x7f0c00bb

    const/4 v0, 0x0

    .line 70
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onDestroyView()V
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->release()V

    .line 105
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onDestroyView()V

    return-void
.end method

.method public onPageSelected(Z)V
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->setPageSelected(Z)V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->setResumed(Z)V

    .line 94
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 2

    .line 87
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/TipFragment;->onResume()V

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->setResumed(Z)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 6
    .param p2    # Landroid/os/Bundle;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 75
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const p2, 0x7f0901e7

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    move-object v2, p2

    check-cast v2, Landroid/view/TextureView;

    const p2, 0x7f0901cb

    .line 76
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroid/widget/TextView;

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mOwner:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;->getVideoExecutor()Ljava/util/concurrent/Executor;

    move-result-object v4

    const/4 v5, 0x1

    .line 75
    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->init(Landroid/content/Context;Landroid/view/TextureView;Landroid/widget/TextView;Ljava/util/concurrent/Executor;Z)V

    .line 77
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mZipResourceFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getVideoName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;->getAssetFileDescriptor(Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;

    move-result-object p1

    if-nez p1, :cond_0

    .line 79
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "FullscreenVideoFragment: Failed to find "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getVideoName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " in Expansion file"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 82
    :cond_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->mPlayerController:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getSubtitles()I

    move-result v0

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getVideoName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p1, v0, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->setVideoFileResource(Landroid/content/res/AssetFileDescriptor;ILjava/lang/String;)V

    return-void
.end method
