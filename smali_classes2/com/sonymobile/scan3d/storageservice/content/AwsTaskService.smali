.class abstract Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;
.super Lcom/sonymobile/scan3d/storageservice/content/TaskService;
.source "AwsTaskService.java"


# instance fields
.field private mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;-><init>()V

    return-void
.end method


# virtual methods
.method final newTask(Landroid/app/job/JobParameters;Z)Lcom/sonymobile/scan3d/storageservice/content/Task;
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    invoke-virtual {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->newTask(Landroid/app/job/JobParameters;ZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/sonymobile/scan3d/storageservice/content/Task;

    move-result-object p1

    return-object p1
.end method

.method abstract newTask(Landroid/app/job/JobParameters;ZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/sonymobile/scan3d/storageservice/content/Task;
.end method

.method public onCreate()V
    .locals 1

    .line 24
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->onCreate()V

    .line 25
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->startSession(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 30
    invoke-super {p0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->onDestroy()V

    .line 31
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTaskService;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->endSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method
