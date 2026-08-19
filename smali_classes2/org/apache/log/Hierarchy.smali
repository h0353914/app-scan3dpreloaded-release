.class public Lorg/apache/log/Hierarchy;
.super Ljava/lang/Object;
.source "Hierarchy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log/Hierarchy$InnerErrorHandler;
    }
.end annotation


# static fields
.field private static final FORMAT:Ljava/lang/String; = "%7.7{priority} %5.5{time}   [%8.8{category}] (%{context}): %{message}\\n%{throwable}"

.field private static final c_hierarchy:Lorg/apache/log/Hierarchy;


# instance fields
.field private m_errorHandler:Lorg/apache/log/ErrorHandler;

.field private m_rootLogger:Lorg/apache/log/Logger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 28
    new-instance v0, Lorg/apache/log/Hierarchy;

    invoke-direct {v0}, Lorg/apache/log/Hierarchy;-><init>()V

    sput-object v0, Lorg/apache/log/Hierarchy;->c_hierarchy:Lorg/apache/log/Hierarchy;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    new-instance v0, Lorg/apache/log/util/DefaultErrorHandler;

    invoke-direct {v0}, Lorg/apache/log/util/DefaultErrorHandler;-><init>()V

    iput-object v0, p0, Lorg/apache/log/Hierarchy;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    .line 59
    new-instance v0, Lorg/apache/log/Logger;

    new-instance v1, Lorg/apache/log/Hierarchy$InnerErrorHandler;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lorg/apache/log/Hierarchy$InnerErrorHandler;-><init>(Lorg/apache/log/Hierarchy;Lorg/apache/log/Hierarchy$1;)V

    const-string v3, ""

    invoke-direct {v0, v1, v3, v2, v2}, Lorg/apache/log/Logger;-><init>(Lorg/apache/log/ErrorHandler;Ljava/lang/String;[Lorg/apache/log/LogTarget;Lorg/apache/log/Logger;)V

    iput-object v0, p0, Lorg/apache/log/Hierarchy;->m_rootLogger:Lorg/apache/log/Logger;

    .line 62
    new-instance v0, Lorg/apache/log/format/PatternFormatter;

    const-string v1, "%7.7{priority} %5.5{time}   [%8.8{category}] (%{context}): %{message}\\n%{throwable}"

    invoke-direct {v0, v1}, Lorg/apache/log/format/PatternFormatter;-><init>(Ljava/lang/String;)V

    .line 63
    new-instance v1, Lorg/apache/log/output/io/StreamTarget;

    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v1, v2, v0}, Lorg/apache/log/output/io/StreamTarget;-><init>(Ljava/io/OutputStream;Lorg/apache/log/format/Formatter;)V

    .line 65
    invoke-virtual {p0, v1}, Lorg/apache/log/Hierarchy;->setDefaultLogTarget(Lorg/apache/log/LogTarget;)V

    return-void
.end method

.method static synthetic access$100(Lorg/apache/log/Hierarchy;)Lorg/apache/log/ErrorHandler;
    .locals 0

    .line 21
    iget-object p0, p0, Lorg/apache/log/Hierarchy;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    return-object p0
.end method

.method public static getDefaultHierarchy()Lorg/apache/log/Hierarchy;
    .locals 1

    .line 49
    sget-object v0, Lorg/apache/log/Hierarchy;->c_hierarchy:Lorg/apache/log/Hierarchy;

    return-object v0
.end method


# virtual methods
.method public getLoggerFor(Ljava/lang/String;)Lorg/apache/log/Logger;
    .locals 1

    .line 148
    invoke-virtual {p0}, Lorg/apache/log/Hierarchy;->getRootLogger()Lorg/apache/log/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->getChildLogger(Ljava/lang/String;)Lorg/apache/log/Logger;

    move-result-object p1

    return-object p1
.end method

.method protected final getRootLogger()Lorg/apache/log/Logger;
    .locals 1

    .line 204
    iget-object v0, p0, Lorg/apache/log/Hierarchy;->m_rootLogger:Lorg/apache/log/Logger;

    return-object v0
.end method

.method public log(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 173
    invoke-virtual {p0, p1, v0}, Lorg/apache/log/Hierarchy;->log(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public log(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 2

    .line 161
    iget-object v0, p0, Lorg/apache/log/Hierarchy;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    const/4 v1, 0x0

    invoke-interface {v0, p1, p2, v1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    return-void
.end method

.method public setDefaultLogTarget(Lorg/apache/log/LogTarget;)V
    .locals 2

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    .line 81
    new-array v0, v0, [Lorg/apache/log/LogTarget;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    .line 82
    invoke-virtual {p0}, Lorg/apache/log/Hierarchy;->getRootLogger()Lorg/apache/log/Logger;

    move-result-object p1

    invoke-virtual {p1, v0}, Lorg/apache/log/Logger;->setLogTargets([Lorg/apache/log/LogTarget;)V

    return-void

    .line 78
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not set DefaultLogTarget to null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDefaultLogTargets([Lorg/apache/log/LogTarget;)V
    .locals 2

    if-eqz p1, :cond_2

    .line 93
    array-length v0, p1

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 98
    :goto_0
    array-length v1, p1

    if-lt v0, v1, :cond_0

    .line 106
    invoke-virtual {p0}, Lorg/apache/log/Hierarchy;->getRootLogger()Lorg/apache/log/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->setLogTargets([Lorg/apache/log/LogTarget;)V

    return-void

    .line 100
    :cond_0
    aget-object v1, p1, v0

    if-eqz v1, :cond_1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 102
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not set DefaultLogTarget element to null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 95
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not set DefaultLogTargets to null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setDefaultPriority(Lorg/apache/log/Priority;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 122
    invoke-virtual {p0}, Lorg/apache/log/Hierarchy;->getRootLogger()Lorg/apache/log/Logger;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log/Logger;->setPriority(Lorg/apache/log/Priority;)V

    return-void

    .line 119
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not set default Hierarchy Priority to null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setErrorHandler(Lorg/apache/log/ErrorHandler;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 137
    iput-object p1, p0, Lorg/apache/log/Hierarchy;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    return-void

    .line 134
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Can not set default Hierarchy ErrorHandler to null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
