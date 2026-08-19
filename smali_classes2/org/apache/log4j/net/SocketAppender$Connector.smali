.class Lorg/apache/log4j/net/SocketAppender$Connector;
.super Ljava/lang/Thread;
.source "SocketAppender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log4j/net/SocketAppender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Connector"
.end annotation


# instance fields
.field interrupted:Z

.field private final synthetic this$0:Lorg/apache/log4j/net/SocketAppender;


# direct methods
.method constructor <init>(Lorg/apache/log4j/net/SocketAppender;)V
    .locals 0

    .line 360
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 100
    iput-object p1, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    const/4 p1, 0x0

    .line 362
    iput-boolean p1, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->interrupted:Z

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 367
    :goto_0
    iget-boolean v0, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->interrupted:Z

    if-eqz v0, :cond_0

    goto :goto_1

    .line 369
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    iget v0, v0, Lorg/apache/log4j/net/SocketAppender;->reconnectionDelay:I

    int-to-long v0, v0

    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 370
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Attempting connection to "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    iget-object v1, v1, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 371
    new-instance v0, Ljava/net/Socket;

    iget-object v1, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    iget-object v1, v1, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    iget-object v2, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    iget v2, v2, Lorg/apache/log4j/net/SocketAppender;->port:I

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/net/InetAddress;I)V

    .line 372
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/net/ConnectException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 373
    :try_start_1
    iget-object v1, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    new-instance v2, Ljava/io/ObjectOutputStream;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {v2, v0}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    iput-object v2, v1, Lorg/apache/log4j/net/SocketAppender;->oos:Ljava/io/ObjectOutputStream;

    .line 374
    iget-object v0, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/log4j/net/SocketAppender;->access$1(Lorg/apache/log4j/net/SocketAppender;Lorg/apache/log4j/net/SocketAppender$Connector;)V

    const-string v0, "Connection established. Exiting connector thread."

    .line 375
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 365
    :try_start_2
    monitor-exit p0

    :goto_1
    return-void

    :catchall_0
    move-exception v0

    .line 372
    monitor-exit p0

    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/net/ConnectException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception v0

    .line 385
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not connect to "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    iget-object v2, v2, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    invoke-virtual {v2}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, ". Exception is "

    .line 386
    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 385
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 382
    :catch_1
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Remote host "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/net/SocketAppender$Connector;->this$0:Lorg/apache/log4j/net/SocketAppender;

    iget-object v1, v1, Lorg/apache/log4j/net/SocketAppender;->address:Ljava/net/InetAddress;

    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, " refused connection."

    .line 383
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 382
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    :catch_2
    const-string v0, "Connector interrupted. Leaving loop."

    .line 379
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    return-void
.end method
