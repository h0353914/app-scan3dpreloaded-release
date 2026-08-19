.class abstract Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;
.super Ljava/lang/Object;
.source "SendQueueBuffer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "OutboundBatchTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Lcom/amazonaws/AmazonWebServiceRequest;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field final futures:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "TR;TResult;>;>;"
        }
    .end annotation
.end field

.field volatile onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener<",
            "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask<",
            "TR;TResult;>;>;"
        }
    .end annotation
.end field

.field open:Ljava/util/concurrent/atomic/AtomicBoolean;

.field final requests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TR;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;


# direct methods
.method constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V
    .locals 2

    .line 340
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 337
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->open:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    .line 338
    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;

    .line 341
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->requests:Ljava/util/List;

    .line 342
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result p1

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->futures:Ljava/util/ArrayList;

    return-void
.end method

.method private failAll(Ljava/lang/Exception;)V
    .locals 2

    .line 451
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    .line 452
    invoke-virtual {v1, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method declared-synchronized addIfAllowed(Lcom/amazonaws/AmazonWebServiceRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "TR;TResult;>;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "TR;TResult;>;"
        }
    .end annotation

    monitor-enter p0

    .line 382
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->isOkToAdd(Lcom/amazonaws/AmazonWebServiceRequest;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 383
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 385
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-direct {v0, p2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;-><init>(Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)V

    .line 387
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onRequestAdded(Lcom/amazonaws/AmazonWebServiceRequest;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 389
    monitor-exit p0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    .line 391
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized addRequest(Lcom/amazonaws/AmazonWebServiceRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "TR;TResult;>;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "TR;TResult;>;"
        }
    .end annotation

    monitor-enter p0

    .line 353
    :try_start_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->open:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    .line 354
    monitor-exit p0

    return-object p1

    .line 356
    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->addIfAllowed(Lcom/amazonaws/AmazonWebServiceRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 360
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->isFull()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 361
    :cond_1
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->open:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 366
    :cond_2
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->open:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result p2

    if-nez p2, :cond_3

    .line 367
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 369
    :cond_3
    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized isFull()Z
    .locals 2

    monitor-enter p0

    .line 406
    :try_start_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected declared-synchronized isOkToAdd(Lcom/amazonaws/AmazonWebServiceRequest;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)Z"
        }
    .end annotation

    monitor-enter p0

    .line 395
    :try_start_0
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->requests:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected declared-synchronized onRequestAdded(Lcom/amazonaws/AmazonWebServiceRequest;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    monitor-enter p0

    .line 400
    monitor-exit p0

    return-void
.end method

.method abstract process()V
.end method

.method public declared-synchronized run()V
    .locals 8

    monitor-enter p0

    .line 417
    :try_start_0
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 419
    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchOpenMs()J

    move-result-wide v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    .line 420
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    .line 421
    :goto_0
    iget-object v6, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->open:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v6

    if-eqz v6, :cond_0

    cmp-long v4, v4, v0

    if-gez v4, :cond_0

    .line 422
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    sub-long v6, v0, v4

    .line 425
    invoke-static {v2, v3, v6, v7}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v6

    .line 426
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V

    goto :goto_0

    .line 429
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->open:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 430
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->process()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 444
    :try_start_1
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;

    if-eqz v0, :cond_1

    .line 446
    :goto_1
    invoke-interface {v0, p0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;->invoke(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 439
    :try_start_2
    new-instance v1, Lcom/amazonaws/AmazonClientException;

    const-string v2, "Error encountered"

    invoke-direct {v1, v2, v0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->failAll(Ljava/lang/Exception;)V

    .line 440
    throw v0

    :catch_1
    move-exception v0

    .line 436
    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->failAll(Ljava/lang/Exception;)V

    .line 437
    throw v0

    :catch_2
    move-exception v0

    .line 434
    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->failAll(Ljava/lang/Exception;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 444
    :try_start_3
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_1

    goto :goto_1

    :catch_3
    move-exception v0

    .line 432
    :try_start_4
    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->failAll(Ljava/lang/Exception;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 444
    :try_start_5
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v0, :cond_1

    goto :goto_1

    .line 448
    :cond_1
    :goto_2
    monitor-exit p0

    return-void

    .line 444
    :goto_3
    :try_start_6
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;

    if-eqz v1, :cond_2

    .line 446
    invoke-interface {v1, p0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;->invoke(Ljava/lang/Object;)V

    .line 447
    :cond_2
    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v0

    monitor-exit p0

    throw v0
.end method
