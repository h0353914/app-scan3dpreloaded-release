.class public Lorg/apache/log/output/io/rotate/RotateStrategyBySize;
.super Ljava/lang/Object;
.source "RotateStrategyBySize.java"

# interfaces
.implements Lorg/apache/log/output/io/rotate/RotateStrategy;


# instance fields
.field private m_currentSize:J

.field private m_maxSize:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/32 v0, 0x100000

    .line 29
    invoke-direct {p0, v0, v1}, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 39
    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_currentSize:J

    .line 40
    iput-wide p1, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_maxSize:J

    return-void
.end method


# virtual methods
.method public isRotationNeeded(Ljava/lang/String;Ljava/io/File;)Z
    .locals 2

    .line 59
    iget-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_currentSize:J

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    int-to-long p1, p1

    add-long/2addr v0, p1

    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_currentSize:J

    .line 60
    iget-wide p1, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_currentSize:J

    iget-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_maxSize:J

    cmp-long p1, p1, v0

    if-ltz p1, :cond_0

    const-wide/16 p1, 0x0

    .line 62
    iput-wide p1, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_currentSize:J

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public reset()V
    .locals 2

    const-wide/16 v0, 0x0

    .line 48
    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyBySize;->m_currentSize:J

    return-void
.end method
