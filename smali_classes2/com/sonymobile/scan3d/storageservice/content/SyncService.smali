.class public final Lcom/sonymobile/scan3d/storageservice/content/SyncService;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;
.source "SyncService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;
    }
.end annotation


# static fields
.field private static volatile sIsSyncActive:Z

.field private static sObservers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile sSyncDisabled:Z
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 25
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sObservers:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 20
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;-><init>()V

    return-void
.end method

.method public static allowSync(Z)V
    .locals 0

    xor-int/lit8 p0, p0, 0x1

    .line 75
    sput-boolean p0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sSyncDisabled:Z

    return-void
.end method

.method public static isSyncActive()Z
    .locals 1

    .line 84
    sget-boolean v0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sIsSyncActive:Z

    return v0
.end method

.method private static declared-synchronized notifyObservers(Z)V
    .locals 3

    const-class v0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;

    monitor-enter v0

    .line 131
    :try_start_0
    sput-boolean p0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sIsSyncActive:Z

    .line 132
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sObservers:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;

    .line 133
    invoke-interface {v2, p0}, Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;->onSync(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 135
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized registerObserver(Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;)V
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;

    monitor-enter v0

    .line 57
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sObservers:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 58
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sObservers:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 60
    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized unregisterObserver(Lcom/sonymobile/scan3d/storageservice/content/SyncService$SyncObserver;)V
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;

    monitor-enter v0

    .line 66
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sObservers:Ljava/util/List;

    invoke-interface {v1, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method newTask(Landroid/app/job/JobParameters;ZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/sonymobile/scan3d/storageservice/content/Task;
    .locals 0

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    .line 92
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->notifyObservers(Z)V

    .line 93
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;

    invoke-direct {p2, p0, p1, p3}, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    return-object p2
.end method

.method public bridge synthetic onCreate()V
    .locals 0

    .line 20
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onCreate()V

    return-void
.end method

.method public bridge synthetic onDestroy()V
    .locals 0

    .line 20
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onDestroy()V

    return-void
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 1

    .line 107
    sget-boolean v0, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->sSyncDisabled:Z

    if-nez v0, :cond_0

    .line 108
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onStartJob(Landroid/app/job/JobParameters;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 1

    const/4 v0, 0x0

    .line 115
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->notifyObservers(Z)V

    .line 116
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onStopJob(Landroid/app/job/JobParameters;)Z

    move-result p1

    return p1
.end method

.method onTaskFinished(Landroid/app/job/JobParameters;ZZ)V
    .locals 1

    const/4 v0, 0x0

    .line 121
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/content/SyncService;->notifyObservers(Z)V

    .line 122
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onTaskFinished(Landroid/app/job/JobParameters;ZZ)V

    return-void
.end method

.method scheduleTask(Lcom/sonymobile/scan3d/storageservice/content/Task;)V
    .locals 2

    .line 100
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    const/4 v1, 0x0

    .line 101
    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 102
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    return-void
.end method
