.class public Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityRequestMarshaller;
.super Ljava/lang/Object;
.source "ChangeMessageVisibilityRequestMarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Marshaller;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Marshaller<",
        "Lcom/amazonaws/Request<",
        "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
        ">;",
        "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
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
.method public marshall(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)Lcom/amazonaws/Request;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            ")",
            "Lcom/amazonaws/Request<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 38
    new-instance v0, Lcom/amazonaws/DefaultRequest;

    const-string v1, "AmazonSQS"

    invoke-direct {v0, p1, v1}, Lcom/amazonaws/DefaultRequest;-><init>(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)V

    const-string v1, "Action"

    const-string v2, "ChangeMessageVisibility"

    .line 40
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "Version"

    const-string v2, "2012-11-05"

    .line 41
    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v1, "QueueUrl"

    .line 46
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    .line 47
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v1, "ReceiptHandle"

    .line 51
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    .line 52
    invoke-static {v2}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    :cond_1
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v1, "VisibilityTimeout"

    .line 56
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object p1

    .line 57
    invoke-static {p1}, Lcom/amazonaws/util/StringUtils;->fromInteger(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-object v0

    .line 34
    :cond_3
    new-instance p1, Lcom/amazonaws/AmazonClientException;

    const-string v0, "Invalid argument passed to marshall(ChangeMessageVisibilityRequest)"

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
    check-cast p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)Lcom/amazonaws/Request;

    move-result-object p1

    return-object p1
.end method
