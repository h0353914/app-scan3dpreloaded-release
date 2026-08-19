.class public Lorg/apache/log/output/db/NormalizedJDBCTarget;
.super Lorg/apache/log/output/db/DefaultJDBCTarget;
.source "NormalizedJDBCTarget.java"


# instance fields
.field private m_categoryIDs:Ljava/util/HashMap;

.field private m_priorityIDs:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Ljavax/sql/DataSource;Ljava/lang/String;[Lorg/apache/log/output/db/ColumnInfo;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/log/output/db/DefaultJDBCTarget;-><init>(Ljavax/sql/DataSource;Ljava/lang/String;[Lorg/apache/log/output/db/ColumnInfo;)V

    .line 30
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/apache/log/output/db/NormalizedJDBCTarget;->m_categoryIDs:Ljava/util/HashMap;

    .line 31
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lorg/apache/log/output/db/NormalizedJDBCTarget;->m_priorityIDs:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method protected declared-synchronized getID(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    monitor-enter p0

    .line 74
    :try_start_0
    invoke-virtual {p2, p3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    monitor-exit p0

    return p1

    :cond_0
    const/4 v0, 0x0

    .line 83
    :try_start_1
    invoke-virtual {p0}, Lorg/apache/log/output/db/NormalizedJDBCTarget;->getConnection()Ljava/sql/Connection;

    move-result-object v1

    invoke-interface {v1}, Ljava/sql/Connection;->createStatement()Ljava/sql/Statement;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 85
    :try_start_2
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v3, "SELECT ID FROM "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, " WHERE NAME=\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 86
    invoke-interface {v1, v2}, Ljava/sql/Statement;->executeQuery(Ljava/lang/String;)Ljava/sql/ResultSet;

    move-result-object v0

    .line 88
    invoke-interface {v0}, Ljava/sql/ResultSet;->next()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    .line 90
    new-instance p1, Ljava/lang/Integer;

    invoke-interface {v0, v3}, Ljava/sql/ResultSet;->getInt(I)I

    move-result v2

    invoke-direct {p1, v2}, Ljava/lang/Integer;-><init>(I)V

    .line 91
    invoke-virtual {p2, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_1

    .line 121
    :try_start_3
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    :catch_0
    :cond_1
    if-eqz v1, :cond_2

    .line 126
    :try_start_4
    invoke-interface {v1}, Ljava/sql/Statement;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 92
    :catch_1
    :cond_2
    monitor-exit p0

    return p1

    .line 95
    :cond_3
    :try_start_5
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V

    .line 102
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "SELECT MAX(ID) FROM "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    .line 103
    invoke-interface {v1, v2}, Ljava/sql/Statement;->executeQuery(Ljava/lang/String;)Ljava/sql/ResultSet;

    move-result-object v0

    const/4 v2, 0x0

    .line 105
    invoke-interface {v0}, Ljava/sql/ResultSet;->next()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v0, v3}, Ljava/sql/ResultSet;->getInt(I)I

    move-result v2

    .line 106
    :cond_4
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V

    add-int/2addr v2, v3

    .line 109
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "INSERT INTO "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, " (ID, NAME) VALUES ( "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    const-string p1, ", \'"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3, p3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p1, "\')"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 111
    invoke-interface {v1, p1}, Ljava/sql/Statement;->executeUpdate(Ljava/lang/String;)I

    .line 113
    new-instance p1, Ljava/lang/Integer;

    invoke-direct {p1, v2}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {p2, p3, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    if-eqz v0, :cond_5

    .line 121
    :try_start_6
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catch_2
    :cond_5
    if-eqz v1, :cond_6

    .line 126
    :try_start_7
    invoke-interface {v1}, Ljava/sql/Statement;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 114
    :catch_3
    :cond_6
    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    move-object v1, v0

    :goto_0
    if-eqz v0, :cond_7

    .line 121
    :try_start_8
    invoke-interface {v0}, Ljava/sql/ResultSet;->close()V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catch_4
    :cond_7
    if-eqz v1, :cond_8

    .line 126
    :try_start_9
    invoke-interface {v1}, Ljava/sql/Statement;->close()V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 119
    :catch_5
    :cond_8
    :try_start_a
    throw p1
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected specifyColumn(Ljava/sql/PreparedStatement;ILorg/apache/log/LogEvent;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 48
    invoke-virtual {p0, p2}, Lorg/apache/log/output/db/NormalizedJDBCTarget;->getColumn(I)Lorg/apache/log/output/db/ColumnInfo;

    move-result-object v0

    .line 52
    invoke-virtual {v0}, Lorg/apache/log/output/db/ColumnInfo;->getType()I

    move-result v0

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    .line 67
    invoke-super {p0, p1, p2, p3}, Lorg/apache/log/output/db/DefaultJDBCTarget;->specifyColumn(Ljava/sql/PreparedStatement;ILorg/apache/log/LogEvent;)V

    goto :goto_0

    .line 61
    :cond_0
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/log/output/db/NormalizedJDBCTarget;->getTable()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "priority"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "_SET"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 62
    iget-object v1, p0, Lorg/apache/log/output/db/NormalizedJDBCTarget;->m_priorityIDs:Ljava/util/HashMap;

    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getPriority()Lorg/apache/log/Priority;

    move-result-object p3

    invoke-virtual {p3}, Lorg/apache/log/Priority;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/log/output/db/NormalizedJDBCTarget;->getID(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)I

    move-result p3

    add-int/lit8 p2, p2, 0x1

    .line 63
    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setInt(II)V

    goto :goto_0

    .line 55
    :cond_1
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Lorg/apache/log/output/db/NormalizedJDBCTarget;->getTable()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "category"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "_SET"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 56
    iget-object v1, p0, Lorg/apache/log/output/db/NormalizedJDBCTarget;->m_categoryIDs:Ljava/util/HashMap;

    invoke-virtual {p3}, Lorg/apache/log/LogEvent;->getCategory()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p0, v0, v1, p3}, Lorg/apache/log/output/db/NormalizedJDBCTarget;->getID(Ljava/lang/String;Ljava/util/HashMap;Ljava/lang/String;)I

    move-result p3

    add-int/lit8 p2, p2, 0x1

    .line 57
    invoke-interface {p1, p2, p3}, Ljava/sql/PreparedStatement;->setInt(II)V

    :goto_0
    return-void
.end method
