.class public Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;
.super Ljava/text/DateFormat;
.source "AbsoluteTimeDateFormat.java"


# static fields
.field public static final ABS_TIME_DATE_FORMAT:Ljava/lang/String; = "ABSOLUTE"

.field public static final DATE_AND_TIME_DATE_FORMAT:Ljava/lang/String; = "DATE"

.field public static final ISO8601_DATE_FORMAT:Ljava/lang/String; = "ISO8601"

.field private static previousTime:J

.field private static previousTimeWithoutMillis:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    .line 69
    new-array v0, v0, [C

    sput-object v0, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;->previousTimeWithoutMillis:[C

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/text/DateFormat;-><init>()V

    .line 60
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->setCalendar(Ljava/util/Calendar;)V

    return-void
.end method

.method public constructor <init>(Ljava/util/TimeZone;)V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/text/DateFormat;-><init>()V

    .line 65
    invoke-static {p1}, Ljava/util/Calendar;->getInstance(Ljava/util/TimeZone;)Ljava/util/Calendar;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->setCalendar(Ljava/util/Calendar;)V

    return-void
.end method


# virtual methods
.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .locals 7

    .line 83
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    .line 84
    rem-long v2, v0, v2

    long-to-int p3, v2

    int-to-long v2, p3

    sub-long/2addr v0, v2

    .line 86
    sget-wide v2, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;->previousTime:J

    cmp-long v2, v0, v2

    const/16 v3, 0xa

    const/16 v4, 0x30

    if-eqz v2, :cond_3

    .line 91
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    invoke-virtual {v2, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 93
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->length()I

    move-result p1

    .line 95
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v5, 0xb

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ge v2, v3, :cond_0

    .line 97
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 99
    :cond_0
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const/16 v2, 0x3a

    .line 100
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 102
    iget-object v5, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v6, 0xc

    invoke-virtual {v5, v6}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ge v5, v3, :cond_1

    .line 104
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 106
    :cond_1
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 107
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 109
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v5, 0xd

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ge v2, v3, :cond_2

    .line 111
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 113
    :cond_2
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const/16 v2, 0x2c

    .line 114
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 117
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    sget-object v5, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;->previousTimeWithoutMillis:[C

    const/4 v6, 0x0

    invoke-virtual {p2, p1, v2, v5, v6}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 119
    sput-wide v0, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;->previousTime:J

    goto :goto_0

    .line 122
    :cond_3
    sget-object p1, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;->previousTimeWithoutMillis:[C

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    :goto_0
    const/16 p1, 0x64

    if-ge p3, p1, :cond_4

    .line 128
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_4
    if-ge p3, v3, :cond_5

    .line 130
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 132
    :cond_5
    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    return-object p2
.end method

.method public parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
