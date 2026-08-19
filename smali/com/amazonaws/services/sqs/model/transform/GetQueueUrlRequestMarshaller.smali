.class public Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlRequestMarshaller;
.super Ljava/lang/Object;
.source "GetQueueUrlRequestMarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Marshaller;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Marshaller<",
        "Lcom/amazonaws/Request<",
        "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
        ">;",
        "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
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
.method public marshall(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/Request;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
            ")",
            "Lcom/amazonaws/Request<",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 37
    new-instance v0, Lcom/amazonaws/DefaultRequest;

    const-string v1, "AmazonSQS"

    invoke-direct {v0, p1, v1}, Lcom/amazonaws/DefaultRequest;-><init>(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)V

    const-string v1, "Action"

    const-string v2, "GetQueueUrl"

    .line 39
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Version"

    const-string v2, "2012-11-05"

    .line 40
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;->getQueueName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, "QueueName"

    .line 45
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;->getQueueName()Ljava/lang/String;

    move-result-object v2

    .line 46
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;->getQueueOwnerAWSAccountId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "QueueOwnerAWSAccountId"

    .line 50
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;->getQueueOwnerAWSAccountId()Ljava/lang/String;

    move-result-object p1

    .line 51
    invoke-static {p1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    return-object v0

    .line 33
    :cond_2
    new-instance p1, Lcom/amazonaws/AmazonClientException;

    const-string v0, "Invalid argument passed to marshall(GetQueueUrlRequest)"

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
    check-cast p1, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/Request;

    move-result-object p1

    return-object p1
.end method
