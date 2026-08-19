.class public Lcom/amazonaws/services/sqs/model/SendMessageResult;
.super Ljava/lang/Object;
.source "SendMessageResult.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private mD5OfMessageAttributes:Ljava/lang/String;

.field private mD5OfMessageBody:Ljava/lang/String;

.field private messageId:Ljava/lang/String;

.field private sequenceNumber:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
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

    .line 427
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/SendMessageResult;

    if-nez v2, :cond_2

    return v1

    .line 429
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageResult;

    .line 431
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

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

    .line 433
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 434
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 436
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

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

    .line 438
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 439
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 441
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

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

    .line 443
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 444
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v1

    .line 446
    :cond_e
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v0

    goto :goto_6

    :cond_f
    move v2, v1

    :goto_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

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

    .line 448
    :cond_11
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 449
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_12

    return v1

    :cond_12
    return v0
.end method

.method public getMD5OfMessageAttributes()Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->mD5OfMessageAttributes:Ljava/lang/String;

    return-object v0
.end method

.method public getMD5OfMessageBody()Ljava/lang/String;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->mD5OfMessageBody:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageId()Ljava/lang/String;
    .locals 1

    .line 230
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public getSequenceNumber()Ljava/lang/String;
    .locals 1

    .line 309
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->sequenceNumber:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 409
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 412
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    .line 413
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 414
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 416
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_3
    add-int/2addr v0, v1

    return v0
.end method

.method public setMD5OfMessageAttributes(Ljava/lang/String;)V
    .locals 0

    .line 182
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->mD5OfMessageAttributes:Ljava/lang/String;

    return-void
.end method

.method public setMD5OfMessageBody(Ljava/lang/String;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->mD5OfMessageBody:Ljava/lang/String;

    return-void
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0

    .line 251
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->messageId:Ljava/lang/String;

    return-void
.end method

.method public setSequenceNumber(Ljava/lang/String;)V
    .locals 0

    .line 340
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->sequenceNumber:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 389
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 390
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 392
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MD5OfMessageBody: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 393
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 394
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MD5OfMessageAttributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 396
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 398
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SequenceNumber: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getSequenceNumber()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_3
    const-string v1, "}"

    .line 399
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withMD5OfMessageAttributes(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 0

    .line 208
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->mD5OfMessageAttributes:Ljava/lang/String;

    return-object p0
.end method

.method public withMD5OfMessageBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 0

    .line 139
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->mD5OfMessageBody:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 0

    .line 277
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->messageId:Ljava/lang/String;

    return-object p0
.end method

.method public withSequenceNumber(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 0

    .line 376
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SendMessageResult;->sequenceNumber:Ljava/lang/String;

    return-object p0
.end method
