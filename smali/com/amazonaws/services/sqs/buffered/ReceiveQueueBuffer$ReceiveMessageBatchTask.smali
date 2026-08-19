.class Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;
.super Ljava/lang/Object;
.source "ReceiveQueueBuffer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReceiveMessageBatchTask"
.end annotation


# instance fields
.field private exception:Ljava/lang/Exception;

.field private messages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/Message;",
            ">;"
        }
    .end annotation
.end field

.field private open:Z

.field private parentBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

.field private visibilityDeadlineNano:J


# direct methods
.method constructor <init>(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)V
    .locals 0

    .line 388
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 376
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->exception:Ljava/lang/Exception;

    const/4 p1, 0x0

    .line 379
    iput-boolean p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    .line 389
    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->parentBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    .line 390
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    return-void
.end method


# virtual methods
.method declared-synchronized clear()V
    .locals 8

    monitor-enter p0

    .line 446
    :try_start_0
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    if-eqz v0, :cond_2

    .line 449
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->visibilityDeadlineNano:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_1

    .line 450
    new-instance v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;-><init>()V

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    .line 451
    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$000(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    move-result-object v0

    .line 452
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 455
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    .line 456
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 459
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/Message;

    .line 461
    new-instance v6, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    invoke-direct {v6}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;-><init>()V

    .line 462
    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    move-result-object v6

    .line 463
    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    move-result-object v5

    .line 464
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->withVisibilityTimeout(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    move-result-object v5

    .line 461
    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 469
    :cond_0
    :try_start_1
    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 470
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$100(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v1

    invoke-interface {v1, v0}, Lcom/amazonaws/services/sqs/AmazonSQS;->changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    :try_end_1
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 473
    :try_start_2
    invoke-static {}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$200()Lorg/apache/commons/logging/Log;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ReceiveMessageBatchTask: changeMessageVisibility failed "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 476
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 477
    monitor-exit p0

    return-void

    .line 447
    :cond_2
    :try_start_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "batch is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getException()Ljava/lang/Exception;
    .locals 2

    monitor-enter p0

    .line 413
    :try_start_0
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    if-eqz v0, :cond_0

    .line 416
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->exception:Ljava/lang/Exception;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 414
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "batch is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized getSize()I
    .locals 2

    monitor-enter p0

    .line 394
    :try_start_0
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    if-eqz v0, :cond_0

    .line 397
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 395
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "batch is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized isEmpty()Z
    .locals 2

    monitor-enter p0

    .line 402
    :try_start_0
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    if-eqz v0, :cond_0

    .line 405
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 403
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "batch is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized removeMessage()Lcom/amazonaws/services/sqs/model/Message;
    .locals 4

    monitor-enter p0

    .line 427
    :try_start_0
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    if-eqz v0, :cond_2

    .line 431
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->visibilityDeadlineNano:J

    cmp-long v0, v0, v2

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 433
    monitor-exit p0

    return-object v1

    .line 436
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    .line 437
    monitor-exit p0

    return-object v1

    .line 439
    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/Message;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    .line 428
    :cond_2
    :try_start_3
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "batch is not open"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public run()V
    .locals 8

    const/4 v0, 0x1

    .line 487
    :try_start_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v3}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)J

    move-result-wide v3

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->visibilityDeadlineNano:J

    .line 488
    new-instance v1, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$000(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    .line 489
    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->withMaxNumberOfMessages(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    move-result-object v1

    .line 490
    sget-object v2, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {v1, v2}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 492
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getVisibilityTimeoutSeconds()I

    move-result v2

    if-lez v2, :cond_0

    .line 493
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getVisibilityTimeoutSeconds()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->setVisibilityTimeout(Ljava/lang/Integer;)V

    .line 494
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    .line 495
    invoke-static {v5}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getVisibilityTimeoutSeconds()I

    move-result v5

    int-to-long v5, v5

    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v4

    add-long/2addr v2, v4

    iput-wide v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->visibilityDeadlineNano:J

    .line 499
    :cond_0
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->isLongPoll()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 500
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getLongPollWaitTimeoutSeconds()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->withWaitTimeSeconds(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    .line 503
    :cond_1
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->access$100(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v2

    invoke-interface {v2, v1}, Lcom/amazonaws/services/sqs/AmazonSQS;->receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;->getMessages()Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->messages:Ljava/util/List;
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    .line 505
    :try_start_1
    iput-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->exception:Ljava/lang/Exception;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 508
    :goto_0
    iput-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    .line 509
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->parentBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-virtual {v0, p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->reportBatchFinished(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;)V

    return-void

    .line 508
    :goto_1
    iput-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->open:Z

    .line 509
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->parentBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-virtual {v0, p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->reportBatchFinished(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;)V

    throw v1
.end method
