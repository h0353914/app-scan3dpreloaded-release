.class public Lcom/amazonaws/services/sqs/model/Message;
.super Ljava/lang/Object;
.source "Message.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private body:Ljava/lang/String;

.field private mD5OfBody:Ljava/lang/String;

.field private mD5OfMessageAttributes:Ljava/lang/String;

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

.field private messageId:Ljava/lang/String;

.field private receiptHandle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    .line 90
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public addAttributesEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 2

    .line 404
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 405
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    .line 407
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 410
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 408
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

.method public addMessageAttributesEntry(Ljava/lang/String;Lcom/amazonaws/services/sqs/model/MessageAttributeValue;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 2

    .line 580
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 581
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    .line 583
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 586
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 584
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

.method public clearAttributesEntries()Lcom/amazonaws/services/sqs/model/Message;
    .locals 1

    const/4 v0, 0x0

    .line 421
    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    return-object p0
.end method

.method public clearMessageAttributesEntries()Lcom/amazonaws/services/sqs/model/Message;
    .locals 1

    const/4 v0, 0x0

    .line 597
    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

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

    .line 657
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/Message;

    if-nez v2, :cond_2

    return v1

    .line 659
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/Message;

    .line 661
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

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

    .line 663
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 664
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 666
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

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

    .line 668
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 669
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 671
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

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

    .line 673
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 674
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v1

    .line 676
    :cond_e
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v0

    goto :goto_6

    :cond_f
    move v2, v1

    :goto_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

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

    .line 678
    :cond_11
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_12

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    return v1

    .line 680
    :cond_12
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_8

    :cond_13
    move v2, v1

    :goto_8
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

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

    .line 682
    :cond_15
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 683
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    return v1

    .line 685
    :cond_16
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_17

    move v2, v0

    goto :goto_a

    :cond_17
    move v2, v1

    :goto_a
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

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

    .line 687
    :cond_19
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1a

    .line 688
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    return v1

    .line 690
    :cond_1a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_1b

    move v2, v0

    goto :goto_c

    :cond_1b
    move v2, v1

    :goto_c
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v3

    if-nez v3, :cond_1c

    move v3, v0

    goto :goto_d

    :cond_1c
    move v3, v1

    :goto_d
    xor-int/2addr v2, v3

    if-eqz v2, :cond_1d

    return v1

    .line 692
    :cond_1d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_1e

    .line 693
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1e

    return v1

    :cond_1e
    return v0
.end method

.method public getAttributes()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 321
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    return-object v0
.end method

.method public getBody()Ljava/lang/String;
    .locals 1

    .line 263
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->body:Ljava/lang/String;

    return-object v0
.end method

.method public getMD5OfBody()Ljava/lang/String;
    .locals 1

    .line 218
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->mD5OfBody:Ljava/lang/String;

    return-object v0
.end method

.method public getMD5OfMessageAttributes()Ljava/lang/String;
    .locals 1

    .line 443
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->mD5OfMessageAttributes:Ljava/lang/String;

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

    .line 511
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    return-object v0
.end method

.method public getMessageId()Ljava/lang/String;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->messageId:Ljava/lang/String;

    return-object v0
.end method

.method public getReceiptHandle()Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/Message;->receiptHandle:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 635
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 637
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 638
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 639
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_3

    move v3, v1

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 640
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v3

    if-nez v3, :cond_4

    move v3, v1

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->hashCode()I

    move-result v3

    :goto_4
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 643
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_5

    move v3, v1

    goto :goto_5

    :cond_5
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v3

    .line 644
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_5
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 646
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    :goto_6
    add-int/2addr v0, v1

    return v0
.end method

.method public setAttributes(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 347
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    return-void
.end method

.method public setBody(Ljava/lang/String;)V
    .locals 0

    .line 276
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->body:Ljava/lang/String;

    return-void
.end method

.method public setMD5OfBody(Ljava/lang/String;)V
    .locals 0

    .line 231
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->mD5OfBody:Ljava/lang/String;

    return-void
.end method

.method public setMD5OfMessageAttributes(Ljava/lang/String;)V
    .locals 0

    .line 464
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->mD5OfMessageAttributes:Ljava/lang/String;

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

    .line 531
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    return-void
.end method

.method public setMessageId(Ljava/lang/String;)V
    .locals 0

    .line 120
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->messageId:Ljava/lang/String;

    return-void
.end method

.method public setReceiptHandle(Ljava/lang/String;)V
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->receiptHandle:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 610
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 611
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 612
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 613
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 614
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 615
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ReceiptHandle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 617
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MD5OfBody: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 618
    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 619
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Body: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 620
    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 621
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 622
    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 623
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MD5OfMessageAttributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 624
    :cond_5
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 625
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageAttributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    const-string v1, "}"

    .line 626
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 627
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withAttributes(Ljava/util/Map;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/Message;"
        }
    .end annotation

    .line 378
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->attributes:Ljava/util/Map;

    return-object p0
.end method

.method public withBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0

    .line 294
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->body:Ljava/lang/String;

    return-object p0
.end method

.method public withMD5OfBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0

    .line 249
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->mD5OfBody:Ljava/lang/String;

    return-object p0
.end method

.method public withMD5OfMessageAttributes(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0

    .line 490
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->mD5OfMessageAttributes:Ljava/lang/String;

    return-object p0
.end method

.method public withMessageAttributes(Ljava/util/Map;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/Message;"
        }
    .end annotation

    .line 557
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->messageAttributes:Ljava/util/Map;

    return-object p0
.end method

.method public withMessageId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0

    .line 141
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->messageId:Ljava/lang/String;

    return-object p0
.end method

.method public withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/Message;
    .locals 0

    .line 204
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/Message;->receiptHandle:Ljava/lang/String;

    return-object p0
.end method
