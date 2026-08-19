.class public Lorg/apache/log4j/spi/LocationInfo;
.super Ljava/lang/Object;
.source "LocationInfo.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final NA:Ljava/lang/String; = "?"

.field static inVisualAge:Z = false

.field private static pw:Ljava/io/PrintWriter; = null

.field static final serialVersionUID:J = -0x1266441eb56e5a84L

.field private static sw:Ljava/io/StringWriter;


# instance fields
.field transient className:Ljava/lang/String;

.field transient fileName:Ljava/lang/String;

.field public fullInfo:Ljava/lang/String;

.field transient lineNumber:Ljava/lang/String;

.field transient methodName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 55
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    sput-object v0, Lorg/apache/log4j/spi/LocationInfo;->sw:Ljava/io/StringWriter;

    .line 56
    new-instance v0, Ljava/io/PrintWriter;

    sget-object v1, Lorg/apache/log4j/spi/LocationInfo;->sw:Ljava/io/StringWriter;

    invoke-direct {v0, v1}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    sput-object v0, Lorg/apache/log4j/spi/LocationInfo;->pw:Ljava/io/PrintWriter;

    const/4 v0, 0x0

    .line 68
    sput-boolean v0, Lorg/apache/log4j/spi/LocationInfo;->inVisualAge:Z

    :try_start_0
    const-string v0, "com.ibm.uvm.tools.DebugSupport"

    .line 71
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    const/4 v0, 0x1

    .line 72
    sput-boolean v0, Lorg/apache/log4j/spi/LocationInfo;->inVisualAge:Z

    const-string v0, "Detected IBM VisualAge environment."

    .line 73
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 3

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p1, :cond_0

    return-void

    .line 104
    :cond_0
    sget-object v0, Lorg/apache/log4j/spi/LocationInfo;->sw:Ljava/io/StringWriter;

    monitor-enter v0

    .line 105
    :try_start_0
    sget-object v1, Lorg/apache/log4j/spi/LocationInfo;->pw:Ljava/io/PrintWriter;

    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 106
    sget-object p1, Lorg/apache/log4j/spi/LocationInfo;->sw:Ljava/io/StringWriter;

    invoke-virtual {p1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p1

    .line 107
    sget-object v1, Lorg/apache/log4j/spi/LocationInfo;->sw:Ljava/io/StringWriter;

    invoke-virtual {v1}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->setLength(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 104
    monitor-exit v0

    .line 119
    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result p2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    return-void

    .line 124
    :cond_1
    sget-object v1, Lorg/apache/log4j/Layout;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result p2

    if-ne p2, v0, :cond_2

    return-void

    .line 127
    :cond_2
    sget v1, Lorg/apache/log4j/Layout;->LINE_SEP_LEN:I

    add-int/2addr p2, v1

    .line 130
    sget-object v1, Lorg/apache/log4j/Layout;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {p1, v1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v0, :cond_3

    return-void

    .line 136
    :cond_3
    sget-boolean v2, Lorg/apache/log4j/spi/LocationInfo;->inVisualAge:Z

    if-nez v2, :cond_5

    const-string p2, "at "

    .line 138
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result p2

    if-ne p2, v0, :cond_4

    return-void

    :cond_4
    add-int/lit8 p2, p2, 0x3

    .line 145
    :cond_5
    invoke-virtual {p1, p2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    return-void

    :catchall_0
    move-exception p1

    .line 104
    monitor-exit v0

    throw p1
.end method


# virtual methods
.method public getClassName()Ljava/lang/String;
    .locals 4

    .line 154
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "?"

    return-object v0

    .line 155
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->className:Ljava/lang/String;

    if-nez v1, :cond_4

    const/16 v1, 0x28

    .line 158
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const-string v0, "?"

    .line 160
    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->className:Ljava/lang/String;

    goto :goto_0

    .line 162
    :cond_1
    iget-object v2, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    const/16 v3, 0x2e

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v0

    const/4 v2, 0x0

    .line 174
    sget-boolean v3, Lorg/apache/log4j/spi/LocationInfo;->inVisualAge:Z

    if-eqz v3, :cond_2

    .line 175
    iget-object v2, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    const/16 v3, 0x20

    invoke-virtual {v2, v3, v0}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    :cond_2
    if-ne v0, v1, :cond_3

    const-string v0, "?"

    .line 179
    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->className:Ljava/lang/String;

    goto :goto_0

    .line 181
    :cond_3
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->className:Ljava/lang/String;

    .line 184
    :cond_4
    :goto_0
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->className:Ljava/lang/String;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 4

    .line 194
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "?"

    return-object v0

    .line 196
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->fileName:Ljava/lang/String;

    if-nez v1, :cond_2

    const/16 v1, 0x3a

    .line 197
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const-string v0, "?"

    .line 199
    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fileName:Ljava/lang/String;

    goto :goto_0

    .line 201
    :cond_1
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    const/16 v2, 0x28

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    .line 202
    iget-object v2, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fileName:Ljava/lang/String;

    .line 205
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getLineNumber()Ljava/lang/String;
    .locals 4

    .line 215
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "?"

    return-object v0

    .line 217
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->lineNumber:Ljava/lang/String;

    if-nez v1, :cond_2

    const/16 v1, 0x29

    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 219
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    const/16 v2, 0x3a

    add-int/lit8 v3, v0, -0x1

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    const-string v0, "?"

    .line 221
    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->lineNumber:Ljava/lang/String;

    goto :goto_0

    .line 223
    :cond_1
    iget-object v2, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->lineNumber:Ljava/lang/String;

    .line 225
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->lineNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getMethodName()Ljava/lang/String;
    .locals 3

    .line 233
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, "?"

    return-object v0

    .line 234
    :cond_0
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->methodName:Ljava/lang/String;

    if-nez v1, :cond_2

    const/16 v1, 0x28

    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 236
    iget-object v1, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    const/16 v2, 0x2e

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->lastIndexOf(II)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_1

    const-string v0, "?"

    .line 238
    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->methodName:Ljava/lang/String;

    goto :goto_0

    .line 240
    :cond_1
    iget-object v2, p0, Lorg/apache/log4j/spi/LocationInfo;->fullInfo:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->methodName:Ljava/lang/String;

    .line 242
    :cond_2
    :goto_0
    iget-object v0, p0, Lorg/apache/log4j/spi/LocationInfo;->methodName:Ljava/lang/String;

    return-object v0
.end method
