.class public final synthetic Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$GetKeyExecution$EnMnnSlCSLab4dqFXSQq5Nll4w4;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$GetKeyExecution$EnMnnSlCSLab4dqFXSQq5Nll4w4;->f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$GetKeyExecution$EnMnnSlCSLab4dqFXSQq5Nll4w4;->f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->lambda$getRunningTask$0(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v0

    return-object v0
.end method
