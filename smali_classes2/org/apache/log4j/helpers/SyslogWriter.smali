.class public Lorg/apache/log4j/helpers/SyslogWriter;
.super Ljava/io/Writer;
.source "SyslogWriter.java"


# static fields
.field static syslogHost:Ljava/lang/String;


# instance fields
.field final SYSLOG_PORT:I

.field private address:Ljava/net/InetAddress;

.field private ds:Ljava/net/DatagramSocket;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 43
    invoke-direct {p0}, Ljava/io/Writer;-><init>()V

    const/16 v0, 0x202

    .line 36
    iput v0, p0, Lorg/apache/log4j/helpers/SyslogWriter;->SYSLOG_PORT:I

    .line 44
    sput-object p1, Lorg/apache/log4j/helpers/SyslogWriter;->syslogHost:Ljava/lang/String;

    .line 47
    :try_start_0
    invoke-static {p1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/helpers/SyslogWriter;->address:Ljava/net/InetAddress;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 50
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not find "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, ". All logging will FAIL."

    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 50
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 55
    :goto_0
    :try_start_1
    new-instance v0, Ljava/net/DatagramSocket;

    invoke-direct {v0}, Ljava/net/DatagramSocket;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/helpers/SyslogWriter;->ds:Ljava/net/DatagramSocket;
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    .line 58
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 59
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not instantiate DatagramSocket to "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, ". All logging will FAIL."

    .line 60
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 59
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0

    return-void
.end method

.method public flush()V
    .locals 0

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    .line 73
    new-instance v0, Ljava/net/DatagramPacket;

    array-length v1, p1

    .line 74
    iget-object v2, p0, Lorg/apache/log4j/helpers/SyslogWriter;->address:Ljava/net/InetAddress;

    const/16 v3, 0x202

    .line 73
    invoke-direct {v0, p1, v1, v2, v3}, Ljava/net/DatagramPacket;-><init>([BILjava/net/InetAddress;I)V

    .line 76
    iget-object p1, p0, Lorg/apache/log4j/helpers/SyslogWriter;->ds:Ljava/net/DatagramSocket;

    if-eqz p1, :cond_0

    .line 77
    invoke-virtual {p1, v0}, Ljava/net/DatagramSocket;->send(Ljava/net/DatagramPacket;)V

    :cond_0
    return-void
.end method

.method public write([CII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 67
    new-instance v0, Ljava/lang/String;

    invoke-direct {v0, p1, p2, p3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p0, v0}, Lorg/apache/log4j/helpers/SyslogWriter;->write(Ljava/lang/String;)V

    return-void
.end method
