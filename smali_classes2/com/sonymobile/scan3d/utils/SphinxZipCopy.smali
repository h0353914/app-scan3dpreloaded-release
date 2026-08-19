.class public Lcom/sonymobile/scan3d/utils/SphinxZipCopy;
.super Ljava/lang/Object;
.source "SphinxZipCopy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;
    }
.end annotation


# instance fields
.field private mInputBuffer:Ljava/nio/ByteBuffer;

.field private mNativeHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 41
    invoke-static {}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->classInit()V

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->mNativeHandle:J

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/utils/SphinxZipCopy;)Z
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->init()Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/utils/SphinxZipCopy;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->next()Z

    move-result p0

    return p0
.end method

.method private static native classInit()V
.end method

.method private native create()J
.end method

.method private native destroy()V
.end method

.method private native init()Z
.end method

.method private next()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->nextChunk()I

    move-result v0

    if-ltz v0, :cond_1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 192
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "nextChunk failure in native code"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private native nextChunk()I
.end method

.method private native setInputBufferNative(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
.end method


# virtual methods
.method public native getOutputBuffer()Ljava/nio/ByteBuffer;
.end method

.method public declared-synchronized release()V
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 57
    :try_start_0
    iput-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 58
    iget-wide v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 59
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->destroy()V

    .line 60
    iput-wide v2, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public native run()Z
.end method

.method public setInputBuffer(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .locals 0

    .line 83
    iput-object p1, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->mInputBuffer:Ljava/nio/ByteBuffer;

    .line 84
    iget-object p1, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->mInputBuffer:Ljava/nio/ByteBuffer;

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setInputBufferNative(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    return-void
.end method

.method public native setInputFile(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public native setOutputBuffer(Ljava/lang/String;)V
.end method

.method public native setOutputFile(Ljava/lang/String;Ljava/lang/String;)V
.end method

.method public stream()Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 181
    new-instance v0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;-><init>(Lcom/sonymobile/scan3d/utils/SphinxZipCopy;)V

    return-object v0
.end method
