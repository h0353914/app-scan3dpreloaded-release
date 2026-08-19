.class final Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;
.super Ljava/lang/Object;
.source "MultipartForm.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;,
        Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;,
        Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;,
        Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;,
        Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;
    }
.end annotation


# static fields
.field private static final BOUNDARY:Ljava/lang/String; = "*****"

.field private static final LINE_END:Ljava/lang/String; = "\r\n"

.field private static final TWO_HYPHENS:Ljava/lang/String; = "--"


# instance fields
.field private final mBoundary:Ljava/lang/String;

.field private final mWriters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 353
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 354
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->getMultipartBoundary()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mBoundary:Ljava/lang/String;

    .line 355
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    return-void
.end method

.method private static getMultipartBoundary()Ljava/lang/String;
    .locals 3

    .line 460
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "*****"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "*****"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private size(Landroid/content/Context;)J
    .locals 5

    .line 448
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;

    .line 449
    invoke-virtual {v3, p1}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;->size(Landroid/content/Context;)J

    move-result-wide v3

    add-long/2addr v1, v3

    goto :goto_0

    :cond_0
    return-wide v1
.end method


# virtual methods
.method addFile(Ljava/lang/String;Ljava/io/File;Z)V
    .locals 3

    .line 418
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;

    const/4 v2, 0x0

    invoke-direct {v1, p2, p1, v2, p3}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;-><init>(Ljava/io/File;Ljava/lang/String;ZZ)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addFile(Ljava/lang/String;Ljava/io/File;ZZ)V
    .locals 2

    .line 407
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;

    invoke-direct {v1, p2, p1, p3, p4}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;-><init>(Ljava/io/File;Ljava/lang/String;ZZ)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addFileAsResource(Ljava/lang/String;IZ)V
    .locals 2
    .param p2    # I
        .annotation build Landroidx/annotation/RawRes;
        .end annotation
    .end param

    .line 395
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;

    invoke-direct {v1, p2, p1, p3}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;-><init>(ILjava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addTextField(Ljava/lang/String;I)V
    .locals 3

    .line 384
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    const/4 v2, 0x0

    invoke-direct {v1, p1, p2, v2}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method addTextField(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 374
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;

    const/4 v2, 0x1

    invoke-direct {v1, p1, p2, v2}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method getBoundary()Ljava/lang/String;
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mBoundary:Ljava/lang/String;

    return-object v0
.end method

.method onWrite(Landroid/content/Context;Ljava/io/DataOutputStream;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;)V
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 430
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->size(Landroid/content/Context;)J

    move-result-wide v8

    .line 432
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mWriters:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const-wide/16 v0, 0x0

    move-wide v6, v0

    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;

    .line 433
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "--"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mBoundary:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, v8

    .line 434
    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;->onWrite(Landroid/content/Context;Ljava/io/DataOutputStream;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;JJ)J

    move-result-wide v6

    goto :goto_0

    .line 436
    :cond_0
    invoke-virtual {p3, v8, v9, v6, v7}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->reportNetworkProgress(JJ)V

    .line 437
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "--"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;->mBoundary:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "--"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    return-void
.end method
