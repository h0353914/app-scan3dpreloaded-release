.class Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;
.super Ljava/lang/Object;
.source "ThermalAlertReceiver.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ThermalAlertReceiver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ServiceConnectionSysmon"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/ThermalAlertReceiver;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/ThermalAlertReceiver;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;->this$0:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/ThermalAlertReceiver;Lcom/sonymobile/scan3d/ThermalAlertReceiver$1;)V
    .locals 0

    .line 81
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;-><init>(Lcom/sonymobile/scan3d/ThermalAlertReceiver;)V

    return-void
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 1

    .line 84
    iget-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;->this$0:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    .line 85
    invoke-static {p2}, Lcom/sonyericsson/psm/sysmonservice/ISysmonService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    move-result-object p2

    .line 84
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->access$102(Lcom/sonymobile/scan3d/ThermalAlertReceiver;Lcom/sonyericsson/psm/sysmonservice/ISysmonService;)Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    .line 86
    iget-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;->this$0:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    invoke-static {p1}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->access$100(Lcom/sonymobile/scan3d/ThermalAlertReceiver;)Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 88
    :try_start_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;->this$0:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    invoke-static {p1}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->access$200(Lcom/sonymobile/scan3d/ThermalAlertReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 90
    invoke-static {}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->access$300()Ljava/lang/String;

    move-result-object p2

    const-string v0, "sysmon ServiceConnection failed."

    invoke-static {p2, v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1

    .line 97
    iget-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;->this$0:Lcom/sonymobile/scan3d/ThermalAlertReceiver;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->access$102(Lcom/sonymobile/scan3d/ThermalAlertReceiver;Lcom/sonyericsson/psm/sysmonservice/ISysmonService;)Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    return-void
.end method
