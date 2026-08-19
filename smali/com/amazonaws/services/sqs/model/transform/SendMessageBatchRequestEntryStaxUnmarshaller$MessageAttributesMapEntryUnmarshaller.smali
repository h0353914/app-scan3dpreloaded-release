.class Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;
.super Ljava/lang/Object;
.source "SendMessageBatchRequestEntryStaxUnmarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Unmarshaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MessageAttributesMapEntryUnmarshaller"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Unmarshaller<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/String;",
        "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
        ">;",
        "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
        ">;"
    }
.end annotation


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;
    .locals 1

    .line 70
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    if-nez v0, :cond_0

    .line 71
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    .line 72
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic unmarshall(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 35
    check-cast p1, Lcom/amazonaws/transform/StaxUnmarshallerContext;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestEntryStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/util/Map$Entry;

    move-result-object p1

    return-object p1
.end method

.method public unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/util/Map$Entry;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
            ")",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 40
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    .line 43
    new-instance v2, Lcom/amazonaws/transform/MapEntry;

    invoke-direct {v2}, Lcom/amazonaws/transform/MapEntry;-><init>()V

    .line 46
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->nextEvent()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    return-object v2

    :cond_1
    const/4 v4, 0x2

    if-ne v3, v4, :cond_3

    const-string v3, "Name"

    .line 51
    invoke-virtual {p1, v3, v1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 52
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazonaws/transform/MapEntry;->setKey(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const-string v3, "Value"

    .line 55
    invoke-virtual {p1, v3, v1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 56
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxUnmarshaller;

    move-result-object v3

    .line 57
    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/MessageAttributeValue;

    move-result-object v3

    .line 56
    invoke-virtual {v2, v3}, Lcom/amazonaws/transform/MapEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 61
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v3

    if-ge v3, v0, :cond_0

    return-object v2
.end method
