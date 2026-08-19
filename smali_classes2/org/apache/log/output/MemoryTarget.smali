.class public Lorg/apache/log/output/MemoryTarget;
.super Lorg/apache/log/output/AbstractTarget;
.source "MemoryTarget.java"


# instance fields
.field private final m_buffer:[Lorg/apache/log/LogEvent;

.field private m_index:I

.field private m_overwrite:Z

.field private m_target:Lorg/apache/log/LogTarget;

.field private m_threshold:Lorg/apache/log/Priority;

.field private m_used:I


# direct methods
.method public constructor <init>(Lorg/apache/log/LogTarget;ILorg/apache/log/Priority;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lorg/apache/log/output/AbstractTarget;-><init>()V

    .line 50
    iput-object p1, p0, Lorg/apache/log/output/MemoryTarget;->m_target:Lorg/apache/log/LogTarget;

    .line 51
    new-array p1, p2, [Lorg/apache/log/LogEvent;

    iput-object p1, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    .line 52
    iput-object p3, p0, Lorg/apache/log/output/MemoryTarget;->m_threshold:Lorg/apache/log/Priority;

    .line 53
    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->open()V

    return-void
.end method


# virtual methods
.method protected declared-synchronized doProcessEvent(Lorg/apache/log/LogEvent;)V
    .locals 3

    monitor-enter p0

    .line 74
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->isFull()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 76
    iget-boolean v0, p0, Lorg/apache/log/output/MemoryTarget;->m_overwrite:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Memory buffer is full"

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 80
    monitor-exit p0

    return-void

    .line 84
    :cond_1
    :goto_0
    :try_start_1
    iget v0, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    if-nez v0, :cond_2

    const/4 v0, 0x0

    iput v0, p0, Lorg/apache/log/output/MemoryTarget;->m_index:I

    goto :goto_1

    .line 87
    :cond_2
    iget v0, p0, Lorg/apache/log/output/MemoryTarget;->m_index:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    array-length v1, v1

    rem-int/2addr v0, v1

    iput v0, p0, Lorg/apache/log/output/MemoryTarget;->m_index:I

    .line 89
    :goto_1
    iget-object v0, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    iget v1, p0, Lorg/apache/log/output/MemoryTarget;->m_index:I

    aput-object p1, v0, v1

    .line 90
    iget v0, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    .line 92
    invoke-virtual {p0, p1}, Lorg/apache/log/output/MemoryTarget;->shouldPush(Lorg/apache/log/LogEvent;)Z

    move-result p1

    if-eqz p1, :cond_3

    .line 94
    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->push()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    :cond_3
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final declared-synchronized isFull()Z
    .locals 2

    monitor-enter p0

    .line 105
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    array-length v0, v0

    iget v1, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized push()V
    .locals 7

    monitor-enter p0

    .line 126
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/MemoryTarget;->m_target:Lorg/apache/log/LogTarget;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 128
    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v2, "Can not push events to a null target"

    invoke-interface {v0, v2, v1, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 129
    monitor-exit p0

    return-void

    .line 134
    :cond_0
    :try_start_1
    iget v0, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    .line 135
    iget v2, p0, Lorg/apache/log/output/MemoryTarget;->m_index:I

    iget v3, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    sub-int/2addr v2, v3

    add-int/lit8 v2, v2, 0x1

    if-gez v2, :cond_1

    .line 136
    iget-object v3, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    array-length v3, v3

    add-int/2addr v2, v3

    :cond_1
    const/4 v3, 0x0

    :goto_0
    if-lt v3, v0, :cond_2

    goto :goto_1

    :cond_2
    add-int v4, v2, v3

    .line 140
    iget-object v5, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    array-length v5, v5

    rem-int/2addr v4, v5

    .line 143
    iget-object v5, p0, Lorg/apache/log/output/MemoryTarget;->m_target:Lorg/apache/log/LogTarget;

    iget-object v6, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    aget-object v6, v6, v4

    invoke-interface {v5, v6}, Lorg/apache/log/LogTarget;->processEvent(Lorg/apache/log/LogEvent;)V

    .line 146
    iget-object v5, p0, Lorg/apache/log/output/MemoryTarget;->m_buffer:[Lorg/apache/log/LogEvent;

    aput-object v1, v5, v4

    .line 147
    iget v4, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I

    add-int/lit8 v4, v4, -0x1

    iput v4, p0, Lorg/apache/log/output/MemoryTarget;->m_used:I
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 152
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Unknown error pushing events."

    invoke-interface {v2, v3, v0, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 154
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setOverwrite(Z)V
    .locals 0

    monitor-enter p0

    .line 63
    :try_start_0
    iput-boolean p1, p0, Lorg/apache/log/output/MemoryTarget;->m_overwrite:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 64
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized shouldPush(Lorg/apache/log/LogEvent;)Z
    .locals 1

    monitor-enter p0

    .line 118
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/MemoryTarget;->m_threshold:Lorg/apache/log/Priority;

    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result p1

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lorg/apache/log/output/MemoryTarget;->isFull()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
