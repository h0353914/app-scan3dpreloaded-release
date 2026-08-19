.class public Lorg/apache/log4j/lf5/util/LogFileParser;
.super Ljava/lang/Object;
.source "LogFileParser.java"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final ATTRIBUTE_DELIMITER:Ljava/lang/String; = "[slf5s."

.field public static final CATEGORY_DELIMITER:Ljava/lang/String; = "[slf5s.CATEGORY]"

.field public static final DATE_DELIMITER:Ljava/lang/String; = "[slf5s.DATE]"

.field public static final LOCATION_DELIMITER:Ljava/lang/String; = "[slf5s.LOCATION]"

.field public static final MESSAGE_DELIMITER:Ljava/lang/String; = "[slf5s.MESSAGE]"

.field public static final NDC_DELIMITER:Ljava/lang/String; = "[slf5s.NDC]"

.field public static final PRIORITY_DELIMITER:Ljava/lang/String; = "[slf5s.PRIORITY]"

.field public static final RECORD_DELIMITER:Ljava/lang/String; = "[slf5s.start]"

.field public static final THREAD_DELIMITER:Ljava/lang/String; = "[slf5s.THREAD]"

.field private static _sdf:Ljava/text/SimpleDateFormat;


# instance fields
.field private _in:Ljava/io/InputStream;

.field _loadDialog:Lorg/apache/log4j/lf5/viewer/LogFactor5LoadingDialog;

.field private _monitor:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 62
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "dd MMM yyyy HH:mm:ss,S"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lorg/apache/log4j/lf5/util/LogFileParser;->_sdf:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 72
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {p0, v0}, Lorg/apache/log4j/lf5/util/LogFileParser;-><init>(Ljava/io/InputStream;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_in:Ljava/io/InputStream;

    .line 76
    iput-object p1, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_in:Ljava/io/InputStream;

    return-void
.end method

.method static synthetic access$0(Lorg/apache/log4j/lf5/util/LogFileParser;)V
    .locals 0

    .line 163
    invoke-direct {p0}, Lorg/apache/log4j/lf5/util/LogFileParser;->destroyDialog()V

    return-void
.end method

.method private createLogRecord(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogRecord;
    .locals 3

    if-eqz p1, :cond_1

    .line 261
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 265
    :cond_0
    new-instance v0, Lorg/apache/log4j/lf5/Log4JLogRecord;

    invoke-direct {v0}, Lorg/apache/log4j/lf5/Log4JLogRecord;-><init>()V

    .line 266
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseDate(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lorg/apache/log4j/lf5/LogRecord;->setMillis(J)V

    .line 267
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parsePriority(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogLevel;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/LogRecord;->setLevel(Lorg/apache/log4j/lf5/LogLevel;)V

    .line 268
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseCategory(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/LogRecord;->setCategory(Ljava/lang/String;)V

    .line 269
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseLocation(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/LogRecord;->setLocation(Ljava/lang/String;)V

    .line 270
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseThread(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/LogRecord;->setThreadDescription(Ljava/lang/String;)V

    .line 271
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseNDC(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/LogRecord;->setNDC(Ljava/lang/String;)V

    .line 272
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseMessage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log4j/lf5/LogRecord;->setMessage(Ljava/lang/String;)V

    .line 273
    invoke-direct {p0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseThrowable(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lorg/apache/log4j/lf5/LogRecord;->setThrownStackTrace(Ljava/lang/String;)V

    return-object v0

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private destroyDialog()V
    .locals 1

    .line 164
    iget-object v0, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_loadDialog:Lorg/apache/log4j/lf5/viewer/LogFactor5LoadingDialog;

    invoke-virtual {v0}, Ljava/awt/Dialog;->hide()V

    .line 165
    iget-object v0, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_loadDialog:Lorg/apache/log4j/lf5/viewer/LogFactor5LoadingDialog;

    invoke-virtual {v0}, Ljava/awt/Dialog;->dispose()V

    return-void
.end method

.method private getAttribute(ILjava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "[slf5s."

    add-int/lit8 v1, p1, -0x1

    .line 280
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 283
    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v1, "]"

    .line 286
    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    .line 288
    invoke-virtual {p2, v0, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private loadLogFile(Ljava/io/InputStream;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 172
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 175
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->available()I

    move-result p1

    if-lez p1, :cond_0

    .line 179
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    goto :goto_0

    .line 181
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    const/16 p1, 0x400

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 184
    :goto_0
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->read()I

    move-result p1

    const/4 v2, -0x1

    if-ne p1, v2, :cond_1

    .line 188
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->close()V

    .line 190
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    int-to-char p1, p1

    .line 185
    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_0
.end method

.method private parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 196
    invoke-virtual {p2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 202
    :cond_0
    invoke-direct {p0, p1, p2}, Lorg/apache/log4j/lf5/util/LogFileParser;->getAttribute(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseCategory(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "[slf5s.CATEGORY]"

    .line 241
    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseDate(Ljava/lang/String;)J
    .locals 3

    const-wide/16 v0, 0x0

    :try_start_0
    const-string v2, "[slf5s.DATE]"

    .line 207
    invoke-direct {p0, v2, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    return-wide v0

    .line 213
    :cond_0
    sget-object v2, Lorg/apache/log4j/lf5/util/LogFileParser;->_sdf:Ljava/text/SimpleDateFormat;

    invoke-virtual {v2, p1}, Ljava/text/DateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    .line 215
    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    :catch_0
    return-wide v0
.end method

.method private parseLocation(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "[slf5s.LOCATION]"

    .line 245
    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseMessage(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "[slf5s.MESSAGE]"

    .line 249
    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseNDC(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "[slf5s.NDC]"

    .line 253
    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parsePriority(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogLevel;
    .locals 1

    const-string v0, "[slf5s.PRIORITY]"

    .line 222
    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 226
    :try_start_0
    invoke-static {p1}, Lorg/apache/log4j/lf5/LogLevel;->valueOf(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogLevel;

    move-result-object p1
    :try_end_0
    .catch Lorg/apache/log4j/lf5/LogLevelFormatException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    .line 228
    :catch_0
    sget-object p1, Lorg/apache/log4j/lf5/LogLevel;->DEBUG:Lorg/apache/log4j/lf5/LogLevel;

    return-object p1

    .line 233
    :cond_0
    sget-object p1, Lorg/apache/log4j/lf5/LogLevel;->DEBUG:Lorg/apache/log4j/lf5/LogLevel;

    return-object p1
.end method

.method private parseThread(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "[slf5s.THREAD]"

    .line 237
    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->parseAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private parseThrowable(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 257
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lorg/apache/log4j/lf5/util/LogFileParser;->getAttribute(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected displayError(Ljava/lang/String;)V
    .locals 2

    .line 155
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;

    .line 156
    iget-object v1, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_monitor:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    invoke-virtual {v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    .line 155
    invoke-direct {v0, v1, p1}, Lorg/apache/log4j/lf5/viewer/LogFactor5ErrorDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    return-void
.end method

.method public parse(Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/RuntimeException;
        }
    .end annotation

    .line 88
    iput-object p1, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_monitor:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    .line 89
    new-instance p1, Ljava/lang/Thread;

    invoke-direct {p1, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 90
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method public run()V
    .locals 5

    .line 104
    new-instance v0, Lorg/apache/log4j/lf5/viewer/LogFactor5LoadingDialog;

    .line 105
    iget-object v1, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_monitor:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    invoke-virtual {v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->getBaseFrame()Ljavax/swing/JFrame;

    move-result-object v1

    const-string v2, "Loading file..."

    .line 104
    invoke-direct {v0, v1, v2}, Lorg/apache/log4j/lf5/viewer/LogFactor5LoadingDialog;-><init>(Ljavax/swing/JFrame;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_loadDialog:Lorg/apache/log4j/lf5/viewer/LogFactor5LoadingDialog;

    .line 109
    :try_start_0
    iget-object v0, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_in:Ljava/io/InputStream;

    invoke-direct {p0, v0}, Lorg/apache/log4j/lf5/util/LogFileParser;->loadLogFile(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const-string v3, "[slf5s.start]"

    .line 111
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_2

    .line 122
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_0

    if-eqz v2, :cond_0

    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/apache/log4j/lf5/util/LogFileParser;->createLogRecord(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogRecord;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 126
    iget-object v1, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_monitor:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    invoke-virtual {v1, v0}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->addMessage(Lorg/apache/log4j/lf5/LogRecord;)V

    :cond_0
    if-eqz v2, :cond_1

    .line 133
    new-instance v0, Lorg/apache/log4j/lf5/util/LogFileParser$1;

    invoke-direct {v0, p0}, Lorg/apache/log4j/lf5/util/LogFileParser$1;-><init>(Lorg/apache/log4j/lf5/util/LogFileParser;)V

    invoke-static {v0}, Ljavax/swing/SwingUtilities;->invokeLater(Ljava/lang/Runnable;)V

    goto :goto_1

    .line 131
    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Invalid log file format"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_2
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/apache/log4j/lf5/util/LogFileParser;->createLogRecord(Ljava/lang/String;)Lorg/apache/log4j/lf5/LogRecord;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_3

    .line 116
    iget-object v4, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_monitor:Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;

    invoke-virtual {v4, v1}, Lorg/apache/log4j/lf5/viewer/LogBrokerMonitor;->addMessage(Lorg/apache/log4j/lf5/LogRecord;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_3
    add-int/lit8 v1, v3, 0xd

    goto :goto_0

    .line 144
    :catch_0
    invoke-direct {p0}, Lorg/apache/log4j/lf5/util/LogFileParser;->destroyDialog()V

    const-string v0, "Error - Unable to load log file!"

    .line 145
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/util/LogFileParser;->displayError(Ljava/lang/String;)V

    goto :goto_1

    .line 140
    :catch_1
    invoke-direct {p0}, Lorg/apache/log4j/lf5/util/LogFileParser;->destroyDialog()V

    const-string v0, "Error - Invalid log file format.\nPlease see documentation on how to load log files."

    .line 141
    invoke-virtual {p0, v0}, Lorg/apache/log4j/lf5/util/LogFileParser;->displayError(Ljava/lang/String;)V

    :goto_1
    const/4 v0, 0x0

    .line 148
    iput-object v0, p0, Lorg/apache/log4j/lf5/util/LogFileParser;->_in:Ljava/io/InputStream;

    return-void
.end method
