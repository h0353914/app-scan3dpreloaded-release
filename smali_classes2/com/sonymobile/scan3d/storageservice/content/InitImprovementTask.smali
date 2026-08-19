.class final Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "InitImprovementTask.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.InitImprovementTask"


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

    .line 62
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method private getFiles(Landroid/content/Context;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/File;
    .locals 2

    .line 201
    :try_start_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    invoke-virtual {p4}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKeyDecoded()[B

    move-result-object p4

    .line 203
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, p3, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    invoke-static {p1, p2, v0, p4}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptForCloud(Landroid/content/Context;Ljava/io/File;Ljava/io/File;[B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    move-object p2, v0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 211
    :goto_0
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->TAG:Ljava/lang/String;

    const-string p3, "Could not get file"

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p2, 0x0

    :cond_0
    :goto_1
    return-object p2
.end method

.method private isTransferred(I)Z
    .locals 0

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private upload(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 135
    new-instance v3, Ljava/io/File;

    invoke-interface {p3}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getLogUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 136
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getTempDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v6

    const/4 v7, 0x1

    .line 138
    :try_start_0
    invoke-direct {p0, p1, v3, v6, p4}, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->getFiles(Landroid/content/Context;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/File;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move-object v4, p3

    move-object v5, p2

    .line 139
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->uploadTarget(Landroid/content/Context;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    invoke-static {v6, v7}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    return p1

    :catchall_0
    move-exception p1

    invoke-static {v6, v7}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    .line 142
    throw p1
.end method

.method private uploadTarget(Landroid/content/Context;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    if-eqz p2, :cond_2

    .line 149
    invoke-interface {p4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferId()I

    move-result v0

    .line 150
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessLogBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 151
    invoke-interface {p4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    .line 152
    invoke-virtual {p5}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v3

    .line 153
    invoke-static {v3, v2}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->getPostProcessLogKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 155
    invoke-virtual {p5, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->resume(I)Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;

    move-result-object v0

    if-nez v0, :cond_0

    .line 157
    invoke-virtual {p5, v1, v2, p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->upload(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;

    move-result-object v0

    .line 159
    :cond_0
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->monitor(Lcom/sonymobile/scan3d/storageservice/Cancellable;)Z

    move-result p2

    .line 161
    new-instance p5, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {p5, v1}, Landroid/content/ContentValues;-><init>(I)V

    const/4 v1, 0x0

    if-eqz p2, :cond_1

    const-string p2, "log_url"

    .line 163
    move-object v0, v1

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p5, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "log_transfer_id"

    const/4 v0, -0x1

    .line 164
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p5, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p2, "transfer_flags"

    .line 166
    invoke-interface {p4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v0

    or-int/lit8 v0, v0, 0x8

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 165
    invoke-virtual {p5, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 167
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    move-result p2

    goto :goto_0

    .line 170
    :cond_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->pause()I

    move-result p3

    const-string v0, "log_transfer_id"

    .line 172
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-virtual {p5, v0, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 174
    :goto_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-interface {p4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p3

    invoke-virtual {p1, p3, p5, v1, v1}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    :goto_1
    return p2
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 78
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 81
    :try_start_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->executeWait()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    .line 82
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object v2

    .line 84
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_4

    if-eqz v2, :cond_4

    .line 85
    invoke-virtual {v2}, Landroid/app/job/JobWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    .line 86
    sget-object v4, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v5, "com.sonymobile.scan3d.extra.improvement_id"

    .line 87
    invoke-virtual {v3, v5}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v5

    .line 86
    invoke-static {v4, v5, v6}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v3

    .line 88
    invoke-static {p1, v3}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovement(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 91
    invoke-virtual {v4}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getParentUri()Landroid/net/Uri;

    move-result-object v4

    invoke-static {p1, v4}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v4

    const/4 v5, 0x0

    if-eqz v4, :cond_1

    .line 93
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v6

    .line 95
    invoke-direct {p0, v6}, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->isTransferred(I)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-direct {p0, p1, p3, v4, v1}, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->upload(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z

    move-result v4

    if-eqz v4, :cond_3

    :cond_0
    const-string v4, "execution_request"

    .line 97
    invoke-virtual {p3, v4}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postInitKeyJob(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 100
    new-instance v6, Landroid/content/ContentValues;

    const/4 v7, 0x1

    invoke-direct {v6, v7}, Landroid/content/ContentValues;-><init>(I)V

    const-string v7, "sqs_message_id"

    .line 101
    invoke-virtual {v6, v7, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    invoke-virtual {v0, v3, v6, v5, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 103
    sget-object v3, Lcom/sonymobile/scan3d/analytics/HitEvent;->IMPROVEMENT_STARTED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v4, 0x1

    invoke-virtual {v3, p1, v4, v5}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    .line 104
    invoke-virtual {p2, v2}, Landroid/app/job/JobParameters;->completeWork(Landroid/app/job/JobWorkItem;)V

    goto :goto_1

    .line 109
    :cond_1
    invoke-virtual {v0, v3, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 110
    invoke-virtual {p2, v2}, Landroid/app/job/JobParameters;->completeWork(Landroid/app/job/JobWorkItem;)V

    goto :goto_1

    .line 113
    :cond_2
    invoke-virtual {p2, v2}, Landroid/app/job/JobParameters;->completeWork(Landroid/app/job/JobWorkItem;)V

    .line 116
    :cond_3
    :goto_1
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object v2
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    goto :goto_2

    :catch_2
    move-exception p1

    .line 119
    :goto_2
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/InitImprovementTask;->TAG:Ljava/lang/String;

    const-string p3, "Work failed "

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4
    return-void
.end method

.method getForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 2

    const/4 v0, 0x0

    .line 67
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object v0

    const/4 v1, 0x1

    .line 68
    invoke-virtual {v0, p1, v1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v0

    const v1, 0x7f08010e

    .line 69
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    const v1, 0x7f100245

    .line 70
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const v1, 0x7f100244

    .line 71
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 72
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    return-object p1
.end method
