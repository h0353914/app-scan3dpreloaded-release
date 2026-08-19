.class abstract Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "AbstractAuthenticatedSyncAdapter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.AbstractAuthenticatedSyncAdapter"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 43
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 4

    .line 48
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;->TAG:Ljava/lang/String;

    const-string v0, "doWork(): Start"

    invoke-static {p2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p2, 0x0

    .line 51
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "com.sonymobile.scan3d.storageprovider"

    .line 52
    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->acquireContentProviderClient(Ljava/lang/String;)Landroid/content/ContentProviderClient;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    const/4 v1, 0x0

    .line 54
    :try_start_1
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object v2

    .line 57
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isDeleteOngoing(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 58
    invoke-virtual {p0, p1, p3, v0, v2}, Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;->onAuthenticatedSync(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Landroid/content/ContentProviderClient;Ljava/lang/String;)Z

    move-result p1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    if-eqz v0, :cond_3

    .line 60
    :try_start_2
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_4

    :catch_0
    move-exception p3

    goto :goto_3

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    move-object v1, p1

    .line 51
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_1
    if-eqz v0, :cond_2

    if-eqz v1, :cond_1

    .line 60
    :try_start_4
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_2

    :catch_2
    move-exception p3

    :try_start_5
    invoke-virtual {v1, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_1
    invoke-virtual {v0}, Landroid/content/ContentProviderClient;->close()V

    :cond_2
    :goto_2
    throw p1
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    :catch_3
    move-exception p3

    move p1, p2

    .line 61
    :goto_3
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;->TAG:Ljava/lang/String;

    const-string v1, "doWork(): "

    invoke-static {v0, v1, p3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_3
    :goto_4
    if-nez p1, :cond_4

    const/4 p2, 0x1

    .line 64
    :cond_4
    invoke-virtual {p0, p2}, Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;->setReschedule(Z)V

    return-void
.end method

.method abstract onAuthenticatedSync(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Landroid/content/ContentProviderClient;Ljava/lang/String;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;,
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation
.end method
