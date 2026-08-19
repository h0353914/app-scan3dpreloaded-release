.class public Lorg/apache/log/output/io/rotate/RotateStrategyByTime;
.super Ljava/lang/Object;
.source "RotateStrategyByTime.java"

# interfaces
.implements Lorg/apache/log/output/io/rotate/RotateStrategy;


# instance fields
.field private m_currentRotation:J

.field private m_startingTime:J

.field private m_timeInterval:J


# direct methods
.method public constructor <init>()V
    .locals 2

    const-wide/32 v0, 0x5265c00

    .line 35
    invoke-direct {p0, v0, v1}, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;-><init>(J)V

    return-void
.end method

.method public constructor <init>(J)V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_startingTime:J

    const-wide/16 v0, 0x0

    .line 46
    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_currentRotation:J

    .line 47
    iput-wide p1, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_timeInterval:J

    return-void
.end method


# virtual methods
.method public isRotationNeeded(Ljava/lang/String;Ljava/io/File;)Z
    .locals 2

    .line 70
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_startingTime:J

    sub-long/2addr p1, v0

    iget-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_timeInterval:J

    div-long/2addr p1, v0

    .line 73
    iget-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_currentRotation:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 75
    iput-wide p1, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_currentRotation:J

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public reset()V
    .locals 2

    .line 55
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_startingTime:J

    const-wide/16 v0, 0x0

    .line 56
    iput-wide v0, p0, Lorg/apache/log/output/io/rotate/RotateStrategyByTime;->m_currentRotation:J

    return-void
.end method
