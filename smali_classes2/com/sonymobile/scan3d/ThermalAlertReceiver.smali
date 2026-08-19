.class public Lcom/sonymobile/scan3d/ThermalAlertReceiver;
.super Landroid/content/BroadcastReceiver;
.source "ThermalAlertReceiver.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;,
        Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;
    }
.end annotation


# static fields
.field private static final ACTION_CAMERA_COOLED_DOWN_NORMAL:Ljava/lang/String; = "com.sonyericsson.psm.action.CAMERA_COOLED_DOWN_NORMAL"

.field private static final ACTION_CAMERA_HEATED_CLOSE_TO_SHUTDOWN:Ljava/lang/String; = "com.sonyericsson.psm.action.CAMERA_HEATED_CLOSE_TO_SHUTDOWN"

.field private static final ACTION_CAMERA_HEATED_OVER_CRITICAL:Ljava/lang/String; = "com.sonyericsson.psm.action.CAMERA_HEATED_OVER_CRITICAL"

.field private static final CAMERA_CLOSE_SHUTDOWN:I = 0x26c

.field private static final CAMERA_CRITICAL:I = 0x25c

.field private static final SYSMON_SERVICE_CLASS_NAME:Ljava/lang/String; = "com.sonyericsson.psm.sysmonservice.SysmonService"

.field private static final SYSMON_SERVICE_PACKAGE_NAME:Ljava/lang/String; = "com.sonyericsson.psm.sysmonservice"

.field private static final TAG:Ljava/lang/String; = "ThermalAlertReceiver"


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mIsBound:Z

.field private mIsRegistered:Z

.field private final mServiceConnection:Landroid/content/ServiceConnection;

.field private mSysmonService:Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

.field private final mThermalCallback:Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;)V
    .locals 0

    .line 74
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 75
    iput-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mContext:Landroid/content/Context;

    .line 76
    iput-object p2, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mThermalCallback:Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;

    .line 77
    new-instance p1, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ServiceConnectionSysmon;-><init>(Lcom/sonymobile/scan3d/ThermalAlertReceiver;Lcom/sonymobile/scan3d/ThermalAlertReceiver$1;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mServiceConnection:Landroid/content/ServiceConnection;

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/ThermalAlertReceiver;)Lcom/sonyericsson/psm/sysmonservice/ISysmonService;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mSysmonService:Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    return-object p0
.end method

.method static synthetic access$102(Lcom/sonymobile/scan3d/ThermalAlertReceiver;Lcom/sonyericsson/psm/sysmonservice/ISysmonService;)Lcom/sonyericsson/psm/sysmonservice/ISysmonService;
    .locals 0

    .line 19
    iput-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mSysmonService:Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    return-object p1
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/ThermalAlertReceiver;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 19
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->isCameraAllowedToStart()V

    return-void
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 19
    sget-object v0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private isCameraAllowedToStart()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 142
    iget-object v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mSysmonService:Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    invoke-interface {v0}, Lcom/sonyericsson/psm/sysmonservice/ISysmonService;->getThermalLevelForCamera()I

    move-result v0

    const/16 v1, 0x25c

    if-eq v0, v1, :cond_0

    const/16 v1, 0x26c

    if-ne v0, v1, :cond_1

    .line 144
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mThermalCallback:Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;->cameraTooHotToStart()V

    :cond_1
    return-void
.end method

.method private register()V
    .locals 2

    .line 149
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsRegistered:Z

    if-nez v0, :cond_0

    .line 150
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.sonyericsson.psm.action.CAMERA_HEATED_CLOSE_TO_SHUTDOWN"

    .line 151
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.sonyericsson.psm.action.CAMERA_HEATED_OVER_CRITICAL"

    .line 152
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.sonyericsson.psm.action.CAMERA_COOLED_DOWN_NORMAL"

    .line 153
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 155
    iget-object v1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v1, p0, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 156
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsRegistered:Z

    :cond_0
    return-void
.end method

.method private unregister()V
    .locals 1

    .line 161
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsRegistered:Z

    if-eqz v0, :cond_0

    .line 162
    iget-object v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    .line 163
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsRegistered:Z

    :cond_0
    return-void
.end method


# virtual methods
.method public bindThermalService()V
    .locals 4

    .line 103
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    const-string v1, "com.sonyericsson.psm.sysmonservice"

    const-string v2, "com.sonyericsson.psm.sysmonservice.SysmonService"

    .line 104
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 105
    iget-object v1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mServiceConnection:Landroid/content/ServiceConnection;

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsBound:Z

    .line 107
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsBound:Z

    if-eqz v0, :cond_0

    .line 108
    sget-object v0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->TAG:Ljava/lang/String;

    const-string v1, "bind sysmon service"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 112
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 114
    :goto_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->register()V

    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    .line 129
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    const-string p2, "com.sonyericsson.psm.action.CAMERA_HEATED_CLOSE_TO_SHUTDOWN"

    .line 131
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 132
    iget-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mThermalCallback:Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;->cameraGettingHot()V

    goto :goto_0

    :cond_0
    const-string p2, "com.sonyericsson.psm.action.CAMERA_HEATED_OVER_CRITICAL"

    .line 133
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 134
    iget-object p1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mThermalCallback:Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/ThermalAlertReceiver$ThermalAlertCallback;->cameraOverheated()V

    goto :goto_0

    :cond_1
    const-string p2, "com.sonyericsson.psm.action.CAMERA_COOLED_DOWN_NORMAL"

    .line 135
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 136
    sget-object p1, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->TAG:Ljava/lang/String;

    const-string p2, "Camera cooled down"

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public unbindThermalService()V
    .locals 2

    .line 118
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsBound:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 119
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mIsBound:Z

    .line 120
    iget-object v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mServiceConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    .line 121
    iput-object v0, p0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->mSysmonService:Lcom/sonyericsson/psm/sysmonservice/ISysmonService;

    .line 122
    sget-object v0, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->TAG:Ljava/lang/String;

    const-string v1, "unbind sysmon service"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 124
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ThermalAlertReceiver;->unregister()V

    return-void
.end method
