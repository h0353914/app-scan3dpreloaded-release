.class abstract Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.super Lcom/sonymobile/scan3d/storageservice/content/Task;
.source "AwsTask.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.AwsTask"


# instance fields
.field private mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/content/Task;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZ)V

    .line 42
    iput-object p5, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    return-void
.end method


# virtual methods
.method final doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V
    .locals 2

    const/4 v0, 0x0

    .line 48
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->refreshCredentials()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 49
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    invoke-virtual {p0, p1, p2, v1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 51
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->isForeground(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 53
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->removeAllFinishedTransfers()V

    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->onFailed(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    :cond_1
    :goto_0
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    .line 62
    :catch_0
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->onFailed(Landroid/content/Context;)V

    .line 63
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->TAG:Ljava/lang/String;

    const-string p2, "Task failed when refreshing credentials."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 59
    :catch_1
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->onFailed(Landroid/content/Context;)V

    .line 60
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->TAG:Ljava/lang/String;

    const-string p2, "Task failed since session is closed."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    .line 65
    :goto_2
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;->mSession:Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    .line 66
    throw p1
.end method

.method abstract doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation
.end method
