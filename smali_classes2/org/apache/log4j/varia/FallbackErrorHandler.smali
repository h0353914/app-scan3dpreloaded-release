.class public Lorg/apache/log4j/varia/FallbackErrorHandler;
.super Ljava/lang/Object;
.source "FallbackErrorHandler.java"

# interfaces
.implements Lorg/apache/log4j/spi/ErrorHandler;


# instance fields
.field backup:Lorg/apache/log4j/Appender;

.field loggers:Ljava/util/Vector;

.field primary:Lorg/apache/log4j/Appender;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public activateOptions()V
    .locals 0

    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Exception;I)V
    .locals 1

    const/4 v0, 0x0

    .line 76
    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/apache/log4j/varia/FallbackErrorHandler;->error(Ljava/lang/String;Ljava/lang/Exception;ILorg/apache/log4j/spi/LoggingEvent;)V

    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Exception;ILorg/apache/log4j/spi/LoggingEvent;)V
    .locals 0

    .line 85
    new-instance p3, Ljava/lang/StringBuffer;

    const-string p4, "FB: The following error reported: "

    invoke-direct {p3, p4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string p1, "FB: INITIATING FALLBACK PROCEDURE."

    .line 86
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 87
    :goto_0
    iget-object p2, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->loggers:Ljava/util/Vector;

    invoke-virtual {p2}, Ljava/util/Vector;->size()I

    move-result p2

    if-lt p1, p2, :cond_0

    return-void

    .line 88
    :cond_0
    iget-object p2, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->loggers:Ljava/util/Vector;

    invoke-virtual {p2, p1}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lorg/apache/log4j/Logger;

    .line 89
    new-instance p3, Ljava/lang/StringBuffer;

    const-string p4, "FB: Searching for ["

    invoke-direct {p3, p4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object p4, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->primary:Lorg/apache/log4j/Appender;

    invoke-interface {p4}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p4, "] in logger ["

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 90
    invoke-virtual {p2}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p4, "]."

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    .line 89
    invoke-static {p3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 92
    new-instance p3, Ljava/lang/StringBuffer;

    const-string p4, "FB: Replacing ["

    invoke-direct {p3, p4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object p4, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->primary:Lorg/apache/log4j/Appender;

    invoke-interface {p4}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p4, "] by ["

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 93
    iget-object p4, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->backup:Lorg/apache/log4j/Appender;

    invoke-interface {p4}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p4, "] in logger ["

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p4, "]."

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    .line 92
    invoke-static {p3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 94
    iget-object p3, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->primary:Lorg/apache/log4j/Appender;

    invoke-virtual {p2, p3}, Lorg/apache/log4j/Category;->removeAppender(Lorg/apache/log4j/Appender;)V

    .line 95
    new-instance p3, Ljava/lang/StringBuffer;

    const-string p4, "FB: Adding appender ["

    invoke-direct {p3, p4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object p4, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->backup:Lorg/apache/log4j/Appender;

    invoke-interface {p4}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p4, "] to logger "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 96
    invoke-virtual {p2}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p3, p4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p3

    .line 95
    invoke-static {p3}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 97
    iget-object p3, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->backup:Lorg/apache/log4j/Appender;

    invoke-virtual {p2, p3}, Lorg/apache/log4j/Category;->addAppender(Lorg/apache/log4j/Appender;)V

    add-int/lit8 p1, p1, 0x1

    goto/16 :goto_0
.end method

.method public setAppender(Lorg/apache/log4j/Appender;)V
    .locals 2

    .line 119
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "FB: Setting primary appender to ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 120
    iput-object p1, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->primary:Lorg/apache/log4j/Appender;

    return-void
.end method

.method public setBackupAppender(Lorg/apache/log4j/Appender;)V
    .locals 2

    .line 128
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "FB: Setting backup appender to ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-interface {p1}, Lorg/apache/log4j/Appender;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 129
    iput-object p1, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->backup:Lorg/apache/log4j/Appender;

    return-void
.end method

.method public setLogger(Lorg/apache/log4j/Logger;)V
    .locals 2

    .line 55
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "FB: Adding logger ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    .line 56
    iget-object v0, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->loggers:Ljava/util/Vector;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->loggers:Ljava/util/Vector;

    .line 59
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/varia/FallbackErrorHandler;->loggers:Ljava/util/Vector;

    invoke-virtual {v0, p1}, Ljava/util/Vector;->addElement(Ljava/lang/Object;)V

    return-void
.end method
