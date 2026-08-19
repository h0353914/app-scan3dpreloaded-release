.class Lorg/apache/log4j/RollingCalendar;
.super Ljava/util/GregorianCalendar;
.source "DailyRollingFileAppender.java"


# instance fields
.field type:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 372
    invoke-direct {p0}, Ljava/util/GregorianCalendar;-><init>()V

    const/4 v0, -0x1

    .line 369
    iput v0, p0, Lorg/apache/log4j/RollingCalendar;->type:I

    return-void
.end method

.method constructor <init>(Ljava/util/TimeZone;Ljava/util/Locale;)V
    .locals 0

    .line 376
    invoke-direct {p0, p1, p2}, Ljava/util/GregorianCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    const/4 p1, -0x1

    .line 369
    iput p1, p0, Lorg/apache/log4j/RollingCalendar;->type:I

    return-void
.end method


# virtual methods
.method public getNextCheckDate(Ljava/util/Date;)Ljava/util/Date;
    .locals 7

    .line 388
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    .line 390
    iget p1, p0, Lorg/apache/log4j/RollingCalendar;->type:I

    const/4 v0, 0x5

    const/16 v1, 0xc

    const/16 v2, 0xe

    const/16 v3, 0xd

    const/16 v4, 0xb

    const/4 v5, 0x1

    const/4 v6, 0x0

    packed-switch p1, :pswitch_data_0

    .line 436
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Unknown periodicity type."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 429
    :pswitch_0
    invoke-virtual {p0, v0, v5}, Ljava/util/Calendar;->set(II)V

    .line 430
    invoke-virtual {p0, v4, v6}, Ljava/util/Calendar;->set(II)V

    .line 431
    invoke-virtual {p0, v3, v6}, Ljava/util/Calendar;->set(II)V

    .line 432
    invoke-virtual {p0, v2, v6}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x2

    .line 433
    invoke-virtual {p0, p1, v5}, Ljava/util/GregorianCalendar;->add(II)V

    goto :goto_0

    :pswitch_1
    const/4 p1, 0x7

    .line 422
    invoke-virtual {p0}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Ljava/util/Calendar;->set(II)V

    .line 423
    invoke-virtual {p0, v4, v6}, Ljava/util/Calendar;->set(II)V

    .line 424
    invoke-virtual {p0, v3, v6}, Ljava/util/Calendar;->set(II)V

    .line 425
    invoke-virtual {p0, v2, v6}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x3

    .line 426
    invoke-virtual {p0, p1, v5}, Ljava/util/GregorianCalendar;->add(II)V

    goto :goto_0

    .line 415
    :pswitch_2
    invoke-virtual {p0, v4, v6}, Ljava/util/Calendar;->set(II)V

    .line 416
    invoke-virtual {p0, v1, v6}, Ljava/util/Calendar;->set(II)V

    .line 417
    invoke-virtual {p0, v3, v6}, Ljava/util/Calendar;->set(II)V

    .line 418
    invoke-virtual {p0, v2, v6}, Ljava/util/Calendar;->set(II)V

    .line 419
    invoke-virtual {p0, v0, v5}, Ljava/util/GregorianCalendar;->add(II)V

    goto :goto_0

    .line 403
    :pswitch_3
    invoke-virtual {p0, v1, v6}, Ljava/util/Calendar;->set(II)V

    .line 404
    invoke-virtual {p0, v3, v6}, Ljava/util/Calendar;->set(II)V

    .line 405
    invoke-virtual {p0, v2, v6}, Ljava/util/Calendar;->set(II)V

    .line 406
    invoke-virtual {p0, v4}, Ljava/util/Calendar;->get(I)I

    move-result p1

    if-ge p1, v1, :cond_0

    .line 408
    invoke-virtual {p0, v4, v1}, Ljava/util/Calendar;->set(II)V

    goto :goto_0

    .line 410
    :cond_0
    invoke-virtual {p0, v4, v6}, Ljava/util/Calendar;->set(II)V

    .line 411
    invoke-virtual {p0, v0, v5}, Ljava/util/GregorianCalendar;->add(II)V

    goto :goto_0

    .line 397
    :pswitch_4
    invoke-virtual {p0, v1, v6}, Ljava/util/Calendar;->set(II)V

    .line 398
    invoke-virtual {p0, v3, v6}, Ljava/util/Calendar;->set(II)V

    .line 399
    invoke-virtual {p0, v2, v6}, Ljava/util/Calendar;->set(II)V

    .line 400
    invoke-virtual {p0, v4, v5}, Ljava/util/GregorianCalendar;->add(II)V

    goto :goto_0

    .line 392
    :pswitch_5
    invoke-virtual {p0, v3, v6}, Ljava/util/Calendar;->set(II)V

    .line 393
    invoke-virtual {p0, v2, v6}, Ljava/util/Calendar;->set(II)V

    .line 394
    invoke-virtual {p0, v1, v5}, Ljava/util/GregorianCalendar;->add(II)V

    .line 438
    :goto_0
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getNextCheckMillis(Ljava/util/Date;)J
    .locals 2

    .line 384
    invoke-virtual {p0, p1}, Lorg/apache/log4j/RollingCalendar;->getNextCheckDate(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    return-wide v0
.end method

.method setType(I)V
    .locals 0

    .line 380
    iput p1, p0, Lorg/apache/log4j/RollingCalendar;->type:I

    return-void
.end method
