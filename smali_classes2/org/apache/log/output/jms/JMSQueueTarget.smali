.class public Lorg/apache/log/output/jms/JMSQueueTarget;
.super Lorg/apache/log/output/jms/AbstractJMSTarget;
.source "JMSQueueTarget.java"


# instance fields
.field private m_connection:Ljavax/jms/QueueConnection;

.field private m_factory:Ljavax/jms/QueueConnectionFactory;

.field private m_queue:Ljavax/jms/Queue;

.field private m_sender:Ljavax/jms/QueueSender;

.field private m_session:Ljavax/jms/QueueSession;


# direct methods
.method public constructor <init>(Lorg/apache/log/output/jms/MessageBuilder;Ljavax/jms/QueueConnectionFactory;Ljavax/jms/Queue;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lorg/apache/log/output/jms/AbstractJMSTarget;-><init>(Lorg/apache/log/output/jms/MessageBuilder;)V

    .line 46
    iput-object p2, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_factory:Ljavax/jms/QueueConnectionFactory;

    .line 47
    iput-object p3, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_queue:Ljavax/jms/Queue;

    .line 48
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSQueueTarget;->open()V

    return-void
.end method


# virtual methods
.method protected declared-synchronized closeConnection()V
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 90
    :try_start_0
    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_sender:Ljavax/jms/QueueSender;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_sender:Ljavax/jms/QueueSender;

    invoke-interface {v1}, Ljavax/jms/QueueSender;->close()V

    .line 91
    :cond_0
    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_session:Ljavax/jms/QueueSession;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_session:Ljavax/jms/QueueSession;

    invoke-interface {v1}, Ljavax/jms/QueueSession;->close()V

    .line 92
    :cond_1
    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_connection:Ljavax/jms/QueueConnection;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_connection:Ljavax/jms/QueueConnection;

    invoke-interface {v1}, Ljavax/jms/QueueConnection;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 96
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSQueueTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error closing connection"

    invoke-interface {v2, v3, v1, v0}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    .line 99
    :cond_2
    :goto_0
    iput-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_sender:Ljavax/jms/QueueSender;

    .line 100
    iput-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_session:Ljavax/jms/QueueSession;

    .line 101
    iput-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_connection:Ljavax/jms/QueueConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 102
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method protected getSession()Ljavax/jms/Session;
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_session:Ljavax/jms/QueueSession;

    return-object v0
.end method

.method protected declared-synchronized openConnection()V
    .locals 4

    monitor-enter p0

    .line 72
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_factory:Ljavax/jms/QueueConnectionFactory;

    invoke-interface {v0}, Ljavax/jms/QueueConnectionFactory;->createQueueConnection()Ljavax/jms/QueueConnection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_connection:Ljavax/jms/QueueConnection;

    .line 73
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_connection:Ljavax/jms/QueueConnection;

    invoke-interface {v0}, Ljavax/jms/QueueConnection;->start()V

    .line 75
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_connection:Ljavax/jms/QueueConnection;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Ljavax/jms/QueueConnection;->createQueueSession(ZI)Ljavax/jms/QueueSession;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_session:Ljavax/jms/QueueSession;

    .line 78
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_session:Ljavax/jms/QueueSession;

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_queue:Ljavax/jms/Queue;

    invoke-interface {v0, v1}, Ljavax/jms/QueueSession;->createSender(Ljavax/jms/Queue;)Ljavax/jms/QueueSender;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_sender:Ljavax/jms/QueueSender;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 82
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSQueueTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v1

    const-string v2, "Error starting connection"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v0, v3}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method protected send(Ljavax/jms/Message;)V
    .locals 3

    .line 55
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSQueueTarget;->m_sender:Ljavax/jms/QueueSender;

    invoke-interface {v0, p1}, Ljavax/jms/QueueSender;->send(Ljavax/jms/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 59
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSQueueTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Error publishing message"

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    :goto_0
    return-void
.end method
