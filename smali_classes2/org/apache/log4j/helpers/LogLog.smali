.class public Lorg/apache/log4j/helpers/LogLog;
.super Ljava/lang/Object;
.source "LogLog.java"


# static fields
.field public static final CONFIG_DEBUG_KEY:Ljava/lang/String; = "log4j.configDebug"

.field public static final DEBUG_KEY:Ljava/lang/String; = "log4j.debug"

.field private static final ERR_PREFIX:Ljava/lang/String; = "log4j:ERROR "

.field private static final PREFIX:Ljava/lang/String; = "log4j: "

.field private static final WARN_PREFIX:Ljava/lang/String; = "log4j:WARN "

.field protected static debugEnabled:Z = false

.field private static quietMode:Z = false


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "log4j.debug"

    const/4 v1, 0x0

    .line 71
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "log4j.configDebug"

    .line 74
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->getSystemProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    const/4 v1, 0x1

    .line 78
    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/OptionConverter;->toBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lorg/apache/log4j/helpers/LogLog;->debugEnabled:Z

    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static debug(Ljava/lang/String;)V
    .locals 3

    .line 98
    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->debugEnabled:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    if-nez v0, :cond_0

    .line 99
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "log4j: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 110
    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->debugEnabled:Z

    if-eqz v0, :cond_0

    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    if-nez v0, :cond_0

    .line 111
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "log4j: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p1, :cond_0

    .line 113
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    :cond_0
    return-void
.end method

.method public static error(Ljava/lang/String;)V
    .locals 3

    .line 126
    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    if-eqz v0, :cond_0

    return-void

    .line 128
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "log4j:ERROR "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 139
    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    if-eqz v0, :cond_0

    return-void

    .line 142
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "log4j:ERROR "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    .line 144
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    return-void
.end method

.method public static setInternalDebugging(Z)V
    .locals 0

    .line 88
    sput-boolean p0, Lorg/apache/log4j/helpers/LogLog;->debugEnabled:Z

    return-void
.end method

.method public static setQuietMode(Z)V
    .locals 0

    .line 157
    sput-boolean p0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    return-void
.end method

.method public static warn(Ljava/lang/String;)V
    .locals 3

    .line 167
    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    if-eqz v0, :cond_0

    return-void

    .line 170
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "log4j:WARN "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public static warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 180
    sget-boolean v0, Lorg/apache/log4j/helpers/LogLog;->quietMode:Z

    if-eqz v0, :cond_0

    return-void

    .line 183
    :cond_0
    sget-object v0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "log4j:WARN "

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    if-eqz p1, :cond_1

    .line 185
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    :cond_1
    return-void
.end method
