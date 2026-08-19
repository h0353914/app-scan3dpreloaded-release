.class public final Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;
.super Lcom/sonymobile/scan3d/recording/Muxer$Encoder;
.source "Muxer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/recording/Muxer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "AudioEncoder"
.end annotation


# instance fields
.field private final mPts:Ljava/util/concurrent/atomic/AtomicLong;

.field private volatile mRecording:Z

.field private final mSource:Lcom/sonymobile/scan3d/recording/AudioSource;

.field final synthetic this$0:Lcom/sonymobile/scan3d/recording/Muxer;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/AudioSource;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 279
    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    .line 280
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;-><init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;)V

    .line 260
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mPts:Ljava/util/concurrent/atomic/AtomicLong;

    .line 281
    iput-object p3, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mSource:Lcom/sonymobile/scan3d/recording/AudioSource;

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/AudioSource;Lcom/sonymobile/scan3d/recording/Muxer$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 255
    invoke-direct {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;-><init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/AudioSource;)V

    return-void
.end method

.method public static synthetic lambda$init$0(Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;)V
    .locals 10

    .line 292
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mSource:Lcom/sonymobile/scan3d/recording/AudioSource;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/recording/AudioSource;->init()V

    .line 293
    :goto_0
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mRecording:Z

    if-eqz v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    const-wide/16 v1, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v4

    .line 295
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0, v4}, Landroid/media/MediaCodec;->getInputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 296
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mSource:Lcom/sonymobile/scan3d/recording/AudioSource;

    iget-object v2, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mPts:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-interface {v1, v0, v2}, Lcom/sonymobile/scan3d/recording/AudioSource;->write(Ljava/nio/ByteBuffer;Ljava/util/concurrent/atomic/AtomicLong;)I

    move-result v6

    .line 297
    iget-object v3, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    const/4 v5, 0x0

    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mPts:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v7

    const/4 v9, 0x0

    invoke-virtual/range {v3 .. v9}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 301
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mSource:Lcom/sonymobile/scan3d/recording/AudioSource;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/recording/AudioSource;->done()V

    .line 304
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 305
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    return-void

    :catchall_0
    move-exception v0

    .line 301
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mSource:Lcom/sonymobile/scan3d/recording/AudioSource;

    invoke-interface {v1}, Lcom/sonymobile/scan3d/recording/AudioSource;->done()V

    .line 304
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->stop()V

    .line 305
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V

    .line 306
    throw v0
.end method


# virtual methods
.method protected done()V
    .locals 1

    const/4 v0, 0x0

    .line 314
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mRecording:Z

    return-void
.end method

.method public drain(Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 321
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mRecording:Z

    .line 323
    :cond_0
    invoke-super {p0, v0}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->drain(Z)V

    return-void
.end method

.method public bridge synthetic getFirstPts()J
    .locals 2

    .line 255
    invoke-super {p0}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->getFirstPts()J

    move-result-wide v0

    return-wide v0
.end method

.method protected init()V
    .locals 2

    .line 286
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    const/4 v0, 0x1

    .line 287
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;->mRecording:Z

    .line 290
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/sonymobile/scan3d/recording/-$$Lambda$Muxer$AudioEncoder$J7YmACvdHyKKc6-PpCREiAPtEnA;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/recording/-$$Lambda$Muxer$AudioEncoder$J7YmACvdHyKKc6-PpCREiAPtEnA;-><init>(Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 307
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
