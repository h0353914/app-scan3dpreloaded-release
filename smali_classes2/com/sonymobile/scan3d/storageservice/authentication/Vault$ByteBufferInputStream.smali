.class Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;
.super Ljava/io/InputStream;
.source "Vault.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/Vault;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ByteBufferInputStream"
.end annotation


# instance fields
.field private mBuffer:Ljava/nio/ByteBuffer;


# direct methods
.method constructor <init>(Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 142
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 143
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    .line 144
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    const/4 v0, 0x0

    .line 170
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    return-void
.end method

.method public read()I
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public read([BII)I
    .locals 1
    .param p1    # [B
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 158
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 159
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 160
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;->mBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    return p3

    :cond_0
    const/4 p1, -0x1

    return p1
.end method
