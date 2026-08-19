.class public Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;
.super Ljava/lang/Object;
.source "TransferProgress.java"


# instance fields
.field private mBytesTransferred:J

.field private mTotalBytes:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBytesTransferred()J
    .locals 2

    .line 53
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->mBytesTransferred:J

    return-wide v0
.end method

.method public getPercent()I
    .locals 6

    .line 64
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->mTotalBytes:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    const-wide/16 v2, 0x64

    .line 65
    iget-wide v4, p0, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->mBytesTransferred:J

    mul-long/2addr v4, v2

    div-long/2addr v4, v0

    long-to-int v0, v4

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getTotalBytes()J
    .locals 2

    .line 44
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->mTotalBytes:J

    return-wide v0
.end method

.method update(JJ)Z
    .locals 1

    .line 31
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->getPercent()I

    move-result v0

    .line 32
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->mTotalBytes:J

    .line 33
    iput-wide p3, p0, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->mBytesTransferred:J

    .line 35
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;->getPercent()I

    move-result p1

    if-eq v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
