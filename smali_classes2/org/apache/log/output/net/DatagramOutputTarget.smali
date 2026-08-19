.class public Lorg/apache/log/output/net/DatagramOutputTarget;
.super Lorg/apache/log/output/AbstractOutputTarget;
.source "DatagramOutputTarget.java"


# instance fields
.field private m_socket:Ljava/net/DatagramSocket;


# direct methods
.method public constructor <init>(Ljava/net/InetAddress;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 57
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/log/output/net/DatagramOutputTarget;-><init>(Ljava/net/InetAddress;ILorg/apache/log/format/Formatter;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;ILorg/apache/log/format/Formatter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-direct {p0, p3}, Lorg/apache/log/output/AbstractOutputTarget;-><init>(Lorg/apache/log/format/Formatter;)V

    .line 42
    new-instance p3, Ljava/net/DatagramSocket;

    invoke-direct {p3}, Ljava/net/DatagramSocket;-><init>()V

    iput-object p3, p0, Lorg/apache/log/output/net/DatagramOutputTarget;->m_socket:Ljava/net/DatagramSocket;

    .line 43
    iget-object p3, p0, Lorg/apache/log/output/net/DatagramOutputTarget;->m_socket:Ljava/net/DatagramSocket;

    invoke-virtual {p3, p1, p2}, Ljava/net/DatagramSocket;->connect(Ljava/net/InetAddress;I)V

    .line 44
    invoke-virtual {p0}, Lorg/apache/log/output/net/DatagramOutputTarget;->open()V

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 86
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/AbstractOutputTarget;->close()V

    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Lorg/apache/log/output/net/DatagramOutputTarget;->m_socket:Ljava/net/DatagramSocket;
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

.method protected write(Ljava/lang/String;)V
    .locals 3

    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 71
    :try_start_0
    new-instance v0, Ljava/net/DatagramPacket;

    array-length v1, p1

    invoke-direct {v0, p1, v1}, Ljava/net/DatagramPacket;-><init>([BI)V

    .line 72
    iget-object p1, p0, Lorg/apache/log/output/net/DatagramOutputTarget;->m_socket:Ljava/net/DatagramSocket;

    invoke-virtual {p1, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 76
    invoke-virtual {p0}, Lorg/apache/log/output/net/DatagramOutputTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Error sending datagram."

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    :goto_0
    return-void
.end method
