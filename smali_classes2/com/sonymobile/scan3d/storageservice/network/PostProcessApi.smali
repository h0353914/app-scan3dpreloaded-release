.class public final Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;
.super Ljava/lang/Object;
.source "PostProcessApi.java"


# static fields
.field private static final LOG_S3_KEY:Ljava/lang/String; = "log"

.field private static final S3_PREFIX:Ljava/lang/String; = "cognito/3dcreator"

.field private static final SLASH:Ljava/lang/String; = "/"


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static varargs buildS3Path([Ljava/lang/String;)Ljava/lang/String;
    .locals 5

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "cognito/3dcreator"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p0, v2

    const-string v4, "/"

    .line 120
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 123
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static deleteLog(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 101
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v0

    if-eqz p1, :cond_0

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_0

    .line 105
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessLogBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x2

    .line 106
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->buildS3Path([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 107
    invoke-virtual {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->delete(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static getPostProcessLogKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x3

    .line 55
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 p0, 0x1

    aput-object p1, v0, p0

    const-string p0, "log"

    const/4 p1, 0x2

    aput-object p0, v0, p1

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->buildS3Path([Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static listLogs(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_1

    .line 72
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessLogBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    .line 73
    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->buildS3Path([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 75
    invoke-virtual {p1, p0, v1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->listObjects(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    .line 76
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/s3/model/S3ObjectSummary;

    .line 77
    invoke-virtual {p1}, Lcom/amazonaws/services/s3/model/S3ObjectSummary;->getKey()Ljava/lang/String;

    move-result-object p1

    const-string v1, "log"

    .line 78
    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "/"

    .line 79
    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 80
    array-length v1, p1

    const/4 v2, 0x3

    if-le v1, v2, :cond_0

    .line 81
    aget-object p1, p1, v2

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method
