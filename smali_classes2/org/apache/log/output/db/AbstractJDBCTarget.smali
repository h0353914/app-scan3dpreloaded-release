.class public abstract Lorg/apache/log/output/db/AbstractJDBCTarget;
.super Lorg/apache/log/output/AbstractTarget;
.source "AbstractJDBCTarget.java"


# instance fields
.field private m_connection:Ljava/sql/Connection;

.field private m_dataSource:Ljavax/sql/DataSource;


# direct methods
.method protected constructor <init>(Ljavax/sql/DataSource;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Lorg/apache/log/output/AbstractTarget;-><init>()V

    .line 32
    iput-object p1, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_dataSource:Ljavax/sql/DataSource;

    return-void
.end method


# virtual methods
.method protected final declared-synchronized checkConnection()V
    .locals 1

    monitor-enter p0

    .line 103
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->isStale()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 105
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->closeConnection()V

    .line 106
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->openConnection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 138
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->closeConnection()V

    .line 141
    invoke-super {p0}, Lorg/apache/log/output/AbstractTarget;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 143
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized closeConnection()V
    .locals 4

    monitor-enter p0

    .line 151
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 155
    :try_start_1
    iget-object v1, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;

    invoke-interface {v1}, Ljava/sql/Connection;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 159
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error shutting down JDBC connection"

    invoke-interface {v2, v3, v1, v0}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    .line 162
    :goto_0
    iput-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 164
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized doProcessEvent(Lorg/apache/log/LogEvent;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    monitor-enter p0

    .line 43
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->checkConnection()V

    .line 45
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 47
    invoke-virtual {p0, p1}, Lorg/apache/log/output/db/AbstractJDBCTarget;->output(Lorg/apache/log/LogEvent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected final declared-synchronized getConnection()Ljava/sql/Connection;
    .locals 1

    monitor-enter p0

    .line 95
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized isStale()Z
    .locals 2

    monitor-enter p0

    .line 117
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    monitor-exit p0

    return v1

    .line 121
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;

    invoke-interface {v0}, Ljava/sql/Connection;->isClosed()Z

    move-result v0
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    monitor-exit p0

    return v1

    :cond_1
    const/4 v0, 0x0

    .line 128
    monitor-exit p0

    return v0

    .line 125
    :catch_0
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized open()V
    .locals 1

    monitor-enter p0

    .line 65
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 67
    invoke-super {p0}, Lorg/apache/log/output/AbstractTarget;->open()V

    .line 68
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->openConnection()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized openConnection()V
    .locals 4

    monitor-enter p0

    .line 80
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_dataSource:Ljavax/sql/DataSource;

    invoke-interface {v0}, Ljavax/sql/DataSource;->getConnection()Ljava/sql/Connection;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/output/db/AbstractJDBCTarget;->m_connection:Ljava/sql/Connection;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 84
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v1

    const-string v2, "Unable to open connection"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v0, v3}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw v0
.end method

.method protected abstract output(Lorg/apache/log/LogEvent;)V
.end method
