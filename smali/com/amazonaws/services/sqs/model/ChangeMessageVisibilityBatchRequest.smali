.class public Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;
.super Lcom/amazonaws/AmazonWebServiceRequest;
.source "ChangeMessageVisibilityBatchRequest.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private entries:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            ">;"
        }
    .end annotation
.end field

.field private queueUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 76
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            ">;)V"
        }
    .end annotation

    .line 96
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    .line 97
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 98
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setEntries(Ljava/util/Collection;)V

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

    .line 285
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    if-nez v2, :cond_2

    return v1

    .line 287
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    .line 289
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

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

    .line 291
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 293
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

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

    .line 295
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    return v1

    :cond_a
    return v0
.end method

.method public getEntries()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            ">;"
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    return-object v0
.end method

.method public getQueueUrl()Ljava/lang/String;
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->queueUrl:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 273
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 274
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    return v0
.end method

.method public setEntries(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 192
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    return-void

    .line 196
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    return-void
.end method

.method public setQueueUrl(Ljava/lang/String;)V
    .locals 0

    .line 136
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->queueUrl:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 258
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 259
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 261
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QueueUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 263
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Entries: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v1, "}"

    .line 264
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 265
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withEntries(Ljava/util/Collection;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;"
        }
    .end annotation

    .line 245
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setEntries(Ljava/util/Collection;)V

    return-object p0
.end method

.method public varargs withEntries([Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;
    .locals 4

    .line 217
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 218
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    .line 221
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 222
    iget-object v3, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->entries:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;
    .locals 0

    .line 160
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->queueUrl:Ljava/lang/String;

    return-object p0
.end method
