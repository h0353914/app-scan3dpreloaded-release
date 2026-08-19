.class public Lcom/sonymobile/scan3d/EnvConditions;
.super Ljava/lang/Object;
.source "EnvConditions.java"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mFreeStorageMB:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/EnvConditions;->mContext:Landroid/content/Context;

    .line 22
    new-instance p1, Landroid/os/StatFs;

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 23
    invoke-virtual {p1}, Landroid/os/StatFs;->getAvailableBytes()J

    move-result-wide v0

    const-wide/32 v2, 0x100000

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/EnvConditions;->mFreeStorageMB:J

    return-void
.end method


# virtual methods
.method public declared-synchronized sendData(Lcom/sonymobile/scan3d/Sphinx;)V
    .locals 4

    monitor-enter p0

    .line 27
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/EnvConditions;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    const-string v1, "level"

    const/4 v2, -0x1

    .line 28
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    const-string v3, "temperature"

    .line 29
    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 30
    sget-object v2, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondBattery:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    int-to-float v1, v1

    invoke-virtual {p1, v2, v1}, Lcom/sonymobile/scan3d/Sphinx;->setEnvCondition(Lcom/sonymobile/scan3d/SphinxEnvCondition;F)V

    .line 31
    sget-object v1, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondTemp:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    int-to-float v0, v0

    const v2, 0x3dcccccd    # 0.1f

    mul-float/2addr v0, v2

    invoke-virtual {p1, v1, v0}, Lcom/sonymobile/scan3d/Sphinx;->setEnvCondition(Lcom/sonymobile/scan3d/SphinxEnvCondition;F)V

    .line 32
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEnvCondition;->kEnvCondFreeStorageMB:Lcom/sonymobile/scan3d/SphinxEnvCondition;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/EnvConditions;->mFreeStorageMB:J

    long-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/Sphinx;->setEnvCondition(Lcom/sonymobile/scan3d/SphinxEnvCondition;F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 33
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
