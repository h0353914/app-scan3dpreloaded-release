.class public Lorg/apache/log/output/db/DefaultJDBCTarget;
.super Lorg/apache/log/output/db/AbstractJDBCTarget;
.source "DefaultJDBCTarget.java"


# instance fields
.field private final m_columns:[Lorg/apache/log/output/db/ColumnInfo;

.field private m_statement:Ljava/sql/PreparedStatement;

.field private final m_table:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljavax/sql/DataSource;Ljava/lang/String;[Lorg/apache/log/output/db/ColumnInfo;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lorg/apache/log/output/db/AbstractJDBCTarget;-><init>(Ljavax/sql/DataSource;)V

    .line 38
    iput-object p2, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_table:Ljava/lang/String;

    .line 39
    iput-object p3, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    if-eqz p2, :cond_2

    if-eqz p3, :cond_1

    .line 51
    array-length p1, p3

    if-eqz p1, :cond_0

    .line 56
    invoke-virtual {p0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->open()V

    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "columns must have at least 1 element"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "columns property must not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 43
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "table property must not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private getContextMap(Lorg/apache/log/ContextMap;Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    const-string p1, ""

    return-object p1

    :cond_0
    const-string v0, ""

    .line 231
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

    .line 223
    :cond_0
    new-instance v0, Ljava/io/StringWriter;

    invoke-direct {v0}, Ljava/io/StringWriter;-><init>()V

    .line 224
    new-instance v1, Ljava/io/PrintWriter;

    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    invoke-virtual {p1, v1}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintWriter;)V

    .line 225
    invoke-virtual {v0}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected declared-synchronized closeConnection()V
    .locals 4

    monitor-enter p0

    .line 146
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->closeConnection()V

    .line 148
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 150
    :try_start_1
    iget-object v1, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;

    invoke-interface {v1}, Ljava/sql/PreparedStatement;->close()V
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 153
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error closing statement"

    invoke-interface {v2, v3, v1, v0}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    .line 156
    :goto_0
    iput-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 158
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected final getColumn(I)Lorg/apache/log/output/db/ColumnInfo;
    .locals 1

    .line 217
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    aget-object p1, v0, p1

    return-object p1
.end method

.method protected getStatementSQL()Ljava/lang/String;
    .locals 4

    .line 110
    new-instance v0, Ljava/lang/StringBuffer;

    const-string v1, "INSERT INTO "

    invoke-direct {v0, v1}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 111
    iget-object v1, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_table:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, " ("

    .line 112
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 113
    iget-object v1, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v1}, Lorg/apache/log/output/db/ColumnInfo;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 v1, 0x1

    move v2, v1

    .line 115
    :goto_0
    iget-object v3, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    array-length v3, v3

    if-lt v2, v3, :cond_1

    const-string v2, ") VALUES (?"

    .line 121
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 123
    :goto_1
    iget-object v2, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    array-length v2, v2

    if-lt v1, v2, :cond_0

    const-string v1, ")"

    .line 128
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 130
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v2, ", ?"

    .line 125
    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    const-string v3, ", "

    .line 117
    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 118
    iget-object v3, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    aget-object v3, v3, v2

    invoke-virtual {v3}, Lorg/apache/log/output/db/ColumnInfo;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method protected final getTable()Ljava/lang/String;
    .locals 1

    .line 212
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_table:Ljava/lang/String;

    return-object v0
.end method

.method protected isStale()Z
    .locals 1

    .line 135
    invoke-super {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->isStale()Z

    move-result v0

    return v0
.end method

.method protected declared-synchronized openConnection()V
    .locals 4

    monitor-enter p0

    .line 91
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/db/AbstractJDBCTarget;->openConnection()V

    const/4 v0, 0x0

    .line 93
    iput-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 96
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getConnection()Ljava/sql/Connection;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 99
    invoke-virtual {p0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getStatementSQL()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/sql/Connection;->prepareStatement(Ljava/lang/String;)Ljava/sql/PreparedStatement;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;
    :try_end_1
    .catch Ljava/sql/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 104
    :try_start_2
    invoke-virtual {p0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v2

    const-string v3, "Error preparing statement"

    invoke-interface {v2, v3, v1, v0}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 106
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized output(Lorg/apache/log/LogEvent;)V
    .locals 3

    monitor-enter p0

    const/4 v0, 0x0

    .line 71
    :goto_0
    :try_start_0
    iget-object v1, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    array-length v1, v1

    if-lt v0, v1, :cond_0

    .line 76
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;

    invoke-interface {v0}, Ljava/sql/PreparedStatement;->executeUpdate()I

    goto :goto_1

    .line 73
    :cond_0
    iget-object v1, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_statement:Ljava/sql/PreparedStatement;

    invoke-virtual {p0, v1, v0, p1}, Lorg/apache/log/output/db/DefaultJDBCTarget;->specifyColumn(Ljava/sql/PreparedStatement;ILorg/apache/log/LogEvent;)V
    :try_end_0
    .catch Ljava/sql/SQLException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v0

    .line 80
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getErrorHandler()Lorg/apache/log/ErrorHandler;

    move-result-object v1

    const-string v2, "Error executing statement"

    invoke-interface {v1, v2, v0, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 82
    :goto_1
    monitor-exit p0

    return-void

    :goto_2
    monitor-exit p0

    throw p1
.end method

.method protected specifyColumn(Ljava/sql/PreparedStatement;ILorg/apache/log/LogEvent;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 168
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultJDBCTarget;->m_columns:[Lorg/apache/log/output/db/ColumnInfo;

    aget-object v0, v0, p2

    .line 170
    invoke-virtual {v0}, Lorg/apache/log/output/db/ColumnInfo;->getType()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 206
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuffer;

    invoke-direct {p2}, Ljava/lang/StringBuffer;-><init>()V

    const-string p3, "Unknown ColumnType: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Lorg/apache/log/output/db/ColumnInfo;->getType()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    invoke-virtual {p2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :pswitch_0
    add-int/lit8 p2, p2, 0x1

    .line 189
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p3

    invoke-virtual {p3}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setString(ILjava/lang/String;)V

    goto :goto_0

    :pswitch_1
    add-int/lit8 p2, p2, 0x1

    .line 202
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getThrowable()Ljava/lang/Throwable;

    move-result-object p3

    invoke-direct {p0, p3}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getStackTrace(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setString(ILjava/lang/String;)V

    goto :goto_0

    :pswitch_2
    add-int/lit8 p2, p2, 0x1

    .line 173
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getRelativeTime()J

    move-result-wide v0

    invoke-interface {p1, p2, v0, v1}, Ljava/sql/PreparedStatement;->setLong(IJ)V

    goto :goto_0

    :pswitch_3
    add-int/lit8 p2, p2, 0x1

    .line 177
    new-instance v0, Ljava/sql/Timestamp;

    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getTime()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/sql/Timestamp;-><init>(J)V

    invoke-interface {p1, p2, v0}, Ljava/sql/PreparedStatement;->setTimestamp(ILjava/sql/Timestamp;)V

    goto :goto_0

    :pswitch_4
    add-int/lit8 p2, p2, 0x1

    .line 181
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setString(ILjava/lang/String;)V

    goto :goto_0

    :pswitch_5
    add-int/lit8 p2, p2, 0x1

    .line 193
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getContextMap()Lorg/apache/log/ContextMap;

    move-result-object p3

    invoke-virtual {v0}, Lorg/apache/log/output/db/ColumnInfo;->getAux()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p3, v0}, Lorg/apache/log/output/db/DefaultJDBCTarget;->getContextMap(Lorg/apache/log/ContextMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setString(ILjava/lang/String;)V

    goto :goto_0

    :pswitch_6
    add-int/lit8 p2, p2, 0x1

    .line 185
    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getCategory()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setString(ILjava/lang/String;)V

    goto :goto_0

    :pswitch_7
    add-int/lit8 p2, p2, 0x1

    .line 198
    invoke-virtual {v0}, Lorg/apache/log/output/db/ColumnInfo;->getAux()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setString(ILjava/lang/String;)V

    :goto_0
    return-void

    nop

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
