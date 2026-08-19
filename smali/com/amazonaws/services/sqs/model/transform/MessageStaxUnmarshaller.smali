.class Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;
.super Ljava/lang/Object;
.source "MessageStaxUnmarshaller.java"

# interfaces
.implements Lcom/amazonaws/transform/Unmarshaller;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;,
        Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$AttributesMapEntryUnmarshaller;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/amazonaws/transform/Unmarshaller<",
        "Lcom/amazonaws/services/sqs/model/Message;",
        "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
        ">;"
    }
.end annotation


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;
    .locals 1

    .line 177
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;

    if-nez v0, :cond_0

    .line 178
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;

    .line 179
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;

    return-object v0
.end method


# virtual methods
.method public unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 117
    new-instance v0, Lcom/amazonaws/services/sqs/model/Message;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/Message;-><init>()V

    .line 119
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->getCurrentDepth()I

    move-result v1

    add-int/lit8 v2, v1, 0x1

    .line 122
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->isStartOfDocument()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x2

    .line 126
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->nextEvent()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    goto/16 :goto_1

    :cond_1
    const/4 v4, 0x2

    if-ne v3, v4, :cond_8

    const-string v3, "MessageId"

    .line 131
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 132
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/Message;->setMessageId(Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string v3, "ReceiptHandle"

    .line 135
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 136
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/Message;->setReceiptHandle(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    const-string v3, "MD5OfBody"

    .line 140
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 141
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/Message;->setMD5OfBody(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    const-string v3, "Body"

    .line 144
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 145
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/Message;->setBody(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const-string v3, "Attribute"

    .line 148
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 149
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$AttributesMapEntryUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$AttributesMapEntryUnmarshaller;

    move-result-object v3

    .line 150
    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$AttributesMapEntryUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/util/Map$Entry;

    move-result-object v3

    .line 151
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v0, v4, v3}, Lcom/amazonaws/services/sqs/model/Message;->addAttributesEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;

    goto :goto_0

    :cond_6
    const-string v3, "MD5OfMessageAttributes"

    .line 154
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 155
    invoke-static {}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->getInstance()Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;

    move-result-object v3

    .line 156
    invoke-virtual {v3, p1}, Lcom/amazonaws/transform/SimpleTypeStaxUnmarshallers$StringStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/lang/String;

    move-result-object v3

    .line 155
    invoke-virtual {v0, v3}, Lcom/amazonaws/services/sqs/model/Message;->setMD5OfMessageAttributes(Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_7
    const-string v3, "MessageAttribute"

    .line 159
    invoke-virtual {p1, v3, v2}, Lcom/amazonaws/transform/StaxUnmarshallerContext;->testExpression(Ljava/lang/String;I)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 161
    invoke-static {}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->getInstance()Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller$MessageAttributesMapEntryUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Ljava/util/Map$Entry;

    move-result-object v3

    .line 162
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;

    invoke-virtual {v0, v4, v3}, Lcom/amazonaws/services/sqs/model/Message;->addMessageAttributesEntry(Ljava/lang/String;Lcom/amazonaws/services/sqs/model/MessageAttributeValue;)Lcom/amazonaws/services/sqs/model/Message;

    goto/16 :goto_0

    :cond_8
    const/4 v4, 0x3

    if-ne v3, v4, :cond_0

    .line 166
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

    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/transform/MessageStaxUnmarshaller;->unmarshall(Lcom/amazonaws/transform/StaxUnmarshallerContext;)Lcom/amazonaws/services/sqs/model/Message;

    move-result-object p1

    return-object p1
.end method
