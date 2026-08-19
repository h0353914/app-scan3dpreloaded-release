.class public final Lorg/apache/avalon/framework/logger/ConsoleLogger;
.super Ljava/lang/Object;
.source "ConsoleLogger.java"

# interfaces
.implements Lorg/apache/avalon/framework/logger/Logger;


# static fields
.field public static final LEVEL_DEBUG:I = 0x0

.field public static final LEVEL_DISABLED:I = 0x5

.field public static final LEVEL_ERROR:I = 0x3

.field public static final LEVEL_FATAL:I = 0x4

.field public static final LEVEL_INFO:I = 0x1

.field public static final LEVEL_WARN:I = 0x2


# instance fields
.field private final m_logLevel:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, v0}, Lorg/apache/avalon/framework/logger/ConsoleLogger;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    iput p1, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 66
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/ConsoleLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 77
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    if-gtz v0, :cond_0

    .line 79
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[DEBUG] "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 80
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 84
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_0
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 186
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/ConsoleLogger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 197
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_0

    .line 199
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[ERROR] "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 200
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 204
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_0
    return-void
.end method

.method public fatalError(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 226
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/ConsoleLogger;->fatalError(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public fatalError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 237
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_0

    .line 239
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[FATAL ERROR] "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 240
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 244
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_0
    return-void
.end method

.method public getChildLogger(Ljava/lang/String;)Lorg/apache/avalon/framework/logger/Logger;
    .locals 0

    return-object p0
.end method

.method public info(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 106
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/ConsoleLogger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 117
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    .line 119
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[INFO] "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 120
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 124
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_0
    return-void
.end method

.method public isDebugEnabled()Z
    .locals 1

    .line 96
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isErrorEnabled()Z
    .locals 2

    .line 216
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFatalErrorEnabled()Z
    .locals 2

    .line 256
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x4

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isInfoEnabled()Z
    .locals 2

    .line 136
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isWarnEnabled()Z
    .locals 2

    .line 176
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public warn(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 146
    invoke-virtual {p0, p1, v0}, Lorg/apache/avalon/framework/logger/ConsoleLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 157
    iget v0, p0, Lorg/apache/avalon/framework/logger/ConsoleLogger;->m_logLevel:I

    const/4 v1, 0x2

    if-gt v0, v1, :cond_0

    .line 159
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "[WARNING] "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 160
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 164
    sget-object p1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p2, p1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_0
    return-void
.end method
