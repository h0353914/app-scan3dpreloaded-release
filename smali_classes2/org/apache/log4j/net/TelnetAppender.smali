.class public Lorg/apache/log4j/net/TelnetAppender;
.super Lorg/apache/log4j/AppenderSkeleton;
.source "TelnetAppender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/net/TelnetAppender$SocketHandler;
    }
.end annotation


# instance fields
.field private port:I

.field private sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 55
    invoke-direct {p0}, Lorg/apache/log4j/AppenderSkeleton;-><init>()V

    const/16 v0, 0x17

    .line 58
    iput v0, p0, Lorg/apache/log4j/net/TelnetAppender;->port:I

    return-void
.end method


# virtual methods
.method public activateOptions()V
    .locals 2

    .line 71
    :try_start_0
    new-instance v0, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    iget v1, p0, Lorg/apache/log4j/net/TelnetAppender;->port:I

    invoke-direct {v0, p0, v1}, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;-><init>(Lorg/apache/log4j/net/TelnetAppender;I)V

    iput-object v0, p0, Lorg/apache/log4j/net/TelnetAppender;->sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    .line 72
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender;->sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    :goto_0
    return-void
.end method

.method protected append(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 4

    .line 98
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender;->sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    iget-object v1, p0, Lorg/apache/log4j/AppenderSkeleton;->layout:Lorg/apache/log4j/Layout;

    invoke-virtual {v1, p1}, Lorg/apache/log4j/Layout;->format(Lorg/apache/log4j/spi/LoggingEvent;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->send(Ljava/lang/String;)V

    .line 99
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->layout:Lorg/apache/log4j/Layout;

    invoke-virtual {v0}, Lorg/apache/log4j/Layout;->ignoresThrowable()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 100
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getThrowableStrRep()[Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 102
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-lt v1, v0, :cond_0

    goto :goto_1

    .line 104
    :cond_0
    iget-object v2, p0, Lorg/apache/log4j/net/TelnetAppender;->sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    aget-object v3, p1, v1

    invoke-virtual {v2, v3}, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->send(Ljava/lang/String;)V

    .line 105
    iget-object v2, p0, Lorg/apache/log4j/net/TelnetAppender;->sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    sget-object v3, Lorg/apache/log4j/Layout;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v2, v3}, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->send(Ljava/lang/String;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method public close()V
    .locals 1

    .line 92
    iget-object v0, p0, Lorg/apache/log4j/net/TelnetAppender;->sh:Lorg/apache/log4j/net/TelnetAppender$SocketHandler;

    invoke-virtual {v0}, Lorg/apache/log4j/net/TelnetAppender$SocketHandler;->finalize()V

    return-void
.end method

.method public getPort()I
    .locals 1

    .line 81
    iget v0, p0, Lorg/apache/log4j/net/TelnetAppender;->port:I

    return v0
.end method

.method public requiresLayout()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setPort(I)V
    .locals 0

    .line 86
    iput p1, p0, Lorg/apache/log4j/net/TelnetAppender;->port:I

    return-void
.end method
