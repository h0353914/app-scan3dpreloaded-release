.class public Lcom/sonymobile/scan3d/recording/VideoRecorder;
.super Ljava/lang/Object;
.source "VideoRecorder.java"


# static fields
.field private static final AUDIO_BIT_RATE:I = 0x1f400

.field private static final AUDIO_MIME_TYPE:Ljava/lang/String; = "audio/mp4a-latm"

.field private static final FRAME_RATE:I = 0x1e

.field private static final IFRAME_INTERVAL:I = 0x1

.field private static final MIME_TYPE:Ljava/lang/String; = "video/avc"

.field private static final SAMPLE_RATE:I = 0xac44

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.recording.VideoRecorder"

.field private static final VIDEO_BIT_RATE:I = 0x3d0900


# instance fields
.field private final mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

.field private final mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(IILjava/io/File;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    new-instance v0, Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-virtual {p3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p3

    const/4 v1, 0x0

    invoke-direct {v0, p3, v1}, Lcom/sonymobile/scan3d/recording/Muxer;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

    const-string p3, "video/avc"

    .line 86
    invoke-static {p3, p1, p2}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p1

    const-string p2, "color-format"

    const p3, 0x7f000789

    .line 87
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "bitrate"

    const p3, 0x3d0900

    .line 89
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "frame-rate"

    const/16 p3, 0x1e

    .line 90
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "i-frame-interval"

    const/4 p3, 0x1

    .line 91
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 92
    iget-object p2, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-virtual {p2, p1}, Lcom/sonymobile/scan3d/recording/Muxer;->addVideoEncoder(Landroid/media/MediaFormat;)Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    if-eqz p4, :cond_0

    const-string p1, "audio/mp4a-latm"

    const p2, 0xac44

    .line 97
    invoke-static {p1, p2, p3}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object p1

    const-string p2, "aac-profile"

    const/4 p3, 0x2

    .line 98
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "bitrate"

    const p3, 0x1f400

    .line 100
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    const-string p2, "max-input-size"

    const/16 p3, 0x4000

    .line 101
    invoke-virtual {p1, p2, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 102
    iget-object p2, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

    new-instance p3, Lcom/sonymobile/scan3d/recording/MicAudioSource;

    iget-object p4, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    invoke-direct {p3, p4}, Lcom/sonymobile/scan3d/recording/MicAudioSource;-><init>(Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;)V

    invoke-virtual {p2, p1, p3}, Lcom/sonymobile/scan3d/recording/Muxer;->addAudioEncoder(Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/AudioSource;)Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;

    .line 106
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/recording/Muxer;->init()V

    return-void
.end method


# virtual methods
.method public getOutputSurface()Landroid/view/Surface;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mVideoEncoder:Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->getInputSurface()Landroid/view/Surface;

    move-result-object v0

    return-object v0
.end method

.method public onFrameAvailable(Z)V
    .locals 2

    .line 127
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/recording/Muxer;->drain(Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 129
    sget-object v0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->TAG:Ljava/lang/String;

    const-string v1, "Failed to drain encoders"

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method public release()V
    .locals 3

    .line 139
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/VideoRecorder;->mMuxer:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/recording/Muxer;->done()V
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 141
    sget-object v1, Lcom/sonymobile/scan3d/recording/VideoRecorder;->TAG:Ljava/lang/String;

    const-string v2, "Muxer did not receive any frames"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method
