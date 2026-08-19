.class final Lcom/sonymobile/scan3d/storageservice/content/DeleteAccountTask;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "DeleteAccountTask.java"


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 30
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method static synthetic lambda$onFailed$0(Landroid/content/Context;)V
    .locals 2

    const v0, 0x7f100186

    const/4 v1, 0x1

    .line 43
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    .line 44
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 36
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postDeleteAccountJob()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/DeleteAccountTask;->setReschedule(Z)V

    return-void
.end method

.method protected onFailed(Landroid/content/Context;)V
    .locals 2

    const/4 v0, 0x0

    .line 41
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setDeleteOngoing(Landroid/content/Context;Z)V

    .line 42
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DeleteAccountTask$GySwQsjpyVmdBuLe0fJne9Q7pFM;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DeleteAccountTask$GySwQsjpyVmdBuLe0fJne9Q7pFM;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
