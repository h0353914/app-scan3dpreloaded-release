.class public Lorg/apache/log/output/ServletOutputLogTarget;
.super Lorg/apache/log/output/DefaultOutputLogTarget;
.source "ServletOutputLogTarget.java"


# instance fields
.field private m_context:Ljavax/servlet/ServletContext;


# direct methods
.method public constructor <init>(Ljavax/servlet/ServletContext;)V
    .locals 0

    .line 24
    invoke-direct {p0}, Lorg/apache/log/output/DefaultOutputLogTarget;-><init>()V

    .line 25
    iput-object p1, p0, Lorg/apache/log/output/ServletOutputLogTarget;->m_context:Ljavax/servlet/ServletContext;

    .line 26
    invoke-virtual {p0}, Lorg/apache/log/output/ServletOutputLogTarget;->open()V

    return-void
.end method


# virtual methods
.method public declared-synchronized close()V
    .locals 1

    monitor-enter p0

    .line 52
    :try_start_0
    invoke-super {p0}, Lorg/apache/log/output/DefaultOutputLogTarget;->close()V

    const/4 v0, 0x0

    .line 54
    iput-object v0, p0, Lorg/apache/log/output/ServletOutputLogTarget;->m_context:Ljavax/servlet/ServletContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected write(Ljava/lang/String;)V
    .locals 1

    .line 36
    iget-object v0, p0, Lorg/apache/log/output/ServletOutputLogTarget;->m_context:Ljavax/servlet/ServletContext;

    if-eqz v0, :cond_0

    .line 39
    monitor-enter v0

    .line 41
    :try_start_0
    invoke-interface {v0, p1}, Ljavax/servlet/ServletContext;->log(Ljava/lang/String;)V

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    .line 42
    monitor-exit v0

    throw p1

    :cond_0
    :goto_0
    return-void
.end method
