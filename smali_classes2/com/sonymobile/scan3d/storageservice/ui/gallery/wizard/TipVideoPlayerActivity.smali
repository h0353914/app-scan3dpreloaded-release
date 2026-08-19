.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;
.super Landroid/app/Activity;
.source "TipVideoPlayerActivity.java"


# static fields
.field public static final EXTRA_VIDEO:Ljava/lang/String; = "extra_video"


# instance fields
.field private mMediaController:Landroid/widget/MediaController;

.field private mMediaPlayerControl:Landroid/widget/MediaController$MediaPlayerControl;

.field private mVideo:I

.field private mVideoView:Landroid/widget/VideoView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 72
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaPlayerControl:Landroid/widget/MediaController$MediaPlayerControl;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)Landroid/widget/VideoView;
    .locals 0

    .line 21
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideoView:Landroid/widget/VideoView;

    return-object p0
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;Landroid/media/MediaPlayer;)V
    .locals 0

    .line 42
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->finish()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 32
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0c0024

    .line 33
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->setContentView(I)V

    .line 35
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "extra_video"

    const/4 v1, 0x0

    .line 37
    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideo:I

    :cond_0
    const p1, 0x7f090215

    .line 40
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/VideoView;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideoView:Landroid/widget/VideoView;

    .line 41
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideoView:Landroid/widget/VideoView;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "android.resource://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideo:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setVideoURI(Landroid/net/Uri;)V

    .line 42
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideoView:Landroid/widget/VideoView;

    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$TipVideoPlayerActivity$VtPuUfY84wxhTvrH8DLVL31afjU;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/-$$Lambda$TipVideoPlayerActivity$VtPuUfY84wxhTvrH8DLVL31afjU;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/VideoView;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 43
    new-instance p1, Landroid/widget/MediaController;

    invoke-direct {p1, p0}, Landroid/widget/MediaController;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaController:Landroid/widget/MediaController;

    .line 44
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaController:Landroid/widget/MediaController;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaPlayerControl:Landroid/widget/MediaController$MediaPlayerControl;

    invoke-virtual {p1, v0}, Landroid/widget/MediaController;->setMediaPlayer(Landroid/widget/MediaController$MediaPlayerControl;)V

    .line 45
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaController:Landroid/widget/MediaController;

    const v0, 0x7f090218

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/widget/MediaController;->setAnchorView(Landroid/view/View;)V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 50
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 51
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->start()V

    return-void
.end method

.method protected onStop()V
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mVideoView:Landroid/widget/VideoView;

    invoke-virtual {v0}, Landroid/widget/VideoView;->stopPlayback()V

    .line 57
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 62
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 63
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->isShown()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 64
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaController:Landroid/widget/MediaController;

    invoke-virtual {v0}, Landroid/widget/MediaController;->hide()V

    goto :goto_0

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/TipVideoPlayerActivity;->mMediaController:Landroid/widget/MediaController;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/MediaController;->show(I)V

    .line 69
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroid/app/Activity;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
