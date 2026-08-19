.class public Lorg/apache/log/output/net/SocketOutputTarget;
.super Lorg/apache/log/output/AbstractOutputTarget;
.source "SocketOutputTarget.java"


# instance fields
.field private m_outputStream:Ljava/io/ObjectOutputStream;

.field private m_socket:Ljava/net/Socket;


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 58
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;-><init>()V

    .line 59
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_socket:Ljava/net/Socket;

    .line 60
    new-instance p1, Ljava/io/ObjectOutputStream;

    iget-object p2, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_socket:Ljava/net/Socket;

    invoke-virtual {p2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object p1, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_outputStream:Ljava/io/ObjectOutputStream;

    .line 61
    invoke-super {p0}, Lorg/apache/log/output/AbstractOutputTarget;->open()V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 42
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;-><init>()V

    .line 43
    new-instance v0, Ljava/net/Socket;

    invoke-direct {v0, p1, p2}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    iput-object v0, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_socket:Ljava/net/Socket;

    .line 44
    new-instance p1, Ljava/io/ObjectOutputStream;

    iget-object p2, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_socket:Ljava/net/Socket;

    invoke-virtual {p2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object p1, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_outputStream:Ljava/io/ObjectOutputStream;

    .line 45
    invoke-super {p0}, Lorg/apache/log/output/AbstractOutputTarget;->open()V

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 98
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/AbstractOutputTarget;->close()V

    const/4 v0, 0x0

    .line 99
    iput-object v0, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_socket:Ljava/net/Socket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected doProcessEvent(Lorg/apache/log/LogEvent;)V
    .locals 0

    .line 89
    invoke-virtual {p0, p1}, Lorg/apache/log/output/net/SocketOutputTarget;->write(Lorg/apache/log/LogEvent;)V

    return-void
.end method

.method protected write(Lorg/apache/log/LogEvent;)V
    .locals 3

    .line 74
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/net/SocketOutputTarget;->m_outputStream:Ljava/io/ObjectOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 78
    invoke-virtual {p0}, Lorg/apache/log/output/net/SocketOutputTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Error writting to socket"

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    :goto_0
    return-void
.end method
