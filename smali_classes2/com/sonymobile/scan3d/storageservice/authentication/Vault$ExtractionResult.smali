.class public Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;
.super Ljava/lang/Object;
.source "Vault.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/Vault;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtractionResult"
.end annotation


# instance fields
.field private final mIdentifier:Ljava/lang/String;

.field private final mPreviewPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .locals 0

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->mIdentifier:Ljava/lang/String;

    if-eqz p2, :cond_0

    .line 96
    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->mPreviewPath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->mIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviewPath()Ljava/lang/String;
    .locals 1

    .line 123
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->mPreviewPath:Ljava/lang/String;

    return-object v0
.end method

.method public success()Z
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->mIdentifier:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;->mPreviewPath:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
