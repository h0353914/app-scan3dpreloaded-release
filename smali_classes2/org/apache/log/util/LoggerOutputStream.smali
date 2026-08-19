.class public Lorg/apache/log/util/LoggerOutputStream;
.super Ljava/io/OutputStream;
.source "LoggerOutputStream.java"


# instance fields
.field private m_closed:Z

.field private final m_logger:Lorg/apache/log/Logger;

.field private final m_output:Ljava/lang/StringBuffer;

.field private final m_priority:Lorg/apache/log/Priority;


# direct methods
.method public constructor <init>(Lorg/apache/log/Logger;Lorg/apache/log/Priority;)V
    .locals 1

    .line 54
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 41
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    iput-object v0, p0, Lorg/apache/log/util/LoggerOutputStream;->m_output:Ljava/lang/StringBuffer;

    .line 55
    iput-object p1, p0, Lorg/apache/log/util/LoggerOutputStream;->m_logger:Lorg/apache/log/Logger;

    .line 56
    iput-object p2, p0, Lorg/apache/log/util/LoggerOutputStream;->m_priority:Lorg/apache/log/Priority;

    return-void
.end method

.method private checkValid()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    iget-boolean v0, p0, Lorg/apache/log/util/LoggerOutputStream;->m_closed:Z

    const/4 v1, 0x1

    if-eq v1, v0, :cond_0

    return-void

    .line 115
    :cond_0
    new-instance v0, Ljava/io/EOFException;

    const-string v1, "OutputStreamLogger closed"

    invoke-direct {v0, v1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 66
    invoke-virtual {p0}, Lorg/apache/log/util/LoggerOutputStream;->flush()V

    .line 67
    invoke-super {p0}, Ljava/io/OutputStream;->close()V

    const/4 v0, 0x1

    .line 68
    iput-boolean v0, p0, Lorg/apache/log/util/LoggerOutputStream;->m_closed:Z

    return-void
.end method

.method public declared-synchronized flush()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 99
    :try_start_0
    invoke-direct {p0}, Lorg/apache/log/util/LoggerOutputStream;->checkValid()V

    .line 101
    iget-object v0, p0, Lorg/apache/log/util/LoggerOutputStream;->m_logger:Lorg/apache/log/Logger;

    iget-object v1, p0, Lorg/apache/log/util/LoggerOutputStream;->m_priority:Lorg/apache/log/Priority;

    iget-object v2, p0, Lorg/apache/log/util/LoggerOutputStream;->m_output:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/apache/log/Logger;->log(Lorg/apache/log/Priority;Ljava/lang/String;)V

    .line 102
    iget-object v0, p0, Lorg/apache/log/util/LoggerOutputStream;->m_output:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 103
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public write(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 80
    invoke-direct {p0}, Lorg/apache/log/util/LoggerOutputStream;->checkValid()V

    .line 83
    iget-object v0, p0, Lorg/apache/log/util/LoggerOutputStream;->m_output:Ljava/lang/StringBuffer;

    int-to-char v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const/16 v0, 0xa

    if-ne v0, p1, :cond_0

    .line 87
    invoke-virtual {p0}, Lorg/apache/log/util/LoggerOutputStream;->flush()V

    :cond_0
    return-void
.end method
