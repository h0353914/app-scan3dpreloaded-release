.class Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;
.super Ljava/lang/Object;
.source "SocketHubAppender.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log4j/net/SocketHubAppender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServerMonitor"
.end annotation


# instance fields
.field private keepRunning:Z

.field private monitorThread:Ljava/lang/Thread;

.field private oosList:Ljava/util/Vector;

.field private port:I

.field private final synthetic this$0:Lorg/apache/log4j/net/SocketHubAppender;


# direct methods
.method public constructor <init>(Lorg/apache/log4j/net/SocketHubAppender;ILjava/util/Vector;)V
    .locals 0

    .line 286
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 106
    iput-object p1, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->this$0:Lorg/apache/log4j/net/SocketHubAppender;

    .line 287
    iput p2, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->port:I

    .line 288
    iput-object p3, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->oosList:Ljava/util/Vector;

    const/4 p1, 0x1

    .line 289
    iput-boolean p1, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->keepRunning:Z

    .line 290
    new-instance p2, Ljava/lang/Thread;

    invoke-direct {p2, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object p2, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->monitorThread:Ljava/lang/Thread;

    .line 291
    iget-object p2, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {p2, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 292
    iget-object p1, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    const/4 v0, 0x0

    .line 324
    :try_start_0
    new-instance v1, Ljava/net/ServerSocket;

    iget v2, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->port:I

    invoke-direct {v1, v2}, Ljava/net/ServerSocket;-><init>(I)V

    const/16 v2, 0x3e8

    .line 325
    invoke-virtual {v1, v2}, Ljava/net/ServerSocket;->setSoTimeout(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_8

    .line 335
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/net/ServerSocket;->setSoTimeout(I)V
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 342
    :cond_0
    :goto_0
    :try_start_2
    iget-boolean v2, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->keepRunning:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v2, :cond_1

    .line 380
    :try_start_3
    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    :catch_0
    return-void

    :cond_1
    const/4 v2, 0x0

    .line 345
    :try_start_4
    invoke-virtual {v1}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v2
    :try_end_4
    .catch Ljava/io/InterruptedIOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/net/SocketException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    :catch_1
    move-exception v3

    :try_start_5
    const-string v4, "exception accepting socket."

    .line 355
    invoke-static {v4, v3}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_2
    move-exception v3

    const-string v4, "exception accepting socket, shutting down server socket."

    .line 351
    invoke-static {v4, v3}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 352
    iput-boolean v0, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->keepRunning:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :catch_3
    :goto_1
    if-eqz v2, :cond_0

    .line 361
    :try_start_6
    invoke-virtual {v2}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v3

    .line 362
    new-instance v4, Ljava/lang/StringBuffer;

    const-string v5, "accepting connection from "

    invoke-direct {v4, v5}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v5, " ("

    .line 363
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, ")"

    invoke-virtual {v4, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 362
    invoke-static {v3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 366
    new-instance v3, Ljava/io/ObjectOutputStream;

    invoke-virtual {v2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 369
    iget-object v2, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->oosList:Ljava/util/Vector;

    invoke-virtual {v2, v3}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_0

    :catch_4
    move-exception v2

    :try_start_7
    const-string v3, "exception creating output stream on socket."

    .line 372
    invoke-static {v3, v2}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_5
    move-exception v0

    const-string v2, "exception setting timeout, shutting down server socket."

    .line 338
    invoke-static {v2, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 380
    :try_start_8
    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_6

    :catch_6
    return-void

    :goto_2
    :try_start_9
    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_7

    .line 333
    :catch_7
    throw v0

    :catch_8
    move-exception v1

    const-string v2, "exception setting timeout, shutting down server socket."

    .line 328
    invoke-static {v2, v1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 329
    iput-boolean v0, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->keepRunning:Z

    return-void
.end method

.method public declared-synchronized stopMonitor()V
    .locals 1

    monitor-enter p0

    .line 301
    :try_start_0
    iget-boolean v0, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->keepRunning:Z

    if-eqz v0, :cond_0

    const-string v0, "server monitor thread shutting down"

    .line 302
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 303
    iput-boolean v0, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->keepRunning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    :try_start_1
    iget-object v0, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->monitorThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catch_0
    const/4 v0, 0x0

    .line 312
    :try_start_2
    iput-object v0, p0, Lorg/apache/log4j/net/SocketHubAppender$ServerMonitor;->monitorThread:Ljava/lang/Thread;

    const-string v0, "server monitor thread shut down"

    .line 313
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 300
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
