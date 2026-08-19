.class public Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;
.super Lcom/amazonaws/AmazonWebServiceRequest;
.source "SetQueueAttributesRequest.java"

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

.field private queueUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 208
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 201
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 391
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 201
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    .line 392
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 393
    invoke-virtual {p0, p2}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->setAttributes(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public addAttributesEntry(Ljava/lang/String;Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;
    .locals 2

    .line 1600
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 1601
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    .line 1603
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 1606
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 1604
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

.method public clearAttributesEntries()Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;
    .locals 1

    const/4 v0, 0x0

    .line 1617
    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

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

    .line 1657
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;

    if-nez v2, :cond_2

    return v1

    .line 1659
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;

    .line 1661
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

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

    .line 1663
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 1665
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

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

    .line 1667
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 1668
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    return v1

    :cond_a
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

    .line 775
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    return-object v0
.end method

.method public getQueueUrl()Ljava/lang/String;
    .locals 1

    .line 412
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->queueUrl:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 1645
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 1646
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->hashCode()I

    move-result v1

    :goto_1
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

    .line 1101
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    return-void
.end method

.method public setQueueUrl(Ljava/lang/String;)V
    .locals 0

    .line 431
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->queueUrl:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1630
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 1631
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1632
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 1633
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QueueUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1634
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 1635
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Attributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->getAttributes()Ljava/util/Map;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v1, "}"

    .line 1636
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1637
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withAttributes(Ljava/util/Map;)Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;"
        }
    .end annotation

    .line 1432
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->attributes:Ljava/util/Map;

    return-object p0
.end method

.method public withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;
    .locals 0

    .line 455
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->queueUrl:Ljava/lang/String;

    return-object p0
.end method
