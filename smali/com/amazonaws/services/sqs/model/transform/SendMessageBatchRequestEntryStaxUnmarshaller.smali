.class Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;
.super Ljava/lang/Object;
.source "SendMessageBatchRequestEntryStaxUnmarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Unmarshaller;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Unmarshaller<",
        "Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;",
        "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
        ">;"
    }
.end annotation


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;
    .locals 1

    .line 137
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;

    if-nez v0, :cond_0

    .line 138
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;

    .line 139
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;

    return-object v0
.end method


# virtual methods
.method public unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 79
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;-><init>()V

    .line 81
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 84
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->isStartOfDocument()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x2

    .line 88
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->nextEvent()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v4, 0x2

    if-ne v3, v4, :cond_7

    const-string v3, "Id"

    .line 93
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 94
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    .line 95
    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 94
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setId(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v3, "MessageBody"

    .line 98
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 100
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 99
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setMessageBody(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v3, "DelaySeconds"

    .line 103
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 105
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$IntegerStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$IntegerStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$IntegerStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/Integer;

    move-result-object v3

    .line 104
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setDelaySeconds(Ljava/lang/Integer;)V

    goto :goto_0

    :cond_4
    const-string v3, "MessageAttribute"

    .line 108
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 110
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/util/Map$Entry;

    move-result-object v3

    .line 111
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 112
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;

    .line 111
    invoke-virtual {v0, v4, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->addMessageAttributesEntry(Ljava/lang/String;Lcom/amazonaws/services/sqs/model/MessageAttributeValue;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    goto :goto_0

    :cond_5
    const-string v3, "MessageDeduplicationId"

    .line 115
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 117
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 116
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setMessageDeduplicationId(Ljava/lang/String;)V

    goto :goto_0

    :cond_6
    const-string v3, "MessageGroupId"

    .line 120
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 122
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 121
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setMessageGroupId(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 126
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

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    move-result-object p1

    return-object p1
.end method
