.class public final Lorg/apache/avalon/framework/ExceptionUtil;
.super Ljava/lang/Object;
.source "ExceptionUtil.java"


# static fields
.field private static final GET_CAUSE_NAME:Ljava/lang/String; = "getCause"

.field private static final GET_CAUSE_PARAMTYPES:[Ljava/lang/Class;

.field private static final LINE_SEPARATOR:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "line.separator"

    .line 26
    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/avalon/framework/ExceptionUtil;->LINE_SEPARATOR:Ljava/lang/String;

    const/4 v0, 0x0

    .line 28
    new-array v0, v0, [Ljava/lang/Class;

    sput-object v0, Lorg/apache/avalon/framework/ExceptionUtil;->GET_CAUSE_PARAMTYPES:[Ljava/lang/Class;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static captureStackTrace(Ljava/lang/Throwable;)[Ljava/lang/String;
    .locals 3

    .line 192
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 193
    new-instance v1, Ljava/io/PrintWriter;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 194
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v0, Lorg/apache/avalon/framework/ExceptionUtil;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-static {p0, v0}, Lorg/apache/avalon/framework/ExceptionUtil;->splitString(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getCause(Ljava/lang/Throwable;Z)Ljava/lang/Throwable;
    .locals 3

    .line 160
    instance-of v0, p0, Lorg/apache/avalon/framework/CascadingThrowable;

    if-eqz v0, :cond_0

    .line 162
    check-cast p0, Lorg/apache/avalon/framework/CascadingThrowable;

    invoke-interface {p0}, Lorg/apache/avalon/framework/CascadingThrowable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    .line 168
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    const-string v1, "getCause"

    .line 169
    sget-object v2, Lorg/apache/avalon/framework/ExceptionUtil;->GET_CAUSE_PARAMTYPES:[Ljava/lang/Class;

    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 171
    invoke-virtual {p1, p0, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Throwable;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    return-object v0

    :cond_1
    return-object v0
.end method

.method public static printStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    .line 45
    invoke-static {p0, v0, v1}, Lorg/apache/avalon/framework/ExceptionUtil;->printStackTrace(Ljava/lang/Throwable;IZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static printStackTrace(Ljava/lang/Throwable;I)Ljava/lang/String;
    .locals 3

    .line 73
    invoke-static {p0}, Lorg/apache/avalon/framework/ExceptionUtil;->captureStackTrace(Ljava/lang/Throwable;)[Ljava/lang/String;

    move-result-object p0

    if-eqz p1, :cond_0

    .line 75
    array-length v0, p0

    if-le p1, v0, :cond_1

    .line 77
    :cond_0
    array-length p1, p0

    .line 80
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v1, 0x0

    :goto_0
    if-lt v1, p1, :cond_2

    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 84
    :cond_2
    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    sget-object v2, Lorg/apache/avalon/framework/ExceptionUtil;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method public static printStackTrace(Ljava/lang/Throwable;IZ)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 103
    invoke-static {p0, p1, p2, v0}, Lorg/apache/avalon/framework/ExceptionUtil;->printStackTrace(Ljava/lang/Throwable;IZZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static printStackTrace(Ljava/lang/Throwable;IZZ)Ljava/lang/String;
    .locals 1

    .line 124
    invoke-static {p0, p1}, Lorg/apache/avalon/framework/ExceptionUtil;->printStackTrace(Ljava/lang/Throwable;I)Ljava/lang/String;

    move-result-object v0

    if-nez p2, :cond_0

    return-object v0

    .line 132
    :cond_0
    new-instance p2, Ljava/lang/StringBuffer;

    invoke-direct {p2}, Ljava/lang/StringBuffer;-><init>()V

    .line 133
    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 135
    invoke-static {p0, p3}, Lorg/apache/avalon/framework/ExceptionUtil;->getCause(Ljava/lang/Throwable;Z)Ljava/lang/Throwable;

    move-result-object p0

    :goto_0
    if-nez p0, :cond_1

    .line 146
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const-string v0, "rethrown from"

    .line 139
    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 140
    sget-object v0, Lorg/apache/avalon/framework/ExceptionUtil;->LINE_SEPARATOR:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 141
    invoke-static {p0, p1}, Lorg/apache/avalon/framework/ExceptionUtil;->printStackTrace(Ljava/lang/Throwable;I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 143
    invoke-static {p0, p3}, Lorg/apache/avalon/framework/ExceptionUtil;->getCause(Ljava/lang/Throwable;Z)Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0
.end method

.method public static printStackTrace(Ljava/lang/Throwable;Z)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 58
    invoke-static {p0, v0, p1}, Lorg/apache/avalon/framework/ExceptionUtil;->printStackTrace(Ljava/lang/Throwable;IZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static splitString(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 2

    .line 207
    new-instance v0, Ljava/util/StringTokenizer;

    invoke-direct {v0, p0, p1}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->countTokens()I

    move-result p0

    new-array p0, p0, [Ljava/lang/String;

    const/4 p1, 0x0

    .line 210
    :goto_0
    array-length v1, p0

    if-lt p1, v1, :cond_0

    return-object p0

    .line 212
    :cond_0
    invoke-virtual {v0}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p0, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0
.end method
