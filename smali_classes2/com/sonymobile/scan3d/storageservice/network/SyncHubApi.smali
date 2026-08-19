.class public final Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.super Ljava/lang/Object;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;,
        Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;,
        Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$MetadataUploader;,
        Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;,
        Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;,
        Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.network.SyncHubApi"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 54
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 0

    .line 54
    invoke-static {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getDownloadUrl(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 0

    .line 54
    invoke-static {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->download(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 0

    .line 54
    invoke-static/range {p0 .. p5}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getS3PrivateUploadData(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 0

    .line 54
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->uploadToS3(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 0

    .line 54
    invoke-static/range {p0 .. p5}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getS3PublicUploadData(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static deleteAllModels(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 265
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/deleteAll3DScans"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 267
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$4;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$4;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    .line 283
    invoke-virtual {v1, p0, v0, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$4;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static deleteModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 239
    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->deleteModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method private static deleteModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 299
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/delete3Dscan"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 301
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$5;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$5;-><init>()V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    .line 318
    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    const/4 p3, 0x1

    aput-object p1, v2, p3

    invoke-virtual {v1, p0, v0, p2, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$5;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method private static download(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;",
            "Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 1154
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;-><init>()V

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    const/4 p2, 0x1

    aput-object p3, v1, p2

    const/4 p2, 0x0

    .line 1241
    invoke-virtual {v0, p0, p1, p2, v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static getAuthToken(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 89
    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getToken(Landroid/content/Context;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method private static getDownloadUrl(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1257
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/requestSignedURI3D"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1259
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$8;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$8;-><init>()V

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    .line 1280
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->getS3Key()Ljava/lang/String;

    move-result-object p1

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x1

    aput-object p2, v2, p1

    invoke-virtual {v1, p0, v0, p3, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$8;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static getDownloadableContent(Landroid/content/Context;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;",
            ">;"
        }
    .end annotation

    .line 978
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 980
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3, v3, v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;-><init>(Landroid/content/Context;IZI)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 983
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2, v2, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Downloadable;-><init>(Landroid/content/Context;IZI)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static getPublicUploads(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/viewer/sharing/Shareable;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;",
            ">;"
        }
    .end annotation

    .line 1026
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 1028
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3, v3, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;-><init>(Landroid/content/Context;IZZ)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-eqz p1, :cond_0

    .line 1032
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$10;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p1

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result p1

    aget p1, v1, p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 1041
    :pswitch_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;

    const/4 v1, 0x5

    invoke-direct {p1, p0, v1, v2, v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;-><init>(Landroid/content/Context;IZZ)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1037
    :pswitch_1
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;

    const/4 v1, 0x4

    invoke-direct {p1, p0, v1, v2, v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;-><init>(Landroid/content/Context;IZZ)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1034
    :pswitch_2
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;

    invoke-direct {p1, p0, v2, v2, v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;-><init>(Landroid/content/Context;IZZ)V

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getS3PrivateUploadData(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/io/File;",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;",
            "Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;",
            ">;"
        }
    .end annotation

    .line 1065
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/requestPost3DObject"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1066
    invoke-static {p2, p4, p1, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->newPrivateUploadExecutor(Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;

    move-result-object p1

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    .line 1067
    invoke-virtual {p1, p0, v0, p5, p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method private static getS3PublicUploadData(Landroid/content/Context;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/io/File;",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;",
            ">;"
        }
    .end annotation

    .line 1084
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/requestPostPublic3DObject"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1087
    invoke-static {p2, p3, p1, p5}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->newPublicUploadExecutor(Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Ljava/lang/String;Ljava/io/File;Z)Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;

    move-result-object p1

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    .line 1088
    invoke-virtual {p1, p0, v0, p4, p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$UploadDataExecutor;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method private static getToken(Landroid/content/Context;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Z)",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;"
        }
    .end annotation

    .line 1298
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1299
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/generateToken"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1302
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;-><init>(Landroid/content/Context;)V

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Boolean;

    .line 1330
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    const/4 v3, 0x0

    aput-object p2, v2, v3

    invoke-virtual {v1, p0, v0, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$9;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static getUploadableContent(Landroid/content/Context;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;",
            ">;"
        }
    .end annotation

    .line 995
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 997
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;

    const/4 v3, 0x1

    const/4 v4, 0x4

    invoke-direct {v2, p0, v3, v3, v4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;-><init>(Landroid/content/Context;IZI)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1000
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;

    const/4 v3, 0x0

    const/16 v4, 0x10

    invoke-direct {v2, p0, v3, v3, v4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;-><init>(Landroid/content/Context;IZI)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1008
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f05000b

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1010
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;

    invoke-direct {v2, p0, v1, v3, v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;-><init>(Landroid/content/Context;IZI)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1014
    :cond_0
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$MetadataUploader;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$MetadataUploader;-><init>(Landroid/content/Context;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public static listMetadata(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;",
            ">;>;"
        }
    .end annotation

    .line 142
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/contentList"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 144
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$2;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$2;-><init>()V

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    .line 171
    invoke-virtual {v1, p0, v0, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$2;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static refreshAuthToken(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 101
    invoke-static {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getToken(Landroid/content/Context;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static revokeRefreshToken(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 113
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/Config;->getRevokeRefreshTokenUrl(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 114
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$1;-><init>()V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    const/4 v2, 0x0

    .line 125
    invoke-virtual {v0, p0, p1, v2, v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$1;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static setPackageName(Ljava/lang/String;)V
    .locals 0

    .line 74
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/PropertiesUtil;->setPackageName(Ljava/lang/String;)V

    return-void
.end method

.method public static unshareModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 253
    invoke-static {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->deleteModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method public static updateMetadata(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 188
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/contentUpdate"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 191
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    const/4 v3, 0x0

    aput-object p2, v2, v3

    .line 222
    invoke-virtual {v1, p0, v0, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$3;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method

.method private static uploadToS3(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1100
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 1102
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;

    invoke-direct {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;-><init>()V

    const/4 v2, 0x1

    new-array v2, v2, [Lcom/sonymobile/scan3d/storageservice/network/model/S3UploadData;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 p1, 0x0

    .line 1137
    invoke-virtual {v1, p0, v0, p1, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$6;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    return-object p0
.end method
