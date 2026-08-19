.class public Lorg/apache/log/output/io/rotate/UniqueFileStrategy;
.super Ljava/lang/Object;
.source "UniqueFileStrategy.java"

# interfaces
.implements Lorg/apache/log/output/io/rotate/FileStrategy;


# instance fields
.field private m_baseFile:Ljava/io/File;

.field private m_formatter:Ljava/text/SimpleDateFormat;

.field private m_suffix:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;->m_baseFile:Ljava/io/File;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 0

    .line 46
    invoke-direct {p0, p1}, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;-><init>(Ljava/io/File;)V

    .line 47
    new-instance p1, Ljava/text/SimpleDateFormat;

    invoke-direct {p1, p2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;->m_formatter:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 53
    iput-object p3, p0, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;->m_suffix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public nextFile()Ljava/io/File;
    .locals 3

    .line 63
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 64
    iget-object v1, p0, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;->m_baseFile:Ljava/io/File;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    .line 65
    iget-object v1, p0, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;->m_formatter:Ljava/text/SimpleDateFormat;

    if-nez v1, :cond_0

    .line 67
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuffer;->append(J)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 71
    :cond_0
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 75
    :goto_0
    iget-object v1, p0, Lorg/apache/log/output/io/rotate/UniqueFileStrategy;->m_suffix:Ljava/lang/String;

    if-eqz v1, :cond_1

    .line 76
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 79
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object v1
.end method
