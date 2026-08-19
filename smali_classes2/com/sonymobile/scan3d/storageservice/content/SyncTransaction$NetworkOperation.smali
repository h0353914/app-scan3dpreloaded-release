.class Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;
.super Ljava/lang/Object;
.source "SyncTransaction.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NetworkOperation"
.end annotation


# instance fields
.field private mAreKeysRequired:Z

.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mType:I


# direct methods
.method constructor <init>(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V
    .locals 0

    .line 78
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 79
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mType:I

    .line 80
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 81
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mAreKeysRequired:Z

    return-void
.end method


# virtual methods
.method areKeysRequired()Z
    .locals 1

    .line 90
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mAreKeysRequired:Z

    return v0
.end method

.method execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z
    .locals 2

    .line 102
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mAreKeysRequired:Z

    if-eqz v0, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    .line 103
    :cond_1
    :goto_0
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mType:I

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-static {p1, v0, v1, p2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestTransferJob(Landroid/content/Context;ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z

    move-result p1

    :goto_1
    return p1
.end method
