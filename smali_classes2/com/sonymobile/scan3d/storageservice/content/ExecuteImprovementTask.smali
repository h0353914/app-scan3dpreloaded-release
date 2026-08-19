.class final Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "ExecuteImprovementTask.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.ExecuteImprovementTask"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 6

    const/4 v3, 0x1

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 48
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method private static getAESEncrypted(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 148
    :try_start_0
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptWithServerKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 150
    :catch_0
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;->TAG:Ljava/lang/String;

    const-string p1, "Could not encrypt."

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private handleWorkItem(Landroid/content/Context;Landroid/app/job/JobWorkItem;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 88
    invoke-virtual {p2}, Landroid/app/job/JobWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    .line 89
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "com.sonymobile.scan3d.extra.improvement_id"

    .line 90
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 89
    invoke-static {v1, v2, v3}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1

    const-string v2, "com.sonymobile.scan3d.extra.improvement_type"

    .line 91
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v2, "com.sonymobile.scan3d.extra.server_key"

    .line 92
    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "com.sonymobile.scan3d.extra.session_id"

    .line 93
    invoke-virtual {p2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v3, "com.sonymobile.scan3d.extra.protocol_version"

    const/4 v9, 0x0

    .line 94
    invoke-virtual {p2, v3, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v8

    .line 95
    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovement(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object p2

    const/4 v10, 0x1

    if-eqz p2, :cond_2

    .line 99
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getParentUri()Landroid/net/Uri;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 102
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKey()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;->getAESEncrypted(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v7, :cond_2

    move-object v3, p4

    .line 104
    invoke-virtual/range {v3 .. v8}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postExecuteImprovementJob(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 109
    invoke-direct {p0, v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;->updateImprovementRecord(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    move v10, v9

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 117
    invoke-virtual {v0, v1, p1, p1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_2
    :goto_0
    return v10
.end method

.method private updateImprovementRecord(Landroid/content/ContentResolver;Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    .line 133
    new-instance v0, Landroid/content/ContentValues;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "sqs_message_id"

    .line 134
    invoke-virtual {v0, v1, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p3, 0x0

    .line 135
    invoke-virtual {p1, p2, v0, p3, p3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 55
    :try_start_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->executeWait()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    .line 56
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object v1

    .line 58
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_1

    if-eqz v1, :cond_1

    .line 60
    invoke-direct {p0, p1, v1, v0, p3}, Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;->handleWorkItem(Landroid/content/Context;Landroid/app/job/JobWorkItem;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 62
    invoke-virtual {p2, v1}, Landroid/app/job/JobParameters;->completeWork(Landroid/app/job/JobWorkItem;)V

    .line 66
    :cond_0
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 69
    :goto_1
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/ExecuteImprovementTask;->TAG:Ljava/lang/String;

    const-string p3, "doWork(): failure."

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return-void
.end method
