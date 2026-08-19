.class final Lcom/sonymobile/scan3d/storageservice/content/TransferTask;
.super Lcom/sonymobile/scan3d/storageservice/content/Task;
.source "TransferTask.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.TransferTask"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 47
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Task;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZ)V

    return-void
.end method

.method private static getTransfer(Landroid/content/Context;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;
    .locals 3

    .line 118
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v1, "com.sonymobile.scan3d.extra.fileset_id"

    .line 119
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 118
    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    .line 120
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->keysFromBundle(Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v1

    .line 121
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v2, "com.sonymobile.scan3d.extra.improvement_type"

    .line 124
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 127
    :pswitch_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/content/Downloader;

    invoke-direct {p1, p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Downloader;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V

    goto :goto_1

    .line 130
    :pswitch_1
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/content/Uploader;

    invoke-direct {p1, p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/Uploader;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)V

    goto :goto_1

    .line 133
    :pswitch_2
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/content/Deleter;

    invoke-direct {p1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Deleter;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_1

    .line 136
    :pswitch_3
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/content/Modifier;

    invoke-direct {p1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Modifier;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_1

    :cond_0
    :goto_0
    const/4 p1, 0x0

    .line 143
    :goto_1
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getTransfer(): "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static isCharging(Landroid/content/Context;)Z
    .locals 2

    .line 184
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    .line 185
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object p0

    const/4 v0, -0x1

    if-eqz p0, :cond_0

    const-string v1, "plugged"

    .line 187
    invoke-virtual {p0, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    :cond_0
    const/4 p0, 0x1

    if-eq v0, p0, :cond_2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :cond_2
    :goto_0
    return p0
.end method

.method private isTransferAllowed(Landroid/content/Context;)Z
    .locals 6

    .line 157
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001f1

    .line 159
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    const v3, 0x7f1001f2

    .line 160
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 161
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f05000c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v4

    .line 160
    invoke-interface {v0, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v1, :cond_0

    .line 166
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->isWifiConnection(Landroid/content/Context;)Z

    move-result v2

    :cond_0
    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    .line 170
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->isCharging(Landroid/content/Context;)Z

    move-result v2

    :cond_1
    return v2
.end method

.method static synthetic lambda$transferAll$0(Landroid/app/job/JobWorkItem;Landroid/app/job/JobWorkItem;)I
    .locals 1

    .line 80
    invoke-virtual {p0}, Landroid/app/job/JobWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p0

    .line 81
    invoke-virtual {p1}, Landroid/app/job/JobWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "com.sonymobile.scan3d.extra.improvement_type"

    .line 83
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p0

    const-string v0, "com.sonymobile.scan3d.extra.improvement_type"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    sub-int/2addr p0, p1

    return p0
.end method

.method private transferAll(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Landroid/app/job/JobWorkItem;",
            ">;)",
            "Ljava/util/List<",
            "Landroid/app/job/JobWorkItem;",
            ">;"
        }
    .end annotation

    .line 76
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 79
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$TransferTask$Jjwa_N1v8-S9r0PfJNeITSIm8Qs;

    invoke-interface {p2, v1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 86
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :catch_0
    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/job/JobWorkItem;

    .line 87
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->isCancelled()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->isTransferAllowed(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    .line 90
    :cond_1
    invoke-virtual {v1}, Landroid/app/job/JobWorkItem;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    .line 91
    invoke-static {p1, v2}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->getTransfer(Landroid/content/Context;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 94
    :try_start_0
    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;->isValid()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransfer;->transfer()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 95
    :cond_2
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_3
    :goto_1
    return-object v0
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V
    .locals 3

    .line 52
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object v0

    .line 53
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    if-eqz v0, :cond_1

    .line 56
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    invoke-virtual {p2}, Landroid/app/job/JobParameters;->dequeueWork()Landroid/app/job/JobWorkItem;

    move-result-object v0

    .line 58
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->isCancelled()Z

    move-result v2

    if-eqz v2, :cond_0

    return-void

    .line 63
    :cond_1
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 64
    invoke-direct {p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/content/TransferTask;->transferAll(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DYxCPdvdj3LHfHcx-PYvCbd9sxE;

    invoke-direct {v0, p2}, Lcom/sonymobile/scan3d/storageservice/content/-$$Lambda$DYxCPdvdj3LHfHcx-PYvCbd9sxE;-><init>(Landroid/app/job/JobParameters;)V

    invoke-interface {p1, v0}, Ljava/util/List;->forEach(Ljava/util/function/Consumer;)V

    :cond_2
    return-void
.end method
