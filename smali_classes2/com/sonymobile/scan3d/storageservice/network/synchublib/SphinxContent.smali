.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;
.super Ljava/lang/Object;
.source "SphinxContent.java"


# instance fields
.field private contentId:Ljava/lang/String;

.field private creationDate:J

.field private downloadable:Z

.field private etag:Ljava/lang/String;

.field private feedback:Ljava/lang/String;

.field private improvement:Z

.field private name:Ljava/lang/String;

.field private policy:I

.field private rating:F

.field private shareHash:Ljava/lang/String;

.field private sharedMeshes:I

.field private visible:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContentId()Ljava/lang/String;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->contentId:Ljava/lang/String;

    return-object v0
.end method

.method public getCreationDate()J
    .locals 2

    .line 80
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->creationDate:J

    return-wide v0
.end method

.method public getETag()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->etag:Ljava/lang/String;

    return-object v0
.end method

.method public getFeedback()Ljava/lang/String;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->feedback:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getPolicy()I
    .locals 1

    .line 96
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->policy:I

    return v0
.end method

.method public getRating()F
    .locals 1

    .line 88
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->rating:F

    return v0
.end method

.method public getShareHash()Ljava/lang/String;
    .locals 1

    .line 128
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->shareHash:Ljava/lang/String;

    return-object v0
.end method

.method public getSharedMeshes()I
    .locals 1

    .line 136
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->sharedMeshes:I

    return v0
.end method

.method public isDownloadable()Z
    .locals 1

    .line 112
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->downloadable:Z

    return v0
.end method

.method public isImprovement()Z
    .locals 1

    .line 120
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->improvement:Z

    return v0
.end method

.method public isVisible()Z
    .locals 1

    .line 104
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->visible:Z

    return v0
.end method

.method public setContentId(Ljava/lang/String;)V
    .locals 0

    .line 68
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->contentId:Ljava/lang/String;

    return-void
.end method

.method public setCreationDate(J)V
    .locals 0

    .line 84
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->creationDate:J

    return-void
.end method

.method public setDownloadable(Z)V
    .locals 0

    .line 116
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->downloadable:Z

    return-void
.end method

.method public setETag(Ljava/lang/String;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->etag:Ljava/lang/String;

    return-void
.end method

.method public setFeedback(Ljava/lang/String;)V
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->feedback:Ljava/lang/String;

    return-void
.end method

.method public setIsImprovement(Z)V
    .locals 0

    .line 124
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->improvement:Z

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->name:Ljava/lang/String;

    return-void
.end method

.method public setPolicy(I)V
    .locals 0

    .line 100
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->policy:I

    return-void
.end method

.method public setRating(F)V
    .locals 0

    .line 92
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->rating:F

    return-void
.end method

.method public setShareHash(Ljava/lang/String;)V
    .locals 0

    .line 132
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->shareHash:Ljava/lang/String;

    return-void
.end method

.method public setSharedMeshes(I)V
    .locals 0

    .line 140
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->sharedMeshes:I

    return-void
.end method

.method public setVisible(Z)V
    .locals 0

    .line 108
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/SphinxContent;->visible:Z

    return-void
.end method
