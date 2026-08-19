.class public Lorg/apache/log/output/io/StreamTarget;
.super Lorg/apache/log/output/AbstractOutputTarget;
.source "StreamTarget.java"


# instance fields
.field private m_outputStream:Ljava/io/OutputStream;


# direct methods
.method public constructor <init>(Ljava/io/OutputStream;Lorg/apache/log/format/Formatter;)V
    .locals 0

    .line 34
    invoke-direct {p0, p2}, Lorg/apache/log/output/AbstractOutputTarget;-><init>(Lorg/apache/log/format/Formatter;)V

    if-eqz p1, :cond_0

    .line 38
    invoke-virtual {p0, p1}, Lorg/apache/log/output/io/StreamTarget;->setOutputStream(Ljava/io/OutputStream;)V

    .line 39
    invoke-virtual {p0}, Lorg/apache/log/output/io/StreamTarget;->open()V

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 97
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/AbstractOutputTarget;->close()V

    .line 98
    invoke-virtual {p0}, Lorg/apache/log/output/io/StreamTarget;->shutdownStream()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setOutputStream(Ljava/io/OutputStream;)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_0

    .line 56
    :try_start_0
    iput-object p1, p0, Lorg/apache/log/output/io/StreamTarget;->m_outputStream:Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 53
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "outputStream property must not be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized shutdownStream()V
    .locals 4

    monitor-enter p0

    .line 106
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/io/StreamTarget;->m_outputStream:Ljava/io/OutputStream;

    const/4 v1, 0x0

    .line 107
    iput-object v1, p0, Lorg/apache/log/output/io/StreamTarget;->m_outputStream:Ljava/io/OutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 113
    :try_start_1
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 118
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/io/StreamTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error closing OutputStream"

    invoke-interface {v2, v3, v0, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized write(Ljava/lang/String;)V
    .locals 4

    monitor-enter p0

    .line 68
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/io/StreamTarget;->m_outputStream:Ljava/io/OutputStream;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Attempted to write data \'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\' to Null OutputStream"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 73
    invoke-virtual {p0}, Lorg/apache/log/output/io/StreamTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    invoke-interface {v0, p1, v1, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    monitor-exit p0

    return-void

    .line 80
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 81
    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 85
    :try_start_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "Error writing data \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\' to OutputStream"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 86
    invoke-virtual {p0}, Lorg/apache/log/output/io/StreamTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    invoke-interface {v2, p1, v0, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 88
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
