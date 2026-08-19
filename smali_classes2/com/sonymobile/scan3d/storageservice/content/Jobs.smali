.class public final Lcom/sonymobile/scan3d/storageservice/content/Jobs;
.super Ljava/lang/Object;
.source "Jobs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;
    }
.end annotation


# static fields
.field private static final CONTENT_CHANGED_MAX_TRIGGER_DELAY:J

.field private static final EXTRA_ENCRYPTION_KEY:Ljava/lang/String; = "com.sonymobile.scan3d.extra.encryption_key"

.field static final EXTRA_FILESET_ID:Ljava/lang/String; = "com.sonymobile.scan3d.extra.fileset_id"

.field static final EXTRA_IMPROVEMENT_ID:Ljava/lang/String; = "com.sonymobile.scan3d.extra.improvement_id"

.field static final EXTRA_RECEIVING_REQUEST:Ljava/lang/String; = "com.sonymobile.scan3d.extra.receiving_request"

.field static final EXTRA_SERVER_KEY:Ljava/lang/String; = "com.sonymobile.scan3d.extra.server_key"

.field static final EXTRA_SESSION_ID:Ljava/lang/String; = "com.sonymobile.scan3d.extra.session_id"

.field private static final EXTRA_SIGNING_KEY:Ljava/lang/String; = "com.sonymobile.scan3d.extra.signing_key"

.field static final EXTRA_TYPE:Ljava/lang/String; = "com.sonymobile.scan3d.extra.improvement_type"

.field static final EXTRA_VERSION:Ljava/lang/String; = "com.sonymobile.scan3d.extra.protocol_version"

.field static final JOB_CLEANUP_ID:I = -0x4

.field static final JOB_DELETE_BACKEND_ID:I = -0x6

.field static final JOB_DELETE_SYNCHUB_ID:I = -0x9

.field static final JOB_EXTRACT_DATA_ID:I = -0x7

.field static final JOB_GDPR_RETENTION_ID:I = -0xa

.field static final JOB_IMPROVEMENT_EXECUTE_ID:I = -0x2

.field static final JOB_IMPROVEMENT_INIT_ID:I = -0x1

.field static final JOB_IMPROVEMENT_RECEIVE_ID:I = -0x3

.field static final JOB_INIT_KEY_ID:I = -0x8

.field private static final JOB_SYNC_ID:I = 0x0

.field static final JOB_TRANSFER_ID:I = 0x1

.field static final JOB_UPDATE_IMPROVEMENT_NOTIFICATION_ID:I = -0x5

.field static final TYPE_DELETE:I = 0x2

.field static final TYPE_DOWNLOAD:I = 0x4

.field public static final TYPE_IMPROVEMENT:Ljava/lang/String; = "refinement"

.field static final TYPE_MODIFY:I = 0x1

.field static final TYPE_UPLOAD:I = 0x3


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 182
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x2

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->CONTENT_CHANGED_MAX_TRIGGER_DELAY:J

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cancelAllJobs(Landroid/content/Context;)V
    .locals 3

    const-string v0, "jobscheduler"

    .line 503
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    .line 505
    invoke-virtual {p0}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/job/JobInfo;

    .line 506
    invoke-virtual {v1}, Landroid/app/job/JobInfo;->getId()I

    move-result v1

    .line 507
    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->isPersistentJob(I)Z

    move-result v2

    if-nez v2, :cond_0

    .line 508
    invoke-virtual {p0, v1}, Landroid/app/job/JobScheduler;->cancel(I)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static cancelJob(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 5

    .line 449
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v0

    const-string p1, "jobscheduler"

    .line 452
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/job/JobScheduler;

    .line 454
    invoke-virtual {p0}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/job/JobInfo;

    .line 456
    invoke-virtual {v3}, Landroid/app/job/JobInfo;->getId()I

    move-result v3

    int-to-long v3, v3

    cmp-long v3, v3, v0

    if-nez v3, :cond_0

    long-to-int v2, v0

    .line 457
    invoke-virtual {p0, v2}, Landroid/app/job/JobScheduler;->cancel(I)V

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private static getNetWorkType(Landroid/content/Context;)I
    .locals 2

    .line 655
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001f1

    .line 658
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x1

    invoke-interface {v0, p0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 v1, 0x2

    :cond_0
    return v1
.end method

.method public static initPersistentJobs(Landroid/content/Context;)V
    .locals 0

    .line 265
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->scheduleNotificationUpdate(Landroid/content/Context;)Z

    .line 266
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->scheduleCleanup(Landroid/content/Context;)Z

    .line 267
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->scheduleGDPRRetention(Landroid/content/Context;)Z

    return-void
.end method

.method private static isChargingRequired(Landroid/content/Context;)Z
    .locals 3

    .line 675
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001f2

    .line 676
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 677
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v2, 0x7f05000c

    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    .line 676
    invoke-interface {v0, v1, p0}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static isPersistentJob(I)Z
    .locals 1

    const/16 v0, -0xa

    if-eq p0, v0, :cond_0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    :cond_0
    :pswitch_0
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method static keysFromBundle(Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    .locals 3

    const-string v0, "com.sonymobile.scan3d.extra.encryption_key"

    const/4 v1, 0x0

    .line 520
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.sonymobile.scan3d.extra.signing_key"

    .line 521
    invoke-virtual {p0, v2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    .line 525
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    invoke-direct {v1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v1
.end method

.method private static keysToBundle(Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "com.sonymobile.scan3d.extra.encryption_key"

    .line 688
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "com.sonymobile.scan3d.extra.signing_key"

    .line 689
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getSignatureKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static requestDeleteAccountJob(Landroid/content/Context;)Z
    .locals 5

    const-string v0, "jobscheduler"

    .line 298
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 300
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 p0, -0x9

    invoke-direct {v1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p0, 0x1

    .line 302
    invoke-virtual {v1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    .line 303
    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    .line 304
    invoke-virtual {v1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v1

    .line 306
    invoke-virtual {v0, v1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result v0

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    move p0, v4

    :goto_0
    return p0
.end method

.method public static requestDeleteBackendDataJob(Landroid/content/Context;)Z
    .locals 5

    const-string v0, "jobscheduler"

    .line 279
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 281
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x6

    invoke-direct {v1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p0, 0x1

    .line 283
    invoke-virtual {v1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    .line 284
    invoke-virtual {v2, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    .line 285
    invoke-virtual {v1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v1

    .line 287
    invoke-virtual {v0, v1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result v0

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    move p0, v4

    :goto_0
    return p0
.end method

.method public static requestExecuteImprovementJob(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;)Z
    .locals 4

    const-string v0, "jobscheduler"

    .line 390
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 392
    new-instance v1, Landroid/app/job/JobWorkItem;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;->access$000(Lcom/sonymobile/scan3d/storageservice/content/Jobs$RequestBuilder;)Landroid/content/Intent;

    move-result-object p1

    invoke-direct {v1, p1}, Landroid/app/job/JobWorkItem;-><init>(Landroid/content/Intent;)V

    .line 394
    new-instance p1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x2

    invoke-direct {p1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p0, 0x2

    .line 396
    invoke-virtual {p1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    .line 398
    invoke-virtual {p1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    const/4 p1, 0x0

    invoke-virtual {p0, v2, v3, p1}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 399
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 400
    invoke-virtual {v0, p0, v1}, Landroid/app/job/JobScheduler;->enqueue(Landroid/app/job/JobInfo;Landroid/app/job/JobWorkItem;)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    move p1, v0

    :cond_0
    return p1
.end method

.method public static requestExtractDataJob(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 3

    const-string v0, "jobscheduler"

    .line 320
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 321
    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    const-string v2, "com.sonymobile.scan3d.extra.server_key"

    .line 322
    invoke-virtual {v1, v2, p1}, Landroid/os/PersistableBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "com.sonymobile.scan3d.extra.session_id"

    .line 323
    invoke-virtual {v1, p1, p2}, Landroid/os/PersistableBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    new-instance p1, Landroid/app/job/JobInfo$Builder;

    new-instance p2, Landroid/content/ComponentName;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {p2, p0, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x7

    invoke-direct {p1, p0, p2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 327
    invoke-virtual {p1, v1}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    const/4 p1, 0x1

    .line 328
    invoke-virtual {p0, p1}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-object p2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    .line 329
    invoke-virtual {p2, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    const/4 p2, 0x0

    invoke-virtual {p0, v1, v2, p2}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 330
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 331
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    return p1
.end method

.method public static requestInitImprovementJob(Landroid/content/Context;Landroid/net/Uri;)Z
    .locals 5

    const-string v0, "jobscheduler"

    .line 365
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 367
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "com.sonymobile.scan3d.extra.receiving_request"

    const-string v3, "execution_request"

    .line 368
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.sonymobile.scan3d.extra.improvement_id"

    .line 369
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 370
    new-instance p1, Landroid/app/job/JobWorkItem;

    invoke-direct {p1, v1}, Landroid/app/job/JobWorkItem;-><init>(Landroid/content/Intent;)V

    .line 372
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x1

    invoke-direct {v1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p0, 0x2

    .line 374
    invoke-virtual {v1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    .line 376
    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v2, v3}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 377
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 378
    invoke-virtual {v0, p0, p1}, Landroid/app/job/JobScheduler;->enqueue(Landroid/app/job/JobInfo;Landroid/app/job/JobWorkItem;)I

    move-result p0

    const/4 p1, 0x1

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v3

    :goto_0
    return p1
.end method

.method public static requestKeyInitJob(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4

    const-string v0, "jobscheduler"

    .line 342
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 344
    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    const-string v2, "com.sonymobile.scan3d.extra.receiving_request"

    .line 345
    invoke-virtual {v1, v2, p1}, Landroid/os/PersistableBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    new-instance p1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x8

    invoke-direct {p1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 348
    invoke-virtual {p1, v1}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    const/4 p1, 0x1

    .line 349
    invoke-virtual {p0, p1}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0x1

    .line 351
    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v2, v3}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 352
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 353
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-ne p0, p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v3

    :goto_0
    return p1
.end method

.method public static requestReceiveImprovementJob(Landroid/content/Context;)Z
    .locals 4

    const-string v0, "jobscheduler"

    .line 411
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 413
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x3

    invoke-direct {v1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p0, 0x2

    .line 415
    invoke-virtual {v1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 416
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 417
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    const/4 v0, 0x1

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static requestSync(Landroid/content/Context;Z)Z
    .locals 6

    const-string v0, "jobscheduler"

    .line 429
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 430
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/SyncService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v3, 0x0

    invoke-direct {v1, v3, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    move v4, v2

    goto :goto_0

    .line 432
    :cond_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->getNetWorkType(Landroid/content/Context;)I

    move-result v4

    :goto_0
    invoke-virtual {v1, v4}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    if-nez p1, :cond_1

    .line 433
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->isChargingRequired(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_1

    move p0, v2

    goto :goto_1

    :cond_1
    move p0, v3

    :goto_1
    invoke-virtual {v1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-object p1, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v4, 0x1

    .line 435
    invoke-virtual {p1, v4, v5}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v4

    invoke-virtual {p0, v4, v5, v3}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 436
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 437
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-ne p0, v2, :cond_2

    goto :goto_2

    :cond_2
    move v2, v3

    :goto_2
    return v2
.end method

.method static requestTransferJob(Landroid/content/Context;ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z
    .locals 4

    .line 477
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isValid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 478
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getId()J

    move-result-wide v2

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 482
    :pswitch_0
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isRemote()Z

    move-result p2

    if-eqz p2, :cond_0

    invoke-static {p0, v2, v3, p1, p3}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->start(Landroid/content/Context;JILcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    move v1, p0

    goto :goto_0

    .line 487
    :pswitch_1
    invoke-static {p0, v2, v3, p1, p3}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->start(Landroid/content/Context;JILcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z

    move-result v1

    :cond_0
    :goto_0
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static scheduleCleanup(Landroid/content/Context;)Z
    .locals 4

    const-string v0, "jobscheduler"

    .line 559
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 561
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x4

    invoke-direct {v1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    sget-object p0, Ljava/util/concurrent/TimeUnit;->HOURS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xc

    .line 563
    invoke-virtual {p0, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Landroid/app/job/JobInfo$Builder;->setPeriodic(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    const/4 v1, 0x1

    .line 564
    invoke-virtual {p0, v1}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 565
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 566
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method static scheduleGDPRRetention(Landroid/content/Context;)Z
    .locals 4

    const-string v0, "jobscheduler"

    .line 578
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 580
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 p0, -0xa

    invoke-direct {v1, p0, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p0, 0x1

    .line 582
    invoke-virtual {v1, p0}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v1

    .line 583
    invoke-virtual {v1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object v1

    .line 584
    invoke-virtual {v0, v1}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result v0

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static scheduleNotificationUpdate(Landroid/content/Context;)Z
    .locals 6

    const-string v0, "jobscheduler"

    .line 538
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 541
    new-instance v1, Landroid/app/job/JobInfo$TriggerContentUri;

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3}, Landroid/app/job/JobInfo$TriggerContentUri;-><init>(Landroid/net/Uri;I)V

    .line 543
    new-instance v2, Landroid/app/job/JobInfo$Builder;

    new-instance v4, Landroid/content/ComponentName;

    const-class v5, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v4, p0, v5}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 p0, -0x5

    invoke-direct {v2, p0, v4}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 545
    invoke-virtual {v2, v1}, Landroid/app/job/JobInfo$Builder;->addTriggerContentUri(Landroid/app/job/JobInfo$TriggerContentUri;)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-wide v1, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->CONTENT_CHANGED_MAX_TRIGGER_DELAY:J

    .line 546
    invoke-virtual {p0, v1, v2}, Landroid/app/job/JobInfo$Builder;->setTriggerContentMaxDelay(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 547
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 548
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-ne p0, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    return v3
.end method

.method private static start(Landroid/content/Context;JILcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z
    .locals 3

    const-string v0, "jobscheduler"

    .line 598
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    .line 600
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "com.sonymobile.scan3d.extra.fileset_id"

    .line 601
    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p1, "com.sonymobile.scan3d.extra.improvement_type"

    .line 602
    invoke-virtual {v1, p1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 603
    invoke-static {v1, p4}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->keysToBundle(Landroid/os/Bundle;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V

    .line 604
    invoke-static {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->start(Landroid/content/Context;Landroid/app/job/JobScheduler;Landroid/os/Bundle;)Z

    move-result p0

    return p0
.end method

.method private static start(Landroid/content/Context;Landroid/app/job/JobScheduler;Landroid/os/Bundle;)Z
    .locals 5

    .line 616
    new-instance v0, Landroid/content/ComponentName;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/content/WorkService;

    invoke-direct {v0, p0, v1}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 618
    new-instance v1, Landroid/app/job/JobInfo$Builder;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v0}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    .line 619
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->getNetWorkType(Landroid/content/Context;)I

    move-result v0

    invoke-virtual {v1, v0}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    .line 620
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->isChargingRequired(Landroid/content/Context;)Z

    move-result p0

    invoke-virtual {v0, p0}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v3, 0x1

    .line 621
    invoke-virtual {v0, v3, v4}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1, v2}, Landroid/app/job/JobInfo$Builder;->setBackoffCriteria(JI)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    .line 623
    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    .line 625
    new-instance v0, Landroid/app/job/JobWorkItem;

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    invoke-virtual {v1, p2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object p2

    invoke-direct {v0, p2}, Landroid/app/job/JobWorkItem;-><init>(Landroid/content/Intent;)V

    .line 626
    invoke-virtual {p1, p0, v0}, Landroid/app/job/JobScheduler;->enqueue(Landroid/app/job/JobInfo;Landroid/app/job/JobWorkItem;)I

    move-result p0

    if-ne v2, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method
