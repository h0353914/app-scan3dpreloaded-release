.class public Lorg/apache/log4j/RollingFileAppender;
.super Lorg/apache/log4j/FileAppender;
.source "RollingFileAppender.java"


# instance fields
.field protected maxBackupIndex:I

.field protected maxFileSize:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 54
    invoke-direct {p0}, Lorg/apache/log4j/FileAppender;-><init>()V

    const-wide/32 v0, 0xa00000

    .line 42
    iput-wide v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    const/4 v0, 0x1

    .line 47
    iput v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/log4j/Layout;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    invoke-direct {p0, p1, p2}, Lorg/apache/log4j/FileAppender;-><init>(Lorg/apache/log4j/Layout;Ljava/lang/String;)V

    const-wide/32 p1, 0xa00000

    .line 42
    iput-wide p1, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    const/4 p1, 0x1

    .line 47
    iput p1, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/log4j/Layout;Ljava/lang/String;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/log4j/FileAppender;-><init>(Lorg/apache/log4j/Layout;Ljava/lang/String;Z)V

    const-wide/32 p1, 0xa00000

    .line 42
    iput-wide p1, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    const/4 p1, 0x1

    .line 47
    iput p1, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    return-void
.end method


# virtual methods
.method public getMaxBackupIndex()I
    .locals 1

    .line 88
    iget v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    return v0
.end method

.method public getMaximumFileSize()J
    .locals 2

    .line 99
    iget-wide v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    return-wide v0
.end method

.method public rollOver()V
    .locals 7

    .line 121
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "rolling over count="

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/WriterAppender;->qw:Lorg/apache/log4j/helpers/QuietWriter;

    check-cast v1, Lorg/apache/log4j/helpers/CountingQuietWriter;

    invoke-virtual {v1}, Lorg/apache/log4j/helpers/CountingQuietWriter;->getCount()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 122
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "maxBackupIndex="

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 125
    iget v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    if-lez v0, :cond_3

    .line 127
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuffer;

    iget-object v2, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x2e

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    iget v3, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 128
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 129
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 132
    :cond_0
    iget v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_0
    if-ge v0, v1, :cond_1

    .line 142
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuffer;

    iget-object v3, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v3, "."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 144
    invoke-virtual {p0}, Lorg/apache/log4j/FileAppender;->closeFile()V

    .line 146
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 147
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Renaming file "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v3, " to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 148
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    goto :goto_1

    .line 133
    :cond_1
    new-instance v3, Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuffer;

    iget-object v5, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 134
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 135
    new-instance v4, Ljava/io/File;

    new-instance v5, Ljava/lang/StringBuffer;

    iget-object v6, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    add-int/lit8 v6, v0, 0x1

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 136
    new-instance v5, Ljava/lang/StringBuffer;

    const-string v6, "Renaming file "

    invoke-direct {v5, v6}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    const-string v6, " to "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 137
    invoke-virtual {v3, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto/16 :goto_0

    .line 154
    :cond_3
    :goto_1
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    const/4 v1, 0x0

    iget-boolean v2, p0, Lorg/apache/log4j/FileAppender;->bufferedIO:Z

    iget v3, p0, Lorg/apache/log4j/FileAppender;->bufferSize:I

    invoke-virtual {p0, v0, v1, v2, v3}, Lorg/apache/log4j/RollingFileAppender;->setFile(Ljava/lang/String;ZZI)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 157
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "setFile("

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, ", false) call failed."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method public declared-synchronized setFile(Ljava/lang/String;ZZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 165
    :try_start_0
    iget-boolean p3, p0, Lorg/apache/log4j/FileAppender;->bufferedIO:Z

    iget p4, p0, Lorg/apache/log4j/FileAppender;->bufferSize:I

    invoke-super {p0, p1, p2, p3, p4}, Lorg/apache/log4j/FileAppender;->setFile(Ljava/lang/String;ZZI)V

    if-eqz p2, :cond_0

    .line 167
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 168
    iget-object p1, p0, Lorg/apache/log4j/WriterAppender;->qw:Lorg/apache/log4j/helpers/QuietWriter;

    check-cast p1, Lorg/apache/log4j/helpers/CountingQuietWriter;

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide p2

    invoke-virtual {p1, p2, p3}, Lorg/apache/log4j/helpers/CountingQuietWriter;->setCount(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 163
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public setMaxBackupIndex(I)V
    .locals 0

    .line 184
    iput p1, p0, Lorg/apache/log4j/RollingFileAppender;->maxBackupIndex:I

    return-void
.end method

.method public setMaxFileSize(Ljava/lang/String;)V
    .locals 4

    .line 218
    iget-wide v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    invoke-static {p1, v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->toFileSize(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    return-void
.end method

.method public setMaximumFileSize(J)V
    .locals 0

    .line 201
    iput-wide p1, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    return-void
.end method

.method protected setQWForFiles(Ljava/io/Writer;)V
    .locals 2

    .line 223
    new-instance v0, Lorg/apache/log4j/helpers/CountingQuietWriter;

    iget-object v1, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    invoke-direct {v0, p1, v1}, Lorg/apache/log4j/helpers/CountingQuietWriter;-><init>(Ljava/io/Writer;Lorg/apache/log4j/spi/ErrorHandler;)V

    iput-object v0, p0, Lorg/apache/log4j/WriterAppender;->qw:Lorg/apache/log4j/helpers/QuietWriter;

    return-void
.end method

.method protected subAppend(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 4

    .line 234
    invoke-super {p0, p1}, Lorg/apache/log4j/WriterAppender;->subAppend(Lorg/apache/log4j/spi/LoggingEvent;)V

    .line 235
    iget-object p1, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 236
    iget-object p1, p0, Lorg/apache/log4j/WriterAppender;->qw:Lorg/apache/log4j/helpers/QuietWriter;

    check-cast p1, Lorg/apache/log4j/helpers/CountingQuietWriter;

    invoke-virtual {p1}, Lorg/apache/log4j/helpers/CountingQuietWriter;->getCount()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/apache/log4j/RollingFileAppender;->maxFileSize:J

    cmp-long p1, v0, v2

    if-ltz p1, :cond_0

    .line 237
    invoke-virtual {p0}, Lorg/apache/log4j/RollingFileAppender;->rollOver()V

    :cond_0
    return-void
.end method
