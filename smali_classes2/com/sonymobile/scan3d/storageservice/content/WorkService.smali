.class public final Lcom/sonymobile/scan3d/storageservice/content/WorkService;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;
.source "WorkService.java"


# instance fields
.field private mConcurrentService:Ljava/util/concurrent/ExecutorService;

.field private mQueuedService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;-><init>()V

    return-void
.end method


# virtual methods
.method newTask(Landroid/app/job/JobParameters;ZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/sonymobile/scan3d/storageservice/content/Task;
    .locals 0

    .line 48
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 1

    .line 31
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onCreate()V

    .line 32
    invoke-static {}, Ljava/util/concurrent/Executors;->newCachedThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/WorkService;->mConcurrentService:Ljava/util/concurrent/ExecutorService;

    .line 33
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/WorkService;->mQueuedService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 38
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onDestroy()V

    .line 40
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/WorkService;->mConcurrentService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 41
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/WorkService;->mQueuedService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    return-void
.end method

.method public bridge synthetic onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    .line 17
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onStartJob(Landroid/app/job/JobParameters;)Z

    move-result p1

    return p1
.end method

.method public bridge synthetic onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    .line 17
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->onStopJob(Landroid/app/job/JobParameters;)Z

    move-result p1

    return p1
.end method

.method scheduleTask(Lcom/sonymobile/scan3d/storageservice/content/Task;)V
    .locals 2

    .line 58
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->isConcurrent()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/WorkService;->mConcurrentService:Ljava/util/concurrent/ExecutorService;

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 61
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/WorkService;->mQueuedService:Ljava/util/concurrent/ExecutorService;

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :goto_0
    return-void
.end method
