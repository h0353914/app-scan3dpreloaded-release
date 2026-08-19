.class public Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;
.super Ljava/lang/Object;
.source "SendMessageBatchResultStaxUnmarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Unmarshaller;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Unmarshaller<",
        "Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;",
        "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
        ">;"
    }
.end annotation


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;
    .locals 1

    .line 73
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;

    if-nez v0, :cond_0

    .line 74
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;

    .line 75
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;

    return-object v0
.end method


# virtual methods
.method public unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 36
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;-><init>()V

    .line 38
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 41
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->isStartOfDocument()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x2

    .line 45
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->nextEvent()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    goto :goto_1

    :cond_1
    const/4 v5, 0x2

    if-ne v3, v5, :cond_3

    const-string v3, "SendMessageBatchResultEntry"

    .line 50
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    const/4 v5, 0x0

    if-eqz v3, :cond_2

    .line 51
    new-array v3, v4, [Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;

    .line 53
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultEntryStaxUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultEntryStaxUnmarshaller;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultEntryStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;

    move-result-object v4

    aput-object v4, v3, v5

    .line 52
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;->withSuccessful([Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    goto :goto_0

    :cond_2
    const-string v3, "BatchResultErrorEntry"

    .line 56
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 57
    new-array v3, v4, [Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;

    .line 58
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxUnmarshaller;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;

    move-result-object v4

    aput-object v4, v3, v5

    .line 57
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;->withFailed([Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

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

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    move-result-object p1

    return-object p1
.end method
