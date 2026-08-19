.class public abstract Lorg/apache/log/output/jms/AbstractJMSTarget;
.super Lorg/apache/log/output/AbstractTarget;
.source "AbstractJMSTarget.java"


# instance fields
.field private m_builder:Lorg/apache/log/output/jms/MessageBuilder;


# direct methods
.method public constructor <init>(Lorg/apache/log/output/jms/MessageBuilder;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lorg/apache/log/output/AbstractTarget;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/apache/log/output/jms/AbstractJMSTarget;->m_builder:Lorg/apache/log/output/jms/MessageBuilder;

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 71
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/jms/AbstractJMSTarget;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0}, Lorg/apache/log/output/jms/AbstractJMSTarget;->closeConnection()V

    .line 74
    invoke-super {p0}, Lorg/apache/log/output/AbstractTarget;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract closeConnection()V
.end method

.method protected doProcessEvent(Lorg/apache/log/LogEvent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 46
    iget-object v0, p0, Lorg/apache/log/output/jms/AbstractJMSTarget;->m_builder:Lorg/apache/log/output/jms/MessageBuilder;

    invoke-virtual {p0}, Lorg/apache/log/output/jms/AbstractJMSTarget;->getSession()Ljavax/jms/Session;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lorg/apache/log/output/jms/MessageBuilder;->buildMessage(Ljavax/jms/Session;Lorg/apache/log/LogEvent;)Ljavax/jms/Message;

    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Lorg/apache/log/output/jms/AbstractJMSTarget;->send(Ljavax/jms/Message;)V

    return-void
.end method

.method protected abstract getSession()Ljavax/jms/Session;
.end method

.method protected declared-synchronized open()V
    .locals 1

    monitor-enter p0

    .line 57
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/jms/AbstractJMSTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 59
    invoke-super {p0}, Lorg/apache/log/output/AbstractTarget;->open()V

    .line 60
    invoke-virtual {p0}, Lorg/apache/log/output/jms/AbstractJMSTarget;->openConnection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract openConnection()V
.end method

.method protected abstract send(Ljavax/jms/Message;)V
.end method
