.class public interface abstract Lorg/apache/log/output/jms/MessageBuilder;
.super Ljava/lang/Object;
.source "MessageBuilder.java"


# virtual methods
.method public abstract buildMessage(Ljavax/jms/Session;Lorg/apache/log/LogEvent;)Ljavax/jms/Message;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/jms/JMSException;
        }
    .end annotation
.end method
