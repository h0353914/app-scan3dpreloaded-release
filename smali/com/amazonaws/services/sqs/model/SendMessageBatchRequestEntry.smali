.class public Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
.super Ljava/lang/Object;
.source "SendMessageBatchRequestEntry.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private delaySeconds:Ljava/lang/Integer;

.field private id:Ljava/lang/String;

.field private messageAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;"
        }
    .end annotation
.end field

.field private messageBody:Ljava/lang/String;

.field private messageDeduplicationId:Ljava/lang/String;

.field private messageGroupId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 218
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 235
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    .line 236
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setId(Ljava/lang/String;)V

    .line 237
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->setMessageBody(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public addMessageAttributesEntry(Ljava/lang/String;Lcom/amazonaws/services/sqs/model/MessageAttributeValue;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 2

    .line 537
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 538
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    .line 540
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 543
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 541
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Duplicated keys ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ") are provided."

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public clearMessageAttributesEntries()Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 1

    const/4 v0, 0x0

    .line 554
    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 1520
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    if-nez v2, :cond_2

    return v1

    .line 1522
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    .line 1524
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    move v3, v0

    goto :goto_1

    :cond_4
    move v3, v1

    :goto_1
    xor-int/2addr v2, v3

    if-eqz v2, :cond_5

    return v1

    .line 1526
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 1528
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_8

    move v3, v0

    goto :goto_3

    :cond_8
    move v3, v1

    :goto_3
    xor-int/2addr v2, v3

    if-eqz v2, :cond_9

    return v1

    .line 1530
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 1531
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 1533
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_c

    move v3, v0

    goto :goto_5

    :cond_c
    move v3, v1

    :goto_5
    xor-int/2addr v2, v3

    if-eqz v2, :cond_d

    return v1

    .line 1535
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 1536
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v1

    .line 1538
    :cond_e
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v0

    goto :goto_6

    :cond_f
    move v2, v1

    :goto_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    if-nez v3, :cond_10

    move v3, v0

    goto :goto_7

    :cond_10
    move v3, v1

    :goto_7
    xor-int/2addr v2, v3

    if-eqz v2, :cond_11

    return v1

    .line 1540
    :cond_11
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 1541
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    return v1

    .line 1543
    :cond_12
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_8

    :cond_13
    move v2, v1

    :goto_8
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_14

    move v3, v0

    goto :goto_9

    :cond_14
    move v3, v1

    :goto_9
    xor-int/2addr v2, v3

    if-eqz v2, :cond_15

    return v1

    .line 1545
    :cond_15
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 1546
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    return v1

    .line 1548
    :cond_16
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_17

    move v2, v0

    goto :goto_a

    :cond_17
    move v2, v1

    :goto_a
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_18

    move v3, v0

    goto :goto_b

    :cond_18
    move v3, v1

    :goto_b
    xor-int/2addr v2, v3

    if-eqz v2, :cond_19

    return v1

    .line 1550
    :cond_19
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1a

    .line 1551
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1a

    return v1

    :cond_1a
    return v0
.end method

.method public getDelaySeconds()Ljava/lang/Integer;
    .locals 1

    .line 373
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->delaySeconds:Ljava/lang/Integer;

    return-object v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 254
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;"
        }
    .end annotation

    .line 467
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    return-object v0
.end method

.method public getMessageBody()Ljava/lang/String;
    .locals 1

    .line 307
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageBody:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageDeduplicationId()Ljava/lang/String;
    .locals 1

    .line 759
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageDeduplicationId:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageGroupId()Ljava/lang/String;
    .locals 1

    .line 1272
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageGroupId:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 1497
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 1499
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1501
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1503
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    if-nez v3, :cond_3

    move v3, v1

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1506
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    move v3, v1

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    .line 1507
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_4
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1509
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_5
    add-int/2addr v0, v1

    return v0
.end method

.method public setDelaySeconds(Ljava/lang/Integer;)V
    .locals 0

    .line 407
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->delaySeconds:Ljava/lang/Integer;

    return-void
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 271
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->id:Ljava/lang/String;

    return-void
.end method

.method public setMessageAttributes(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;)V"
        }
    .end annotation

    .line 487
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    return-void
.end method

.method public setMessageBody(Ljava/lang/String;)V
    .locals 0

    .line 320
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageBody:Ljava/lang/String;

    return-void
.end method

.method public setMessageDeduplicationId(Ljava/lang/String;)V
    .locals 0

    .line 967
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageDeduplicationId:Ljava/lang/String;

    return-void
.end method

.method public setMessageGroupId(Ljava/lang/String;)V
    .locals 0

    .line 1364
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageGroupId:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1474
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 1475
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1476
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1477
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1478
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1479
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageBody: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1480
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1481
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DelaySeconds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1482
    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1483
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageAttributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1484
    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 1485
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageDeduplicationId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1486
    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 1487
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageGroupId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    const-string v1, "}"

    .line 1488
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1489
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withDelaySeconds(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 0

    .line 446
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->delaySeconds:Ljava/lang/Integer;

    return-object p0
.end method

.method public withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 0

    .line 293
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->id:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageAttributes(Ljava/util/Map;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;"
        }
    .end annotation

    .line 513
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageAttributes:Ljava/util/Map;

    return-object p0
.end method

.method public withMessageBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 0

    .line 338
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageBody:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageDeduplicationId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 0

    .line 1180
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageDeduplicationId:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageGroupId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;
    .locals 0

    .line 1461
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->messageGroupId:Ljava/lang/String;

    return-object p0
.end method
