.class public Lorg/apache/log/output/io/rotate/RotatingFileTarget;
.super Lorg/apache/log/output/io/FileTarget;
.source "RotatingFileTarget.java"


# instance fields
.field private m_fileStrategy:Lorg/apache/log/output/io/rotate/FileStrategy;

.field private m_rotateStrategy:Lorg/apache/log/output/io/rotate/RotateStrategy;


# direct methods
.method public constructor <init>(Lorg/apache/log/format/Formatter;Lorg/apache/log/output/io/rotate/RotateStrategy;Lorg/apache/log/output/io/rotate/FileStrategy;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 42
    invoke-direct {p0, v0, v1, p1}, Lorg/apache/log/output/io/FileTarget;-><init>(Ljava/io/File;ZLorg/apache/log/format/Formatter;)V

    .line 44
    iput-object p2, p0, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->m_rotateStrategy:Lorg/apache/log/output/io/rotate/RotateStrategy;

    .line 45
    iput-object p3, p0, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->m_fileStrategy:Lorg/apache/log/output/io/rotate/FileStrategy;

    .line 47
    invoke-virtual {p0}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->rotate()V

    return-void
.end method


# virtual methods
.method protected declared-synchronized rotate()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 53
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->close()V

    .line 55
    iget-object v0, p0, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->m_fileStrategy:Lorg/apache/log/output/io/rotate/FileStrategy;

    invoke-interface {v0}, Lorg/apache/log/output/io/rotate/FileStrategy;->nextFile()Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    .line 56
    invoke-virtual {p0, v0, v1}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->setFile(Ljava/io/File;Z)V

    .line 57
    invoke-virtual {p0}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->openFile()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized write(Ljava/lang/String;)V
    .locals 3

    monitor-enter p0

    .line 66
    :try_start_0
    invoke-super {p0, p1}, Lorg/apache/log/output/io/FileTarget;->write(Ljava/lang/String;)V

    .line 69
    iget-object v0, p0, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->m_rotateStrategy:Lorg/apache/log/output/io/rotate/RotateStrategy;

    invoke-virtual {p0}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->getFile()Ljava/io/File;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lorg/apache/log/output/io/rotate/RotateStrategy;->isRotationNeeded(Ljava/lang/String;Ljava/io/File;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_0

    .line 73
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->rotate()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 76
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/io/rotate/RotatingFileTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Error rotating file"

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
