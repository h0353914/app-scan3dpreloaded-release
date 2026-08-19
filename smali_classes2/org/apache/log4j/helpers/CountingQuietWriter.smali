.class public Lorg/apache/log4j/helpers/CountingQuietWriter;
.super Lorg/apache/log4j/helpers/QuietWriter;
.source "CountingQuietWriter.java"


# instance fields
.field protected count:J


# direct methods
.method public constructor <init>(Ljava/io/Writer;Lorg/apache/log4j/spi/ErrorHandler;)V
    .locals 0

    .line 38
    invoke-direct {p0, p1, p2}, Lorg/apache/log4j/helpers/QuietWriter;-><init>(Ljava/io/Writer;Lorg/apache/log4j/spi/ErrorHandler;)V

    return-void
.end method


# virtual methods
.method public getCount()J
    .locals 2

    .line 54
    iget-wide v0, p0, Lorg/apache/log4j/helpers/CountingQuietWriter;->count:J

    return-wide v0
.end method

.method public setCount(J)V
    .locals 0

    .line 59
    iput-wide p1, p0, Lorg/apache/log4j/helpers/CountingQuietWriter;->count:J

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 4

    .line 44
    :try_start_0
    iget-object v0, p0, Ljava/io/FilterWriter;->out:Ljava/io/Writer;

    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 45
    iget-wide v0, p0, Lorg/apache/log4j/helpers/CountingQuietWriter;->count:J

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    int-to-long v2, p1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/log4j/helpers/CountingQuietWriter;->count:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 48
    iget-object v0, p0, Lorg/apache/log4j/helpers/QuietWriter;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    const-string v1, "Write failure."

    const/4 v2, 0x1

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log4j/spi/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Exception;I)V

    :goto_0
    return-void
.end method
