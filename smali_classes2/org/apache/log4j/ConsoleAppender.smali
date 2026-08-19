.class public Lorg/apache/log4j/ConsoleAppender;
.super Lorg/apache/log4j/WriterAppender;
.source "ConsoleAppender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/ConsoleAppender$SystemErrStream;,
        Lorg/apache/log4j/ConsoleAppender$SystemOutStream;
    }
.end annotation


# static fields
.field public static final SYSTEM_ERR:Ljava/lang/String; = "System.err"

.field public static final SYSTEM_OUT:Ljava/lang/String; = "System.out"


# instance fields
.field protected target:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 41
    invoke-direct {p0}, Lorg/apache/log4j/WriterAppender;-><init>()V

    const-string v0, "System.out"

    .line 36
    iput-object v0, p0, Lorg/apache/log4j/ConsoleAppender;->target:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/apache/log4j/Layout;)V
    .locals 1

    const-string v0, "System.out"

    .line 50
    invoke-direct {p0, p1, v0}, Lorg/apache/log4j/ConsoleAppender;-><init>(Lorg/apache/log4j/Layout;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/log4j/Layout;Ljava/lang/String;)V
    .locals 1

    .line 58
    invoke-direct {p0}, Lorg/apache/log4j/WriterAppender;-><init>()V

    const-string v0, "System.out"

    .line 36
    iput-object v0, p0, Lorg/apache/log4j/ConsoleAppender;->target:Ljava/lang/String;

    .line 59
    invoke-virtual {p0, p1}, Lorg/apache/log4j/AppenderSkeleton;->setLayout(Lorg/apache/log4j/Layout;)V

    .line 60
    invoke-virtual {p0, p2}, Lorg/apache/log4j/ConsoleAppender;->setTarget(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0}, Lorg/apache/log4j/ConsoleAppender;->activateOptions()V

    return-void
.end method


# virtual methods
.method public activateOptions()V
    .locals 2

    .line 102
    iget-object v0, p0, Lorg/apache/log4j/ConsoleAppender;->target:Ljava/lang/String;

    const-string v1, "System.err"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 103
    new-instance v0, Lorg/apache/log4j/ConsoleAppender$SystemErrStream;

    invoke-direct {v0}, Lorg/apache/log4j/ConsoleAppender$SystemErrStream;-><init>()V

    invoke-virtual {p0, v0}, Lorg/apache/log4j/WriterAppender;->createWriter(Ljava/io/OutputStream;)Ljava/io/OutputStreamWriter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/WriterAppender;->setWriter(Ljava/io/Writer;)V

    goto :goto_0

    .line 105
    :cond_0
    new-instance v0, Lorg/apache/log4j/ConsoleAppender$SystemOutStream;

    invoke-direct {v0}, Lorg/apache/log4j/ConsoleAppender$SystemOutStream;-><init>()V

    invoke-virtual {p0, v0}, Lorg/apache/log4j/WriterAppender;->createWriter(Ljava/io/OutputStream;)Ljava/io/OutputStreamWriter;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/apache/log4j/WriterAppender;->setWriter(Ljava/io/Writer;)V

    .line 108
    :goto_0
    invoke-super {p0}, Lorg/apache/log4j/WriterAppender;->activateOptions()V

    return-void
.end method

.method protected final closeWriter()V
    .locals 0

    .line 117
    invoke-super {p0}, Lorg/apache/log4j/WriterAppender;->closeWriter()V

    return-void
.end method

.method public getTarget()Ljava/lang/String;
    .locals 1

    .line 90
    iget-object v0, p0, Lorg/apache/log4j/ConsoleAppender;->target:Ljava/lang/String;

    return-object v0
.end method

.method public setTarget(Ljava/lang/String;)V
    .locals 2

    .line 71
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "System.out"

    .line 73
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "System.out"

    .line 74
    iput-object p1, p0, Lorg/apache/log4j/ConsoleAppender;->target:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v1, "System.err"

    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "System.err"

    .line 76
    iput-object p1, p0, Lorg/apache/log4j/ConsoleAppender;->target:Ljava/lang/String;

    goto :goto_0

    .line 78
    :cond_1
    invoke-virtual {p0, p1}, Lorg/apache/log4j/ConsoleAppender;->targetWarn(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method targetWarn(Ljava/lang/String;)V
    .locals 2

    .line 94
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "] should be System.out or System.err."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    const-string p1, "Using previously set target, System.out by default."

    .line 95
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    return-void
.end method
