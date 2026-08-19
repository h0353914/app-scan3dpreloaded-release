.class public Lorg/apache/log/output/jms/TextMessageBuilder;
.super Ljava/lang/Object;
.source "TextMessageBuilder.java"

# interfaces
.implements Lorg/apache/log/output/jms/MessageBuilder;


# instance fields
.field private final m_formatter:Lorg/apache/log/format/Formatter;

.field private final m_properties:[Lorg/apache/log/output/jms/PropertyInfo;


# direct methods
.method public constructor <init>(Lorg/apache/log/format/Formatter;)V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 34
    new-array v0, v0, [Lorg/apache/log/output/jms/PropertyInfo;

    iput-object v0, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_properties:[Lorg/apache/log/output/jms/PropertyInfo;

    .line 35
    iput-object p1, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_formatter:Lorg/apache/log/format/Formatter;

    return-void
.end method

.method public constructor <init>([Lorg/apache/log/output/jms/PropertyInfo;Lorg/apache/log/format/Formatter;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_properties:[Lorg/apache/log/output/jms/PropertyInfo;

    .line 42
    iput-object p2, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_formatter:Lorg/apache/log/format/Formatter;

    return-void
.end method

.method private getContextMap(Lorg/apache/log/ContextMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    const-string v0, ""

    .line 137
    invoke-virtual {p1, p2, v0}, Lorg/apache/log/ContextMap;->get(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 2

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    .line 127
    :cond_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 128
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 129
    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 131
    invoke-virtual {v0}, Ljava/io/StringWriter;->getBuffer()Ljava/lang/StringBuffer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getText(Lorg/apache/log/LogEvent;)Ljava/lang/String;
    .locals 1

    .line 113
    iget-object v0, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_formatter:Lorg/apache/log/format/Formatter;

    if-nez v0, :cond_0

    .line 115
    invoke-virtual {p1}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 119
    :cond_0
    invoke-interface {v0, p1}, Lorg/apache/log/format/Formatter;->format(Lorg/apache/log/LogEvent;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private setProperty(Ljavax/jms/TextMessage;ILorg/apache/log/LogEvent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/jms/JMSException;
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_properties:[Lorg/apache/log/output/jms/PropertyInfo;

    aget-object p2, v0, p2

    .line 68
    invoke-virtual {p2}, Lorg/apache/log/output/jms/PropertyInfo;->getName()Ljava/lang/String;

    move-result-object v0

    .line 70
    invoke-virtual {p2}, Lorg/apache/log/output/jms/PropertyInfo;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 106
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p3, Ljava/lang/StringBuffer;

    invoke-direct {p3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v0, "Unknown PropertyType: "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Lorg/apache/log/output/jms/PropertyInfo;->getType()I

    move-result p2

    invoke-virtual {p3, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {p3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 89
    :pswitch_0
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p2

    invoke-virtual {p2}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/jms/TextMessage;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 102
    :pswitch_1
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getThrowable()Ljava/lang/Throwable;

    move-result-object p2

    invoke-direct {p0, p2}, Lorg/apache/log/output/jms/TextMessageBuilder;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/jms/TextMessage;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 77
    :pswitch_2
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getRelativeTime()J

    move-result-wide p2

    invoke-interface {p1, v0, p2, p3}, Ljavax/jms/TextMessage;->setLongProperty(Ljava/lang/String;J)V

    goto :goto_0

    .line 81
    :pswitch_3
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getTime()J

    move-result-wide p2

    invoke-interface {p1, v0, p2, p3}, Ljavax/jms/TextMessage;->setLongProperty(Ljava/lang/String;J)V

    goto :goto_0

    .line 73
    :pswitch_4
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/jms/TextMessage;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 93
    :pswitch_5
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getContextMap()Lorg/apache/log/ContextMap;

    move-result-object p3

    invoke-virtual {p2}, Lorg/apache/log/output/jms/PropertyInfo;->getAux()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p3, p2}, Lorg/apache/log/output/jms/TextMessageBuilder;->getContextMap(Lorg/apache/log/ContextMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/jms/TextMessage;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 85
    :pswitch_6
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getCategory()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/jms/TextMessage;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 98
    :pswitch_7
    invoke-virtual {p2}, Lorg/apache/log/output/jms/PropertyInfo;->getAux()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, v0, p2}, Ljavax/jms/TextMessage;->setStringProperty(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
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


# virtual methods
.method public buildMessage(Ljavax/jms/Session;Lorg/apache/log/LogEvent;)Ljavax/jms/Message;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/jms/JMSException;
        }
    .end annotation

    .line 48
    monitor-enter p1

    .line 50
    :try_start_0
    invoke-interface {p1}, Ljavax/jms/Session;->createTextMessage()Ljavax/jms/TextMessage;

    move-result-object v0

    .line 52
    invoke-direct {p0, p2}, Lorg/apache/log/output/jms/TextMessageBuilder;->getText(Lorg/apache/log/LogEvent;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljavax/jms/TextMessage;->setText(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 53
    :goto_0
    iget-object v2, p0, Lorg/apache/log/output/jms/TextMessageBuilder;->m_properties:[Lorg/apache/log/output/jms/PropertyInfo;

    array-length v2, v2

    if-lt v1, v2, :cond_0

    .line 58
    monitor-exit p1

    return-object v0

    .line 55
    :cond_0
    invoke-direct {p0, v0, v1, p2}, Lorg/apache/log/output/jms/TextMessageBuilder;->setProperty(Ljavax/jms/TextMessage;ILorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p2

    .line 59
    monitor-exit p1

    throw p2
.end method
