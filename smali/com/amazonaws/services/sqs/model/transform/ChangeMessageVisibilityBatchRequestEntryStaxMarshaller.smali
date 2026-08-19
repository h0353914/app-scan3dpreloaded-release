.class Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;
.super Ljava/lang/Object;
.source "ChangeMessageVisibilityBatchRequestEntryStaxMarshaller.java"


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;
    .locals 1

    .line 52
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;

    .line 54
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestEntryStaxMarshaller;

    return-object v0
.end method


# virtual methods
.method public marshall(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;Lcom/amazonaws/Request;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            "Lcom/amazonaws/Request<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 31
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 33
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v1

    .line 34
    invoke-static {v1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 37
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "ReceiptHandle"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 38
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    .line 39
    invoke-static {v1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    :cond_1
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "VisibilityTimeout"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 44
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object p1

    .line 45
    invoke-static {p1}, Lcom/amazonaws/util/StringUtils;->fromInteger(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-void
.end method
