.class public Lorg/apache/log/output/io/SafeFileTarget;
.super Lorg/apache/log/output/io/FileTarget;
.source "SafeFileTarget.java"


# direct methods
.method public constructor <init>(Ljava/io/File;ZLorg/apache/log/format/Formatter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/log/output/io/FileTarget;-><init>(Ljava/io/File;ZLorg/apache/log/format/Formatter;)V

    .line 39
    invoke-virtual {p0}, Lorg/apache/log/output/io/SafeFileTarget;->shutdownStream()V

    return-void
.end method


# virtual methods
.method public declared-synchronized processEvent(Lorg/apache/log/LogEvent;)V
    .locals 3

    monitor-enter p0

    .line 49
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/io/SafeFileTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 51
    invoke-virtual {p0}, Lorg/apache/log/output/io/SafeFileTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Writing event to closed stream."

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    monitor-exit p0

    return-void

    .line 57
    :cond_0
    :try_start_1
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lorg/apache/log/output/io/SafeFileTarget;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    .line 59
    invoke-virtual {p0, v0}, Lorg/apache/log/output/io/SafeFileTarget;->setOutputStream(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 68
    :try_start_2
    invoke-super {p0, p1}, Lorg/apache/log/output/io/FileTarget;->processEvent(Lorg/apache/log/LogEvent;)V

    .line 70
    invoke-virtual {p0}, Lorg/apache/log/output/io/SafeFileTarget;->shutdownStream()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 71
    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    .line 63
    :try_start_3
    invoke-virtual {p0}, Lorg/apache/log/output/io/SafeFileTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v1

    const-string v2, "Unable to open file to write log event."

    invoke-interface {v1, v2, v0, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 64
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
