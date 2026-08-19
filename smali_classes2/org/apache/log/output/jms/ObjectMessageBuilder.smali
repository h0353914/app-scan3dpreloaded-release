.class public Lorg/apache/log/output/jms/ObjectMessageBuilder;
.super Ljava/lang/Object;
.source "ObjectMessageBuilder.java"

# interfaces
.implements Lorg/apache/log/output/jms/MessageBuilder;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public buildMessage(Ljavax/jms/Session;Lorg/apache/log/LogEvent;)Ljavax/jms/Message;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/jms/JMSException;
        }
    .end annotation

    .line 28
    monitor-enter p1

    .line 30
    :try_start_0
    invoke-interface {p1}, Ljavax/jms/Session;->createObjectMessage()Ljavax/jms/ObjectMessage;

    move-result-object v0

    .line 31
    invoke-interface {v0, p2}, Ljavax/jms/ObjectMessage;->setObject(Ljava/io/Serializable;)V

    .line 32
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object v0

    :catchall_0
    move-exception p2

    .line 33
    monitor-exit p1

    throw p2
.end method
