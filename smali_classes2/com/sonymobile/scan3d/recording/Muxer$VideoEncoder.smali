.class public final Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;
.super Lcom/sonymobile/scan3d/recording/Muxer$Encoder;
.source "Muxer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/recording/Muxer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "VideoEncoder"
.end annotation


# instance fields
.field private final mSurface:Landroid/view/Surface;

.field final synthetic this$0:Lcom/sonymobile/scan3d/recording/Muxer;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 224
    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    .line 225
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;-><init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;)V

    .line 226
    iget-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {p1}, Landroid/media/MediaCodec;->createInputSurface()Landroid/view/Surface;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->mSurface:Landroid/view/Surface;

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/Muxer$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;-><init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;)V

    return-void
.end method


# virtual methods
.method protected done()V
    .locals 1

    .line 246
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->stop()V

    .line 247
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->release()V

    return-void
.end method

.method public bridge synthetic drain(Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->drain(Z)V

    return-void
.end method

.method public bridge synthetic getFirstPts()J
    .locals 2

    .line 211
    invoke-super {p0}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->getFirstPts()J

    move-result-wide v0

    return-wide v0
.end method

.method public getInputSurface()Landroid/view/Surface;
    .locals 1

    .line 236
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->mSurface:Landroid/view/Surface;

    return-object v0
.end method

.method protected init()V
    .locals 1

    .line 241
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->start()V

    return-void
.end method
