.class public abstract Lorg/apache/log/output/AbstractTarget;
.super Ljava/lang/Object;
.source "AbstractTarget.java"

# interfaces
.implements Lorg/apache/log/LogTarget;
.implements Lorg/apache/log/ErrorAware;


# instance fields
.field private m_errorHandler:Lorg/apache/log/ErrorHandler;

.field private m_isOpen:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 94
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractTarget;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 96
    iput-boolean v0, p0, Lorg/apache/log/output/AbstractTarget;->m_isOpen:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract doProcessEvent(Lorg/apache/log/LogEvent;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected final error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 119
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    return-void
.end method

.method protected final getErrorHandler()Lorg/apache/log/ErrorHandler;
    .locals 1

    .line 107
    iget-object v0, p0, Lorg/apache/log/output/AbstractTarget;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    return-object v0
.end method

.method protected declared-synchronized isOpen()Z
    .locals 1

    monitor-enter p0

    .line 41
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/log/output/AbstractTarget;->m_isOpen:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized open()V
    .locals 1

    monitor-enter p0

    .line 49
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 51
    iput-boolean v0, p0, Lorg/apache/log/output/AbstractTarget;->m_isOpen:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized processEvent(Lorg/apache/log/LogEvent;)V
    .locals 3

    monitor-enter p0

    .line 62
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 64
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Writing event to closed stream."

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    monitor-exit p0

    return-void

    .line 70
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1}, Lorg/apache/log/output/AbstractTarget;->doProcessEvent(Lorg/apache/log/LogEvent;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 74
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v1

    const-string v2, "Unknown error writing event."

    invoke-interface {v1, v2, v0, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 76
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setErrorHandler(Lorg/apache/log/ErrorHandler;)V
    .locals 0

    monitor-enter p0

    .line 36
    :try_start_0
    iput-object p1, p0, Lorg/apache/log/output/AbstractTarget;->m_errorHandler:Lorg/apache/log/ErrorHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
