.class public Lorg/apache/log/output/jms/JMSTopicTarget;
.super Lorg/apache/log/output/jms/AbstractJMSTarget;
.source "JMSTopicTarget.java"


# instance fields
.field private m_connection:Ljavax/jms/TopicConnection;

.field private m_factory:Ljavax/jms/TopicConnectionFactory;

.field private m_publisher:Ljavax/jms/TopicPublisher;

.field private m_session:Ljavax/jms/TopicSession;

.field private m_topic:Ljavax/jms/Topic;


# direct methods
.method public constructor <init>(Lorg/apache/log/output/jms/MessageBuilder;Ljavax/jms/TopicConnectionFactory;Ljavax/jms/Topic;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lorg/apache/log/output/jms/AbstractJMSTarget;-><init>(Lorg/apache/log/output/jms/MessageBuilder;)V

    .line 46
    iput-object p2, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_factory:Ljavax/jms/TopicConnectionFactory;

    .line 47
    iput-object p3, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_topic:Ljavax/jms/Topic;

    .line 48
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSTopicTarget;->open()V

    return-void
.end method


# virtual methods
.method protected declared-synchronized closeConnection()V
    .locals 4

    monitor-enter p0

    const/4 v0, 0x0

    .line 94
    :try_start_0
    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_publisher:Ljavax/jms/TopicPublisher;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_publisher:Ljavax/jms/TopicPublisher;

    invoke-interface {v1}, Ljavax/jms/TopicPublisher;->close()V

    .line 95
    :cond_0
    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_session:Ljavax/jms/TopicSession;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_session:Ljavax/jms/TopicSession;

    invoke-interface {v1}, Ljavax/jms/TopicSession;->close()V

    .line 96
    :cond_1
    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_connection:Ljavax/jms/TopicConnection;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_connection:Ljavax/jms/TopicConnection;

    invoke-interface {v1}, Ljavax/jms/TopicConnection;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 100
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSTopicTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error closing connection"

    invoke-interface {v2, v3, v1, v0}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    .line 103
    :cond_2
    :goto_0
    iput-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_publisher:Ljavax/jms/TopicPublisher;

    .line 104
    iput-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_session:Ljavax/jms/TopicSession;

    .line 105
    iput-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_connection:Ljavax/jms/TopicConnection;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 106
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method protected getSession()Ljavax/jms/Session;
    .locals 1

    .line 65
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_session:Ljavax/jms/TopicSession;

    return-object v0
.end method

.method protected declared-synchronized openConnection()V
    .locals 4

    monitor-enter p0

    .line 72
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_factory:Ljavax/jms/TopicConnectionFactory;

    invoke-interface {v0}, Ljavax/jms/TopicConnectionFactory;->createTopicConnection()Ljavax/jms/TopicConnection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_connection:Ljavax/jms/TopicConnection;

    .line 73
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_connection:Ljavax/jms/TopicConnection;

    invoke-interface {v0}, Ljavax/jms/TopicConnection;->start()V

    .line 75
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_connection:Ljavax/jms/TopicConnection;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Ljavax/jms/TopicConnection;->createTopicSession(ZI)Ljavax/jms/TopicSession;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_session:Ljavax/jms/TopicSession;

    .line 78
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_session:Ljavax/jms/TopicSession;

    iget-object v1, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_topic:Ljavax/jms/Topic;

    invoke-interface {v0, v1}, Ljavax/jms/TopicSession;->createPublisher(Ljavax/jms/Topic;)Ljavax/jms/TopicPublisher;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_publisher:Ljavax/jms/TopicPublisher;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 86
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSTopicTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v1

    const-string v2, "Error starting connection"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v0, v3}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 88
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
    iget-object v0, p0, Lorg/apache/log/output/jms/JMSTopicTarget;->m_publisher:Ljavax/jms/TopicPublisher;

    invoke-interface {v0, p1}, Ljavax/jms/TopicPublisher;->publish(Ljavax/jms/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 59
    invoke-virtual {p0}, Lorg/apache/log/output/jms/JMSTopicTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v0

    const-string v1, "Error publishing message"

    const/4 v2, 0x0

    invoke-interface {v0, v1, p1, v2}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    :goto_0
    return-void
.end method
