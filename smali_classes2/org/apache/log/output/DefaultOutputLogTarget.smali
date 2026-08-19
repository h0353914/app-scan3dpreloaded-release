.class public Lorg/apache/log/output/DefaultOutputLogTarget;
.super Lorg/apache/log/output/io/WriterTarget;
.source "DefaultOutputLogTarget.java"


# static fields
.field private static final FORMAT:Ljava/lang/String; = "%7.7{priority} %5.5{time}   [%8.8{category}] (%{context}): %{message}\\n%{throwable}"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 55
    new-instance v0, Ljava/io/OutputStreamWriter;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, v0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>(Ljava/io/Writer;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/OutputStream;)V
    .locals 1

    .line 65
    new-instance v0, Ljava/io/OutputStreamWriter;

    invoke-direct {v0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, v0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>(Ljava/io/Writer;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;)V
    .locals 2

    .line 75
    new-instance v0, Lorg/apache/log/format/PatternFormatter;

    const-string v1, "%7.7{priority} %5.5{time}   [%8.8{category}] (%{context}): %{message}\\n%{throwable}"

    invoke-direct {v0, v1}, Lorg/apache/log/format/PatternFormatter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>(Ljava/io/Writer;Lorg/apache/log/format/Formatter;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/Writer;Lorg/apache/log/format/Formatter;)V
    .locals 0

    .line 80
    invoke-direct {p0, p1, p2}, Lorg/apache/log/output/io/WriterTarget;-><init>(Ljava/io/Writer;Lorg/apache/log/format/Formatter;)V

    .line 81
    invoke-virtual {p0}, Lorg/apache/log/output/DefaultOutputLogTarget;->initPattern()V

    return-void
.end method

.method public constructor <init>(Lorg/apache/log/format/Formatter;)V
    .locals 2

    .line 46
    new-instance v0, Ljava/io/OutputStreamWriter;

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-direct {v0, v1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    invoke-direct {p0, v0, p1}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>(Ljava/io/Writer;Lorg/apache/log/format/Formatter;)V

    return-void
.end method


# virtual methods
.method protected initPattern()V
    .locals 0

    return-void
.end method

.method public setFormat(Ljava/lang/String;)V
    .locals 1

    .line 95
    iget-object v0, p0, Lorg/apache/log/output/DefaultOutputLogTarget;->m_formatter:Lorg/apache/log/format/Formatter;

    check-cast v0, Lorg/apache/log/format/PatternFormatter;

    invoke-virtual {v0, p1}, Lorg/apache/log/format/PatternFormatter;->setFormat(Ljava/lang/String;)V

    return-void
.end method
