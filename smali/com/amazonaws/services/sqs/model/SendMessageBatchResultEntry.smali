.class public Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;
.super Ljava/lang/Object;
.source "SendMessageBatchResultEntry.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private id:Ljava/lang/String;

.field private mD5OfMessageAttributes:Ljava/lang/String;

.field private mD5OfMessageBody:Ljava/lang/String;

.field private messageId:Ljava/lang/String;

.field private sequenceNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 457
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;

    if-nez v2, :cond_2

    return v1

    .line 459
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;

    .line 461
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

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

    .line 463
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 465
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

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

    .line 467
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 468
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 470
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

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

    .line 472
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 473
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v1

    .line 475
    :cond_e
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v0

    goto :goto_6

    :cond_f
    move v2, v1

    :goto_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

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

    .line 477
    :cond_11
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 478
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    return v1

    .line 480
    :cond_12
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_8

    :cond_13
    move v2, v1

    :goto_8
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

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

    .line 482
    :cond_15
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 483
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_16

    return v1

    :cond_16
    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getMD5OfMessageAttributes()Ljava/lang/String;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->mD5OfMessageAttributes:Ljava/lang/String;

    return-object v0
.end method

.method public getMD5OfMessageBody()Ljava/lang/String;
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->mD5OfMessageBody:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()Ljava/lang/String;
    .locals 1

    .line 133
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public getSequenceNumber()Ljava/lang/String;
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->sequenceNumber:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 437
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 438
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 440
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 443
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    move v3, v1

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    .line 444
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 446
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_4
    add-int/2addr v0, v1

    return v0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->id:Ljava/lang/String;

    return-void
.end method

.method public setMD5OfMessageAttributes(Ljava/lang/String;)V
    .locals 0

    .line 277
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->mD5OfMessageAttributes:Ljava/lang/String;

    return-void
.end method

.method public setMD5OfMessageBody(Ljava/lang/String;)V
    .locals 0

    .line 207
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->mD5OfMessageBody:Ljava/lang/String;

    return-void
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0

    .line 146
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->messageId:Ljava/lang/String;

    return-void
.end method

.method public setSequenceNumber(Ljava/lang/String;)V
    .locals 0

    .line 367
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->sequenceNumber:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 416
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 417
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 418
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 419
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 421
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMessageId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 423
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MD5OfMessageBody: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 424
    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 425
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MD5OfMessageAttributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 426
    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 427
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SequenceNumber: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    const-string v1, "}"

    .line 428
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 429
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;
    .locals 0

    .line 119
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->id:Ljava/lang/String;

    return-object p0
.end method

.method public withMD5OfMessageAttributes(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;
    .locals 0

    .line 304
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->mD5OfMessageAttributes:Ljava/lang/String;

    return-object p0
.end method

.method public withMD5OfMessageBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;
    .locals 0

    .line 233
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->mD5OfMessageBody:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;
    .locals 0

    .line 164
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->messageId:Ljava/lang/String;

    return-object p0
.end method

.method public withSequenceNumber(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;
    .locals 0

    .line 403
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->sequenceNumber:Ljava/lang/String;

    return-object p0
.end method
