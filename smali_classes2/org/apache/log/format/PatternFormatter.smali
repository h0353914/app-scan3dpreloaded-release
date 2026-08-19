.class public Lorg/apache/log/format/PatternFormatter;
.super Ljava/lang/Object;
.source "PatternFormatter.java"

# interfaces
.implements Lorg/apache/log/format/Formatter;
.implements Lorg/apache/log/Formatter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/log/format/PatternFormatter$PatternRun;
    }
.end annotation


# static fields
.field private static final EOL:Ljava/lang/String;

.field protected static final MAX_TYPE:I = 0x8

.field private static final SPACE_1:Ljava/lang/String; = " "

.field private static final SPACE_16:Ljava/lang/String; = "                "

.field private static final SPACE_2:Ljava/lang/String; = "  "

.field private static final SPACE_4:Ljava/lang/String; = "    "

.field private static final SPACE_8:Ljava/lang/String; = "        "

.field private static final TYPE_CATEGORY:I = 0x2

.field private static final TYPE_CATEGORY_STR:Ljava/lang/String; = "category"

.field private static final TYPE_CONTEXT:I = 0x3

.field private static final TYPE_CONTEXT_STR:Ljava/lang/String; = "context"

.field private static final TYPE_MESSAGE:I = 0x4

.field private static final TYPE_MESSAGE_STR:Ljava/lang/String; = "message"

.field private static final TYPE_PRIORITY:I = 0x8

.field private static final TYPE_PRIORITY_STR:Ljava/lang/String; = "priority"

.field private static final TYPE_RELATIVE_TIME:I = 0x6

.field private static final TYPE_RELATIVE_TIME_STR:Ljava/lang/String; = "rtime"

.field private static final TYPE_TEXT:I = 0x1

.field private static final TYPE_THROWABLE:I = 0x7

.field private static final TYPE_THROWABLE_STR:Ljava/lang/String; = "throwable"

.field private static final TYPE_TIME:I = 0x5

.field private static final TYPE_TIME_STR:Ljava/lang/String; = "time"


# instance fields
.field private final m_date:Ljava/util/Date;

.field private m_formatSpecification:[Lorg/apache/log/format/PatternFormatter$PatternRun;

.field private m_simpleDateFormat:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "line.separator"

    const-string v1, "\n"

    .line 110
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/log/format/PatternFormatter;->EOL:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 132
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lorg/apache/log/format/PatternFormatter;->m_date:Ljava/util/Date;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 136
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 125
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lorg/apache/log/format/PatternFormatter;->m_date:Ljava/util/Date;

    .line 137
    invoke-virtual {p0, p1}, Lorg/apache/log/format/PatternFormatter;->parse(Ljava/lang/String;)V

    return-void
.end method

.method private addPatternRun(Ljava/util/Stack;[CI)I
    .locals 9

    .line 152
    new-instance v0, Lorg/apache/log/format/PatternFormatter$PatternRun;

    invoke-direct {v0}, Lorg/apache/log/format/PatternFormatter$PatternRun;-><init>()V

    add-int/lit8 v1, p3, 0x1

    .line 156
    aget-char v2, p2, v1

    const/4 v3, 0x1

    const/16 v4, 0x2b

    if-ne v4, v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    const/16 v2, 0x2d

    .line 157
    aget-char v4, p2, v1

    if-ne v2, v4, :cond_1

    .line 159
    iput-boolean v3, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_rightJustify:Z

    add-int/lit8 v1, v1, 0x1

    .line 163
    :cond_1
    :goto_0
    aget-char v2, p2, v1

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_3

    move v2, v4

    .line 166
    :goto_1
    aget-char v5, p2, v1

    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v5

    if-nez v5, :cond_2

    .line 171
    iput v2, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_minSize:I

    goto :goto_2

    :cond_2
    mul-int/lit8 v2, v2, 0xa

    .line 168
    aget-char v5, p2, v1

    add-int/lit8 v5, v5, -0x30

    add-int/2addr v2, v5

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 175
    :cond_3
    :goto_2
    array-length v2, p2

    if-ge v1, v2, :cond_5

    const/16 v2, 0x2e

    aget-char v5, p2, v1

    if-ne v2, v5, :cond_5

    add-int/lit8 v1, v1, 0x1

    .line 179
    aget-char v2, p2, v1

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 182
    :goto_3
    aget-char v2, p2, v1

    invoke-static {v2}, Ljava/lang/Character;->isDigit(C)Z

    move-result v2

    if-nez v2, :cond_4

    .line 187
    iput v4, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_maxSize:I

    goto :goto_4

    :cond_4
    mul-int/lit8 v4, v4, 0xa

    .line 184
    aget-char v2, p2, v1

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v4, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 191
    :cond_5
    :goto_4
    array-length v2, p2

    if-ge v1, v2, :cond_c

    const/16 v2, 0x7b

    aget-char v4, p2, v1

    if-ne v2, v4, :cond_c

    move v2, v1

    .line 201
    :goto_5
    array-length v4, p2

    const/16 v5, 0x3a

    const/16 v6, 0x7d

    if-ge v2, v4, :cond_7

    aget-char v4, p2, v2

    if-eq v4, v5, :cond_7

    aget-char v4, p2, v2

    if-ne v4, v6, :cond_6

    goto :goto_6

    :cond_6
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_7
    :goto_6
    add-int/lit8 v4, v2, -0x1

    .line 208
    new-instance v7, Ljava/lang/String;

    add-int/lit8 v8, v1, 0x1

    sub-int v1, v4, v1

    invoke-direct {v7, p2, v8, v1}, Ljava/lang/String;-><init>([CII)V

    .line 211
    invoke-virtual {p0, v7}, Lorg/apache/log/format/PatternFormatter;->getTypeIdFor(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    .line 213
    array-length v1, p2

    if-ge v2, v1, :cond_a

    aget-char v1, p2, v2

    if-ne v1, v5, :cond_a

    add-int/lit8 v2, v2, 0x1

    .line 216
    :goto_7
    array-length v1, p2

    if-ge v2, v1, :cond_9

    aget-char v1, p2, v2

    if-ne v1, v6, :cond_8

    goto :goto_8

    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_9
    :goto_8
    sub-int v1, v2, v4

    add-int/lit8 v1, v1, -0x2

    if-eqz v1, :cond_a

    .line 222
    new-instance v5, Ljava/lang/String;

    add-int/lit8 v4, v4, 0x2

    invoke-direct {v5, p2, v4, v1}, Ljava/lang/String;-><init>([CII)V

    iput-object v5, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    .line 226
    :cond_a
    array-length v1, p2

    if-ge v2, v1, :cond_b

    aget-char p2, p2, v2

    if-ne v6, p2, :cond_b

    add-int/2addr v2, v3

    .line 235
    invoke-virtual {p1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    sub-int/2addr v2, p3

    return v2

    .line 228
    :cond_b
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuffer;

    invoke-direct {p2}, Ljava/lang/StringBuffer;-><init>()V

    const-string p3, "Unterminated type in pattern at character "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 193
    :cond_c
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuffer;

    invoke-direct {p2}, Ljava/lang/StringBuffer;-><init>()V

    const-string p3, "Badly formed pattern at character "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private addTextRun(Ljava/util/Stack;[CI)I
    .locals 9

    .line 254
    new-instance v0, Lorg/apache/log/format/PatternFormatter$PatternRun;

    invoke-direct {v0}, Lorg/apache/log/format/PatternFormatter$PatternRun;-><init>()V

    .line 258
    aget-char v1, p2, p3

    const/16 v2, 0x25

    if-ne v2, v1, :cond_0

    add-int/lit8 v1, p3, 0x1

    goto :goto_0

    :cond_0
    move v1, p3

    .line 260
    :goto_0
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v4, 0x0

    move v5, v4

    .line 262
    :goto_1
    array-length v6, p2

    const/4 v7, 0x1

    if-ge v1, v6, :cond_6

    aget-char v6, p2, v1

    if-ne v6, v2, :cond_1

    goto :goto_4

    :cond_1
    if-eqz v5, :cond_4

    const/16 v5, 0x6e

    .line 266
    aget-char v6, p2, v1

    if-ne v5, v6, :cond_2

    sget-object v5, Lorg/apache/log/format/PatternFormatter;->EOL:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_2

    :cond_2
    const/16 v5, 0x74

    .line 267
    aget-char v6, p2, v1

    if-ne v5, v6, :cond_3

    const/16 v5, 0x9

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_2

    .line 268
    :cond_3
    aget-char v5, p2, v1

    invoke-virtual {v3, v5}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :goto_2
    move v5, v4

    goto :goto_3

    :cond_4
    const/16 v6, 0x5c

    .line 271
    aget-char v8, p2, v1

    if-ne v6, v8, :cond_5

    move v5, v7

    goto :goto_3

    .line 272
    :cond_5
    aget-char v6, p2, v1

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 276
    :cond_6
    :goto_4
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_data:Ljava/lang/String;

    .line 277
    iput v7, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    .line 279
    invoke-virtual {p1, v0}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    sub-int/2addr v1, p3

    return v1
.end method

.method private append(Ljava/lang/StringBuffer;IIZLjava/lang/String;)V
    .locals 1

    .line 299
    invoke-virtual {p5}, Ljava/lang/String;->length()I

    move-result v0

    if-ge v0, p2, :cond_1

    if-eqz p4, :cond_0

    sub-int/2addr p2, v0

    .line 306
    invoke-direct {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->appendWhiteSpace(Ljava/lang/StringBuffer;I)V

    .line 307
    invoke-virtual {p1, p5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 311
    :cond_0
    invoke-virtual {p1, p5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    sub-int/2addr p2, v0

    .line 312
    invoke-direct {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->appendWhiteSpace(Ljava/lang/StringBuffer;I)V

    goto :goto_0

    :cond_1
    if-lez p3, :cond_3

    if-ge p3, v0, :cond_3

    if-eqz p4, :cond_2

    sub-int/2addr v0, p3

    .line 319
    invoke-virtual {p5, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    :cond_2
    const/4 p2, 0x0

    .line 323
    invoke-virtual {p5, p2, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 328
    :cond_3
    invoke-virtual {p1, p5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :goto_0
    return-void
.end method

.method private appendWhiteSpace(Ljava/lang/StringBuffer;I)V
    .locals 1

    :goto_0
    const/16 v0, 0x10

    if-ge p2, v0, :cond_4

    const/16 v0, 0x8

    if-lt p2, v0, :cond_0

    const-string v0, "        "

    .line 348
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 p2, p2, -0x8

    :cond_0
    const/4 v0, 0x4

    if-lt p2, v0, :cond_1

    const-string v0, "    "

    .line 354
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 p2, p2, -0x4

    :cond_1
    const/4 v0, 0x2

    if-lt p2, v0, :cond_2

    const-string v0, "  "

    .line 360
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 p2, p2, -0x2

    :cond_2
    const/4 v0, 0x1

    if-lt p2, v0, :cond_3

    const-string p2, " "

    .line 366
    invoke-virtual {p1, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    :cond_3
    return-void

    :cond_4
    const-string v0, "                "

    .line 342
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 p2, p2, -0x10

    goto :goto_0
.end method


# virtual methods
.method public format(Lorg/apache/log/LogEvent;)Ljava/lang/String;
    .locals 8

    .line 379
    new-instance v6, Ljava/lang/StringBuffer;

    invoke-direct {v6}, Ljava/lang/StringBuffer;-><init>()V

    const/4 v0, 0x0

    move v7, v0

    .line 381
    :goto_0
    iget-object v0, p0, Lorg/apache/log/format/PatternFormatter;->m_formatSpecification:[Lorg/apache/log/format/PatternFormatter$PatternRun;

    array-length v1, v0

    if-lt v7, v1, :cond_0

    .line 401
    invoke-virtual {v6}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 383
    :cond_0
    aget-object v0, v0, v7

    .line 386
    iget v1, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 388
    iget-object v0, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_data:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_1

    .line 392
    :cond_1
    invoke-virtual {p0, p1, v0}, Lorg/apache/log/format/PatternFormatter;->formatPatternRun(Lorg/apache/log/LogEvent;Lorg/apache/log/format/PatternFormatter$PatternRun;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 396
    iget v2, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_minSize:I

    iget v3, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_maxSize:I

    iget-boolean v4, v0, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_rightJustify:Z

    move-object v0, p0

    move-object v1, v6

    invoke-direct/range {v0 .. v5}, Lorg/apache/log/format/PatternFormatter;->append(Ljava/lang/StringBuffer;IIZLjava/lang/String;)V

    :cond_2
    :goto_1
    add-int/lit8 v7, v7, 0x1

    goto :goto_0
.end method

.method protected formatPatternRun(Lorg/apache/log/LogEvent;Lorg/apache/log/format/PatternFormatter$PatternRun;)Ljava/lang/String;
    .locals 2

    .line 412
    iget v0, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    packed-switch v0, :pswitch_data_0

    .line 435
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "Unknown Pattern specification."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_type:I

    invoke-virtual {v0, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 419
    :pswitch_0
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p1

    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getPriority(Lorg/apache/log/Priority;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 416
    :pswitch_1
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getThrowable()Ljava/lang/Throwable;

    move-result-object p1

    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getStackTrace(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 414
    :pswitch_2
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getRelativeTime()J

    move-result-wide v0

    iget-object p1, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, v0, v1, p1}, Lorg/apache/log/format/PatternFormatter;->getRTime(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 415
    :pswitch_3
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getTime()J

    move-result-wide v0

    iget-object p1, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, v0, v1, p1}, Lorg/apache/log/format/PatternFormatter;->getTime(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 417
    :pswitch_4
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 422
    :pswitch_5
    iget-object v0, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    const-string v1, "stack"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 431
    :cond_0
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getContextMap()Lorg/apache/log/ContextMap;

    move-result-object p1

    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getContextMap(Lorg/apache/log/ContextMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 427
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getContextStack()Lorg/apache/log/ContextStack;

    move-result-object p1

    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getContext(Lorg/apache/log/ContextStack;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 418
    :pswitch_6
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getCategory()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p2, Lorg/apache/log/format/PatternFormatter$PatternRun;->m_format:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getCategory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getCategory(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    return-object p1
.end method

.method protected getContext(Lorg/apache/log/ContextStack;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 469
    invoke-virtual {p0, p1, p2}, Lorg/apache/log/format/PatternFormatter;->getContextStack(Lorg/apache/log/ContextStack;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getContextMap(Lorg/apache/log/ContextMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    const-string v0, ""

    .line 495
    invoke-virtual {p1, p2, v0}, Lorg/apache/log/ContextMap;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getContextStack(Lorg/apache/log/ContextStack;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    const p2, 0x7fffffff

    .line 482
    invoke-virtual {p1, p2}, Lorg/apache/log/ContextStack;->toString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getMessage(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    return-object p1
.end method

.method protected getPriority(Lorg/apache/log/Priority;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 456
    invoke-virtual {p1}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getRTime(JLjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 534
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/log/format/PatternFormatter;->getTime(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getStackTrace(Ljava/lang/Throwable;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    .line 520
    :cond_0
    new-instance p2, Ljava/io/StringWriter;

    invoke-direct {p2}, Ljava/io/StringWriter;-><init>()V

    .line 521
    new-instance v0, Ljava/io/PrintWriter;

    invoke-direct {v0, p2}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 522
    invoke-virtual {p2}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getTime(JLjava/lang/String;)Ljava/lang/String;
    .locals 2

    if-nez p3, :cond_0

    .line 548
    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 552
    :cond_0
    iget-object v0, p0, Lorg/apache/log/format/PatternFormatter;->m_date:Ljava/util/Date;

    monitor-enter v0

    .line 554
    :try_start_0
    iget-object v1, p0, Lorg/apache/log/format/PatternFormatter;->m_simpleDateFormat:Ljava/text/SimpleDateFormat;

    if-nez v1, :cond_1

    .line 556
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lorg/apache/log/format/PatternFormatter;->m_simpleDateFormat:Ljava/text/SimpleDateFormat;

    .line 558
    :cond_1
    iget-object p3, p0, Lorg/apache/log/format/PatternFormatter;->m_date:Ljava/util/Date;

    invoke-virtual {p3, p1, p2}, Ljava/util/Date;->setTime(J)V

    .line 559
    iget-object p1, p0, Lorg/apache/log/format/PatternFormatter;->m_simpleDateFormat:Ljava/text/SimpleDateFormat;

    iget-object p2, p0, Lorg/apache/log/format/PatternFormatter;->m_date:Ljava/util/Date;

    invoke-virtual {p1, p2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :catchall_0
    move-exception p1

    .line 560
    monitor-exit v0

    throw p1
.end method

.method protected getTypeIdFor(Ljava/lang/String;)I
    .locals 3

    const-string v0, "category"

    .line 572
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x2

    return p1

    :cond_0
    const-string v0, "context"

    .line 573
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x3

    return p1

    :cond_1
    const-string v0, "message"

    .line 574
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x4

    return p1

    :cond_2
    const-string v0, "priority"

    .line 575
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/16 p1, 0x8

    return p1

    :cond_3
    const-string v0, "time"

    .line 576
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 p1, 0x5

    return p1

    :cond_4
    const-string v0, "rtime"

    .line 577
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    const/4 p1, 0x6

    return p1

    :cond_5
    const-string v0, "throwable"

    .line 578
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const/4 p1, 0x7

    return p1

    .line 584
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unknown Type in pattern - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final parse(Ljava/lang/String;)V
    .locals 6

    .line 596
    new-instance v0, Ljava/util/Stack;

    invoke-direct {v0}, Ljava/util/Stack;-><init>()V

    .line 597
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    .line 598
    new-array v2, v1, [C

    const/4 v3, 0x0

    .line 601
    invoke-virtual {p1, v3, v1, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    move p1, v3

    :goto_0
    if-lt p1, v1, :cond_1

    .line 616
    invoke-virtual {v0}, Ljava/util/Stack;->size()I

    move-result v4

    .line 618
    new-array p1, v4, [Lorg/apache/log/format/PatternFormatter$PatternRun;

    iput-object p1, p0, Lorg/apache/log/format/PatternFormatter;->m_formatSpecification:[Lorg/apache/log/format/PatternFormatter$PatternRun;

    :goto_1
    if-lt v3, v4, :cond_0

    return-void

    .line 622
    :cond_0
    iget-object p1, p0, Lorg/apache/log/format/PatternFormatter;->m_formatSpecification:[Lorg/apache/log/format/PatternFormatter$PatternRun;

    invoke-virtual {v0, v3}, Ljava/util/Stack;->elementAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/apache/log/format/PatternFormatter$PatternRun;

    aput-object v1, p1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 605
    :cond_1
    aget-char v4, v2, p1

    const/16 v5, 0x25

    if-ne v4, v5, :cond_3

    add-int/lit8 v4, v1, -0x1

    if-eq p1, v4, :cond_2

    add-int/lit8 v4, p1, 0x1

    aget-char v4, v2, v4

    if-eq v4, v5, :cond_3

    .line 608
    :cond_2
    invoke-direct {p0, v0, v2, p1}, Lorg/apache/log/format/PatternFormatter;->addPatternRun(Ljava/util/Stack;[CI)I

    move-result v4

    add-int/2addr p1, v4

    goto :goto_0

    .line 612
    :cond_3
    invoke-direct {p0, v0, v2, p1}, Lorg/apache/log/format/PatternFormatter;->addTextRun(Ljava/util/Stack;[CI)I

    move-result v4

    add-int/2addr p1, v4

    goto :goto_0
.end method

.method public setFormat(Ljava/lang/String;)V
    .locals 0

    .line 634
    invoke-virtual {p0, p1}, Lorg/apache/log/format/PatternFormatter;->parse(Ljava/lang/String;)V

    return-void
.end method
