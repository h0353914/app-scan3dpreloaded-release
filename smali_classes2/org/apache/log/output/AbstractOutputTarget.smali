.class public abstract Lorg/apache/log/output/AbstractOutputTarget;
.super Lorg/apache/log/output/AbstractTarget;
.source "AbstractOutputTarget.java"


# instance fields
.field protected m_formatter:Lorg/apache/log/format/Formatter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 36
    invoke-direct {p0}, Lorg/apache/log/output/AbstractTarget;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/apache/log/format/Formatter;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lorg/apache/log/output/AbstractTarget;-><init>()V

    .line 41
    iput-object p1, p0, Lorg/apache/log/output/AbstractOutputTarget;->m_formatter:Lorg/apache/log/format/Formatter;

    return-void
.end method

.method private format(Lorg/apache/log/LogEvent;)Ljava/lang/String;
    .locals 1

    .line 131
    iget-object v0, p0, Lorg/apache/log/output/AbstractOutputTarget;->m_formatter:Lorg/apache/log/format/Formatter;

    if-eqz v0, :cond_0

    .line 133
    invoke-interface {v0, p1}, Lorg/apache/log/format/Formatter;->format(Lorg/apache/log/LogEvent;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 137
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getHead()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method private getTail()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method private writeHead()V
    .locals 1

    .line 147
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractOutputTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 149
    :cond_0
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;->getHead()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 152
    invoke-virtual {p0, v0}, Lorg/apache/log/output/AbstractOutputTarget;->write(Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method private writeTail()V
    .locals 1

    .line 162
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractOutputTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 164
    :cond_0
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;->getTail()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 167
    invoke-virtual {p0, v0}, Lorg/apache/log/output/AbstractOutputTarget;->write(Ljava/lang/String;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 116
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractOutputTarget;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;->writeTail()V

    .line 119
    invoke-super {p0}, Lorg/apache/log/output/AbstractTarget;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 121
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected doProcessEvent(Lorg/apache/log/LogEvent;)V
    .locals 0

    .line 92
    invoke-direct {p0, p1}, Lorg/apache/log/output/AbstractOutputTarget;->format(Lorg/apache/log/LogEvent;)Ljava/lang/String;

    move-result-object p1

    .line 93
    invoke-virtual {p0, p1}, Lorg/apache/log/output/AbstractOutputTarget;->write(Ljava/lang/String;)V

    return-void
.end method

.method public declared-synchronized getFormatter()Lorg/apache/log/format/Formatter;
    .locals 1

    monitor-enter p0

    .line 53
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/output/AbstractOutputTarget;->m_formatter:Lorg/apache/log/format/Formatter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized open()V
    .locals 1

    monitor-enter p0

    .line 102
    :try_start_0
    invoke-virtual {p0}, Lorg/apache/log/output/AbstractOutputTarget;->isOpen()Z

    move-result v0

    if-nez v0, :cond_0

    .line 104
    invoke-super {p0}, Lorg/apache/log/output/AbstractTarget;->open()V

    .line 105
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;->writeHead()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 107
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected output(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public declared-synchronized setFormatter(Lorg/apache/log/format/Formatter;)V
    .locals 0

    monitor-enter p0

    .line 64
    :try_start_0
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;->writeTail()V

    .line 65
    iput-object p1, p0, Lorg/apache/log/output/AbstractOutputTarget;->m_formatter:Lorg/apache/log/format/Formatter;

    .line 66
    invoke-direct {p0}, Lorg/apache/log/output/AbstractOutputTarget;->writeHead()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected write(Ljava/lang/String;)V
    .locals 0

    .line 76
    invoke-virtual {p0, p1}, Lorg/apache/log/output/AbstractOutputTarget;->output(Ljava/lang/String;)V

    return-void
.end method
