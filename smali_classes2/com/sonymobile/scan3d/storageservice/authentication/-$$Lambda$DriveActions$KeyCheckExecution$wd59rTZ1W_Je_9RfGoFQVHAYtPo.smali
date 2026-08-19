.class public final synthetic Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$wd59rTZ1W_Je_9RfGoFQVHAYtPo;
.super Ljava/lang/Object;
.source "lambda"

# interfaces
.implements Lcom/google/android/gms/tasks/Continuation;


# instance fields
.field private final synthetic f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;


# direct methods
.method public synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$wd59rTZ1W_Je_9RfGoFQVHAYtPo;->f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;

    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$wd59rTZ1W_Je_9RfGoFQVHAYtPo;->f$0:Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->lambda$exists$2(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method
