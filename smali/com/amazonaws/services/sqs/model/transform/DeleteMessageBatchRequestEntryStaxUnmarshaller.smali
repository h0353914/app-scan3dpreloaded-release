.class Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;
.super Ljava/lang/Object;
.source "DeleteMessageBatchRequestEntryStaxUnmarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Unmarshaller;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Unmarshaller<",
        "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;",
        "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
        ">;"
    }
.end annotation


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;
    .locals 1

    .line 73
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;

    .line 75
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;

    return-object v0
.end method


# virtual methods
.method public unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 37
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;-><init>()V

    .line 39
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 42
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->isStartOfDocument()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x2

    .line 46
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->nextEvent()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    const-string v3, "Id"

    .line 51
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 52
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    .line 53
    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 52
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;->setId(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v3, "ReceiptHandle"

    .line 56
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 58
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 57
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;->setReceiptHandle(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 62
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v3

    if-ge v3, v1, :cond_0

    :goto_1
    return-object v0
.end method

.method public bridge synthetic unmarshall(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 32
    check-cast p1, Lcom/amazonaws/transform/StaxUnmarshallerContext;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestEntryStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;

    move-result-object p1

    return-object p1
.end method
