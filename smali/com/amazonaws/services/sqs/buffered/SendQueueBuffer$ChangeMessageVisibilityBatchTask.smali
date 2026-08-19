.class Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;
.super Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;
.source "SendQueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ChangeMessageVisibilityBatchTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask<",
        "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;


# direct methods
.method private constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V
    .locals 0

    .line 573
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;)V
    .locals 0

    .line 573
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)V

    return-void
.end method


# virtual methods
.method process()V
    .locals 6

    .line 578
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->requests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 581
    :cond_0
    new-instance v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;-><init>()V

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 582
    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$400(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    move-result-object v0

    .line 583
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {v0, v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 585
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->requests:Ljava/util/List;

    .line 586
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    .line 587
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->requests:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    :goto_0
    if-ge v2, v3, :cond_1

    .line 588
    new-instance v4, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    invoke-direct {v4}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;-><init>()V

    .line 589
    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    move-result-object v4

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->requests:Ljava/util/List;

    .line 590
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    move-result-object v4

    iget-object v5, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->requests:Ljava/util/List;

    .line 592
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    invoke-virtual {v5}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v5

    .line 591
    invoke-virtual {v4, v5}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->withVisibilityTimeout(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    move-result-object v4

    .line 588
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 593
    :cond_1
    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 595
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v1

    .line 596
    invoke-interface {v1, v0}, Lcom/amazonaws/services/sqs/AmazonSQS;->changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;

    move-result-object v0

    .line 599
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v1

    .line 598
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;

    .line 600
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 601
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v2, v3}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setSuccess(Ljava/lang/Object;)V

    goto :goto_1

    .line 604
    :cond_2
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

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

    .line 605
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 606
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->isSenderFault()Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 607
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->convert(Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;)Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_2

    .line 611
    :cond_3
    :try_start_0
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->this$0:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object v1

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->requests:Ljava/util/List;

    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    invoke-interface {v1, v4}, Lcom/amazonaws/services/sqs/AmazonSQS;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V

    .line 612
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v1, v3}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setSuccess(Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 614
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;->futures:Ljava/util/ArrayList;

    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-virtual {v2, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_2

    :cond_4
    return-void
.end method
