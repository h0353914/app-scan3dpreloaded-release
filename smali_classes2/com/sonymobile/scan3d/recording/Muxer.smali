.class Lcom/sonymobile/scan3d/recording/Muxer;
.super Ljava/lang/Object;
.source "Muxer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;,
        Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;,
        Lcom/sonymobile/scan3d/recording/Muxer$Encoder;
    }
.end annotation


# static fields
.field private static final TIMEOUT_US:I = 0x2710


# instance fields
.field private mEncoders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/recording/Muxer$Encoder;",
            ">;"
        }
    .end annotation
.end field

.field private final mMuxer:Landroid/media/MediaMuxer;

.field private mStarted:Z

.field private mTacksCount:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 335
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    .line 336
    new-instance v0, Landroid/media/MediaMuxer;

    invoke-direct {v0, p1, p2}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mMuxer:Landroid/media/MediaMuxer;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/recording/Muxer;)Landroid/media/MediaMuxer;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mMuxer:Landroid/media/MediaMuxer;

    return-object p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/recording/Muxer;)I
    .locals 0

    .line 40
    iget p0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mTacksCount:I

    return p0
.end method

.method static synthetic access$108(Lcom/sonymobile/scan3d/recording/Muxer;)I
    .locals 2

    .line 40
    iget v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mTacksCount:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mTacksCount:I

    return v0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/recording/Muxer;)Ljava/util/ArrayList;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/recording/Muxer;)Z
    .locals 0

    .line 40
    iget-boolean p0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mStarted:Z

    return p0
.end method

.method static synthetic access$302(Lcom/sonymobile/scan3d/recording/Muxer;Z)Z
    .locals 0

    .line 40
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mStarted:Z

    return p1
.end method


# virtual methods
.method public addAudioEncoder(Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/AudioSource;)Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 364
    new-instance v0, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/sonymobile/scan3d/recording/Muxer$AudioEncoder;-><init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/AudioSource;Lcom/sonymobile/scan3d/recording/Muxer$1;)V

    .line 365
    iget-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public addVideoEncoder(Landroid/media/MediaFormat;)Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 348
    new-instance v0, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/sonymobile/scan3d/recording/Muxer$VideoEncoder;-><init>(Lcom/sonymobile/scan3d/recording/Muxer;Landroid/media/MediaFormat;Lcom/sonymobile/scan3d/recording/Muxer$1;)V

    .line 349
    iget-object p1, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public done()V
    .locals 2

    .line 396
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;

    .line 397
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->done()V

    goto :goto_0

    .line 399
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->stop()V

    .line 400
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mMuxer:Landroid/media/MediaMuxer;

    invoke-virtual {v0}, Landroid/media/MediaMuxer;->release()V

    return-void
.end method

.method public drain(Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 387
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;

    .line 388
    invoke-virtual {v1, p1}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->drain(Z)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public init()V
    .locals 2

    .line 373
    iget-object v0, p0, Lcom/sonymobile/scan3d/recording/Muxer;->mEncoders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;

    .line 374
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/recording/Muxer$Encoder;->init()V

    goto :goto_0

    :cond_0
    return-void
.end method
