.class Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;
.super Ljava/lang/Object;
.source "MessageStaxUnmarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Unmarshaller;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;
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
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;
    .locals 1

    .line 109
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    if-nez v0, :cond_0

    .line 110
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    .line 111
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

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

    .line 74
    check-cast p1, Lcom/amazonaws/transform/StaxUnmarshallerContext;

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/util/Map$Entry;

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

    .line 79
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v0

    add-int/lit8 v1, v0, 0x1

    .line 82
    new-instance v2, Lcom/amazonaws/transform/MapEntry;

    invoke-direct {v2}, Lcom/amazonaws/transform/MapEntry;-><init>()V

    .line 85
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

    .line 90
    invoke-virtual {p1, v3, v1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 91
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/amazonaws/transform/MapEntry;->setKey(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    const-string v3, "Value"

    .line 94
    invoke-virtual {p1, v3, v1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 95
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxUnmarshaller;

    move-result-object v3

    .line 96
    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/MessageAttributeValueStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/MessageAttributeValue;

    move-result-object v3

    .line 95
    invoke-virtual {v2, v3}, Lcom/amazonaws/transform/MapEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_3
    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 100
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v3

    if-ge v3, v0, :cond_0

    return-object v2
.end method
