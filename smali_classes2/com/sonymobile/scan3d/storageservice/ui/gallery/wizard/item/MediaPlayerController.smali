.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;
.super Ljava/lang/Object;
.source "MediaPlayerController.java"

# interfaces
.implements Landroid/view/TextureView$SurfaceTextureListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# static fields
.field private static final ANDROID_RESOURCE_SCHEME:Ljava/lang/String; = "android.resource://"

.field private static final TAG:Ljava/lang/String; = "MediaPlayerController"


# instance fields
.field protected mContext:Landroid/content/Context;

.field private mExecutor:Ljava/util/concurrent/Executor;

.field private mIsFullScreenVideo:Z

.field protected mIsMediaPlayerPrepared:Z

.field protected mIsResumed:Z

.field private mMediaPlayer:Landroid/media/MediaPlayer;

.field protected mPageSelected:Z

.field private mPrepareTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private mRunningTasks:I

.field private mSubtitles:Landroid/widget/TextView;

.field private mSurface:Landroid/view/Surface;

.field protected mSurfaceAvailable:Z

.field protected mSurfaceSet:Z

.field protected mTextView:Landroid/view/TextureView;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)Landroid/media/MediaPlayer;
    .locals 0

    .line 35
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p0
.end method

.method static synthetic access$002(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer;
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    return-object p1
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)I
    .locals 0

    .line 35
    iget p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mRunningTasks:I

    return p0
.end method

.method static synthetic access$110(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)I
    .locals 2

    .line 35
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mRunningTasks:I

    add-int/lit8 v1, v0, -0x1

    iput v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mRunningTasks:I

    return v0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;I)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setSubtitles(I)V

    return-void
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->onStateChange()V

    return-void
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->releaseMediaPlayer()V

    return-void
.end method

.method public static synthetic lambda$setSubtitles$0(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;Landroid/media/MediaPlayer;Landroid/media/TimedText;)V
    .locals 1

    .line 196
    invoke-virtual {p2}, Landroid/media/TimedText;->getText()Ljava/lang/String;

    move-result-object p1

    .line 198
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 199
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSubtitles:Landroid/widget/TextView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 200
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSubtitles:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 202
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSubtitles:Landroid/widget/TextView;

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method private onStateChange()V
    .locals 2

    .line 101
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsMediaPlayerPrepared:Z

    if-nez v0, :cond_0

    return-void

    .line 104
    :cond_0
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceAvailable:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceSet:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    .line 105
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceSet:Z

    .line 106
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurface:Landroid/view/Surface;

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 108
    :cond_1
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsResumed:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceAvailable:Z

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPageSelected:Z

    if-eqz v0, :cond_2

    .line 109
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    goto :goto_0

    .line 110
    :cond_2
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceAvailable:Z

    if-eqz v0, :cond_4

    .line 111
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 112
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 113
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mTextView:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->invalidate()V

    .line 114
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSubtitles:Landroid/widget/TextView;

    if-eqz v0, :cond_4

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :cond_4
    :goto_0
    return-void
.end method

.method private releaseMediaPlayer()V
    .locals 1

    .line 264
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsMediaPlayerPrepared:Z

    if-eqz v0, :cond_0

    .line 265
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 266
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->reset()V

    .line 267
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    const/4 v0, 0x0

    .line 268
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    const/4 v0, 0x0

    .line 269
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsMediaPlayerPrepared:Z

    :cond_0
    return-void
.end method

.method private setSubtitles(I)V
    .locals 8
    .param p1    # I
        .annotation build Landroidx/annotation/RawRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 178
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_a
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_9
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    .line 181
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v2, ".srt"

    invoke-static {p1, v2}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 182
    :try_start_2
    new-instance v2, Ljava/io/OutputStreamWriter;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sget-object v4, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_4
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    .line 184
    :try_start_3
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v1, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    const/4 v4, 0x0

    move v5, v4

    .line 187
    :goto_0
    :try_start_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 188
    invoke-virtual {v2, v6}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    const-string v5, "\n"

    .line 189
    invoke-virtual {v2, v5}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    const/4 v5, 0x1

    goto :goto_0

    .line 192
    :cond_0
    :try_start_5
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V

    if-eqz v5, :cond_2

    .line 195
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    new-instance v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/-$$Lambda$MediaPlayerController$0noxhUuYkkBynIzYfF4Ui9QfSDs;

    invoke-direct {v3, p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/-$$Lambda$MediaPlayerController$0noxhUuYkkBynIzYfF4Ui9QfSDs;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;)V

    invoke-virtual {v2, v3}, Landroid/media/MediaPlayer;->setOnTimedTextListener(Landroid/media/MediaPlayer$OnTimedTextListener;)V

    .line 206
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const-string v5, "application/x-subrip"

    invoke-virtual {v2, v3, v5}, Landroid/media/MediaPlayer;->addTimedTextSource(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2}, Landroid/media/MediaPlayer;->getTrackInfo()[Landroid/media/MediaPlayer$TrackInfo;

    move-result-object v2

    .line 208
    :goto_1
    array-length v3, v2

    if-ge v4, v3, :cond_2

    .line 209
    aget-object v3, v2, v4

    invoke-virtual {v3}, Landroid/media/MediaPlayer$TrackInfo;->getTrackType()I

    move-result v3

    const/4 v5, 0x3

    if-ne v3, v5, :cond_1

    .line 210
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mMediaPlayer:Landroid/media/MediaPlayer;

    invoke-virtual {v2, v4}, Landroid/media/MediaPlayer;->selectTrack(I)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    if-eqz v1, :cond_3

    .line 215
    :try_start_7
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_8
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_7 .. :try_end_7} :catch_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    :cond_3
    if-eqz p1, :cond_8

    .line 222
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_8

    goto/16 :goto_c

    :catchall_0
    move-exception v4

    move-object v5, v0

    goto :goto_3

    :catch_0
    move-exception v4

    .line 182
    :try_start_8
    throw v4
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception v5

    move-object v7, v5

    move-object v5, v4

    move-object v4, v7

    :goto_3
    if-eqz v5, :cond_4

    .line 192
    :try_start_9
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto :goto_4

    :catch_1
    move-exception v3

    :try_start_a
    invoke-virtual {v5, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4

    :cond_4
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    :goto_4
    throw v4
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception v3

    move-object v4, v0

    goto :goto_5

    :catch_2
    move-exception v3

    .line 182
    :try_start_b
    throw v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception v4

    move-object v7, v4

    move-object v4, v3

    move-object v3, v7

    :goto_5
    if-eqz v4, :cond_5

    .line 192
    :try_start_c
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    goto :goto_6

    :catch_3
    move-exception v2

    :try_start_d
    invoke-virtual {v4, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6

    :cond_5
    invoke-virtual {v2}, Ljava/io/OutputStreamWriter;->close()V

    :goto_6
    throw v3
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_4
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    :catch_4
    move-exception v0

    goto :goto_7

    :catchall_4
    move-exception v2

    move-object p1, v0

    goto :goto_8

    :catch_5
    move-exception p1

    move-object v7, v0

    move-object v0, p1

    move-object p1, v7

    .line 178
    :goto_7
    :try_start_e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    :catchall_5
    move-exception v2

    :goto_8
    if-eqz v1, :cond_7

    if-eqz v0, :cond_6

    .line 215
    :try_start_f
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_6
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_8
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_f .. :try_end_f} :catch_7
    .catchall {:try_start_f .. :try_end_f} :catchall_6

    goto :goto_9

    :catch_6
    move-exception v1

    :try_start_10
    invoke-virtual {v0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_9

    :cond_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_7
    :goto_9
    throw v2
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_8
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_10 .. :try_end_10} :catch_7
    .catchall {:try_start_10 .. :try_end_10} :catchall_6

    :catchall_6
    move-exception v0

    move-object v7, v0

    move-object v0, p1

    move-object p1, v7

    goto :goto_d

    :catch_7
    move-object v0, p1

    goto :goto_a

    :catch_8
    move-object v0, p1

    goto :goto_b

    :catchall_7
    move-exception p1

    goto :goto_d

    .line 219
    :catch_9
    :goto_a
    :try_start_11
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->TAG:Ljava/lang/String;

    const-string v1, "No subtitles resource found"

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    if-eqz v0, :cond_8

    .line 222
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_8

    goto :goto_c

    .line 216
    :catch_a
    :goto_b
    :try_start_12
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->TAG:Ljava/lang/String;

    const-string v1, "Failed to create subtitles file."

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    if-eqz v0, :cond_8

    .line 222
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_8

    .line 223
    :goto_c
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->TAG:Ljava/lang/String;

    const-string v0, "Failed to delete temp file."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    return-void

    :goto_d
    if-eqz v0, :cond_9

    .line 222
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_9

    .line 223
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->TAG:Ljava/lang/String;

    const-string v1, "Failed to delete temp file."

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    :cond_9
    throw p1
.end method


# virtual methods
.method public init(Landroid/content/Context;Landroid/view/TextureView;Landroid/widget/TextView;Ljava/util/concurrent/Executor;Z)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mContext:Landroid/content/Context;

    .line 121
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mTextView:Landroid/view/TextureView;

    .line 122
    invoke-virtual {p2, p0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    const p1, 0x3f800054    # 1.00001f

    .line 125
    invoke-virtual {p2, p1}, Landroid/view/TextureView;->setScaleX(F)V

    .line 126
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSubtitles:Landroid/widget/TextView;

    .line 127
    iput-object p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mExecutor:Ljava/util/concurrent/Executor;

    .line 128
    iput-boolean p5, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsFullScreenVideo:Z

    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureAvailable(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    const/4 p1, 0x1

    .line 230
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setSurfaceAvailable(Z)V

    return-void
.end method

.method public onSurfaceTextureDestroyed(Landroid/graphics/SurfaceTexture;)Z
    .locals 0

    const/4 p1, 0x0

    .line 239
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->setSurfaceAvailable(Z)V

    return p1
.end method

.method public onSurfaceTextureSizeChanged(Landroid/graphics/SurfaceTexture;II)V
    .locals 0

    return-void
.end method

.method public onSurfaceTextureUpdated(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    return-void
.end method

.method public release()V
    .locals 2

    .line 258
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->releaseMediaPlayer()V

    .line 259
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurface:Landroid/view/Surface;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPrepareTask:Landroid/os/AsyncTask;

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/AsyncTask;->cancel(Z)Z

    :cond_1
    return-void
.end method

.method public setPageSelected(Z)V
    .locals 1

    .line 252
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPageSelected:Z

    if-ne v0, p1, :cond_0

    return-void

    .line 253
    :cond_0
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPageSelected:Z

    .line 254
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->onStateChange()V

    return-void
.end method

.method public setResumed(Z)V
    .locals 0

    .line 84
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsResumed:Z

    .line 85
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->onStateChange()V

    return-void
.end method

.method public setSurfaceAvailable(Z)V
    .locals 1

    .line 89
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceAvailable:Z

    .line 90
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurfaceAvailable:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurface:Landroid/view/Surface;

    if-nez p1, :cond_0

    .line 91
    new-instance p1, Landroid/view/Surface;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mTextView:Landroid/view/TextureView;

    invoke-virtual {v0}, Landroid/view/TextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mSurface:Landroid/view/Surface;

    .line 93
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsFullScreenVideo:Z

    if-eqz p1, :cond_0

    .line 94
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mTextView:Landroid/view/TextureView;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/utils/ScreenUtil;->setAspectRatio(Landroid/view/View;)V

    .line 97
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->onStateChange()V

    return-void
.end method

.method public setVideoFileResource(Landroid/content/res/AssetFileDescriptor;I)V
    .locals 2
    .param p2    # I
        .annotation build Landroidx/annotation/RawRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 132
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mIsMediaPlayerPrepared:Z

    .line 133
    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mRunningTasks:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mRunningTasks:I

    .line 134
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPrepareTask:Landroid/os/AsyncTask;

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Landroid/os/AsyncTask;->cancel(Z)Z

    .line 135
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;Landroid/content/res/AssetFileDescriptor;I)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPrepareTask:Landroid/os/AsyncTask;

    .line 173
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mPrepareTask:Landroid/os/AsyncTask;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/item/MediaPlayerController;->mExecutor:Ljava/util/concurrent/Executor;

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2, v0}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
