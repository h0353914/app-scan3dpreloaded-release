.class public Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;
.super Ljava/lang/Object;
.source "ChangeMessageVisibilityBatchRequestEntry.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private id:Ljava/lang/String;

.field private receiptHandle:Ljava/lang/String;

.field private visibilityTimeout:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->setId(Ljava/lang/String;)V

    .line 91
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->setReceiptHandle(Ljava/lang/String;)V

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

    .line 284
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    if-nez v2, :cond_2

    return v1

    .line 286
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;

    .line 288
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

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

    .line 290
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 292
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

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

    .line 294
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 295
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 297
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

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

    .line 299
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 300
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e

    return v1

    :cond_e
    return v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->id:Ljava/lang/String;

    return-object v0
.end method

.method public getReceiptHandle()Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->receiptHandle:Ljava/lang/String;

    return-object v0
.end method

.method public getVisibilityTimeout()Ljava/lang/Integer;
    .locals 1

    .line 206
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->visibilityTimeout:Ljava/lang/Integer;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 269
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 271
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 273
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    return v0
.end method

.method public setId(Ljava/lang/String;)V
    .locals 0

    .line 125
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->id:Ljava/lang/String;

    return-void
.end method

.method public setReceiptHandle(Ljava/lang/String;)V
    .locals 0

    .line 174
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->receiptHandle:Ljava/lang/String;

    return-void
.end method

.method public setVisibilityTimeout(Ljava/lang/Integer;)V
    .locals 0

    .line 220
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->visibilityTimeout:Ljava/lang/Integer;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 252
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 253
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 255
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Id: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 257
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ReceiptHandle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 259
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VisibilityTimeout: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v1, "}"

    .line 260
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->id:Ljava/lang/String;

    return-object p0
.end method

.method public withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;
    .locals 0

    .line 192
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->receiptHandle:Ljava/lang/String;

    return-object p0
.end method

.method public withVisibilityTimeout(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;
    .locals 0

    .line 239
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;->visibilityTimeout:Ljava/lang/Integer;

    return-object p0
.end method
