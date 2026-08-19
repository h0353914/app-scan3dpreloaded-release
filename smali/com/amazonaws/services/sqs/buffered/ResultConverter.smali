.class Lcom/amazonaws/services/sqs/buffered/ResultConverter;
.super Ljava/lang/Object;
.source "ResultConverter.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Lcom/amazonaws/AmazonWebServiceRequest;",
            ">(TX;",
            "Ljava/lang/String;",
            ")TX;"
        }
    .end annotation

    .line 49
    invoke-virtual {p0}, Lcom/amazonaws/AmazonWebServiceRequest;->getRequestClientOptions()Lcom/amazonaws/RequestClientOptions;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/amazonaws/RequestClientOptions;->appendUserAgent(Ljava/lang/String;)V

    return-object p0
.end method

.method static convert(Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 2

    .line 29
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageResult;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;-><init>()V

    .line 30
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->setMD5OfMessageBody(Ljava/lang/String;)V

    .line 31
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->setMessageId(Ljava/lang/String;)V

    .line 32
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->setMD5OfMessageAttributes(Ljava/lang/String;)V

    return-object v0
.end method

.method static convert(Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;)Ljava/lang/Exception;
    .locals 2

    .line 38
    new-instance v0, Lcom/amazonaws/AmazonServiceException;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazonaws/AmazonServiceException;-><init>(Ljava/lang/String;)V

    .line 40
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getCode()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/AmazonServiceException;->setErrorCode(Ljava/lang/String;)V

    .line 41
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->isSenderFault()Ljava/lang/Boolean;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/amazonaws/AmazonServiceException$ErrorType;->Client:Lcom/amazonaws/AmazonServiceException$ErrorType;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/amazonaws/AmazonServiceException$ErrorType;->Service:Lcom/amazonaws/AmazonServiceException$ErrorType;

    :goto_0
    invoke-virtual {v0, p0}, Lcom/amazonaws/AmazonServiceException;->setErrorType(Lcom/amazonaws/AmazonServiceException$ErrorType;)V

    const-string p0, "AmazonSQS"

    .line 42
    invoke-virtual {v0, p0}, Lcom/amazonaws/AmazonServiceException;->setServiceName(Ljava/lang/String;)V

    return-object v0
.end method
