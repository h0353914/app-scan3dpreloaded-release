.class public Lcom/dd/plist/NSDate;
.super Lcom/dd/plist/NSObject;
.source "NSDate.java"


# static fields
.field private static final EPOCH:J = 0xe3c7a73400L

.field private static final sdfDefault:Ljava/text/SimpleDateFormat;

.field private static final sdfGnuStep:Ljava/text/SimpleDateFormat;


# instance fields
.field private date:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss\'Z\'"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/dd/plist/NSDate;->sdfDefault:Ljava/text/SimpleDateFormat;

    .line 47
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss Z"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/dd/plist/NSDate;->sdfGnuStep:Ljava/text/SimpleDateFormat;

    .line 50
    sget-object v0, Lcom/dd/plist/NSDate;->sdfDefault:Ljava/text/SimpleDateFormat;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 51
    sget-object v0, Lcom/dd/plist/NSDate;->sdfGnuStep:Ljava/text/SimpleDateFormat;

    const-string v1, "GMT"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    .line 111
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 112
    invoke-static {p1}, Lcom/dd/plist/NSDate;->parseDateString(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    return-void
.end method

.method public constructor <init>(Ljava/util/Date;)V
    .locals 1

    .line 120
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    if-eqz p1, :cond_0

    .line 123
    iput-object p1, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    return-void

    .line 122
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Date cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>([B)V
    .locals 5

    .line 99
    invoke-direct {p0}, Lcom/dd/plist/NSObject;-><init>()V

    .line 101
    new-instance v0, Ljava/util/Date;

    invoke-static {p1}, Lcom/dd/plist/BinaryPropertyListParser;->parseDouble([B)D

    move-result-wide v1

    const-wide v3, 0x408f400000000000L    # 1000.0

    mul-double/2addr v1, v3

    double-to-long v1, v1

    const-wide v3, 0xe3c7a73400L

    add-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    return-void
.end method

.method private static declared-synchronized makeDateString(Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    const-class v0, Lcom/dd/plist/NSDate;

    monitor-enter v0

    .line 79
    :try_start_0
    sget-object v1, Lcom/dd/plist/NSDate;->sdfDefault:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized makeDateStringGnuStep(Ljava/util/Date;)Ljava/lang/String;
    .locals 2

    const-class v0, Lcom/dd/plist/NSDate;

    monitor-enter v0

    .line 91
    :try_start_0
    sget-object v1, Lcom/dd/plist/NSDate;->sdfGnuStep:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized parseDateString(Ljava/lang/String;)Ljava/util/Date;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/text/ParseException;
        }
    .end annotation

    const-class v0, Lcom/dd/plist/NSDate;

    monitor-enter v0

    .line 65
    :try_start_0
    sget-object v1, Lcom/dd/plist/NSDate;->sdfDefault:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 67
    :catch_0
    :try_start_1
    sget-object v1, Lcom/dd/plist/NSDate;->sdfGnuStep:Ljava/text/SimpleDateFormat;

    invoke-virtual {v1, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object p0

    :goto_0
    monitor-exit v0

    throw p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 137
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    check-cast p1, Lcom/dd/plist/NSDate;

    invoke-virtual {p1}, Lcom/dd/plist/NSDate;->getDate()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 142
    iget-object v0, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->hashCode()I

    move-result v0

    return v0
.end method

.method protected toASCII(Ljava/lang/StringBuilder;I)V
    .locals 0

    .line 172
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSDate;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "\""

    .line 173
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    iget-object p2, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    invoke-static {p2}, Lcom/dd/plist/NSDate;->makeDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\""

    .line 175
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method protected toASCIIGnuStep(Ljava/lang/StringBuilder;I)V
    .locals 0

    .line 180
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSDate;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "<*D"

    .line 181
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    iget-object p2, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    invoke-static {p2}, Lcom/dd/plist/NSDate;->makeDateStringGnuStep(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ">"

    .line 183
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method

.method public toBinary(Lcom/dd/plist/BinaryPropertyListWriter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x33

    .line 155
    invoke-virtual {p1, v0}, Lcom/dd/plist/BinaryPropertyListWriter;->write(I)V

    .line 156
    iget-object v0, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const-wide v2, 0xe3c7a73400L

    sub-long/2addr v0, v2

    long-to-double v0, v0

    const-wide v2, 0x408f400000000000L    # 1000.0

    div-double/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Lcom/dd/plist/BinaryPropertyListWriter;->writeDouble(D)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 167
    iget-object v0, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method toXML(Ljava/lang/StringBuilder;I)V
    .locals 0

    .line 147
    invoke-virtual {p0, p1, p2}, Lcom/dd/plist/NSDate;->indent(Ljava/lang/StringBuilder;I)V

    const-string p2, "<date>"

    .line 148
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    iget-object p2, p0, Lcom/dd/plist/NSDate;->date:Ljava/util/Date;

    invoke-static {p2}, Lcom/dd/plist/NSDate;->makeDateString(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "</date>"

    .line 150
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    return-void
.end method
