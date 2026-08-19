.class public Lcom/sonymobile/scan3d/recording/MicAudioSource;
.super Ljava/lang/Object;
.source "MicAudioSource.java"

# interfaces
.implements Lcom/sonymobile/scan3d/recording/AudioSource;


# static fields
.field private static final AUDIO_FORMAT:I = 0x2

.field private static final CHANNEL_CONFIG:I = 0x10

.field private static final FRAME_SIZE:I = 0x2

.field private static final POLLING_RATE:I = 0x1

.field private static final SAMPLE_RATE:I = 0xac44


# instance fields
.field private final mBufferSize:I

.field private mFirstPts:J

.field private final mRecorder:Landroid/media/AudioRecord;

.field private final mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;


# direct methods
.method public constructor <init>(Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;)V
    .locals 6

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    const p1, 0xac44

    const/16 v0, 0x10

    const/4 v1, 0x2

    .line 62
    invoke-static {p1, v0, v1}, Landroid/media/AudioRecord;->getMinBufferSize(III)I

    move-result p1

    const v0, 0x15888

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mBufferSize:I

    .line 66
    new-instance p1, Landroid/media/AudioRecord;

    iget v5, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mBufferSize:I

    const/4 v1, 0x7

    const v2, 0xac44

    const/16 v3, 0x10

    const/4 v4, 0x2

    move-object v0, p1

    invoke-direct/range {v0 .. v5}, Landroid/media/AudioRecord;-><init>(IIIII)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mRecorder:Landroid/media/AudioRecord;

    return-void
.end method


# virtual methods
.method public done()V
    .locals 1

    .line 94
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mRecorder:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->stop()V

    return-void
.end method

.method public init()V
    .locals 4

    .line 72
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mFirstPts:J

    .line 73
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mRecorder:Landroid/media/AudioRecord;

    invoke-virtual {v0}, Landroid/media/AudioRecord;->startRecording()V

    return-void
.end method

.method public write(Ljava/nio/ByteBuffer;Ljava/util/concurrent/atomic/AtomicLong;)I
    .locals 4

    .line 80
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->getFirstPts()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 83
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iget-wide v2, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mFirstPts:J

    sub-long/2addr v0, v2

    .line 84
    iget-object v2, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mRecorder:Landroid/media/AudioRecord;

    iget v3, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mBufferSize:I

    invoke-virtual {v2, p1, v3}, Landroid/media/AudioRecord;->read(Ljava/nio/ByteBuffer;I)I

    move-result p1

    .line 87
    iget-object v2, p0, Lcom/sonymobile/scan3d/recording/MicAudioSource;->mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->getFirstPts()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    return p1
.end method
