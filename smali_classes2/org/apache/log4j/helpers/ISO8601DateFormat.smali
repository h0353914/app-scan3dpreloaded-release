.class public Lorg/apache/log4j/helpers/ISO8601DateFormat;
.super Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;
.source "ISO8601DateFormat.java"


# static fields
.field private static lastTime:J

.field private static lastTimeString:[C


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x14

    .line 53
    new-array v0, v0, [C

    sput-object v0, Lorg/apache/log4j/helpers/ISO8601DateFormat;->lastTimeString:[C

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/TimeZone;)V
    .locals 0

    .line 49
    invoke-direct {p0, p1}, Lorg/apache/log4j/helpers/AbsoluteTimeDateFormat;-><init>(Ljava/util/TimeZone;)V

    return-void
.end method


# virtual methods
.method public format(Ljava/util/Date;Ljava/lang/StringBuffer;Ljava/text/FieldPosition;)Ljava/lang/StringBuffer;
    .locals 7

    .line 65
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    .line 66
    rem-long v2, v0, v2

    long-to-int p3, v2

    int-to-long v2, p3

    sub-long/2addr v0, v2

    .line 68
    sget-wide v2, Lorg/apache/log4j/helpers/ISO8601DateFormat;->lastTime:J

    cmp-long v2, v0, v2

    const/16 v3, 0xa

    const/16 v4, 0x30

    if-eqz v2, :cond_4

    .line 73
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    invoke-virtual {v2, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 75
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->length()I

    move-result p1

    .line 77
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    .line 78
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 81
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/4 v5, 0x2

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    packed-switch v2, :pswitch_data_0

    const-string v2, "-NA-"

    goto :goto_0

    :pswitch_0
    const-string v2, "-12-"

    goto :goto_0

    :pswitch_1
    const-string v2, "-11-"

    goto :goto_0

    :pswitch_2
    const-string v2, "-10-"

    goto :goto_0

    :pswitch_3
    const-string v2, "-09-"

    goto :goto_0

    :pswitch_4
    const-string v2, "-08-"

    goto :goto_0

    :pswitch_5
    const-string v2, "-07-"

    goto :goto_0

    :pswitch_6
    const-string v2, "-06-"

    goto :goto_0

    :pswitch_7
    const-string v2, "-05-"

    goto :goto_0

    :pswitch_8
    const-string v2, "-04-"

    goto :goto_0

    :pswitch_9
    const-string v2, "-03-"

    goto :goto_0

    :pswitch_a
    const-string v2, "-02-"

    goto :goto_0

    :pswitch_b
    const-string v2, "-01-"

    .line 96
    :goto_0
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/4 v5, 0x5

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ge v2, v3, :cond_0

    .line 100
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 101
    :cond_0
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const/16 v2, 0x20

    .line 103
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 105
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v5, 0xb

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ge v2, v3, :cond_1

    .line 107
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 109
    :cond_1
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const/16 v2, 0x3a

    .line 110
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 112
    iget-object v5, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v6, 0xc

    invoke-virtual {v5, v6}, Ljava/util/Calendar;->get(I)I

    move-result v5

    if-ge v5, v3, :cond_2

    .line 114
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 116
    :cond_2
    invoke-virtual {p2, v5}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 117
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 119
    iget-object v2, p0, Ljava/text/DateFormat;->calendar:Ljava/util/Calendar;

    const/16 v5, 0xd

    invoke-virtual {v2, v5}, Ljava/util/Calendar;->get(I)I

    move-result v2

    if-ge v2, v3, :cond_3

    .line 121
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 123
    :cond_3
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const/16 v2, 0x2c

    .line 125
    invoke-virtual {p2, v2}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 128
    invoke-virtual {p2}, Ljava/lang/StringBuffer;->length()I

    move-result v2

    sget-object v5, Lorg/apache/log4j/helpers/ISO8601DateFormat;->lastTimeString:[C

    const/4 v6, 0x0

    invoke-virtual {p2, p1, v2, v5, v6}, Ljava/lang/StringBuffer;->getChars(II[CI)V

    .line 129
    sput-wide v0, Lorg/apache/log4j/helpers/ISO8601DateFormat;->lastTime:J

    goto :goto_1

    .line 132
    :cond_4
    sget-object p1, Lorg/apache/log4j/helpers/ISO8601DateFormat;->lastTimeString:[C

    invoke-virtual {p2, p1}, Ljava/lang/StringBuffer;->append([C)Ljava/lang/StringBuffer;

    :goto_1
    const/16 p1, 0x64

    if-ge p3, p1, :cond_5

    .line 137
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    :cond_5
    if-ge p3, v3, :cond_6

    .line 139
    invoke-virtual {p2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 141
    :cond_6
    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    return-object p2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public parse(Ljava/lang/String;Ljava/text/ParsePosition;)Ljava/util/Date;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method
