.class Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;
.super Ljava/io/InputStream;
.source "SphinxZipCopy.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/utils/SphinxZipCopy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ZipCopyStream"
.end annotation


# instance fields
.field mBuffer:Ljava/nio/ByteBuffer;

.field mEnd:Z

.field final synthetic this$0:Lcom/sonymobile/scan3d/utils/SphinxZipCopy;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/utils/SphinxZipCopy;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 127
    iput-object p1, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->this$0:Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    .line 125
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mEnd:Z

    .line 128
    invoke-static {p1}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->access$000(Lcom/sonymobile/scan3d/utils/SphinxZipCopy;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 131
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->refresh()V

    return-void

    .line 129
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Failed to initialize stream"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private refresh()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->this$0:Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->access$100(Lcom/sonymobile/scan3d/utils/SphinxZipCopy;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 137
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->this$0:Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->getOutputBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    .line 139
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mEnd:Z

    :goto_0
    return-void
.end method


# virtual methods
.method public markSupported()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mEnd:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 161
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->refresh()V

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 164
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method public read([BII)I
    .locals 1
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-ltz p2, :cond_3

    if-ltz p3, :cond_3

    .line 145
    array-length v0, p1

    sub-int/2addr v0, p2

    if-gt p3, v0, :cond_3

    .line 148
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mEnd:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    .line 149
    invoke-direct {p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->refresh()V

    .line 151
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    if-lez p3, :cond_1

    .line 153
    iget-object v0, p0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy$ZipCopyStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    :cond_1
    if-nez p3, :cond_2

    const/4 p3, -0x1

    :cond_2
    return p3

    .line 146
    :cond_3
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method
