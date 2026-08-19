.class public Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestMarshaller;
.super Ljava/lang/Object;
.source "DeleteMessageBatchRequestMarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Marshaller;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Marshaller<",
        "Lcom/amazonaws/Request<",
        "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
        ">;",
        "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public marshall(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/Request;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
            ")",
            "Lcom/amazonaws/Request<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 38
    new-instance v0, Lcom/amazonaws/DefaultRequest;

    const-string v1, "AmazonSQS"

    invoke-direct {v0, p1, v1}, Lcom/amazonaws/DefaultRequest;-><init>(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)V

    const-string v1, "Action"

    const-string v2, "DeleteMessageBatch"

    .line 40
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Version"

    const-string v2, "2012-11-05"

    .line 41
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, "QueueUrl"

    .line 46
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    .line 47
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "DeleteMessageBatchRequestEntry"

    .line 52
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->getEntries()Ljava/util/List;

    move-result-object p1

    .line 55
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;

    .line 56
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    if-eqz v3, :cond_1

    .line 58
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxMarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxMarshaller;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "."

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v3, v0, v4}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;Lcom/amazonaws/Request;Ljava/lang/String;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0

    .line 34
    :cond_3
    new-instance p1, Lcom/amazonaws/AmazonClientException;

    const-string v0, "Invalid argument passed to marshall(DeleteMessageBatchRequest)"

    invoke-direct {p1, v0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic marshall(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    check-cast p1, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/Request;

    move-result-object p1

    return-object p1
.end method
