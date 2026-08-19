.class Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;
.super Ljava/lang/Object;
.source "DeleteMessageBatchResultEntryStaxMarshaller.java"


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;
    .locals 1

    .line 40
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;

    if-nez v0, :cond_0

    .line 41
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;

    .line 42
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultEntryStaxMarshaller;

    return-object v0
.end method


# virtual methods
.method public marshall(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResultEntry;Lcom/amazonaws/Request;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResultEntry;",
            "Lcom/amazonaws/Request<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 30
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "Id"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 32
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object p1

    .line 33
    invoke-static {p1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
