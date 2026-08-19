.class Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$MetadataUploader;
.super Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MetadataUploader"
.end annotation


# static fields
.field private static final KEY_CREATED:Ljava/lang/String; = "created"

.field private static final KEY_DISPLAY_NAME:Ljava/lang/String; = "display_name"

.field private static final KEY_IMPROVEMENT:Ljava/lang/String; = "is_improvement"

.field private static final KEY_NAME:Ljava/lang/String; = "name"

.field private static final KEY_SCAN_TYPE:Ljava/lang/String; = "policy_mode"

.field private static final METADATA_FILE_NAME:Ljava/lang/String; = "metadata.json"


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 3

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/16 v2, 0x20

    .line 684
    invoke-direct {p0, p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;-><init>(Landroid/content/Context;IZI)V

    return-void
.end method


# virtual methods
.method getFile(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/io/File;ZLcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/File;
    .locals 3

    .line 693
    :try_start_0
    new-instance p3, Ljava/io/File;

    const-string p4, "metadata.json"

    invoke-direct {p3, p2, p4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 694
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$MetadataUploader;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getDisplayName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p2

    .line 696
    new-instance p4, Lorg/json/JSONObject;

    invoke-direct {p4}, Lorg/json/JSONObject;-><init>()V

    const-string v0, "name"

    .line 697
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "created"

    .line 698
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getCreated()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {p4, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "policy_mode"

    .line 699
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getScanType()I

    move-result v1

    invoke-virtual {p4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v0, "display_name"

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const-string p2, ""

    .line 700
    :goto_0
    invoke-virtual {p4, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "is_improvement"

    .line 701
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isImprovement()Z

    move-result p1

    invoke-virtual {p4, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 702
    invoke-static {p4, p3}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->jsonToFile(Lorg/json/JSONObject;Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p3

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 705
    :goto_1
    new-instance p2, Ljava/lang/RuntimeException;

    const-string p3, "getFile(): Failed to create or write to temp file."

    invoke-direct {p2, p3, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method
