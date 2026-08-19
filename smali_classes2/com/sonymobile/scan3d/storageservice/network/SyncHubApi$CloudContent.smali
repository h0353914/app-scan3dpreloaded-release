.class public abstract Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;
.super Ljava/lang/Object;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "CloudContent"
.end annotation


# static fields
.field private static final LOG_S3_KEY:Ljava/lang/String; = "log"

.field private static final METADATA_S3_KEY:Ljava/lang/String; = "metadata.json"

.field private static final PREVIEW_S3_KEY:Ljava/lang/String; = "preview"

.field private static final PROP_MESH_S3_KEY:Ljava/lang/String; = "prop_mesh"

.field private static final RIGGED_MESH_S3_KEY:Ljava/lang/String; = "rigged_scan"

.field private static final SCAN_S3_KEY:Ljava/lang/String; = "scan"

.field public static final TYPE_LOG:I = 0x3

.field public static final TYPE_METADATA:I = 0x2

.field public static final TYPE_PREVIEW:I = 0x0

.field public static final TYPE_PROP_MESH:I = 0x5

.field public static final TYPE_RIGGED_MESH:I = 0x4

.field public static final TYPE_SCAN:I = 0x1


# instance fields
.field protected final mContext:Landroid/content/Context;

.field private final mIsEncrypted:Z

.field private final mTransferFlag:I

.field private final mType:I


# direct methods
.method constructor <init>(Landroid/content/Context;IZI)V
    .locals 0

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 419
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mContext:Landroid/content/Context;

    .line 420
    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mType:I

    .line 421
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mIsEncrypted:Z

    .line 422
    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mTransferFlag:I

    return-void
.end method


# virtual methods
.method getFile(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/io/File;ZLcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/File;
    .locals 3

    .line 507
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->getType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 524
    :pswitch_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "No valid type "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->getType()I

    move-result p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 521
    :pswitch_1
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getPropFileUrl()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 518
    :pswitch_2
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 512
    :pswitch_3
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getLogUrl()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 509
    :pswitch_4
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    .line 515
    :pswitch_5
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getPreviewUrl()Ljava/lang/String;

    move-result-object p1

    :goto_0
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 529
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->isEncrypted()Z

    move-result v1

    if-nez v1, :cond_1

    .line 530
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    return-object p2

    .line 533
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 534
    new-instance p1, Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, p2, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    if-eqz p3, :cond_2

    .line 537
    :try_start_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mContext:Landroid/content/Context;

    invoke-static {p2, v1, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->decrypt(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V

    goto :goto_1

    .line 539
    :cond_2
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mContext:Landroid/content/Context;

    .line 540
    invoke-virtual {p4}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKeyDecoded()[B

    move-result-object p3

    .line 539
    invoke-static {p2, v1, p1, p3}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptForCloud(Landroid/content/Context;Ljava/io/File;Ljava/io/File;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-object p1

    :catch_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    .line 543
    :goto_2
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$000()Ljava/lang/String;

    move-result-object p2

    const-string p3, "getFile Failed"

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method final getS3Key()Ljava/lang/String;
    .locals 2

    .line 470
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mType:I

    packed-switch v0, :pswitch_data_0

    .line 490
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The type must always match a key."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const-string v0, "prop_mesh"

    goto :goto_0

    :pswitch_1
    const-string v0, "rigged_scan"

    goto :goto_0

    :pswitch_2
    const-string v0, "log"

    goto :goto_0

    :pswitch_3
    const-string v0, "metadata.json"

    goto :goto_0

    :pswitch_4
    const-string v0, "scan"

    goto :goto_0

    :pswitch_5
    const-string v0, "preview"

    :goto_0
    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final getTransferFlag()I
    .locals 1

    .line 441
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mTransferFlag:I

    return v0
.end method

.method public getType()I
    .locals 1

    .line 450
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mType:I

    return v0
.end method

.method public final isEncrypted()Z
    .locals 1

    .line 459
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mIsEncrypted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final isTransferred(I)Z
    .locals 1

    .line 432
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->mTransferFlag:I

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
