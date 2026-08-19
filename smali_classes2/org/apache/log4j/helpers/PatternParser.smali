.class public Lorg/apache/log4j/helpers/PatternParser;
.super Ljava/lang/Object;
.source "PatternParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$DatePatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$MDCPatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$NamedPatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$ClassNamePatternConverter;,
        Lorg/apache/log4j/helpers/PatternParser$CategoryPatternConverter;
    }
.end annotation


# static fields
.field static final CLASS_LOCATION_CONVERTER:I = 0x3ea

.field private static final CONVERTER_STATE:I = 0x1

.field private static final DOT_STATE:I = 0x3

.field private static final ESCAPE_CHAR:C = '%'

.field static final FILE_LOCATION_CONVERTER:I = 0x3ec

.field static final FULL_LOCATION_CONVERTER:I = 0x3e8

.field static final LEVEL_CONVERTER:I = 0x7d2

.field static final LINE_LOCATION_CONVERTER:I = 0x3eb

.field private static final LITERAL_STATE:I = 0x0

.field private static final MAX_STATE:I = 0x5

.field static final MESSAGE_CONVERTER:I = 0x7d4

.field static final METHOD_LOCATION_CONVERTER:I = 0x3e9

.field private static final MINUS_STATE:I = 0x2

.field private static final MIN_STATE:I = 0x4

.field static final NDC_CONVERTER:I = 0x7d3

.field static final RELATIVE_TIME_CONVERTER:I = 0x7d0

.field static final THREAD_CONVERTER:I = 0x7d1

.field static synthetic class$java$text$DateFormat:Ljava/lang/Class;


# instance fields
.field protected currentLiteral:Ljava/lang/StringBuffer;

.field protected formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

.field head:Lorg/apache/log4j/helpers/PatternConverter;

.field protected i:I

.field protected pattern:Ljava/lang/String;

.field protected patternLength:I

.field state:I

.field tail:Lorg/apache/log4j/helpers/PatternConverter;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/lang/StringBuffer;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(I)V

    iput-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    .line 74
    new-instance v0, Lorg/apache/log4j/helpers/FormattingInfo;

    invoke-direct {v0}, Lorg/apache/log4j/helpers/FormattingInfo;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    .line 79
    iput-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->pattern:Ljava/lang/String;

    .line 80
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lorg/apache/log4j/helpers/PatternParser;->patternLength:I

    const/4 p1, 0x0

    .line 81
    iput p1, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    return-void
.end method

.method private addToList(Lorg/apache/log4j/helpers/PatternConverter;)V
    .locals 1

    .line 86
    iget-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->head:Lorg/apache/log4j/helpers/PatternConverter;

    if-nez v0, :cond_0

    .line 87
    iput-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->tail:Lorg/apache/log4j/helpers/PatternConverter;

    iput-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->head:Lorg/apache/log4j/helpers/PatternConverter;

    goto :goto_0

    .line 89
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->tail:Lorg/apache/log4j/helpers/PatternConverter;

    iput-object p1, v0, Lorg/apache/log4j/helpers/PatternConverter;->next:Lorg/apache/log4j/helpers/PatternConverter;

    .line 90
    iput-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->tail:Lorg/apache/log4j/helpers/PatternConverter;

    :goto_0
    return-void
.end method

.method static synthetic class$(Ljava/lang/String;)Ljava/lang/Class;
    .locals 1

    .line 45
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    new-instance v0, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method protected addConverter(Lorg/apache/log4j/helpers/PatternConverter;)V
    .locals 2

    .line 370
    iget-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 372
    invoke-direct {p0, p1}, Lorg/apache/log4j/helpers/PatternParser;->addToList(Lorg/apache/log4j/helpers/PatternConverter;)V

    .line 374
    iput v1, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    .line 376
    iget-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    invoke-virtual {p1}, Lorg/apache/log4j/helpers/FormattingInfo;->reset()V

    return-void
.end method

.method protected extractOption()Ljava/lang/String;
    .locals 3

    .line 96
    iget v0, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    iget v1, p0, Lorg/apache/log4j/helpers/PatternParser;->patternLength:I

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->pattern:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_0

    .line 97
    iget-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->pattern:Ljava/lang/String;

    const/16 v1, 0x7d

    iget v2, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->indexOf(II)I

    move-result v0

    .line 98
    iget v1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    if-le v0, v1, :cond_0

    .line 99
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->pattern:Ljava/lang/String;

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v2, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    add-int/lit8 v0, v0, 0x1

    .line 100
    iput v0, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    return-object v1

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected extractPrecisionOption()I
    .locals 6

    .line 113
    invoke-virtual {p0}, Lorg/apache/log4j/helpers/PatternParser;->extractOption()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 117
    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    if-gtz v2, :cond_0

    .line 120
    :try_start_1
    new-instance v3, Ljava/lang/StringBuffer;

    const-string v4, "Precision option ("

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v4, ") isn\'t a positive integer."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 119
    invoke-static {v3}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    :cond_0
    move v1, v2

    goto :goto_1

    :catch_1
    move-exception v2

    move-object v5, v2

    move v2, v1

    move-object v1, v5

    .line 125
    :goto_0
    new-instance v3, Ljava/lang/StringBuffer;

    const-string v4, "Category option \""

    invoke-direct {v3, v4}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "\" not a decimal integer."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v1, v2

    :cond_1
    :goto_1
    return v1
.end method

.method protected finalizeConverter(C)V
    .locals 4

    const/4 v0, 0x0

    sparse-switch p1, :sswitch_data_0

    .line 359
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Unexpected char ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const-string p1, "] at position "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget p1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string p1, " in conversion patterrn."

    .line 360
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 359
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    .line 361
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;-><init>(Ljava/lang/String;)V

    .line 362
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    .line 349
    :sswitch_0
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x7d3

    invoke-direct {p1, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 351
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    .line 329
    :sswitch_1
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x7d1

    invoke-direct {p1, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 332
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    .line 322
    :sswitch_2
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x7d0

    invoke-direct {p1, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 326
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    .line 316
    :sswitch_3
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x7d2

    invoke-direct {p1, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 319
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    .line 303
    :sswitch_4
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x7d4

    invoke-direct {p1, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$BasicPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 306
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    .line 289
    :sswitch_5
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x3e8

    invoke-direct {p1, p0, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;-><init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 293
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto/16 :goto_2

    :sswitch_6
    const-string p1, "ISO8601"

    .line 251
    invoke-virtual {p0}, Lorg/apache/log4j/helpers/PatternParser;->extractOption()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    move-object p1, v1

    :cond_0
    const-string v1, "ISO8601"

    .line 255
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    new-instance p1, Lorg/apache/log4j/helpers/ISO8601DateFormat;

    invoke-direct {p1}, Lorg/apache/log4j/helpers/ISO8601DateFormat;-><init>()V

    goto :goto_1

    :cond_1
    const-string v1, "ABSOLUTE"

    .line 258
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 260
    new-instance p1, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;

    invoke-direct {p1}, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;-><init>()V

    goto :goto_1

    :cond_2
    const-string v1, "DATE"

    .line 261
    invoke-virtual {p1, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 263
    new-instance p1, Lorg/apache/log4j/helpers/DateTimeDateFormat;

    invoke-direct {p1}, Lorg/apache/log4j/helpers/DateTimeDateFormat;-><init>()V

    goto :goto_1

    .line 266
    :cond_3
    :try_start_0
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p1, v1

    goto :goto_1

    :catch_0
    move-exception v1

    .line 269
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Could not instantiate SimpleDateFormat with "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 270
    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 269
    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-string p1, "org.apache.log4j.helpers.ISO8601DateFormat"

    .line 273
    sget-object v1, Lorg/apache/log4j/helpers/PatternParser;->class$java$text$DateFormat:Ljava/lang/Class;

    if-eqz v1, :cond_4

    goto :goto_0

    :cond_4
    const-string v1, "java.text.DateFormat"

    invoke-static {v1}, Lorg/apache/log4j/helpers/PatternParser;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lorg/apache/log4j/helpers/PatternParser;->class$java$text$DateFormat:Ljava/lang/Class;

    :goto_0
    const/4 v2, 0x0

    .line 271
    invoke-static {p1, v1, v2}, Lorg/apache/log4j/helpers/OptionConverter;->instantiateByClassName(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/text/DateFormat;

    .line 276
    :goto_1
    new-instance v1, Lorg/apache/log4j/helpers/PatternParser$DatePatternConverter;

    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    invoke-direct {v1, v2, p1}, Lorg/apache/log4j/helpers/PatternParser$DatePatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;Ljava/text/DateFormat;)V

    .line 279
    iget-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    move-object p1, v1

    goto :goto_2

    .line 235
    :sswitch_7
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$CategoryPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    .line 236
    invoke-virtual {p0}, Lorg/apache/log4j/helpers/PatternParser;->extractPrecisionOption()I

    move-result v2

    .line 235
    invoke-direct {p1, p0, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$CategoryPatternConverter;-><init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 239
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_2

    .line 354
    :sswitch_8
    invoke-virtual {p0}, Lorg/apache/log4j/helpers/PatternParser;->extractOption()Ljava/lang/String;

    move-result-object p1

    .line 355
    new-instance v1, Lorg/apache/log4j/helpers/PatternParser$MDCPatternConverter;

    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    invoke-direct {v1, v2, p1}, Lorg/apache/log4j/helpers/PatternParser$MDCPatternConverter;-><init>(Lorg/apache/log4j/helpers/FormattingInfo;Ljava/lang/String;)V

    .line 356
    iget-object p1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    move-object p1, v1

    goto :goto_2

    .line 309
    :sswitch_9
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x3e9

    invoke-direct {p1, p0, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;-><init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 313
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_2

    .line 296
    :sswitch_a
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x3eb

    invoke-direct {p1, p0, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;-><init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 300
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_2

    .line 282
    :sswitch_b
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    const/16 v2, 0x3ec

    invoke-direct {p1, p0, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$LocationPatternConverter;-><init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 286
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    goto :goto_2

    .line 242
    :sswitch_c
    new-instance p1, Lorg/apache/log4j/helpers/PatternParser$ClassNamePatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    .line 243
    invoke-virtual {p0}, Lorg/apache/log4j/helpers/PatternParser;->extractPrecisionOption()I

    move-result v2

    .line 242
    invoke-direct {p1, p0, v1, v2}, Lorg/apache/log4j/helpers/PatternParser$ClassNamePatternConverter;-><init>(Lorg/apache/log4j/helpers/PatternParser;Lorg/apache/log4j/helpers/FormattingInfo;I)V

    .line 246
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 365
    :goto_2
    invoke-virtual {p0, p1}, Lorg/apache/log4j/helpers/PatternParser;->addConverter(Lorg/apache/log4j/helpers/PatternConverter;)V

    return-void

    :sswitch_data_0
    .sparse-switch
        0x43 -> :sswitch_c
        0x46 -> :sswitch_b
        0x4c -> :sswitch_a
        0x4d -> :sswitch_9
        0x58 -> :sswitch_8
        0x63 -> :sswitch_7
        0x64 -> :sswitch_6
        0x6c -> :sswitch_5
        0x6d -> :sswitch_4
        0x70 -> :sswitch_3
        0x72 -> :sswitch_2
        0x74 -> :sswitch_1
        0x78 -> :sswitch_0
    .end sparse-switch
.end method

.method public parse()Lorg/apache/log4j/helpers/PatternConverter;
    .locals 7

    const/4 v0, 0x0

    .line 134
    iput v0, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    .line 135
    :goto_0
    iget v1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    iget v2, p0, Lorg/apache/log4j/helpers/PatternParser;->patternLength:I

    if-lt v1, v2, :cond_1

    .line 223
    iget-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    new-instance v0, Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;

    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lorg/apache/log4j/helpers/PatternParser;->addToList(Lorg/apache/log4j/helpers/PatternConverter;)V

    .line 227
    :cond_0
    iget-object v0, p0, Lorg/apache/log4j/helpers/PatternParser;->head:Lorg/apache/log4j/helpers/PatternConverter;

    return-object v0

    .line 136
    :cond_1
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->pattern:Ljava/lang/String;

    add-int/lit8 v3, v1, 0x1

    iput v3, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 137
    iget v2, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    const/4 v3, 0x3

    const/16 v4, 0x39

    const/4 v5, 0x1

    const/16 v6, 0x30

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto :goto_0

    .line 213
    :pswitch_1
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    if-lt v1, v6, :cond_2

    if-gt v1, v4, :cond_2

    .line 215
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    iget v3, v2, Lorg/apache/log4j/helpers/FormattingInfo;->max:I

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v1, v1, -0x30

    add-int/2addr v3, v1

    iput v3, v2, Lorg/apache/log4j/helpers/FormattingInfo;->max:I

    goto :goto_0

    .line 217
    :cond_2
    invoke-virtual {p0, v1}, Lorg/apache/log4j/helpers/PatternParser;->finalizeConverter(C)V

    .line 218
    iput v0, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    goto :goto_0

    .line 191
    :pswitch_2
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    if-lt v1, v6, :cond_3

    if-gt v1, v4, :cond_3

    .line 193
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    iget v3, v2, Lorg/apache/log4j/helpers/FormattingInfo;->min:I

    mul-int/lit8 v3, v3, 0xa

    add-int/lit8 v1, v1, -0x30

    add-int/2addr v3, v1

    iput v3, v2, Lorg/apache/log4j/helpers/FormattingInfo;->min:I

    goto :goto_0

    :cond_3
    const/16 v2, 0x2e

    if-ne v1, v2, :cond_4

    .line 195
    iput v3, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    goto :goto_0

    .line 197
    :cond_4
    invoke-virtual {p0, v1}, Lorg/apache/log4j/helpers/PatternParser;->finalizeConverter(C)V

    goto :goto_0

    .line 201
    :pswitch_3
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    if-lt v1, v6, :cond_5

    if-gt v1, v4, :cond_5

    .line 203
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    add-int/lit8 v1, v1, -0x30

    iput v1, v2, Lorg/apache/log4j/helpers/FormattingInfo;->max:I

    const/4 v1, 0x5

    .line 204
    iput v1, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    goto/16 :goto_0

    .line 207
    :cond_5
    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "Error occured in position "

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v3, ".\n Was expecting digit, instead got char \""

    .line 208
    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    const-string v1, "\"."

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    .line 207
    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    .line 209
    iput v0, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    goto/16 :goto_0

    .line 173
    :pswitch_4
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    packed-switch v1, :pswitch_data_1

    if-lt v1, v6, :cond_6

    if-gt v1, v4, :cond_6

    .line 183
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    add-int/lit8 v1, v1, -0x30

    iput v1, v2, Lorg/apache/log4j/helpers/FormattingInfo;->min:I

    const/4 v1, 0x4

    .line 184
    iput v1, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    goto/16 :goto_0

    .line 179
    :pswitch_5
    iput v3, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    goto/16 :goto_0

    .line 176
    :pswitch_6
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    iput-boolean v5, v1, Lorg/apache/log4j/helpers/FormattingInfo;->leftAlign:Z

    goto/16 :goto_0

    .line 187
    :cond_6
    invoke-virtual {p0, v1}, Lorg/apache/log4j/helpers/PatternParser;->finalizeConverter(C)V

    goto/16 :goto_0

    .line 140
    :pswitch_7
    iget v2, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    iget v3, p0, Lorg/apache/log4j/helpers/PatternParser;->patternLength:I

    if-ne v2, v3, :cond_7

    .line 141
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_0

    :cond_7
    const/16 v3, 0x25

    if-ne v1, v3, :cond_b

    .line 146
    iget-object v4, p0, Lorg/apache/log4j/helpers/PatternParser;->pattern:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v3, :cond_a

    const/16 v3, 0x6e

    if-eq v2, v3, :cond_9

    .line 156
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    if-eqz v2, :cond_8

    .line 157
    new-instance v2, Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;

    .line 158
    iget-object v3, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    .line 157
    invoke-direct {v2, v3}, Lorg/apache/log4j/helpers/PatternParser$LiteralPatternConverter;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v2}, Lorg/apache/log4j/helpers/PatternParser;->addToList(Lorg/apache/log4j/helpers/PatternConverter;)V

    .line 162
    :cond_8
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->setLength(I)V

    .line 163
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 164
    iput v5, p0, Lorg/apache/log4j/helpers/PatternParser;->state:I

    .line 165
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->formattingInfo:Lorg/apache/log4j/helpers/FormattingInfo;

    invoke-virtual {v1}, Lorg/apache/log4j/helpers/FormattingInfo;->reset()V

    goto/16 :goto_0

    .line 152
    :cond_9
    iget-object v1, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    sget-object v2, Lorg/apache/log4j/Layout;->LINE_SEP:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 153
    iget v1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    add-int/2addr v1, v5

    iput v1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    goto/16 :goto_0

    .line 148
    :cond_a
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 149
    iget v1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    add-int/2addr v1, v5

    iput v1, p0, Lorg/apache/log4j/helpers/PatternParser;->i:I

    goto/16 :goto_0

    .line 169
    :cond_b
    iget-object v2, p0, Lorg/apache/log4j/helpers/PatternParser;->currentLiteral:Ljava/lang/StringBuffer;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto/16 :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2d
        :pswitch_6
        :pswitch_5
    .end packed-switch
.end method
