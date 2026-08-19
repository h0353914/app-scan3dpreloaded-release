.class public final Lorg/apache/avalon/framework/logger/Log4JLogger;
.super Ljava/lang/Object;
.source "Log4JLogger.java"

# interfaces
.implements Lorg/apache/avalon/framework/logger/Logger;


# instance fields
.field private final m_logger:Lorg/apache/log4j/Category;


# direct methods
.method public constructor <init>(Lorg/apache/log4j/Category;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    return-void
.end method


# virtual methods
.method public final debug(Ljava/lang/String;)V
    .locals 1

    .line 42
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Category;->debug(Ljava/lang/Object;)V

    return-void
.end method

.method public final debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 53
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Category;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final error(Ljava/lang/String;)V
    .locals 1

    .line 135
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Category;->error(Ljava/lang/Object;)V

    return-void
.end method

.method public final error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 146
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Category;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final fatalError(Ljava/lang/String;)V
    .locals 1

    .line 166
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Category;->fatal(Ljava/lang/Object;)V

    return-void
.end method

.method public final fatalError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 177
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Category;->fatal(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final getChildLogger(Ljava/lang/String;)Lorg/apache/avalon/framework/logger/Logger;
    .locals 3

    .line 200
    new-instance v0, Lorg/apache/avalon/framework/logger/Log4JLogger;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v2, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v2}, Lorg/apache/log4j/Category;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/Category;->getInstance(Ljava/lang/String;)Lorg/apache/log4j/Category;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/avalon/framework/logger/Log4JLogger;-><init>(Lorg/apache/log4j/Category;)V

    return-object v0
.end method

.method public final info(Ljava/lang/String;)V
    .locals 1

    .line 73
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;)V

    return-void
.end method

.method public final info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 84
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Category;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final isDebugEnabled()Z
    .locals 1

    .line 63
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0}, Lorg/apache/log4j/Category;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public final isErrorEnabled()Z
    .locals 2

    .line 156
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    sget-object v1, Lorg/apache/log4j/Priority;->ERROR:Lorg/apache/log4j/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->isEnabledFor(Lorg/apache/log4j/Priority;)Z

    move-result v0

    return v0
.end method

.method public final isFatalErrorEnabled()Z
    .locals 2

    .line 187
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    sget-object v1, Lorg/apache/log4j/Priority;->FATAL:Lorg/apache/log4j/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->isEnabledFor(Lorg/apache/log4j/Priority;)Z

    move-result v0

    return v0
.end method

.method public final isInfoEnabled()Z
    .locals 1

    .line 94
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0}, Lorg/apache/log4j/Category;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public final isWarnEnabled()Z
    .locals 2

    .line 125
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    sget-object v1, Lorg/apache/log4j/Priority;->WARN:Lorg/apache/log4j/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/Category;->isEnabledFor(Lorg/apache/log4j/Priority;)Z

    move-result v0

    return v0
.end method

.method public final warn(Ljava/lang/String;)V
    .locals 1

    .line 104
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1}, Lorg/apache/log4j/Category;->warn(Ljava/lang/Object;)V

    return-void
.end method

.method public final warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 115
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/Log4JLogger;->m_logger:Lorg/apache/log4j/Category;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log4j/Category;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    return-void
.end method
