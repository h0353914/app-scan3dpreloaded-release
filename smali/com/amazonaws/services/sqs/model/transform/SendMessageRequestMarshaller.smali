.class public Lcom/amazonaws/services/sqs/model/transform/SendMessageRequestMarshaller;
.super Ljava/lang/Object;
.source "SendMessageRequestMarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Marshaller;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Marshaller<",
        "Lcom/amazonaws/Request<",
        "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
        ">;",
        "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
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
.method public marshall(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/Request;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            ")",
            "Lcom/amazonaws/Request<",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_8

    .line 37
    new-instance v0, Lcom/amazonaws/DefaultRequest;

    const-string v1, "AmazonSQS"

    invoke-direct {v0, p1, v1}, Lcom/amazonaws/DefaultRequest;-><init>(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)V

    const-string v1, "Action"

    const-string v2, "SendMessage"

    .line 39
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Version"

    const-string v2, "2012-11-05"

    .line 40
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, "QueueUrl"

    .line 45
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    .line 46
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "MessageBody"

    .line 50
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    .line 51
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    :cond_1
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "DelaySeconds"

    .line 55
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    .line 56
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromInteger(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    :cond_2
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_5

    const-string v1, "MessageAttribute"

    .line 61
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    .line 63
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 65
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    .line 64
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x1

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 66
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 67
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_3

    .line 68
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ".Name"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 69
    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 68
    invoke-interface {v0, v6, v7}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, ".Value"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 72
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 74
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;

    .line 75
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxMarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxMarshaller;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "."

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v4, v0, v5}, Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/MessageAttributeValue;Lcom/amazonaws/Request;Ljava/lang/String;)V

    :cond_4
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 82
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    const-string v1, "MessageDeduplicationId"

    .line 84
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    .line 85
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_7

    const-string v1, "MessageGroupId"

    .line 89
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object p1

    .line 90
    invoke-static {p1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    return-object v0

    .line 33
    :cond_8
    new-instance p1, Lcom/amazonaws/AmazonClientException;

    const-string v0, "Invalid argument passed to marshall(SendMessageRequest)"

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
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/Request;

    move-result-object p1

    return-object p1
.end method
