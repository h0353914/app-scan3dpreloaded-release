.class Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;
.super Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;
.source "SendQueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeleteMessageBatchTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask<",
        "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;


# direct methods
.method private constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V
    .locals 0

    .line 527
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;)V
    .locals 0

    .line 527
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 6

    .line 532
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 535
    :cond_0
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;-><init>()V

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 536
    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;

    move-result-object v0

    .line 537
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 539
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->requests:Ljava/util/List;

    .line 540
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    .line 541
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_1

    .line 542
    new-instance v4, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;

    invoke-direct {v4}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;-><init>()V

    .line 543
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    .line 542
    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;->withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;

    move-result-object v4

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->requests:Ljava/util/List;

    .line 544
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v5

    .line 543
    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;->withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;

    move-result-object v4

    .line 542
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 545
    :cond_1
    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 547
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v1

    .line 548
    invoke-interface {v1, v0}, Lcom/amazonaws/services/sqs/AmazonSQS;->deleteMessageBatch(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;

    move-result-object v0

    .line 551
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v1

    .line 550
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResultEntry;

    .line 552
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 553
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v2, v3}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setSuccess(Ljava/lang/Object;)V

    goto :goto_1

    .line 556
    :cond_2
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;->getFailed()Ljava/util/List;

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

    .line 557
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 558
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->isSenderFault()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 559
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->convert(Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;)Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_2

    .line 563
    :cond_3
    :try_start_0
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v1

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->requests:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    invoke-interface {v1, v4}, Lcom/amazonaws/services/sqs/AmazonSQS;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V

    .line 564
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v1, v3}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 566
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v2, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_2

    :cond_4
    return-void
.end method
