.class public final synthetic Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$bsqQQkLiZB6eBfcUiZbPH-QwmCk;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$bsqQQkLiZB6eBfcUiZbPH-QwmCk;->f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$bsqQQkLiZB6eBfcUiZbPH-QwmCk;->f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->lambda$exists$1(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)Lcom/google/api/services/drive/model/FileList;

    move-result-object v0

    return-object v0
.end method
