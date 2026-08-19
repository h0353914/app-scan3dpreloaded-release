.class Lorg/apache/log4j/varia/HUP;
.super Ljava/lang/Thread;
.source "ExternallyRolledFileAppender.java"


# instance fields
.field er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

.field port:I


# direct methods
.method constructor <init>(Lorg/apache/log4j/varia/ExternallyRolledFileAppender;I)V
    .locals 0

    .line 110
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 111
    iput-object p1, p0, Lorg/apache/log4j/varia/HUP;->er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

    .line 112
    iput p2, p0, Lorg/apache/log4j/varia/HUP;->port:I

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 117
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 119
    :cond_0
    :try_start_0
    new-instance v0, Ljava/net/ServerSocket;

    iget v1, p0, Lorg/apache/log4j/varia/HUP;->port:I

    invoke-direct {v0, v1}, Ljava/net/ServerSocket;-><init>(I)V

    .line 121
    :goto_1
    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    .line 122
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Connected to client at "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 123
    new-instance v2, Ljava/lang/Thread;

    new-instance v3, Lorg/apache/log4j/varia/HUPNode;

    iget-object v4, p0, Lorg/apache/log4j/varia/HUP;->er:Lorg/apache/log4j/varia/ExternallyRolledFileAppender;

    invoke-direct {v3, v1, v4}, Lorg/apache/log4j/varia/HUPNode;-><init>(Ljava/net/Socket;Lorg/apache/log4j/varia/ExternallyRolledFileAppender;)V

    invoke-direct {v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 127
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_0
.end method
