.class public Lorg/apache/log/output/io/FileTarget;
.super Lorg/apache/log/output/io/StreamTarget;
.source "FileTarget.java"


# instance fields
.field private m_append:Z

.field private m_file:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;ZLorg/apache/log/format/Formatter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, v0, p3}, Lorg/apache/log/output/io/StreamTarget;-><init>(Ljava/io/OutputStream;Lorg/apache/log/format/Formatter;)V

    if-eqz p1, :cond_0

    .line 44
    invoke-virtual {p0, p1, p2}, Lorg/apache/log/output/io/FileTarget;->setFile(Ljava/io/File;Z)V

    .line 45
    invoke-virtual {p0}, Lorg/apache/log/output/io/FileTarget;->openFile()V

    :cond_0
    return-void
.end method


# virtual methods
.method protected declared-synchronized getFile()Ljava/io/File;
    .locals 1

    monitor-enter p0

    .line 107
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/io/FileTarget;->m_file:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized openFile()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 82
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/io/FileTarget;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lorg/apache/log/output/io/FileTarget;->close()V

    .line 84
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log/output/io/FileTarget;->getFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getCanonicalFile()Ljava/io/File;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 87
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 89
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 92
    :cond_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    iget-boolean v2, p0, Lorg/apache/log/output/io/FileTarget;->m_append:Z

    invoke-direct {v1, v0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;Z)V

    .line 95
    invoke-virtual {p0, v1}, Lorg/apache/log/output/io/FileTarget;->setOutputStream(Ljava/io/OutputStream;)V

    .line 96
    invoke-virtual {p0}, Lorg/apache/log/output/io/FileTarget;->open()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 97
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized setFile(Ljava/io/File;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    if-eqz p1, :cond_1

    .line 64
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/io/FileTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    iput-boolean p2, p0, Lorg/apache/log/output/io/FileTarget;->m_append:Z

    .line 71
    iput-object p1, p0, Lorg/apache/log/output/io/FileTarget;->m_file:Ljava/io/File;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    monitor-exit p0

    return-void

    .line 66
    :cond_0
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "target must be closed before file property can be set"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 61
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "file property must not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit p0

    throw p1
.end method
