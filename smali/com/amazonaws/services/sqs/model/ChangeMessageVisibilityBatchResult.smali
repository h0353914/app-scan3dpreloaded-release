.class public Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
.super Ljava/lang/Object;
.source "ChangeMessageVisibilityBatchResult.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private failed:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;",
            ">;"
        }
    .end annotation
.end field

.field private successful:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->successful:Ljava/util/List;

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->failed:Ljava/util/List;

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

    .line 235
    :cond_1
    instance-of v2, p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;

    if-nez v2, :cond_2

    return v1

    .line 237
    :cond_2
    check-cast p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;

    .line 239
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_3

    move v2, v0

    goto :goto_0

    :cond_3
    move v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

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

    .line 241
    :cond_5
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_6

    .line 242
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v2

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    return v1

    .line 244
    :cond_6
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_7

    move v2, v0

    goto :goto_2

    :cond_7
    move v2, v1

    :goto_2
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

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

    .line 246
    :cond_9
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_a

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_a

    return v1

    :cond_a
    return v0
.end method

.method public getFailed()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;",
            ">;"
        }
    .end annotation

    .line 134
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->failed:Ljava/util/List;

    return-object v0
.end method

.method public getSuccessful()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;",
            ">;"
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->successful:Ljava/util/List;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 223
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->hashCode()I

    move-result v0

    :goto_0
    const/16 v2, 0x1f

    add-int/2addr v0, v2

    mul-int/2addr v0, v2

    .line 224
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    move-result v1

    :goto_1
    add-int/2addr v0, v1

    return v0
.end method

.method public setFailed(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 148
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->failed:Ljava/util/List;

    return-void

    .line 152
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->failed:Ljava/util/List;

    return-void
.end method

.method public setSuccessful(Ljava/util/Collection;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    .line 68
    iput-object p1, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->successful:Ljava/util/List;

    return-void

    .line 72
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->successful:Ljava/util/List;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{"

    .line 209
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 210
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 211
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Successful: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    :cond_0
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 213
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_1
    const-string v1, "}"

    .line 214
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public withFailed(Ljava/util/Collection;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;"
        }
    .end annotation

    .line 195
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->setFailed(Ljava/util/Collection;)V

    return-object p0
.end method

.method public varargs withFailed([Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 4

    .line 170
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getFailed()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 171
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->failed:Ljava/util/List;

    .line 173
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 174
    iget-object v3, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->failed:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method

.method public withSuccessful(Ljava/util/Collection;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;"
        }
    .end annotation

    .line 120
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->setSuccessful(Ljava/util/Collection;)V

    return-object p0
.end method

.method public varargs withSuccessful([Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResultEntry;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 4

    .line 93
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 94
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->successful:Ljava/util/List;

    .line 97
    :cond_0
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    aget-object v2, p1, v1

    .line 98
    iget-object v3, p0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;->successful:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object p0
.end method
