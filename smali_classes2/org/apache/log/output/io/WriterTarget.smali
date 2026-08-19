.class public Lorg/apache/log/output/io/WriterTarget;
.super Lorg/apache/log/output/AbstractOutputTarget;
.source "WriterTarget.java"


# instance fields
.field protected m_output:Ljava/io/Writer;


# direct methods
.method public constructor <init>(Ljava/io/Writer;Lorg/apache/log/format/Formatter;)V
    .locals 0

    .line 37
    invoke-direct {p0, p2}, Lorg/apache/log/output/AbstractOutputTarget;-><init>(Lorg/apache/log/format/Formatter;)V

    if-eqz p1, :cond_0

    .line 41
    invoke-virtual {p0, p1}, Lorg/apache/log/output/io/WriterTarget;->setWriter(Ljava/io/Writer;)V

    .line 42
    invoke-virtual {p0}, Lorg/apache/log/output/io/WriterTarget;->open()V

    :cond_0
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 86
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/AbstractOutputTarget;->close()V

    .line 87
    invoke-virtual {p0}, Lorg/apache/log/output/io/WriterTarget;->shutdownWriter()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setWriter(Ljava/io/Writer;)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_0

    .line 59
    :try_start_0
    iput-object p1, p0, Lorg/apache/log/output/io/WriterTarget;->m_output:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 56
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "writer property must not be null"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized shutdownWriter()V
    .locals 4

    monitor-enter p0

    .line 95
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/io/WriterTarget;->m_output:Ljava/io/Writer;

    const/4 v1, 0x0

    .line 96
    iput-object v1, p0, Lorg/apache/log/output/io/WriterTarget;->m_output:Ljava/io/Writer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 102
    :try_start_1
    invoke-virtual {v0}, Ljava/io/Writer;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 107
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/io/WriterTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error closing Writer"

    invoke-interface {v2, v3, v0, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected write(Ljava/lang/String;)V
    .locals 3

    .line 71
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/io/WriterTarget;->m_output:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 72
    iget-object p1, p0, Lorg/apache/log/output/io/WriterTarget;->m_output:Ljava/io/Writer;

    invoke-virtual {p1}, Ljava/io/Writer;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 76
    invoke-virtual {p0}, Lorg/apache/log/output/io/WriterTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Caught an IOException"

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    :goto_0
    return-void
.end method
