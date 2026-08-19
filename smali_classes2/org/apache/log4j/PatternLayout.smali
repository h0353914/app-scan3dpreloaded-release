.class public Lorg/apache/log4j/PatternLayout;
.super Lorg/apache/log4j/Layout;
.source "PatternLayout.java"


# static fields
.field public static final DEFAULT_CONVERSION_PATTERN:Ljava/lang/String; = "%m%n"

.field public static final TTCC_CONVERSION_PATTERN:Ljava/lang/String; = "%r [%t] %p %c %x - %m%n"


# instance fields
.field protected final BUF_SIZE:I

.field protected final MAX_CAPACITY:I

.field private head:Lorg/apache/log4j/helpers/PatternConverter;

.field private pattern:Ljava/lang/String;

.field private sbuf:Ljava/lang/StringBuffer;

.field private timezone:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "%m%n"

    .line 427
    invoke-direct {p0, v0}, Lorg/apache/log4j/PatternLayout;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 433
    invoke-direct {p0}, Lorg/apache/log4j/Layout;-><init>()V

    const/16 v0, 0x100

    .line 408
    iput v0, p0, Lorg/apache/log4j/PatternLayout;->BUF_SIZE:I

    const/16 v1, 0x400

    .line 409
    iput v1, p0, Lorg/apache/log4j/PatternLayout;->MAX_CAPACITY:I

    .line 413
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, v0}, Ljava/lang/StringBuffer;-><init>(I)V

    iput-object v1, p0, Lorg/apache/log4j/PatternLayout;->sbuf:Ljava/lang/StringBuffer;

    .line 434
    iput-object p1, p0, Lorg/apache/log4j/PatternLayout;->pattern:Ljava/lang/String;

    if-nez p1, :cond_0

    const-string p1, "%m%n"

    .line 435
    :cond_0
    invoke-virtual {p0, p1}, Lorg/apache/log4j/PatternLayout;->createPatternParser(Ljava/lang/String;)Lorg/apache/log4j/helpers/PatternParser;

    move-result-object p1

    .line 436
    invoke-virtual {p1}, Lorg/apache/log4j/helpers/PatternParser;->parse()Lorg/apache/log4j/helpers/PatternConverter;

    move-result-object p1

    .line 435
    iput-object p1, p0, Lorg/apache/log4j/PatternLayout;->head:Lorg/apache/log4j/helpers/PatternConverter;

    return-void
.end method


# virtual methods
.method public activateOptions()V
    .locals 0

    return-void
.end method

.method protected createPatternParser(Ljava/lang/String;)Lorg/apache/log4j/helpers/PatternParser;
    .locals 1

    .line 485
    new-instance v0, Lorg/apache/log4j/helpers/PatternParser;

    invoke-direct {v0, p1}, Lorg/apache/log4j/helpers/PatternParser;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public format(Lorg/apache/log4j/spi/LoggingEvent;)Ljava/lang/String;
    .locals 2

    .line 494
    iget-object v0, p0, Lorg/apache/log4j/PatternLayout;->sbuf:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->capacity()I

    move-result v0

    const/16 v1, 0x400

    if-le v0, v1, :cond_0

    .line 495
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x100

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/log4j/PatternLayout;->sbuf:Ljava/lang/StringBuffer;

    goto :goto_0

    .line 497
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/PatternLayout;->sbuf:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 500
    :goto_0
    iget-object v0, p0, Lorg/apache/log4j/PatternLayout;->head:Lorg/apache/log4j/helpers/PatternConverter;

    :goto_1
    if-nez v0, :cond_1

    .line 506
    iget-object p1, p0, Lorg/apache/log4j/PatternLayout;->sbuf:Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 503
    :cond_1
    iget-object v1, p0, Lorg/apache/log4j/PatternLayout;->sbuf:Ljava/lang/StringBuffer;

    invoke-virtual {v0, v1, p1}, Lorg/apache/log4j/helpers/PatternConverter;->format(Ljava/lang/StringBuffer;Lorg/apache/log4j/spi/LoggingEvent;)V

    .line 504
    iget-object v0, v0, Lorg/apache/log4j/helpers/PatternConverter;->next:Lorg/apache/log4j/helpers/PatternConverter;

    goto :goto_1
.end method

.method public getConversionPattern()Ljava/lang/String;
    .locals 1

    .line 455
    iget-object v0, p0, Lorg/apache/log4j/PatternLayout;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public ignoresThrowable()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setConversionPattern(Ljava/lang/String;)V
    .locals 0

    .line 446
    iput-object p1, p0, Lorg/apache/log4j/PatternLayout;->pattern:Ljava/lang/String;

    .line 447
    invoke-virtual {p0, p1}, Lorg/apache/log4j/PatternLayout;->createPatternParser(Ljava/lang/String;)Lorg/apache/log4j/helpers/PatternParser;

    move-result-object p1

    invoke-virtual {p1}, Lorg/apache/log4j/helpers/PatternParser;->parse()Lorg/apache/log4j/helpers/PatternConverter;

    move-result-object p1

    iput-object p1, p0, Lorg/apache/log4j/PatternLayout;->head:Lorg/apache/log4j/helpers/PatternConverter;

    return-void
.end method
