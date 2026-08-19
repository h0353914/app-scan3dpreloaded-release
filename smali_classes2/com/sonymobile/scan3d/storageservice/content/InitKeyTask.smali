.class final Lcom/sonymobile/scan3d/storageservice/content/InitKeyTask;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "InitKeyTask.java"


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 27
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

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

    .line 33
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p1

    const-string p2, "com.sonymobile.scan3d.extra.receiving_request"

    invoke-virtual {p1, p2}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 34
    invoke-virtual {p3, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postInitKeyJob(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 35
    :goto_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/InitKeyTask;->setReschedule(Z)V

    return-void
.end method
