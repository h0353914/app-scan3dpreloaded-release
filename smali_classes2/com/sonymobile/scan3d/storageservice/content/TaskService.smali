.class abstract Lcom/sonymobile/scan3d/storageservice/content/TaskService;
.super Landroid/app/job/JobService;
.source "TaskService.java"


# instance fields
.field private mActiveTasks:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/sonymobile/scan3d/storageservice/content/Task;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method


# virtual methods
.method abstract newTask(Landroid/app/job/JobParameters;Z)Lcom/sonymobile/scan3d/storageservice/content/Task;
.end method

.method public onCreate()V
    .locals 1

    .line 28
    invoke-super {p0}, Landroid/app/job/JobService;->onCreate()V

    .line 29
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->mActiveTasks:Landroid/util/SparseArray;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 34
    invoke-super {p0}, Landroid/app/job/JobService;->onDestroy()V

    .line 36
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->mActiveTasks:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    return-void
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 2

    .line 41
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isSignedIn(Landroid/content/Context;)Z

    move-result v0

    .line 42
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->newTask(Landroid/app/job/JobParameters;Z)Lcom/sonymobile/scan3d/storageservice/content/Task;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 45
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->scheduleTask(Lcom/sonymobile/scan3d/storageservice/content/Task;)V

    .line 46
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->mActiveTasks:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 2

    .line 54
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    .line 55
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->mActiveTasks:Landroid/util/SparseArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/content/Task;

    if-eqz v0, :cond_0

    .line 58
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/content/Task;->cancel()V

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->mActiveTasks:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    const/4 p1, 0x1

    return p1
.end method

.method onTaskFinished(Landroid/app/job/JobParameters;ZZ)V
    .locals 0

    if-nez p2, :cond_0

    .line 74
    invoke-virtual {p0, p1, p3}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    .line 76
    :cond_0
    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    .line 77
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->mActiveTasks:Landroid/util/SparseArray;

    invoke-virtual {p2, p1}, Landroid/util/SparseArray;->remove(I)V

    return-void
.end method

.method abstract scheduleTask(Lcom/sonymobile/scan3d/storageservice/content/Task;)V
.end method
