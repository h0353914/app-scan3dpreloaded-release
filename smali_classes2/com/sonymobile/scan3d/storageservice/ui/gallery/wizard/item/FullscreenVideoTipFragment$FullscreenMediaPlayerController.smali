.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;
.super Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;
.source "FullscreenVideoTipFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FullscreenMediaPlayerController"
.end annotation


# instance fields
.field private mVideoName:Ljava/lang/String;

.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$1;)V
    .locals 0

    .line 108
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;)V

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 120
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->onCompletion(Landroid/media/MediaPlayer;)V

    .line 121
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->VIDEO_FINISHED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->mVideoName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    .line 122
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;

    move-result-object p1

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/VideoTipFragmentOwner;->onVideoFinished()V

    return-void
.end method

.method public setVideoFileResource(Landroid/content/res/AssetFileDescriptor;ILjava/lang/String;)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/RawRes;
        .end annotation
    .end param

    .line 113
    invoke-super {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setVideoFileResource(Landroid/content/res/AssetFileDescriptor;I)V

    .line 114
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->mVideoName:Ljava/lang/String;

    .line 115
    sget-object p1, Lcom/sonymobile/scan3d/analytics/HitEvent;->VIDEO_STARTED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/FullscreenVideoTipFragment$FullscreenMediaPlayerController;->mVideoName:Ljava/lang/String;

    invoke-virtual {p1, p2, p3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
