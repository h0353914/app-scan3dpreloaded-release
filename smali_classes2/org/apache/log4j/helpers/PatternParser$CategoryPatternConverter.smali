.class Lorg/apache/log4j/helpers/PatternParser$CategoryPatternConverter;
.super Lorg/apache/log4j/helpers/PatternParser$NamedPatternConverter;
.source "PatternParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/log4j/helpers/PatternParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CategoryPatternConverter"
.end annotation


# instance fields
.field private final synthetic this$0:Lorg/apache/log4j/helpers/PatternParser;


# direct methods
.method constructor <init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V
    .locals 0

    .line 545
    invoke-direct {p0, p2, p3}, Lorg/apache/log4j/helpers/PatternParser$NamedPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 45
    iput-object p1, p0, Lorg/apache/log4j/helpers/PatternParser$CategoryPatternConverter;->this$0:Lorg/apache/log4j/helpers/PatternParser;

    return-void
.end method


# virtual methods
.method getFullyQualifiedName(Lorg/apache/log4j/spi/LoggingEvent;)Ljava/lang/String;
    .locals 0

    .line 549
    invoke-virtual {p1}, Lorg/apache/log4j/spi/LoggingEvent;->getLoggerName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
