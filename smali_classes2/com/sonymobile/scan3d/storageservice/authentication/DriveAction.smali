.class public abstract Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;
.super Ljava/lang/Object;
.source "DriveAction.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mExecutor:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic lambda$execute$0(Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;Lcom/google/android/gms/tasks/Task;)V
    .locals 0

    .line 34
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void
.end method


# virtual methods
.method public execute()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "TT;>;"
        }
    .end annotation

    .line 33
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 34
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->getRunningTask()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveAction$bA1Ts_qyAFzYvjnNIrn_oRUItZo;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveAction$bA1Ts_qyAFzYvjnNIrn_oRUItZo;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->addOnCompleteListener(Lcom/google/android/gms/tasks/OnCompleteListener;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method public final executeWait()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 62
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->execute()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->await(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method getExecutor()Ljava/util/concurrent/Executor;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->mExecutor:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method abstract getRunningTask()Lcom/google/android/gms/tasks/Task;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "TT;>;"
        }
    .end annotation
.end method
