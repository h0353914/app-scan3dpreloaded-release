.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;
.super Ljava/lang/Object;
.source "TipVideoPlayerActivity.java"

# interfaces
.implements Landroid/widget/MediaController$MediaPlayerControl;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public canPause()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public canSeekBackward()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public canSeekForward()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getAudioSessionId()I
    .locals 1

    .line 107
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->getAudioSessionId()I

    move-result v0

    return v0
.end method

.method public getBufferPercentage()I
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->getBufferPercentage()I

    move-result v0

    return v0
.end method

.method public getCurrentPosition()I
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->getCurrentPosition()I

    move-result v0

    return v0
.end method

.method public getDuration()I
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->getDuration()I

    move-result v0

    return v0
.end method

.method public isPlaying()Z
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->isPlaying()Z

    move-result v0

    return v0
.end method

.method public pause()V
    .locals 1

    .line 82
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->pause()V

    return-void
.end method

.method public seekTo(I)V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/widget/VideoView;->seekTo(I)V

    return-void
.end method

.method public start()V
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    return-void
.end method
