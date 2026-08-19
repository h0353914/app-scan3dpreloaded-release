.class public Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;
.super Ljava/lang/Object;
.source "Jobs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/content/Jobs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RequestBuilder"
.end annotation


# instance fields
.field private final mIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 201
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 202
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    .line 203
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.sonymobile.scan3d.extra.improvement_type"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;)Landroid/content/Intent;
    .locals 0

    .line 189
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    return-object p0
.end method


# virtual methods
.method public withImprovement(Lcom/sonymobile/scan3d/storageservice/provider/Improvement;)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;
    .locals 4

    .line 247
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.sonymobile.scan3d.extra.improvement_id"

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    return-object p0
.end method

.method public withProtocolVersion(I)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;
    .locals 2

    .line 213
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.sonymobile.scan3d.extra.protocol_version"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    return-object p0
.end method

.method public withServerKey(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;
    .locals 2

    .line 235
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.sonymobile.scan3d.extra.server_key"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object p0
.end method

.method public withSessionId(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;
    .locals 2

    .line 224
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->mIntent:Landroid/content/Intent;

    const-string v1, "com.sonymobile.scan3d.extra.session_id"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object p0
.end method
