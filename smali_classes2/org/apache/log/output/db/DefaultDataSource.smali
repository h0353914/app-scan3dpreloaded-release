.class public Lorg/apache/log/output/db/DefaultDataSource;
.super Ljava/lang/Object;
.source "DefaultDataSource.java"

# interfaces
.implements Ljavax/sql/DataSource;


# instance fields
.field private m_logWriter:Ljava/io/PrintWriter;

.field private m_loginTimeout:I

.field private final m_password:Ljava/lang/String;

.field private final m_url:Ljava/lang/String;

.field private final m_username:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p1, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_url:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_username:Ljava/lang/String;

    .line 38
    iput-object p3, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_password:Ljava/lang/String;

    .line 40
    new-instance p1, Ljava/io/PrintWriter;

    sget-object p2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    const/4 p3, 0x1

    invoke-direct {p1, p2, p3}, Ljava/io/PrintWriter;-><init>(Ljava/io/OutputStream;Z)V

    iput-object p1, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_logWriter:Ljava/io/PrintWriter;

    return-void
.end method


# virtual methods
.method public getConnection()Ljava/sql/Connection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_username:Ljava/lang/String;

    iget-object v1, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_password:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lorg/apache/log/output/db/DefaultDataSource;->getConnection(Ljava/lang/String;Ljava/lang/String;)Ljava/sql/Connection;

    move-result-object v0

    return-object v0
.end method

.method public getConnection(Ljava/lang/String;Ljava/lang/String;)Ljava/sql/Connection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 62
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_url:Ljava/lang/String;

    invoke-static {v0, p1, p2}, Ljava/sql/DriverManager;->getConnection(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/sql/Connection;

    move-result-object p1

    return-object p1
.end method

.method public getLogWriter()Ljava/io/PrintWriter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 85
    iget-object v0, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_logWriter:Ljava/io/PrintWriter;

    return-object v0
.end method

.method public getLoginTimeout()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 74
    iget v0, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_loginTimeout:I

    return v0
.end method

.method public setLogWriter(Ljava/io/PrintWriter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 103
    iput-object p1, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_logWriter:Ljava/io/PrintWriter;

    return-void
.end method

.method public setLoginTimeout(I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/sql/SQLException;
        }
    .end annotation

    .line 97
    iput p1, p0, Lorg/apache/log/output/db/DefaultDataSource;->m_loginTimeout:I

    return-void
.end method
