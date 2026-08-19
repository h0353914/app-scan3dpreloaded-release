.class public Lcom/amazonaws/services/sqs/model/SendMessageRequest;
.super Lcom/amazonaws/AmazonWebServiceRequest;
.source "SendMessageRequest.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private delaySeconds:Ljava/lang/Integer;

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

.field private queueUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 237
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 256
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 87
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    .line 257
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 258
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->setMessageBody(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public addMessageAttributesEntry(Ljava/lang/String;Lcom/amazonaws/services/sqs/model/MessageAttributeValue;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 2

    .line 569
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 570
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    .line 572
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 575
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 573
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

.method public clearMessageAttributesEntries()Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 1

    const/4 v0, 0x0

    .line 586
    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

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

    .line 1552
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    if-nez v2, :cond_2

    return v1

    .line 1554
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    .line 1556
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

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

    .line 1558
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 1560
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

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

    .line 1562
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 1563
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 1565
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

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

    .line 1567
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 1568
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v1

    .line 1570
    :cond_e
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v0

    goto :goto_6

    :cond_f
    move v2, v1

    :goto_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

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

    .line 1572
    :cond_11
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 1573
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    return v1

    .line 1575
    :cond_12
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_8

    :cond_13
    move v2, v1

    :goto_8
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

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

    .line 1577
    :cond_15
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 1578
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    return v1

    .line 1580
    :cond_16
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_17

    move v2, v0

    goto :goto_a

    :cond_17
    move v2, v1

    :goto_a
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

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

    .line 1582
    :cond_19
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1a

    .line 1583
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

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

    .line 406
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->delaySeconds:Ljava/lang/Integer;

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

    .line 500
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    return-object v0
.end method

.method public getMessageBody()Ljava/lang/String;
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageBody:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageDeduplicationId()Ljava/lang/String;
    .locals 1

    .line 791
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageDeduplicationId:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageGroupId()Ljava/lang/String;
    .locals 1

    .line 1304
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageGroupId:Ljava/lang/String;

    return-object v0
.end method

.method public getQueueUrl()Ljava/lang/String;
    .locals 1

    .line 277
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->queueUrl:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 1529
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 1531
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1533
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1535
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    if-nez v3, :cond_3

    move v3, v1

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1538
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_4

    move v3, v1

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v3

    .line 1539
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_4
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 1541
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5

    goto :goto_5

    :cond_5
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_5
    add-int/2addr v0, v1

    return v0
.end method

.method public setDelaySeconds(Ljava/lang/Integer;)V
    .locals 0

    .line 440
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->delaySeconds:Ljava/lang/Integer;

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

    .line 520
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    return-void
.end method

.method public setMessageBody(Ljava/lang/String;)V
    .locals 0

    .line 351
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageBody:Ljava/lang/String;

    return-void
.end method

.method public setMessageDeduplicationId(Ljava/lang/String;)V
    .locals 0

    .line 999
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageDeduplicationId:Ljava/lang/String;

    return-void
.end method

.method public setMessageGroupId(Ljava/lang/String;)V
    .locals 0

    .line 1396
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageGroupId:Ljava/lang/String;

    return-void
.end method

.method public setQueueUrl(Ljava/lang/String;)V
    .locals 0

    .line 296
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->queueUrl:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1506
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 1507
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1508
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1509
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QueueUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1510
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1511
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageBody: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1512
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 1513
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DelaySeconds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getDelaySeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1514
    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 1515
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageAttributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1516
    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 1517
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageDeduplicationId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageDeduplicationId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1518
    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 1519
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageGroupId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageGroupId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_5
    const-string v1, "}"

    .line 1520
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1521
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withDelaySeconds(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 0

    .line 479
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->delaySeconds:Ljava/lang/Integer;

    return-object p0
.end method

.method public withMessageAttributes(Ljava/util/Map;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;"
        }
    .end annotation

    .line 546
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageAttributes:Ljava/util/Map;

    return-object p0
.end method

.method public withMessageBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 0

    .line 371
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageBody:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageDeduplicationId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 0

    .line 1212
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageDeduplicationId:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageGroupId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 0

    .line 1493
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->messageGroupId:Ljava/lang/String;

    return-object p0
.end method

.method public withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;
    .locals 0

    .line 320
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->queueUrl:Ljava/lang/String;

    return-object p0
.end method
