.class public Lorg/apache/log4j/net/SocketNode;
.super Ljava/lang/Object;
.source "SocketNode.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field static synthetic class$org$apache$log4j$net$SocketNode:Ljava/lang/Class;

.field static logger:Lorg/apache/log4j/Logger;


# instance fields
.field hierarchy:Lorg/apache/log4j/spi/LoggerRepository;

.field ois:Ljava/io/ObjectInputStream;

.field socket:Ljava/net/Socket;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 48
    sget-object v0, Lorg/apache/log4j/net/SocketNode;->class$org$apache$log4j$net$SocketNode:Ljava/lang/Class;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "org.apache.log4j.net.SocketNode"

    invoke-static {v0}, Lorg/apache/log4j/net/SocketNode;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/net/SocketNode;->class$org$apache$log4j$net$SocketNode:Ljava/lang/Class;

    :goto_0
    invoke-static {v0}, Lorg/apache/log4j/Logger;->getLogger(Ljava/lang/Class;)Lorg/apache/log4j/Logger;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/net/Socket;Lorg/apache/log4j/spi/LoggerRepository;)V
    .locals 3

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    iput-object p1, p0, Lorg/apache/log4j/net/SocketNode;->socket:Ljava/net/Socket;

    .line 52
    iput-object p2, p0, Lorg/apache/log4j/net/SocketNode;->hierarchy:Lorg/apache/log4j/spi/LoggerRepository;

    .line 54
    :try_start_0
    new-instance p2, Ljava/io/ObjectInputStream;

    .line 55
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 54
    invoke-direct {p2, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object p2, p0, Lorg/apache/log4j/net/SocketNode;->ois:Ljava/io/ObjectInputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    .line 58
    sget-object v0, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Could not open ObjectInputStream to "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Category;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 42
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 75
    :cond_0
    :goto_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/log4j/spi/LoggingEvent;

    .line 77
    iget-object v1, p0, Lorg/apache/log4j/net/SocketNode;->hierarchy:Lorg/apache/log4j/spi/LoggerRepository;

    invoke-virtual {v0}, Lorg/apache/log4j/spi/LoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/log4j/spi/LoggerRepository;->getLogger(Ljava/lang/String;)Lorg/apache/log4j/Logger;

    move-result-object v1

    .line 80
    invoke-virtual {v0}, Lorg/apache/log4j/spi/LoggingEvent;->getLevel()Lorg/apache/log4j/Level;

    move-result-object v2

    invoke-virtual {v1}, Lorg/apache/log4j/Category;->getEffectiveLevel()Lorg/apache/log4j/Level;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/apache/log4j/Priority;->isGreaterOrEqual(Lorg/apache/log4j/Priority;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 82
    invoke-virtual {v1, v0}, Lorg/apache/log4j/Category;->callAppenders(Lorg/apache/log4j/spi/LoggingEvent;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 93
    sget-object v1, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    const-string v2, "Unexpected exception. Closing conneciton."

    invoke-virtual {v1, v2, v0}, Lorg/apache/log4j/Category;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    move-exception v0

    .line 90
    sget-object v1, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Caught java.io.IOException: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;)V

    .line 91
    sget-object v0, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    const-string v1, "Closing connection."

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;)V

    goto :goto_1

    .line 88
    :catch_2
    sget-object v0, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    const-string v1, "Caught java.net.SocketException closing conneciton."

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;)V

    goto :goto_1

    .line 86
    :catch_3
    sget-object v0, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    const-string v1, "Caught java.io.EOFException closing conneciton."

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;)V

    .line 97
    :goto_1
    :try_start_1
    iget-object v0, p0, Lorg/apache/log4j/net/SocketNode;->ois:Ljava/io/ObjectInputStream;

    invoke-virtual {v0}, Ljava/io/ObjectInputStream;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    goto :goto_2

    :catch_4
    move-exception v0

    .line 99
    sget-object v1, Lorg/apache/log4j/net/SocketNode;->logger:Lorg/apache/log4j/Logger;

    const-string v2, "Could not close connection."

    invoke-virtual {v1, v2, v0}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method
