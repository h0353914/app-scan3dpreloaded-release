.class public final Lorg/apache/avalon/framework/logger/LogKitLogger;
.super Ljava/lang/Object;
.source "LogKitLogger.java"

# interfaces
.implements Lorg/apache/avalon/framework/logger/Logger;


# instance fields
.field private final m_logger:Lorg/apache/log/Logger;


# direct methods
.method public constructor <init>(Lorg/apache/log/Logger;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    return-void
.end method


# virtual methods
.method public final debug(Ljava/lang/String;)V
    .locals 1

    .line 39
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->debug(Ljava/lang/String;)V

    return-void
.end method

.method public final debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 50
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final error(Ljava/lang/String;)V
    .locals 1

    .line 132
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->error(Ljava/lang/String;)V

    return-void
.end method

.method public final error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 143
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final fatalError(Ljava/lang/String;)V
    .locals 1

    .line 163
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->fatalError(Ljava/lang/String;)V

    return-void
.end method

.method public final fatalError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 174
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->fatalError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final getChildLogger(Ljava/lang/String;)Lorg/apache/avalon/framework/logger/Logger;
    .locals 2

    .line 197
    new-instance v0, Lorg/apache/avalon/framework/logger/LogKitLogger;

    iget-object v1, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v1, p1}, Lorg/apache/log/Logger;->getChildLogger(Ljava/lang/String;)Lorg/apache/log/Logger;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/apache/avalon/framework/logger/LogKitLogger;-><init>(Lorg/apache/log/Logger;)V

    return-object v0
.end method

.method public final info(Ljava/lang/String;)V
    .locals 1

    .line 70
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->info(Ljava/lang/String;)V

    return-void
.end method

.method public final info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 81
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final isDebugEnabled()Z
    .locals 1

    .line 60
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public final isErrorEnabled()Z
    .locals 1

    .line 153
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public final isFatalErrorEnabled()Z
    .locals 1

    .line 184
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isFatalErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public final isInfoEnabled()Z
    .locals 1

    .line 91
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public final isWarnEnabled()Z
    .locals 1

    .line 122
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->isWarnEnabled()Z

    move-result v0

    return v0
.end method

.method public final warn(Ljava/lang/String;)V
    .locals 1

    .line 101
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->warn(Ljava/lang/String;)V

    return-void
.end method

.method public final warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 112
    iget-object v0, p0, Lorg/apache/avalon/framework/logger/LogKitLogger;->m_logger:Lorg/apache/log/Logger;

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
