.class abstract Lcom/sonymobile/scan3d/recording/Muxer$Encoder;
.super Ljava/lang/Object;
.source "Muxer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/recording/Muxer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "Encoder"
.end annotation


# instance fields
.field private final mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

.field protected final mEncoder:Landroid/media/MediaCodec;

.field private mInitialPts:J

.field private mLastTime:J

.field private mTrack:I

.field final synthetic this$0:Lcom/sonymobile/scan3d/recording/Muxer;


# direct methods
.method protected constructor <init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 107
    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const/4 p1, -0x1

    .line 83
    iput p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mTrack:I

    const-wide/16 v0, -0x1

    .line 88
    iput-wide v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mInitialPts:J

    const-wide/16 v0, 0x0

    .line 93
    iput-wide v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mLastTime:J

    const-string p1, "mime"

    .line 108
    invoke-virtual {p2, p1}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    .line 109
    iget-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p1, p2, v0, v0, v1}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    return-void
.end method


# virtual methods
.method protected abstract done()V
.end method

.method public drain(Z)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->signalEndOfInputStream()V

    .line 147
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    const-wide/16 v2, 0x2710

    invoke-virtual {v0, v1, v2, v3}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result v0

    const/4 v1, 0x1

    packed-switch v0, :pswitch_data_0

    if-lez v0, :cond_0

    .line 175
    iget-object v2, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v2, v0}, Landroid/media/MediaCodec;->getOutputBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 176
    iget-object v3, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v3, v3, 0x2

    const/4 v4, 0x0

    if-nez v3, :cond_1

    goto :goto_1

    :pswitch_0
    if-eqz p1, :cond_5

    goto :goto_0

    .line 158
    :pswitch_1
    iget v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mTrack:I

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    .line 161
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    .line 162
    iget-object v2, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v2}, Lcom/sonymobile/scan3d/recording/Muxer;->access$000(Lcom/sonymobile/scan3d/recording/Muxer;)Landroid/media/MediaMuxer;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mTrack:I

    .line 163
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v0}, Lcom/sonymobile/scan3d/recording/Muxer;->access$108(Lcom/sonymobile/scan3d/recording/Muxer;)I

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v0}, Lcom/sonymobile/scan3d/recording/Muxer;->access$100(Lcom/sonymobile/scan3d/recording/Muxer;)I

    move-result v0

    iget-object v2, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v2}, Lcom/sonymobile/scan3d/recording/Muxer;->access$200(Lcom/sonymobile/scan3d/recording/Muxer;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v0, v2, :cond_0

    .line 167
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v0}, Lcom/sonymobile/scan3d/recording/Muxer;->access$000(Lcom/sonymobile/scan3d/recording/Muxer;)Landroid/media/MediaMuxer;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->start()V

    .line 168
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/recording/Muxer;->access$302(Lcom/sonymobile/scan3d/recording/Muxer;Z)Z

    goto :goto_0

    :cond_1
    move v1, v4

    :goto_1
    if-eqz v1, :cond_4

    .line 179
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v1}, Lcom/sonymobile/scan3d/recording/Muxer;->access$300(Lcom/sonymobile/scan3d/recording/Muxer;)Z

    move-result v1

    if-eqz v1, :cond_4

    if-eqz v2, :cond_4

    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->size:I

    if-lez v1, :cond_4

    .line 180
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 181
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v1, v1, Landroid/media/MediaCodec$BufferInfo;->offset:I

    iget-object v3, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v3, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    add-int/2addr v1, v3

    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 182
    iget-wide v5, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mInitialPts:J

    const-wide/16 v7, -0x1

    cmp-long v1, v5, v7

    if-nez v1, :cond_2

    .line 183
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v5, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v5, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mInitialPts:J

    .line 185
    :cond_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v5, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iget-wide v7, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mLastTime:J

    cmp-long v1, v5, v7

    if-lez v1, :cond_3

    .line 186
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->this$0:Lcom/sonymobile/scan3d/recording/Muxer;

    invoke-static {v1}, Lcom/sonymobile/scan3d/recording/Muxer;->access$000(Lcom/sonymobile/scan3d/recording/Muxer;)Landroid/media/MediaMuxer;

    move-result-object v1

    iget v3, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mTrack:I

    iget-object v5, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    invoke-virtual {v1, v3, v2, v5}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 187
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v1, v1, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    iput-wide v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mLastTime:J

    goto :goto_2

    :cond_3
    const-string v1, "Muxer"

    .line 189
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Out of order frame. Prev="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mLastTime:J

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, " This="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget-wide v5, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    invoke-virtual {v2, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mEncoder:Landroid/media/MediaCodec;

    invoke-virtual {v1, v0, v4}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 197
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mBufferInfo:Landroid/media/MediaCodec$BufferInfo;

    iget v0, v0, Landroid/media/MediaCodec$BufferInfo;->flags:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_0

    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getFirstPts()J
    .locals 2

    .line 128
    iget-wide v0, p0, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->mInitialPts:J

    return-wide v0
.end method

.method protected abstract init()V
.end method
