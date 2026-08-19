.class public Lcom/sonymobile/scan3d/expansionfile/RemoteAlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "RemoteAlarmReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 19
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    .line 23
    :try_start_0
    const-class v0, Lcom/sonymobile/scan3d/expansionfile/RemoteDownloadService;

    invoke-static {p1, p2, v0}, Lcom/google/android/vending/expansion/downloader/DownloaderClientMarshaller;->startDownloadServiceIfRequired(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/Class;)I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 25
    const-class p2, Lcom/sonymobile/scan3d/expansionfile/RemoteAlarmReceiver;

    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p2

    const-string v0, "Unexpected exception"

    invoke-static {p2, v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
