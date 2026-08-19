.class public Lorg/apache/log4j/DailyRollingFileAppender;
.super Lorg/apache/log4j/FileAppender;
.source "DailyRollingFileAppender.java"


# static fields
.field static final HALF_DAY:I = 0x2

.field static final TOP_OF_DAY:I = 0x3

.field static final TOP_OF_HOUR:I = 0x1

.field static final TOP_OF_MINUTE:I = 0x0

.field static final TOP_OF_MONTH:I = 0x5

.field static final TOP_OF_TROUBLE:I = -0x1

.field static final TOP_OF_WEEK:I = 0x4

.field static final gmtTimeZone:Ljava/util/TimeZone;


# instance fields
.field checkPeriod:I

.field private datePattern:Ljava/lang/String;

.field private nextCheck:J

.field now:Ljava/util/Date;

.field rc:Lorg/apache/log4j/RollingCalendar;

.field private scheduledFilename:Ljava/lang/String;

.field sdf:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "GMT"

    .line 179
    invoke-static {v0}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v0

    sput-object v0, Lorg/apache/log4j/DailyRollingFileAppender;->gmtTimeZone:Ljava/util/TimeZone;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 184
    invoke-direct {p0}, Lorg/apache/log4j/FileAppender;-><init>()V

    const-string v0, "\'.\'yyyy-MM-dd"

    .line 152
    iput-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    .line 168
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->nextCheck:J

    .line 170
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->now:Ljava/util/Date;

    .line 174
    new-instance v0, Lorg/apache/log4j/RollingCalendar;

    invoke-direct {v0}, Lorg/apache/log4j/RollingCalendar;-><init>()V

    iput-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->rc:Lorg/apache/log4j/RollingCalendar;

    const/4 v0, -0x1

    .line 176
    iput v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->checkPeriod:I

    return-void
.end method

.method public constructor <init>(Lorg/apache/log4j/Layout;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 195
    invoke-direct {p0, p1, p2, v0}, Lorg/apache/log4j/FileAppender;-><init>(Lorg/apache/log4j/Layout;Ljava/lang/String;Z)V

    const-string p1, "\'.\'yyyy-MM-dd"

    .line 152
    iput-object p1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    .line 168
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    const-wide/16 v0, 0x1

    sub-long/2addr p1, v0

    iput-wide p1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->nextCheck:J

    .line 170
    new-instance p1, Ljava/util/Date;

    invoke-direct {p1}, Ljava/util/Date;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->now:Ljava/util/Date;

    .line 174
    new-instance p1, Lorg/apache/log4j/RollingCalendar;

    invoke-direct {p1}, Lorg/apache/log4j/RollingCalendar;-><init>()V

    iput-object p1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->rc:Lorg/apache/log4j/RollingCalendar;

    const/4 p1, -0x1

    .line 176
    iput p1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->checkPeriod:I

    .line 196
    iput-object p3, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    .line 197
    invoke-virtual {p0}, Lorg/apache/log4j/DailyRollingFileAppender;->activateOptions()V

    return-void
.end method


# virtual methods
.method public activateOptions()V
    .locals 6

    .line 215
    invoke-super {p0}, Lorg/apache/log4j/FileAppender;->activateOptions()V

    .line 216
    iget-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 217
    iget-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->now:Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/util/Date;->setTime(J)V

    .line 218
    new-instance v0, Ljava/text/SimpleDateFormat;

    iget-object v1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->sdf:Ljava/text/SimpleDateFormat;

    .line 219
    invoke-virtual {p0}, Lorg/apache/log4j/DailyRollingFileAppender;->computeCheckPeriod()I

    move-result v0

    .line 220
    invoke-virtual {p0, v0}, Lorg/apache/log4j/DailyRollingFileAppender;->printPeriodicity(I)V

    .line 221
    iget-object v1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->rc:Lorg/apache/log4j/RollingCalendar;

    invoke-virtual {v1, v0}, Lorg/apache/log4j/RollingCalendar;->setType(I)V

    .line 222
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 223
    new-instance v1, Ljava/lang/StringBuffer;

    iget-object v2, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->sdf:Ljava/text/SimpleDateFormat;

    new-instance v3, Ljava/util/Date;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->scheduledFilename:Ljava/lang/String;

    goto :goto_0

    .line 226
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "Either File or DatePattern options are not set for appender ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 227
    iget-object v1, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "]."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 226
    invoke-static {v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method computeCheckPeriod()I
    .locals 8

    .line 272
    new-instance v0, Lorg/apache/log4j/RollingCalendar;

    sget-object v1, Lorg/apache/log4j/DailyRollingFileAppender;->gmtTimeZone:Ljava/util/TimeZone;

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Lorg/apache/log4j/RollingCalendar;-><init>(Ljava/util/TimeZone;Ljava/util/Locale;)V

    .line 274
    new-instance v1, Ljava/util/Date;

    const-wide/16 v2, 0x0

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 275
    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    if-eqz v2, :cond_2

    const/4 v2, 0x0

    :goto_0
    const/4 v3, 0x5

    if-le v2, v3, :cond_0

    goto :goto_1

    .line 277
    :cond_0
    new-instance v3, Ljava/text/SimpleDateFormat;

    iget-object v4, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 278
    sget-object v4, Lorg/apache/log4j/DailyRollingFileAppender;->gmtTimeZone:Ljava/util/TimeZone;

    invoke-virtual {v3, v4}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 279
    invoke-virtual {v3, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    .line 280
    invoke-virtual {v0, v2}, Lorg/apache/log4j/RollingCalendar;->setType(I)V

    .line 281
    new-instance v5, Ljava/util/Date;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/RollingCalendar;->getNextCheckMillis(Ljava/util/Date;)J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Ljava/util/Date;-><init>(J)V

    .line 282
    invoke-virtual {v3, v5}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    if-eqz v4, :cond_1

    if-eqz v3, :cond_1

    .line 284
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    return v2

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v0, -0x1

    return v0
.end method

.method public getDatePattern()Ljava/lang/String;
    .locals 1

    .line 211
    iget-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    return-object v0
.end method

.method printPeriodicity(I)V
    .locals 1

    packed-switch p1, :pswitch_data_0

    .line 257
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Unknown periodicity for appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "]."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->warn(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 253
    :pswitch_0
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "] to be rolled at start of every month."

    .line 254
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 253
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 249
    :pswitch_1
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "] to be rolled at start of week."

    .line 250
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 249
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 245
    :pswitch_2
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "] to be rolled at midnight."

    .line 246
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 245
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 241
    :pswitch_3
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "] to be rolled at midday and midnight."

    .line 242
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 241
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 237
    :pswitch_4
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "] to be rolled on top of every hour."

    .line 238
    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 237
    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 234
    :pswitch_5
    new-instance p1, Ljava/lang/StringBuffer;

    const-string v0, "Appender ["

    invoke-direct {p1, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v0, "] to be rolled every minute."

    invoke-virtual {p1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    :goto_0
    return-void

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

.method rollOver()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 298
    iget-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 299
    iget-object v0, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    const-string v1, "Missing DatePattern option in rollOver()."

    invoke-interface {v0, v1}, Lorg/apache/log4j/spi/ErrorHandler;->error(Ljava/lang/String;)V

    return-void

    .line 303
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->sdf:Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->now:Ljava/util/Date;

    invoke-virtual {v1, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 307
    iget-object v1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->scheduledFilename:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    .line 312
    :cond_1
    invoke-virtual {p0}, Lorg/apache/log4j/FileAppender;->closeFile()V

    .line 314
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->scheduledFilename:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 315
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 316
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 319
    :cond_2
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 320
    invoke-virtual {v2, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 322
    new-instance v1, Ljava/lang/StringBuffer;

    iget-object v2, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    const-string v2, " -> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->scheduledFilename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 324
    :cond_3
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Failed to rename ["

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "] to ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->scheduledFilename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v2, "]."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;)V

    .line 330
    :goto_0
    :try_start_0
    iget-object v1, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    const/4 v2, 0x0

    iget-boolean v3, p0, Lorg/apache/log4j/FileAppender;->bufferedIO:Z

    iget v4, p0, Lorg/apache/log4j/FileAppender;->bufferSize:I

    invoke-virtual {p0, v1, v2, v3, v4}, Lorg/apache/log4j/FileAppender;->setFile(Ljava/lang/String;ZZI)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 333
    :catch_0
    iget-object v1, p0, Lorg/apache/log4j/AppenderSkeleton;->errorHandler:Lorg/apache/log4j/spi/ErrorHandler;

    new-instance v2, Ljava/lang/StringBuffer;

    const-string v3, "setFile("

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    iget-object v3, p0, Lorg/apache/log4j/FileAppender;->fileName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, ", false) call failed."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/log4j/spi/ErrorHandler;->error(Ljava/lang/String;)V

    .line 335
    :goto_1
    iput-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->scheduledFilename:Ljava/lang/String;

    return-void
.end method

.method public setDatePattern(Ljava/lang/String;)V
    .locals 0

    .line 206
    iput-object p1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->datePattern:Ljava/lang/String;

    return-void
.end method

.method protected subAppend(Lorg/apache/log4j/spi/LoggingEvent;)V
    .locals 4

    .line 347
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 348
    iget-wide v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->nextCheck:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    .line 349
    iget-object v2, p0, Lorg/apache/log4j/DailyRollingFileAppender;->now:Ljava/util/Date;

    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 350
    iget-object v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->rc:Lorg/apache/log4j/RollingCalendar;

    iget-object v1, p0, Lorg/apache/log4j/DailyRollingFileAppender;->now:Ljava/util/Date;

    invoke-virtual {v0, v1}, Lorg/apache/log4j/RollingCalendar;->getNextCheckMillis(Ljava/util/Date;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/apache/log4j/DailyRollingFileAppender;->nextCheck:J

    .line 352
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log4j/DailyRollingFileAppender;->rollOver()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "rollOver() failed."

    .line 355
    invoke-static {v1, v0}, Lorg/apache/log4j/helpers/LogLog;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 358
    :cond_0
    :goto_0
    invoke-super {p0, p1}, Lorg/apache/log4j/WriterAppender;->subAppend(Lorg/apache/log4j/spi/LoggingEvent;)V

    return-void
.end method
