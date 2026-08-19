.class public Lorg/apache/log/output/AsyncLogTarget;
.super Lorg/apache/log/output/AbstractTarget;
.source "AsyncLogTarget.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final m_list:Ljava/util/LinkedList;

.field private final m_logTarget:Lorg/apache/log/LogTarget;

.field private final m_queueSize:I


# direct methods
.method public constructor <init>(Lorg/apache/log/LogTarget;)V
    .locals 1

    const/16 v0, 0xf

    .line 43
    invoke-direct {p0, p1, v0}, Lorg/apache/log/output/AsyncLogTarget;-><init>(Lorg/apache/log/LogTarget;I)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/log/LogTarget;I)V
    .locals 0

    .line 47
    invoke-direct {p0}, Lorg/apache/log/output/AbstractTarget;-><init>()V

    .line 48
    iput-object p1, p0, Lorg/apache/log/output/AsyncLogTarget;->m_logTarget:Lorg/apache/log/LogTarget;

    .line 49
    new-instance p1, Ljava/util/LinkedList;

    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    iput-object p1, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    .line 50
    iput p2, p0, Lorg/apache/log/output/AsyncLogTarget;->m_queueSize:I

    .line 51
    invoke-virtual {p0}, Lorg/apache/log/output/AsyncLogTarget;->open()V

    return-void
.end method


# virtual methods
.method public doProcessEvent(Lorg/apache/log/LogEvent;)V
    .locals 3

    .line 76
    iget-object v0, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    monitor-enter v0

    .line 78
    :try_start_0
    iget-object v1, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    .line 79
    :catch_0
    :goto_0
    iget v2, p0, Lorg/apache/log/output/AsyncLogTarget;->m_queueSize:I

    if-le v2, v1, :cond_1

    .line 90
    iget-object v2, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v2, p1}, Ljava/util/LinkedList;->addFirst(Ljava/lang/Object;)V

    if-nez v1, :cond_0

    .line 96
    iget-object p1, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    .line 81
    :cond_1
    :try_start_1
    iget-object v2, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 98
    monitor-exit v0

    throw p1
.end method

.method public run()V
    .locals 5

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x0

    .line 111
    iget-object v2, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    monitor-enter v2

    :cond_0
    :goto_1
    if-eqz v1, :cond_1

    .line 113
    :try_start_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    :try_start_1
    iget-object v2, p0, Lorg/apache/log/output/AsyncLogTarget;->m_logTarget:Lorg/apache/log/LogTarget;

    invoke-interface {v2, v1}, Lorg/apache/log/LogTarget;->processEvent(Lorg/apache/log/LogEvent;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 156
    invoke-virtual {p0}, Lorg/apache/log/output/AsyncLogTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v3

    const-string v4, "Unknown error writing event."

    invoke-interface {v3, v4, v2, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    goto :goto_0

    .line 115
    :cond_1
    :try_start_2
    iget-object v3, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lez v3, :cond_2

    .line 119
    iget-object v1, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log/LogEvent;

    .line 121
    iget v4, p0, Lorg/apache/log/output/AsyncLogTarget;->m_queueSize:I

    if-ne v3, v4, :cond_0

    .line 125
    iget-object v3, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/lang/Object;->notify()V

    goto :goto_1

    :cond_2
    if-nez v0, :cond_4

    .line 129
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v3, :cond_3

    goto :goto_2

    .line 137
    :cond_3
    :try_start_3
    iget-object v3, p0, Lorg/apache/log/output/AsyncLogTarget;->m_list:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_1

    :catch_1
    const/4 v0, 0x1

    goto :goto_1

    .line 133
    :cond_4
    :goto_2
    :try_start_4
    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 146
    monitor-exit v2

    throw v0
.end method

.method public declared-synchronized setErrorHandler(Lorg/apache/log/ErrorHandler;)V
    .locals 1

    monitor-enter p0

    .line 61
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/log/output/AbstractTarget;->setErrorHandler(Lorg/apache/log/ErrorHandler;)V

    .line 63
    iget-object v0, p0, Lorg/apache/log/output/AsyncLogTarget;->m_logTarget:Lorg/apache/log/LogTarget;

    instance-of v0, v0, Lorg/apache/log/ErrorAware;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lorg/apache/log/output/AsyncLogTarget;->m_logTarget:Lorg/apache/log/LogTarget;

    check-cast v0, Lorg/apache/log/ErrorAware;

    invoke-interface {v0, p1}, Lorg/apache/log/ErrorAware;->setErrorHandler(Lorg/apache/log/ErrorHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
