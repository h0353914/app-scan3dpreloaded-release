.class public Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;
.super Lcom/amazonaws/AmazonWebServiceRequest;
.source "ChangeMessageVisibilityRequest.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private queueUrl:Ljava/lang/String;

.field private receiptHandle:Ljava/lang/String;

.field private visibilityTimeout:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 103
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 128
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 129
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->setReceiptHandle(Ljava/lang/String;)V

    .line 131
    invoke-virtual {p0, p3}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->setVisibilityTimeout(Ljava/lang/Integer;)V

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

    .line 346
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    if-nez v2, :cond_2

    return v1

    .line 348
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    .line 350
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

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

    .line 352
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 354
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

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

    .line 356
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 357
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 359
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

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

    .line 361
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 362
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_e

    return v1

    :cond_e
    return v0
.end method

.method public getQueueUrl()Ljava/lang/String;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->queueUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getReceiptHandle()Ljava/lang/String;
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->receiptHandle:Ljava/lang/String;

    return-object v0
.end method

.method public getVisibilityTimeout()Ljava/lang/Integer;
    .locals 1

    .line 266
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->visibilityTimeout:Ljava/lang/Integer;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 331
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 333
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 335
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_2

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

    move-result v1

    :goto_2
    add-int/2addr v0, v1

    return v0
.end method

.method public setQueueUrl(Ljava/lang/String;)V
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->queueUrl:Ljava/lang/String;

    return-void
.end method

.method public setReceiptHandle(Ljava/lang/String;)V
    .locals 0

    .line 228
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->receiptHandle:Ljava/lang/String;

    return-void
.end method

.method public setVisibilityTimeout(Ljava/lang/Integer;)V
    .locals 0

    .line 281
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->visibilityTimeout:Ljava/lang/Integer;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 314
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 315
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 317
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QueueUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 318
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 319
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ReceiptHandle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 321
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VisibilityTimeout: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    const-string v1, "}"

    .line 322
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 323
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;
    .locals 0

    .line 193
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->queueUrl:Ljava/lang/String;

    return-object p0
.end method

.method public withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;
    .locals 0

    .line 250
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->receiptHandle:Ljava/lang/String;

    return-object p0
.end method

.method public withVisibilityTimeout(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;
    .locals 0

    .line 301
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->visibilityTimeout:Ljava/lang/Integer;

    return-object p0
.end method
