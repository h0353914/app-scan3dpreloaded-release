.class final Lcom/sonymobile/scan3d/storageservice/content/RescheduleGDPRTask;
.super Lcom/sonymobile/scan3d/storageservice/content/Task;
.source "RescheduleGDPRTask.java"


# static fields
.field private static final KEY_DELETE_RETENTION:Ljava/lang/String; = "delete_retention"

.field private static final KEY_EXTRACT_RETENTION:Ljava/lang/String; = "extract_retention"

.field private static final RETENTION_PERIOD:J

.field private static final RETENTION_PREFERENCES:Ljava/lang/String; = "retention_preferences"


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 41
    sget-object v0, Ljava/util/concurrent/TimeUnit;->DAYS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/sonymobile/scan3d/storageservice/content/RescheduleGDPRTask;->RETENTION_PERIOD:J

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;)V
    .locals 1

    const/4 v0, 0x0

    .line 50
    invoke-direct {p0, p1, p2, v0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Task;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZ)V

    return-void
.end method

.method private checkRetention(Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)Z
    .locals 8

    .line 92
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 95
    invoke-interface {p1, p2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_1

    .line 96
    invoke-interface {p1, p2, v0, v1}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sub-long v4, v0, v4

    .line 98
    sget-wide v6, Lcom/sonymobile/scan3d/storageservice/content/RescheduleGDPRTask;->RETENTION_PERIOD:J

    cmp-long p1, v4, v6

    if-lez p1, :cond_0

    .line 99
    invoke-interface {p3, p2}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const/4 v3, 0x1

    goto :goto_0

    .line 102
    :cond_0
    invoke-interface {p3, p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 105
    :cond_1
    invoke-interface {p3, p2, v0, v1}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    :goto_0
    return v3
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V
    .locals 2

    const-string p2, "retention_preferences"

    const/4 v0, 0x0

    .line 55
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p2

    .line 57
    invoke-interface {p2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 59
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isDeleteOngoing(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "delete_retention"

    .line 60
    invoke-direct {p0, p2, v1, v0}, Lcom/sonymobile/scan3d/storageservice/content/RescheduleGDPRTask;->checkRetention(Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 62
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestDeleteAccountJob(Landroid/content/Context;)Z

    .line 66
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isExtractDataOngoing(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "extract_retention"

    .line 67
    invoke-direct {p0, p2, v1, v0}, Lcom/sonymobile/scan3d/storageservice/content/RescheduleGDPRTask;->checkRetention(Landroid/content/SharedPreferences;Ljava/lang/String;Landroid/content/SharedPreferences$Editor;)Z

    move-result p2

    if-eqz p2, :cond_1

    const-string p2, "extract_data_request"

    .line 69
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->requestKeyInitJob(Landroid/content/Context;Ljava/lang/String;)Z

    .line 74
    :cond_1
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method onFinished(Landroid/content/Context;)V
    .locals 0

    .line 80
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->scheduleGDPRRetention(Landroid/content/Context;)Z

    return-void
.end method
