.class Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;
.super Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;
.source "SendQueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SendMessageBatchTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask<",
        "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
        "Lcom/amazonaws/services/sqs/model/SendMessageResult;",
        ">;"
    }
.end annotation


# instance fields
.field batchSizeBytes:I

.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;


# direct methods
.method private constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V
    .locals 0

    .line 457
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V

    const/4 p1, 0x0

    .line 459
    iput p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->batchSizeBytes:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;)V
    .locals 0

    .line 457
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V

    return-void
.end method


# virtual methods
.method declared-synchronized isFull()Z
    .locals 4

    monitor-enter p0

    .line 476
    :try_start_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->batchSizeBytes:I

    int-to-long v0, v0

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 477
    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSizeBytes()J

    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    .line 476
    :goto_1
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected bridge synthetic isOkToAdd(Lcom/amazonaws/AmazonWebServiceRequest;)Z
    .locals 0

    .line 457
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->isOkToAdd(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Z

    move-result p1

    return p1
.end method

.method protected declared-synchronized isOkToAdd(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Z
    .locals 4

    monitor-enter p0

    .line 463
    :try_start_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSize()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 465
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    iget v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->batchSizeBytes:I

    add-int/2addr p1, v0

    int-to-long v0, p1

    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    move-result-object p1

    .line 466
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxBatchSizeBytes()J

    move-result-wide v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 463
    :goto_0
    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected bridge synthetic onRequestAdded(Lcom/amazonaws/AmazonWebServiceRequest;)V
    .locals 0

    .line 457
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->onRequestAdded(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)V

    return-void
.end method

.method protected onRequestAdded(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)V
    .locals 1

    .line 471
    iget v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->batchSizeBytes:I

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    array-length p1, p1

    add-int/2addr v0, p1

    iput v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->batchSizeBytes:I

    return-void
.end method

.method process()V
    .locals 6

    .line 482
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 485
    :cond_0
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;-><init>()V

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 486
    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;->withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;

    move-result-object v0

    .line 487
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 489
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    .line 490
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    .line 491
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_1

    .line 492
    new-instance v4, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    invoke-direct {v4}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;-><init>()V

    .line 493
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    move-result-object v4

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    .line 494
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->withMessageBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    move-result-object v4

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    .line 495
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->withDelaySeconds(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    move-result-object v4

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    .line 496
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->withMessageAttributes(Ljava/util/Map;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    move-result-object v4

    .line 492
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 497
    :cond_1
    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 499
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v1

    .line 500
    invoke-interface {v1, v0}, Lcom/amazonaws/services/sqs/AmazonSQS;->sendMessageBatch(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    move-result-object v0

    .line 503
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v1

    .line 502
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;

    .line 504
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 505
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-static {v2}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->convert(Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;)Lcom/amazonaws/services/sqs/model/SendMessageResult;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setSuccess(Ljava/lang/Object;)V

    goto :goto_1

    .line 508
    :cond_2
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;->getFailed()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;

    .line 509
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 510
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->isSenderFault()Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 511
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->convert(Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;)Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_2

    .line 516
    :cond_3
    :try_start_0
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v3}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v3

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-interface {v3, v4}, Lcom/amazonaws/services/sqs/AmazonSQS;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 518
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v2, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_2

    :cond_4
    return-void
.end method
