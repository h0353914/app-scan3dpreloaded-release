.class final Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "ExtractDataTask.java"


# static fields
.field private static final EXTRACT_DATA_NOTIFICATION_ID:I = -0x1

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.ExtractDataTask"


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

    .line 55
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method private notifyFailed(Landroid/content/Context;)V
    .locals 5

    const-string v0, "gdpr"

    .line 133
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object v0

    const/4 v1, 0x1

    .line 134
    invoke-virtual {v0, p1, v1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v2

    const v3, 0x7f100187

    .line 135
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const v3, 0x7f100188

    .line 136
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const v3, 0x7f08010e

    .line 137
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    .line 138
    invoke-virtual {v2, v1}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 140
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/activity/GalleryActivity;->getBackupSyncIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const/4 v3, 0x0

    const/high16 v4, 0x10000000

    .line 141
    invoke-static {p1, v3, v1, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p1

    .line 143
    invoke-virtual {v2, p1}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 144
    invoke-virtual {v2}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    const/4 v1, -0x1

    invoke-virtual {v0, v1, p1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    return-void
.end method

.method private send(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 107
    invoke-virtual {p5}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getEmail()Ljava/lang/String;

    move-result-object v0

    .line 108
    invoke-virtual {p5}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getGivenName()Ljava/lang/String;

    move-result-object v1

    .line 109
    invoke-virtual {p5}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getId()Ljava/lang/String;

    move-result-object p5

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    if-eqz p5, :cond_0

    .line 113
    invoke-static {p3, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptWithServerKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 114
    invoke-static {p3, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptWithServerKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 115
    invoke-static {p3, p5}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptWithServerKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 116
    invoke-static {p3, p4}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptWithServerKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    move-object v3, p1

    move-object v4, p2

    .line 118
    invoke-virtual/range {v3 .. v8}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postExtractDataJob(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    move v2, p1

    goto :goto_0

    .line 124
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;->TAG:Ljava/lang/String;

    const-string p2, "send(): Could not extract all data from google account."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return v2
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 7

    .line 60
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p2

    const-string v0, "com.sonymobile.scan3d.extra.session_id"

    .line 61
    invoke-virtual {p2, v0}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v0, "com.sonymobile.scan3d.extra.server_key"

    .line 62
    invoke-virtual {p2, v0}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 65
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isExtractDataOngoing(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x0

    .line 67
    :try_start_0
    invoke-static {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v6

    .line 68
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->executeWait()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    if-eqz v6, :cond_0

    if-eqz v0, :cond_0

    .line 71
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKey()Ljava/lang/String;

    move-result-object v5

    move-object v1, p0

    move-object v2, p3

    .line 73
    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;->send(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Z

    move-result p3

    goto :goto_0

    :cond_0
    move p3, p2

    :goto_0
    if-nez p3, :cond_1

    .line 77
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setExtractDataOngoing(Landroid/content/Context;Z)V

    .line 78
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;->notifyFailed(Landroid/content/Context;)V
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p3

    .line 84
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->setExtractDataOngoing(Landroid/content/Context;Z)V

    .line 85
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;->notifyFailed(Landroid/content/Context;)V

    .line 86
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;->TAG:Ljava/lang/String;

    const-string p2, "doWork(): Failed to send message "

    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    :catch_1
    const/4 p1, 0x1

    .line 81
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/ExtractDataTask;->setReschedule(Z)V

    :cond_1
    :goto_1
    return-void
.end method
