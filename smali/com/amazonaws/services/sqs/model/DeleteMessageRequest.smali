.class public Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;
.super Lcom/amazonaws/AmazonWebServiceRequest;
.source "DeleteMessageRequest.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private queueUrl:Ljava/lang/String;

.field private receiptHandle:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 75
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 93
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 94
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 95
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->setReceiptHandle(Ljava/lang/String;)V

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

    .line 243
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    if-nez v2, :cond_2

    return v1

    .line 245
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    .line 247
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

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

    .line 249
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 251
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

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

    .line 253
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 254
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    return v1

    :cond_a
    return v0
.end method

.method public getQueueUrl()Ljava/lang/String;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->queueUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getReceiptHandle()Ljava/lang/String;
    .locals 1

    .line 171
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->receiptHandle:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 230
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 232
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    return v0
.end method

.method public setQueueUrl(Ljava/lang/String;)V
    .locals 0

    .line 133
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->queueUrl:Ljava/lang/String;

    return-void
.end method

.method public setReceiptHandle(Ljava/lang/String;)V
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->receiptHandle:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 215
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 216
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 218
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QueueUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 219
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 220
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ReceiptHandle: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getReceiptHandle()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v1, "}"

    .line 221
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;
    .locals 0

    .line 157
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->queueUrl:Ljava/lang/String;

    return-object p0
.end method

.method public withReceiptHandle(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->receiptHandle:Ljava/lang/String;

    return-object p0
.end method
