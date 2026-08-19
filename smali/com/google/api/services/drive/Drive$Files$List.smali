.class public Lcom/google/api/services/drive/Drive$Files$List;
.super Lcom/google/api/services/drive/DriveRequest;
.source "Drive.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/services/drive/Drive$Files;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "List"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/api/services/drive/DriveRequest<",
        "Lcom/google/api/services/drive/model/FileList;",
        ">;"
    }
.end annotation


# static fields
.field private static final REST_PATH:Ljava/lang/String; = "files"


# instance fields
.field private corpora:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private corpus:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private includeTeamDriveItems:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private orderBy:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private pageSize:Ljava/lang/Integer;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private pageToken:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private q:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private spaces:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private supportsTeamDrives:Ljava/lang/Boolean;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field private teamDriveId:Ljava/lang/String;
    .annotation runtime Lcom/google/api/client/util/Key;
    .end annotation
.end field

.field final synthetic this$1:Lcom/google/api/services/drive/Drive$Files;


# direct methods
.method protected constructor <init>(Lcom/google/api/services/drive/Drive$Files;)V
    .locals 6

    .line 3469
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->this$1:Lcom/google/api/services/drive/Drive$Files;

    .line 3470
    iget-object v1, p1, Lcom/google/api/services/drive/Drive$Files;->this$0:Lcom/google/api/services/drive/Drive;

    const-string v2, "GET"

    const-string v3, "files"

    const-class v5, Lcom/google/api/services/drive/model/FileList;

    const/4 v4, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/google/api/services/drive/DriveRequest;-><init>(Lcom/google/api/services/drive/Drive;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public buildHttpRequestUsingHead()Lcom/google/api/client/http/HttpRequest;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3480
    invoke-super {p0}, Lcom/google/api/services/drive/DriveRequest;->buildHttpRequestUsingHead()Lcom/google/api/client/http/HttpRequest;

    move-result-object v0

    return-object v0
.end method

.method public executeUsingHead()Lcom/google/api/client/http/HttpResponse;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 3475
    invoke-super {p0}, Lcom/google/api/services/drive/DriveRequest;->executeUsingHead()Lcom/google/api/client/http/HttpResponse;

    move-result-object v0

    return-object v0
.end method

.method public getCorpora()Ljava/lang/String;
    .locals 1

    .line 3533
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->corpora:Ljava/lang/String;

    return-object v0
.end method

.method public getCorpus()Ljava/lang/String;
    .locals 1

    .line 3554
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->corpus:Ljava/lang/String;

    return-object v0
.end method

.method public getIncludeTeamDriveItems()Ljava/lang/Boolean;
    .locals 1

    .line 3570
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getOrderBy()Ljava/lang/String;
    .locals 1

    .line 3625
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->orderBy:Ljava/lang/String;

    return-object v0
.end method

.method public getPageSize()Ljava/lang/Integer;
    .locals 1

    .line 3652
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->pageSize:Ljava/lang/Integer;

    return-object v0
.end method

.method public getPageToken()Ljava/lang/String;
    .locals 1

    .line 3675
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->pageToken:Ljava/lang/String;

    return-object v0
.end method

.method public getQ()Ljava/lang/String;
    .locals 1

    .line 3697
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->q:Ljava/lang/String;

    return-object v0
.end method

.method public getSpaces()Ljava/lang/String;
    .locals 1

    .line 3720
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->spaces:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportsTeamDrives()Ljava/lang/Boolean;
    .locals 1

    .line 3739
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object v0
.end method

.method public getTeamDriveId()Ljava/lang/String;
    .locals 1

    .line 3782
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->teamDriveId:Ljava/lang/String;

    return-object v0
.end method

.method public isIncludeTeamDriveItems()Z
    .locals 2

    .line 3600
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 3603
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public isSupportsTeamDrives()Z
    .locals 2

    .line 3769
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->supportsTeamDrives:Ljava/lang/Boolean;

    if-eqz v0, :cond_1

    sget-object v1, Lcom/google/api/client/util/Data;->NULL_BOOLEAN:Ljava/lang/Boolean;

    if-ne v0, v1, :cond_0

    goto :goto_0

    .line 3772
    :cond_0
    iget-object v0, p0, Lcom/google/api/services/drive/Drive$Files$List;->supportsTeamDrives:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/AbstractGoogleClientRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Files$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/googleapis/services/json/AbstractGoogleJsonClientRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Files$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/client/util/GenericData;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Files$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3793
    invoke-super {p0, p1, p2}, Lcom/google/api/services/drive/DriveRequest;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1, p2}, Lcom/google/api/services/drive/Drive$Files$List;->set(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3485
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setAlt(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setCorpora(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3543
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->corpora:Ljava/lang/String;

    return-object p0
.end method

.method public setCorpus(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3559
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->corpus:Ljava/lang/String;

    return-object p0
.end method

.method public setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3490
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setFields(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setFields(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setIncludeTeamDriveItems(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3575
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->includeTeamDriveItems:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3495
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setKey(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setKey(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3500
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setOauthToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setOrderBy(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3637
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->orderBy:Ljava/lang/String;

    return-object p0
.end method

.method public setPageSize(Ljava/lang/Integer;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3660
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->pageSize:Ljava/lang/Integer;

    return-object p0
.end method

.method public setPageToken(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3683
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->pageToken:Ljava/lang/String;

    return-object p0
.end method

.method public setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3505
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setPrettyPrint(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setQ(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3705
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->q:Ljava/lang/String;

    return-object p0
.end method

.method public setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3510
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setQuotaUser(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method

.method public setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3728
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->spaces:Ljava/lang/String;

    return-object p0
.end method

.method public setSupportsTeamDrives(Ljava/lang/Boolean;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3744
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->supportsTeamDrives:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setTeamDriveId(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3787
    iput-object p1, p0, Lcom/google/api/services/drive/Drive$Files$List;->teamDriveId:Ljava/lang/String;

    return-object p0
.end method

.method public setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;
    .locals 0

    .line 3515
    invoke-super {p0, p1}, Lcom/google/api/services/drive/DriveRequest;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/Drive$Files$List;

    return-object p1
.end method

.method public bridge synthetic setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/DriveRequest;
    .locals 0

    .line 3453
    invoke-virtual {p0, p1}, Lcom/google/api/services/drive/Drive$Files$List;->setUserIp(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    return-object p1
.end method
