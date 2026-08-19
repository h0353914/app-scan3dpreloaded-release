.class public Lorg/apache/log4j/AsyncAppender;
.super Lorg/apache/log4j/AppenderSkeleton;
.source "AsyncAppender.java"

# interfaces
.implements Lorg/apache/log4j/spi/AppenderAttachable;


# static fields
.field public static final DEFAULT_BUFFER_SIZE:I = 0x80


# instance fields
.field aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

.field bf:Lorg/apache/log4j/helpers/BoundedFIFO;

.field dispatcher:Lorg/apache/log4j/Dispatcher;

.field interruptedWarningMessage:Z

.field locationInfo:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 65
    invoke-direct {p0}, Lorg/apache/log4j/AppenderSkeleton;-><init>()V

    .line 57
    new-instance v0, Lorg/apache/log4j/helpers/BoundedFIFO;

    const/16 v1, 0x80

    invoke-direct {v0, v1}, Lorg/apache/log4j/helpers/BoundedFIFO;-><init>(I)V

    iput-object v0, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    const/4 v0, 0x0

    .line 61
    iput-boolean v0, p0, Lorg/apache/log4j/AsyncAppender;->locationInfo:Z

    .line 63
    iput-boolean v0, p0, Lorg/apache/log4j/AsyncAppender;->interruptedWarningMessage:Z

    .line 68
    new-instance v0, Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-direct {v0}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    .line 69
    new-instance v0, Lorg/apache/log4j/Dispatcher;

    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-direct {v0, v1, p0}, Lorg/apache/log4j/Dispatcher;-><init>(Lorg/apache/log4j/helpers/BoundedFIFO;Lorg/apache/log4j/AsyncAppender;)V

    iput-object v0, p0, Lorg/apache/log4j/AsyncAppender;->dispatcher:Lorg/apache/log4j/Dispatcher;

    .line 70
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->dispatcher:Lorg/apache/log4j/Dispatcher;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public addAppender(Lorg/apache/log4j/Appender;)V
    .locals 2

    .line 75
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 76
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->addAppender(Lorg/apache/log4j/Appender;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 75
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public append(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 3

    .line 85
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->dispatcher:Lorg/apache/log4j/Dispatcher;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_0

    .line 86
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 87
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->appendLoopOnAppenders(Lorg/apache/log4j/spi/LoggingEvent;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1

    .line 93
    :cond_0
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getNDC()Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getThreadName()Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getMDCCopy()V

    .line 97
    iget-boolean v0, p0, Lorg/apache/log4j/AsyncAppender;->locationInfo:Z

    if-eqz v0, :cond_1

    .line 98
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getLocationInformation()Lorg/apache/log4j/spi/LocationInfo;

    .line 100
    :cond_1
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    monitor-enter v0

    .line 101
    :goto_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {v1}, Lorg/apache/log4j/helpers/BoundedFIFO;->isFull()Z

    move-result v1

    if-nez v1, :cond_3

    .line 116
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/helpers/BoundedFIFO;->put(Lorg/apache/log4j/spi/LoggingEvent;)V

    .line 117
    iget-object p1, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {p1}, Lorg/apache/log4j/helpers/BoundedFIFO;->wasEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 119
    iget-object p1, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {p1}, Ljava/lang/Object;->notify()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 100
    :cond_2
    monitor-exit v0

    return-void

    .line 104
    :cond_3
    :try_start_2
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v1

    .line 106
    :try_start_3
    iget-boolean v2, p0, Lorg/apache/log4j/AsyncAppender;->interruptedWarningMessage:Z

    if-nez v2, :cond_4

    const/4 v2, 0x1

    .line 107
    iput-boolean v2, p0, Lorg/apache/log4j/AsyncAppender;->interruptedWarningMessage:Z

    const-string v2, "AsyncAppender interrupted."

    .line 108
    invoke-static {v2, v1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_4
    const-string v1, "AsyncAppender interrupted again."

    .line 110
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception p1

    .line 100
    monitor-exit v0

    throw p1
.end method

.method public close()V
    .locals 2

    .line 130
    monitor-enter p0

    .line 132
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 129
    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 135
    :try_start_1
    iput-boolean v0, p0, Lorg/apache/log4j/AppenderSkeleton;->closed:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 130
    monitor-exit p0

    .line 142
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->dispatcher:Lorg/apache/log4j/Dispatcher;

    invoke-virtual {v0}, Lorg/apache/log4j/Dispatcher;->close()V

    .line 144
    :try_start_2
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->dispatcher:Lorg/apache/log4j/Dispatcher;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Got an InterruptedException while waiting for the dispatcher to finish."

    .line 146
    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x0

    .line 149
    iput-object v0, p0, Lorg/apache/log4j/AsyncAppender;->dispatcher:Lorg/apache/log4j/Dispatcher;

    .line 150
    iput-object v0, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    return-void

    :catchall_0
    move-exception v0

    .line 130
    monitor-exit p0

    throw v0
.end method

.method public getAllAppenders()Ljava/util/Enumeration;
    .locals 2

    .line 154
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 155
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->getAllAppenders()Ljava/util/Enumeration;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 154
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public getAppender(Ljava/lang/String;)Lorg/apache/log4j/Appender;
    .locals 2

    .line 160
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 161
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->getAppender(Ljava/lang/String;)Lorg/apache/log4j/Appender;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 160
    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public getBufferSize()I
    .locals 1

    .line 242
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {v0}, Lorg/apache/log4j/helpers/BoundedFIFO;->getMaxSize()I

    move-result v0

    return v0
.end method

.method public getLocationInfo()Z
    .locals 1

    .line 169
    iget-boolean v0, p0, Lorg/apache/log4j/AsyncAppender;->locationInfo:Z

    return v0
.end method

.method public isAttached(Lorg/apache/log4j/Appender;)Z
    .locals 1

    .line 176
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->isAttached(Lorg/apache/log4j/Appender;)Z

    move-result p1

    return p1
.end method

.method public removeAllAppenders()V
    .locals 2

    .line 189
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 190
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->removeAllAppenders()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 189
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public removeAppender(Ljava/lang/String;)V
    .locals 2

    .line 202
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 203
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->removeAppender(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public removeAppender(Lorg/apache/log4j/Appender;)V
    .locals 2

    .line 196
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    monitor-enter v0

    .line 197
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/AsyncAppender;->aai:Lorg/apache/log4j/helpers/AppenderAttachableImpl;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/helpers/AppenderAttachableImpl;->removeAppender(Lorg/apache/log4j/Appender;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 196
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0

    throw p1
.end method

.method public requiresLayout()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setBufferSize(I)V
    .locals 1

    .line 235
    iget-object v0, p0, Lorg/apache/log4j/AsyncAppender;->bf:Lorg/apache/log4j/helpers/BoundedFIFO;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/helpers/BoundedFIFO;->resize(I)V

    return-void
.end method

.method public setLocationInfo(Z)V
    .locals 0

    .line 218
    iput-boolean p1, p0, Lorg/apache/log4j/AsyncAppender;->locationInfo:Z

    return-void
.end method
