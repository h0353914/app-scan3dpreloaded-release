.class public Lorg/apache/log/format/SyslogFormatter;
.super Ljava/lang/Object;
.source "SyslogFormatter.java"

# interfaces
.implements Lorg/apache/log/format/Formatter;
.implements Lorg/apache/log/Formatter;


# static fields
.field public static final FACILITY_AUTH:I = 0x20

.field public static final FACILITY_AUTHPRIV:I = 0x50

.field public static final FACILITY_CRON:I = 0x48

.field public static final FACILITY_DAEMON:I = 0x18

.field protected static final FACILITY_DESCRIPTIONS:[Ljava/lang/String;

.field public static final FACILITY_FTP:I = 0x58

.field public static final FACILITY_KERN:I = 0x0

.field public static final FACILITY_LOCAL0:I = 0x80

.field public static final FACILITY_LOCAL1:I = 0x88

.field public static final FACILITY_LOCAL2:I = 0x90

.field public static final FACILITY_LOCAL3:I = 0x98

.field public static final FACILITY_LOCAL4:I = 0xa0

.field public static final FACILITY_LOCAL5:I = 0xa8

.field public static final FACILITY_LOCAL6:I = 0xb0

.field public static final FACILITY_LOCAL7:I = 0xb8

.field public static final FACILITY_LPR:I = 0x30

.field public static final FACILITY_MAIL:I = 0x10

.field public static final FACILITY_NEWS:I = 0x38

.field public static final FACILITY_SYSLOG:I = 0x28

.field public static final FACILITY_USER:I = 0x8

.field public static final FACILITY_UUCP:I = 0x40

.field public static final PRIORITY_ALERT:I = 0x1

.field public static final PRIORITY_CRIT:I = 0x2

.field public static final PRIORITY_DEBUG:I = 0x7

.field public static final PRIORITY_EMERG:I = 0x0

.field public static final PRIORITY_ERR:I = 0x3

.field public static final PRIORITY_INFO:I = 0x6

.field public static final PRIORITY_NOTICE:I = 0x5

.field public static final PRIORITY_WARNING:I = 0x4


# instance fields
.field private m_facility:I

.field private m_showFacilityBanner:Z


# direct methods
.method static constructor <clinit>()V
    .locals 24

    const-string v0, "kern"

    const-string v1, "user"

    const-string v2, "mail"

    const-string v3, "daemon"

    const-string v4, "auth"

    const-string v5, "syslog"

    const-string v6, "lpr"

    const-string v7, "news"

    const-string v8, "uucp"

    const-string v9, "cron"

    const-string v10, "authpriv"

    const-string v11, "ftp"

    const-string v12, ""

    const-string v13, ""

    const-string v14, ""

    const-string v15, ""

    const-string v16, "local0"

    const-string v17, "local1"

    const-string v18, "local2"

    const-string v19, "local3"

    const-string v20, "local4"

    const-string v21, "local5"

    const-string v22, "local6"

    const-string v23, "local7"

    .line 57
    filled-new-array/range {v0 .. v23}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/apache/log/format/SyslogFormatter;->FACILITY_DESCRIPTIONS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x8

    .line 76
    invoke-direct {p0, v0}, Lorg/apache/log/format/SyslogFormatter;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    .line 86
    invoke-direct {p0, p1, v0}, Lorg/apache/log/format/SyslogFormatter;-><init>(IZ)V

    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 0

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput p1, p0, Lorg/apache/log/format/SyslogFormatter;->m_facility:I

    .line 98
    iput-boolean p2, p0, Lorg/apache/log/format/SyslogFormatter;->m_showFacilityBanner:Z

    return-void
.end method


# virtual methods
.method public format(Lorg/apache/log/LogEvent;)Ljava/lang/String;
    .locals 4

    .line 109
    invoke-virtual {p0, p1}, Lorg/apache/log/format/SyslogFormatter;->getSyslogPriority(Lorg/apache/log/LogEvent;)I

    move-result v0

    .line 110
    invoke-virtual {p0, p1}, Lorg/apache/log/format/SyslogFormatter;->getSyslogFacility(Lorg/apache/log/LogEvent;)I

    move-result v1

    .line 111
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, ""

    .line 120
    :cond_0
    iget-boolean v2, p0, Lorg/apache/log/format/SyslogFormatter;->m_showFacilityBanner:Z

    if-eqz v2, :cond_1

    .line 122
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0, v1}, Lorg/apache/log/format/SyslogFormatter;->getFacilityDescription(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 125
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "<"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    or-int/2addr v0, v1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string v0, "> "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getFacilityDescription(I)Ljava/lang/String;
    .locals 1

    .line 136
    sget-object v0, Lorg/apache/log/format/SyslogFormatter;->FACILITY_DESCRIPTIONS:[Ljava/lang/String;

    shr-int/lit8 p1, p1, 0x3

    aget-object p1, v0, p1

    return-object p1
.end method

.method protected getSyslogFacility(Lorg/apache/log/LogEvent;)I
    .locals 0

    .line 148
    iget p1, p0, Lorg/apache/log/format/SyslogFormatter;->m_facility:I

    return p1
.end method

.method protected getSyslogPriority(Lorg/apache/log/LogEvent;)I
    .locals 2

    .line 160
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x7

    return p1

    .line 161
    :cond_0
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p1, 0x6

    return p1

    .line 162
    :cond_1
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 p1, 0x4

    return p1

    .line 163
    :cond_2
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p1

    sget-object v0, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    invoke-virtual {p1, v0}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result p1

    if-eqz p1, :cond_3

    const/4 p1, 0x3

    return p1

    :cond_3
    const/4 p1, 0x2

    return p1
.end method
