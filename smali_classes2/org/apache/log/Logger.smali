.class public Lorg/apache/log/Logger;
.super Ljava/lang/Object;
.source "Logger.java"


# static fields
.field public static final CATEGORY_SEPARATOR:C = '.'


# instance fields
.field private m_additivity:Z

.field private final m_category:Ljava/lang/String;

.field private m_children:[Lorg/apache/log/Logger;

.field private final m_errorHandler:Lorg/apache/log/ErrorHandler;

.field private m_logTargets:[Lorg/apache/log/LogTarget;

.field private m_logTargetsForceSet:Z

.field private final m_parent:Lorg/apache/log/Logger;

.field private m_priority:Lorg/apache/log/Priority;

.field private m_priorityForceSet:Z


# direct methods
.method constructor <init>(Lorg/apache/log/ErrorHandler;Ljava/lang/String;[Lorg/apache/log/LogTarget;Lorg/apache/log/Logger;)V
    .locals 0

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    iput-object p1, p0, Lorg/apache/log/Logger;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    .line 65
    iput-object p2, p0, Lorg/apache/log/Logger;->m_category:Ljava/lang/String;

    .line 66
    iput-object p3, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    .line 67
    iput-object p4, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    .line 69
    iget-object p1, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    if-nez p1, :cond_0

    .line 71
    invoke-virtual {p0}, Lorg/apache/log/Logger;->unsetLogTargets()V

    .line 74
    :cond_0
    invoke-virtual {p0}, Lorg/apache/log/Logger;->unsetPriority()V

    return-void
.end method

.method private final fireEvent(Lorg/apache/log/LogEvent;[Lorg/apache/log/LogTarget;)V
    .locals 2

    const/4 v0, 0x0

    .line 586
    :goto_0
    array-length v1, p2

    if-lt v0, v1, :cond_0

    return-void

    .line 590
    :cond_0
    aget-object v1, p2, v0

    invoke-interface {v1, p1}, Lorg/apache/log/LogTarget;->processEvent(Lorg/apache/log/LogEvent;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private final output(Lorg/apache/log/LogEvent;)V
    .locals 3

    .line 556
    iget-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    if-nez v0, :cond_0

    .line 560
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "LogTarget is null for category \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    iget-object v1, p0, Lorg/apache/log/Logger;->m_category:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    .line 561
    iget-object v1, p0, Lorg/apache/log/Logger;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2, p1}, Lorg/apache/log/ErrorHandler;->error(Ljava/lang/String;Ljava/lang/Throwable;Lorg/apache/log/LogEvent;)V

    goto :goto_0

    .line 563
    :cond_0
    iget-boolean v1, p0, Lorg/apache/log/Logger;->m_additivity:Z

    if-nez v1, :cond_1

    .line 565
    invoke-direct {p0, p1, v0}, Lorg/apache/log/Logger;->fireEvent(Lorg/apache/log/LogEvent;[Lorg/apache/log/LogTarget;)V

    goto :goto_0

    .line 571
    :cond_1
    iget-boolean v1, p0, Lorg/apache/log/Logger;->m_logTargetsForceSet:Z

    if-eqz v1, :cond_2

    .line 573
    invoke-direct {p0, p1, v0}, Lorg/apache/log/Logger;->fireEvent(Lorg/apache/log/LogEvent;[Lorg/apache/log/LogTarget;)V

    .line 577
    :cond_2
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    if-eqz v0, :cond_3

    .line 579
    invoke-direct {v0, p1}, Lorg/apache/log/Logger;->output(Lorg/apache/log/LogEvent;)V

    :cond_3
    :goto_0
    return-void
.end method

.method private final output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 3

    .line 527
    new-instance v0, Lorg/apache/log/LogEvent;

    invoke-direct {v0}, Lorg/apache/log/LogEvent;-><init>()V

    .line 528
    iget-object v1, p0, Lorg/apache/log/Logger;->m_category:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lorg/apache/log/LogEvent;->setCategory(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 529
    invoke-static {v1}, Lorg/apache/log/ContextStack;->getCurrentContext(Z)Lorg/apache/log/ContextStack;

    move-result-object v2

    invoke-virtual {v0, v2}, Lorg/apache/log/LogEvent;->setContextStack(Lorg/apache/log/ContextStack;)V

    .line 530
    invoke-static {v1}, Lorg/apache/log/ContextMap;->getCurrentContext(Z)Lorg/apache/log/ContextMap;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/log/LogEvent;->setContextMap(Lorg/apache/log/ContextMap;)V

    if-eqz p2, :cond_0

    .line 534
    invoke-virtual {v0, p2}, Lorg/apache/log/LogEvent;->setMessage(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 538
    invoke-virtual {v0, p2}, Lorg/apache/log/LogEvent;->setMessage(Ljava/lang/String;)V

    .line 541
    :goto_0
    invoke-virtual {v0, p3}, Lorg/apache/log/LogEvent;->setThrowable(Ljava/lang/Throwable;)V

    .line 542
    invoke-virtual {v0, p1}, Lorg/apache/log/LogEvent;->setPriority(Lorg/apache/log/Priority;)V

    .line 546
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-virtual {v0, p1, p2}, Lorg/apache/log/LogEvent;->setTime(J)V

    .line 548
    invoke-direct {p0, v0}, Lorg/apache/log/Logger;->output(Lorg/apache/log/LogEvent;)V

    return-void
.end method

.method private declared-synchronized resetChildLogTargets(Z)V
    .locals 2

    monitor-enter p0

    .line 662
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 664
    :goto_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    array-length v1, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt v0, v1, :cond_1

    .line 668
    monitor-exit p0

    return-void

    .line 666
    :cond_1
    :try_start_2
    iget-object v1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    aget-object v1, v1, v0

    invoke-direct {v1, p1}, Lorg/apache/log/Logger;->resetLogTargets(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized resetChildPriorities(Z)V
    .locals 3

    monitor-enter p0

    .line 599
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    .line 601
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    const/4 v1, 0x0

    .line 603
    :goto_0
    array-length v2, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt v1, v2, :cond_1

    .line 607
    monitor-exit p0

    return-void

    .line 605
    :cond_1
    :try_start_2
    aget-object v2, v0, v1

    invoke-direct {v2, p1}, Lorg/apache/log/Logger;->resetPriority(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized resetLogTargets(Z)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 697
    :try_start_0
    iput-boolean v0, p0, Lorg/apache/log/Logger;->m_logTargetsForceSet:Z

    goto :goto_0

    .line 699
    :cond_0
    iget-boolean v0, p0, Lorg/apache/log/Logger;->m_logTargetsForceSet:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    .line 701
    monitor-exit p0

    return-void

    .line 704
    :cond_1
    :goto_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    invoke-direct {v0}, Lorg/apache/log/Logger;->safeGetLogTargets()[Lorg/apache/log/LogTarget;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    .line 705
    invoke-direct {p0, p1}, Lorg/apache/log/Logger;->resetChildLogTargets(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 706
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized resetPriority(Z)V
    .locals 1

    monitor-enter p0

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    .line 619
    :try_start_0
    iput-boolean v0, p0, Lorg/apache/log/Logger;->m_priorityForceSet:Z

    goto :goto_0

    .line 621
    :cond_0
    iget-boolean v0, p0, Lorg/apache/log/Logger;->m_priorityForceSet:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_1

    .line 623
    monitor-exit p0

    return-void

    .line 626
    :cond_1
    :goto_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/Logger;->m_priority:Lorg/apache/log/Priority;

    .line 627
    invoke-direct {p0, p1}, Lorg/apache/log/Logger;->resetChildPriorities(Z)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 628
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized safeGetLogTargets()[Lorg/apache/log/LogTarget;
    .locals 3

    monitor-enter p0

    .line 639
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    .line 641
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    if-nez v0, :cond_0

    new-array v0, v1, [Lorg/apache/log/LogTarget;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 642
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    invoke-direct {v0}, Lorg/apache/log/Logger;->safeGetLogTargets()[Lorg/apache/log/LogTarget;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0

    .line 646
    :cond_1
    :try_start_2
    iget-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    array-length v0, v0

    new-array v0, v0, [Lorg/apache/log/LogTarget;

    .line 648
    :goto_0
    array-length v2, v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-lt v1, v2, :cond_2

    .line 653
    monitor-exit p0

    return-object v0

    .line 650
    :cond_2
    :try_start_3
    iget-object v2, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    aget-object v2, v2, v1

    aput-object v2, v0, v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized setupErrorHandlers()V
    .locals 3

    monitor-enter p0

    .line 675
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 677
    :goto_0
    :try_start_1
    iget-object v1, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    array-length v1, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt v0, v1, :cond_1

    .line 685
    monitor-exit p0

    return-void

    .line 679
    :cond_1
    :try_start_2
    iget-object v1, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    aget-object v1, v1, v0

    .line 680
    instance-of v2, v1, Lorg/apache/log/ErrorAware;

    if-eqz v2, :cond_2

    .line 682
    check-cast v1, Lorg/apache/log/ErrorAware;

    iget-object v2, p0, Lorg/apache/log/Logger;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    invoke-interface {v1, v2}, Lorg/apache/log/ErrorAware;->setErrorHandler(Lorg/apache/log/ErrorHandler;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public final debug(Ljava/lang/String;)V
    .locals 2

    .line 108
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    sget-object v0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 95
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 97
    sget-object v0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final error(Ljava/lang/String;)V
    .locals 2

    .line 218
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isErrorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 220
    sget-object v0, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 205
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isErrorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    sget-object v0, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final fatalError(Ljava/lang/String;)V
    .locals 2

    .line 255
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isFatalErrorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 257
    sget-object v0, Lorg/apache/log/Priority;->FATAL_ERROR:Lorg/apache/log/Priority;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final fatalError(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 242
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isFatalErrorEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 244
    sget-object v0, Lorg/apache/log/Priority;->FATAL_ERROR:Lorg/apache/log/Priority;

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final getCategory()Ljava/lang/String;
    .locals 1

    .line 500
    iget-object v0, p0, Lorg/apache/log/Logger;->m_category:Ljava/lang/String;

    return-object v0
.end method

.method public declared-synchronized getChildLogger(Ljava/lang/String;)Lorg/apache/log/Logger;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    monitor-enter p0

    const/16 v0, 0x2e

    .line 417
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-ne v2, v1, :cond_0

    move-object v1, v3

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_8

    .line 430
    invoke-virtual {p1, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    add-int/2addr v1, v4

    .line 431
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    move-object v1, p1

    move-object p1, v2

    .line 436
    :goto_0
    iget-object v2, p0, Lorg/apache/log/Logger;->m_category:Ljava/lang/String;

    const-string v6, ""

    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 439
    :cond_1
    new-instance v2, Ljava/lang/StringBuffer;

    invoke-direct {v2}, Ljava/lang/StringBuffer;-><init>()V

    iget-object v6, p0, Lorg/apache/log/Logger;->m_category:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object p1

    .line 444
    :goto_1
    iget-object v0, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    if-eqz v0, :cond_5

    move v0, v5

    .line 446
    :goto_2
    iget-object v2, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    array-length v2, v2

    if-lt v0, v2, :cond_2

    goto :goto_3

    .line 448
    :cond_2
    iget-object v2, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lorg/apache/log/Logger;->getCategory()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    if-nez v1, :cond_3

    .line 450
    iget-object p1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    aget-object p1, p1, v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 451
    :cond_3
    :try_start_1
    iget-object p1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    aget-object p1, p1, v0

    invoke-virtual {p1, v1}, Lorg/apache/log/Logger;->getChildLogger(Ljava/lang/String;)Lorg/apache/log/Logger;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 457
    :cond_5
    :goto_3
    :try_start_2
    new-instance v0, Lorg/apache/log/Logger;

    iget-object v2, p0, Lorg/apache/log/Logger;->m_errorHandler:Lorg/apache/log/ErrorHandler;

    invoke-direct {v0, v2, p1, v3, p0}, Lorg/apache/log/Logger;-><init>(Lorg/apache/log/ErrorHandler;Ljava/lang/String;[Lorg/apache/log/LogTarget;Lorg/apache/log/Logger;)V

    .line 460
    iget-object p1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    if-nez p1, :cond_6

    .line 462
    new-array p1, v4, [Lorg/apache/log/Logger;

    aput-object v0, p1, v5

    iput-object p1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    goto :goto_4

    .line 466
    :cond_6
    iget-object p1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    array-length p1, p1

    add-int/2addr p1, v4

    new-array p1, p1, [Lorg/apache/log/Logger;

    .line 467
    iget-object v2, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    iget-object v3, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    array-length v3, v3

    invoke-static {v2, v5, p1, v5, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 468
    iget-object v2, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    array-length v2, v2

    aput-object v0, p1, v2

    .line 469
    iput-object p1, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_4
    if-nez v1, :cond_7

    .line 472
    monitor-exit p0

    return-object v0

    .line 473
    :cond_7
    :try_start_3
    invoke-virtual {v0, v1}, Lorg/apache/log/Logger;->getChildLogger(Ljava/lang/String;)Lorg/apache/log/Logger;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-object p1

    .line 427
    :cond_8
    :try_start_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Logger categories MUST not have empty elements"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getChildren()[Lorg/apache/log/Logger;
    .locals 3

    monitor-enter p0

    .line 394
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    new-array v0, v1, [Lorg/apache/log/Logger;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 396
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    array-length v0, v0

    new-array v0, v0, [Lorg/apache/log/Logger;

    .line 398
    :goto_0
    array-length v2, v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-lt v1, v2, :cond_1

    .line 403
    monitor-exit p0

    return-object v0

    .line 400
    :cond_1
    :try_start_2
    iget-object v2, p0, Lorg/apache/log/Logger;->m_children:[Lorg/apache/log/Logger;

    aget-object v2, v2, v1

    aput-object v2, v0, v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getLogTargets()[Lorg/apache/log/LogTarget;
    .locals 1

    const/4 v0, 0x0

    .line 513
    new-array v0, v0, [Lorg/apache/log/LogTarget;

    return-object v0
.end method

.method public final getPriority()Lorg/apache/log/Priority;
    .locals 1

    .line 487
    iget-object v0, p0, Lorg/apache/log/Logger;->m_priority:Lorg/apache/log/Priority;

    return-object v0
.end method

.method public final info(Ljava/lang/String;)V
    .locals 2

    .line 144
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isInfoEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    sget-object v0, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 131
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isInfoEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 133
    sget-object v0, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final isDebugEnabled()Z
    .locals 2

    .line 84
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    return v0
.end method

.method public final isErrorEnabled()Z
    .locals 2

    .line 194
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->ERROR:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    return v0
.end method

.method public final isFatalErrorEnabled()Z
    .locals 2

    .line 231
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->FATAL_ERROR:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    return v0
.end method

.method public final isInfoEnabled()Z
    .locals 2

    .line 121
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->INFO:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    return v0
.end method

.method public final isPriorityEnabled(Lorg/apache/log/Priority;)Z
    .locals 1

    .line 282
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result p1

    return p1
.end method

.method public final isWarnEnabled()Z
    .locals 2

    .line 157
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    sget-object v1, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    invoke-virtual {v0, v1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    return v0
.end method

.method public final log(Lorg/apache/log/Priority;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 310
    invoke-virtual {p0, p1, p2, v0}, Lorg/apache/log/Logger;->log(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public final log(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 296
    invoke-virtual {p0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/apache/log/Priority;->isLowerOrEqual(Lorg/apache/log/Priority;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 298
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final setAdditivity(Z)V
    .locals 0

    .line 272
    iput-boolean p1, p0, Lorg/apache/log/Logger;->m_additivity:Z

    return-void
.end method

.method public declared-synchronized setLogTargets([Lorg/apache/log/LogTarget;)V
    .locals 0

    monitor-enter p0

    .line 357
    :try_start_0
    iput-object p1, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    .line 358
    invoke-direct {p0}, Lorg/apache/log/Logger;->setupErrorHandlers()V

    const/4 p1, 0x1

    .line 359
    iput-boolean p1, p0, Lorg/apache/log/Logger;->m_logTargetsForceSet:Z

    const/4 p1, 0x0

    .line 360
    invoke-direct {p0, p1}, Lorg/apache/log/Logger;->resetChildLogTargets(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 361
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setPriority(Lorg/apache/log/Priority;)V
    .locals 0

    monitor-enter p0

    .line 320
    :try_start_0
    iput-object p1, p0, Lorg/apache/log/Logger;->m_priority:Lorg/apache/log/Priority;

    const/4 p1, 0x1

    .line 321
    iput-boolean p1, p0, Lorg/apache/log/Logger;->m_priorityForceSet:Z

    const/4 p1, 0x0

    .line 322
    invoke-direct {p0, p1}, Lorg/apache/log/Logger;->resetChildPriorities(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 323
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized unsetLogTargets()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 370
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/apache/log/Logger;->unsetLogTargets(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 371
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unsetLogTargets(Z)V
    .locals 1

    monitor-enter p0

    .line 380
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    invoke-direct {v0}, Lorg/apache/log/Logger;->safeGetLogTargets()[Lorg/apache/log/LogTarget;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 381
    iput-object v0, p0, Lorg/apache/log/Logger;->m_logTargets:[Lorg/apache/log/LogTarget;

    :goto_0
    const/4 v0, 0x0

    .line 383
    iput-boolean v0, p0, Lorg/apache/log/Logger;->m_logTargetsForceSet:Z

    .line 384
    invoke-direct {p0, p1}, Lorg/apache/log/Logger;->resetChildLogTargets(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized unsetPriority()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x0

    .line 331
    :try_start_0
    invoke-virtual {p0, v0}, Lorg/apache/log/Logger;->unsetPriority(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 332
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unsetPriority(Z)V
    .locals 1

    monitor-enter p0

    .line 343
    :try_start_0
    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lorg/apache/log/Logger;->m_parent:Lorg/apache/log/Logger;

    invoke-virtual {v0}, Lorg/apache/log/Logger;->getPriority()Lorg/apache/log/Priority;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/log/Logger;->m_priority:Lorg/apache/log/Priority;

    goto :goto_0

    .line 344
    :cond_0
    sget-object v0, Lorg/apache/log/Priority;->DEBUG:Lorg/apache/log/Priority;

    iput-object v0, p0, Lorg/apache/log/Logger;->m_priority:Lorg/apache/log/Priority;

    :goto_0
    const/4 v0, 0x0

    .line 346
    iput-boolean v0, p0, Lorg/apache/log/Logger;->m_priorityForceSet:Z

    .line 347
    invoke-direct {p0, p1}, Lorg/apache/log/Logger;->resetChildPriorities(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 348
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public final warn(Ljava/lang/String;)V
    .locals 2

    .line 181
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 183
    sget-object v0, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method public final warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 168
    invoke-virtual {p0}, Lorg/apache/log/Logger;->isWarnEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    sget-object v0, Lorg/apache/log/Priority;->WARN:Lorg/apache/log/Priority;

    invoke-direct {p0, v0, p1, p2}, Lorg/apache/log/Logger;->output(Lorg/apache/log/Priority;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method
