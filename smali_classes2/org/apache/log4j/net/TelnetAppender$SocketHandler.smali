.class public Lorg/apache/log4j/net/TelnetAppender$SocketHandler;
.super Ljava/lang/Thread;
.source "TelnetAppender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log4j/net/TelnetAppender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SocketHandler"
.end annotation


# instance fields
.field private MAX_CONNECTIONS:I

.field private connections:Ljava/util/Vector;

.field private done:Z

.field private serverSocket:Ljava/net/ServerSocket;

.field private final synthetic this$0:Lorg/apache/log4j/net/TelnetAppender;

.field private writers:Ljava/util/Vector;


# direct methods
.method public constructor <init>(Lorg/apache/log4j/net/TelnetAppender;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 180
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 55
    iput-object p1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->this$0:Lorg/apache/log4j/net/TelnetAppender;

    const/4 p1, 0x0

    .line 118
    iput-boolean p1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->done:Z

    .line 119
    new-instance p1, Ljava/util/Vector;

    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->writers:Ljava/util/Vector;

    .line 120
    new-instance p1, Ljava/util/Vector;

    invoke-direct {p1}, Ljava/util/Vector;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    const/16 p1, 0x14

    .line 122
    iput p1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->MAX_CONNECTIONS:I

    .line 181
    new-instance p1, Ljava/net/ServerSocket;

    invoke-direct {p1, p2}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object p1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->serverSocket:Ljava/net/ServerSocket;

    return-void
.end method


# virtual methods
.method public finalize()V
    .locals 2

    .line 126
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    :catch_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v1

    if-nez v1, :cond_0

    .line 133
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :catch_1
    const/4 v0, 0x1

    .line 136
    iput-boolean v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->done:Z

    return-void

    .line 128
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public run()V
    .locals 4

    .line 159
    :goto_0
    iget-boolean v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->done:Z

    if-eqz v0, :cond_0

    return-void

    .line 161
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->serverSocket:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0

    .line 162
    new-instance v1, Ljava/io/PrintWriter;

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;)V

    .line 163
    iget-object v2, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    iget v3, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->MAX_CONNECTIONS:I

    if-ge v2, v3, :cond_1

    .line 164
    iget-object v2, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    invoke-virtual {v2, v0}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 165
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->writers:Ljava/util/Vector;

    invoke-virtual {v0, v1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    .line 166
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v2, "TelnetAppender v1.0 ("

    invoke-direct {v0, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v2, " active connections)\r\n\r\n"

    .line 167
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 166
    invoke-virtual {v1, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 168
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    goto :goto_0

    :cond_1
    const-string v2, "Too many connections.\r\n"

    .line 170
    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 171
    invoke-virtual {v1}, Ljava/io/PrintWriter;->flush()V

    .line 172
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "Encountered error while in SocketHandler loop."

    .line 175
    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public send(Ljava/lang/String;)V
    .locals 5

    .line 141
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v0

    .line 142
    iget-object v1, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->writers:Ljava/util/Vector;

    invoke-virtual {v1}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_1

    return-void

    .line 143
    :cond_1
    invoke-interface {v0}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/net/Socket;

    .line 144
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/PrintWriter;

    .line 145
    invoke-virtual {v3, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 146
    invoke-virtual {v3}, Ljava/io/PrintWriter;->checkError()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 148
    iget-object v4, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->connections:Ljava/util/Vector;

    invoke-virtual {v4, v2}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 149
    iget-object v2, p0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->writers:Ljava/util/Vector;

    invoke-virtual {v2, v3}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method
