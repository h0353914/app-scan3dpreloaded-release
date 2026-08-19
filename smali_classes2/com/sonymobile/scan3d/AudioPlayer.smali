.class final Lcom/sonymobile/scan3d/AudioPlayer;
.super Ljava/lang/Object;
.source "AudioPlayer.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.AudioPlayer"


# instance fields
.field private final mActivePlayers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mContext:Landroid/content/Context;

    .line 48
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 115
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->release()V

    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 3

    .line 101
    sget-object v0, Lcom/sonymobile/scan3d/AudioPlayer;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Play failed with what="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", extra="

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->release()V

    const/4 p1, 0x0

    return p1
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 108
    iget-object v0, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    move-object v1, p1

    check-cast v1, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    return-void
.end method

.method public play(II)V
    .locals 7

    .line 85
    new-instance v6, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;

    invoke-direct {v6, p1}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;-><init>(I)V

    .line 87
    :try_start_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->openRawResourceFd(I)Landroid/content/res/AssetFileDescriptor;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 p2, 0x0

    .line 88
    :try_start_1
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    move-result-wide v2

    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    move-result-wide v4

    move-object v0, v6

    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 89
    invoke-virtual {v6, p0}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 90
    invoke-virtual {v6, p0}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 91
    invoke-virtual {v6, p0}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 92
    invoke-virtual {v6}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->prepareAsync()V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_2

    .line 93
    :try_start_2
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 87
    :try_start_3
    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 93
    :try_start_4
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_1
    move-exception p1

    :try_start_5
    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Landroid/content/res/AssetFileDescriptor;->close()V

    :cond_1
    :goto_1
    throw v0
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception p1

    .line 94
    sget-object p2, Lcom/sonymobile/scan3d/AudioPlayer;->TAG:Ljava/lang/String;

    const-string v0, "Play failed"

    invoke-static {p2, v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 95
    invoke-virtual {v6}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->release()V

    :cond_2
    :goto_2
    return-void
.end method

.method public stop(I)V
    .locals 3

    .line 68
    iget-object v0, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;

    .line 69
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->getId()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 70
    iget-object p1, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    invoke-interface {p1, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 71
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->stop()V

    .line 72
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/AudioPlayer$HintPlayer;->release()V

    :cond_1
    return-void
.end method

.method public stopAll()V
    .locals 2

    .line 55
    iget-object v0, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/MediaPlayer;

    .line 56
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->stop()V

    .line 57
    invoke-virtual {v1}, Landroid/media/MediaPlayer;->release()V

    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/AudioPlayer;->mActivePlayers:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method
