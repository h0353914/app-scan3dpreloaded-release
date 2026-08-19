.class public Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
.super Lcom/amazonaws/AmazonWebServiceRequest;
.source "ReceiveMessageRequest.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private attributeNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private maxNumberOfMessages:Ljava/lang/Integer;

.field private messageAttributeNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private queueUrl:Ljava/lang/String;

.field private receiveRequestAttemptId:Ljava/lang/String;

.field private visibilityTimeout:Ljava/lang/Integer;

.field private waitTimeSeconds:Ljava/lang/Integer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 421
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 265
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 436
    invoke-direct {p0}, Lcom/amazonaws/AmazonWebServiceRequest;-><init>()V

    .line 265
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    .line 285
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    .line 437
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->setQueueUrl(Ljava/lang/String;)V

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

    .line 2808
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    if-nez v2, :cond_2

    return v1

    .line 2810
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    .line 2812
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

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

    .line 2814
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 2816
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

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

    .line 2818
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_a

    .line 2819
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_a

    return v1

    .line 2821
    :cond_a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_b

    move v2, v0

    goto :goto_4

    :cond_b
    move v2, v1

    :goto_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

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

    .line 2823
    :cond_d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 2824
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_e

    return v1

    .line 2826
    :cond_e
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_f

    move v2, v0

    goto :goto_6

    :cond_f
    move v2, v1

    :goto_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

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

    .line 2828
    :cond_11
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_12

    .line 2829
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_12

    return v1

    .line 2831
    :cond_12
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_13

    move v2, v0

    goto :goto_8

    :cond_13
    move v2, v1

    :goto_8
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

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

    .line 2833
    :cond_15
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_16

    .line 2834
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_16

    return v1

    .line 2836
    :cond_16
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v2

    if-nez v2, :cond_17

    move v2, v0

    goto :goto_a

    :cond_17
    move v2, v1

    :goto_a
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

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

    .line 2838
    :cond_19
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v2

    if-eqz v2, :cond_1a

    .line 2839
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1a

    return v1

    .line 2841
    :cond_1a
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1b

    move v2, v0

    goto :goto_c

    :cond_1b
    move v2, v1

    :goto_c
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

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

    .line 2843
    :cond_1d
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1e

    .line 2844
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1e

    return v1

    :cond_1e
    return v0
.end method

.method public getAttributeNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 805
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    return-object v0
.end method

.method public getMaxNumberOfMessages()Ljava/lang/Integer;
    .locals 1

    .line 1959
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->maxNumberOfMessages:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMessageAttributeNames()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1786
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    return-object v0
.end method

.method public getQueueUrl()Ljava/lang/String;
    .locals 1

    .line 456
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->queueUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getReceiveRequestAttemptId()Ljava/lang/String;
    .locals 1

    .line 2329
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->receiveRequestAttemptId:Ljava/lang/String;

    return-object v0
.end method

.method public getVisibilityTimeout()Ljava/lang/Integer;
    .locals 1

    .line 2028
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->visibilityTimeout:Ljava/lang/Integer;

    return-object v0
.end method

.method public getWaitTimeSeconds()Ljava/lang/Integer;
    .locals 1

    .line 2085
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->waitTimeSeconds:Ljava/lang/Integer;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 2782
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 2784
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    :goto_1
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 2787
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_2

    move v3, v1

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    move-result v3

    :goto_2
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 2789
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_3

    move v3, v1

    goto :goto_3

    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_3
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 2791
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_4

    move v3, v1

    goto :goto_4

    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_4
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 2793
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v3

    if-nez v3, :cond_5

    move v3, v1

    goto :goto_5

    :cond_5
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->hashCode()I

    move-result v3

    :goto_5
    add-int/2addr v0, v3

    mul-int/2addr v0, v2

    .line 2796
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_6

    goto :goto_6

    :cond_6
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v1

    .line 2797
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :goto_6
    add-int/2addr v0, v1

    return v0
.end method

.method public setAttributeNames(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 1112
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    return-void

    .line 1116
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    return-void
.end method

.method public setMaxNumberOfMessages(Ljava/lang/Integer;)V
    .locals 0

    .line 1982
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->maxNumberOfMessages:Ljava/lang/Integer;

    return-void
.end method

.method public setMessageAttributeNames(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 1829
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    return-void

    .line 1833
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    return-void
.end method

.method public setQueueUrl(Ljava/lang/String;)V
    .locals 0

    .line 475
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->queueUrl:Ljava/lang/String;

    return-void
.end method

.method public setReceiveRequestAttemptId(Ljava/lang/String;)V
    .locals 0

    .line 2534
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->receiveRequestAttemptId:Ljava/lang/String;

    return-void
.end method

.method public setVisibilityTimeout(Ljava/lang/Integer;)V
    .locals 0

    .line 2045
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->visibilityTimeout:Ljava/lang/Integer;

    return-void
.end method

.method public setWaitTimeSeconds(Ljava/lang/Integer;)V
    .locals 0

    .line 2103
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->waitTimeSeconds:Ljava/lang/Integer;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 2757
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 2758
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2759
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2760
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "QueueUrl: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2761
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 2762
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AttributeNames: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2763
    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 2764
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MessageAttributeNames: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2765
    :cond_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 2766
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "MaxNumberOfMessages: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2767
    :cond_3
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 2768
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "VisibilityTimeout: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2769
    :cond_4
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_5

    .line 2770
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "WaitTimeSeconds: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getWaitTimeSeconds()Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2771
    :cond_5
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_6

    .line 2772
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ReceiveRequestAttemptId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getReceiveRequestAttemptId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    const-string v1, "}"

    .line 2773
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2774
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withAttributeNames(Ljava/util/Collection;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;"
        }
    .end annotation

    .line 1744
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->setAttributeNames(Ljava/util/Collection;)V

    return-object p0
.end method

.method public varargs withAttributeNames([Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 4

    .line 1427
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1428
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    .line 1430
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1431
    iget-object v3, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->attributeNames:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public withMaxNumberOfMessages(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0

    .line 2010
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->maxNumberOfMessages:Ljava/lang/Integer;

    return-object p0
.end method

.method public withMessageAttributeNames(Ljava/util/Collection;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;"
        }
    .end annotation

    .line 1935
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->setMessageAttributeNames(Ljava/util/Collection;)V

    return-object p0
.end method

.method public varargs withMessageAttributeNames([Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 4

    .line 1880
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1881
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    .line 1884
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 1885
    iget-object v3, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->messageAttributeNames:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0

    .line 499
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->queueUrl:Ljava/lang/String;

    return-object p0
.end method

.method public withReceiveRequestAttemptId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0

    .line 2744
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->receiveRequestAttemptId:Ljava/lang/String;

    return-object p0
.end method

.method public withVisibilityTimeout(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0

    .line 2067
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->visibilityTimeout:Ljava/lang/Integer;

    return-object p0
.end method

.method public withWaitTimeSeconds(Ljava/lang/Integer;)Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;
    .locals 0

    .line 2126
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->waitTimeSeconds:Ljava/lang/Integer;

    return-object p0
.end method
