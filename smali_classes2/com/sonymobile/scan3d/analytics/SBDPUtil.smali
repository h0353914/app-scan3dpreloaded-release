.class public Lcom/sonymobile/scan3d/analytics/SBDPUtil;
.super Ljava/lang/Object;
.source "SBDPUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;
    }
.end annotation


# static fields
.field private static final IDD_CLASS_NAME:Ljava/lang/String; = "com.sonyericsson.idd.api.Idd"

.field private static final IDD_METHOD_NAME:Ljava/lang/String; = "addAppDataJSON"

.field private static final JSON_SESSION_ID:Ljava/lang/String; = "session_id"

.field private static final JSON_VERSION:Ljava/lang/String; = "json_version"

.field private static final JSON_VERSION_VALUE:Ljava/lang/String; = "2"

.field private static final TAG:Ljava/lang/String;

.field private static final TYPE:Ljava/lang/String; = "type"

.field private static final TYPE_CONFIG_VALUES:Ljava/lang/String; = "config-values"

.field private static final TYPE_EVENT:Ljava/lang/String; = "event"

.field private static final TYPE_SCAN_EVENT:Ljava/lang/String; = "scanEvent"

.field private static final TYPE_SCREENVIEW:Ljava/lang/String; = "screenview"

.field private static final TYPE_SCREEN_LEAVE:Ljava/lang/String; = "screenview-exit"

.field private static final TYPE_SIGNIN_EVENT:Ljava/lang/String; = "signinEvent"

.field private static final TYPE_TIMING_ENGINE:Ljava/lang/String; = "timing-engine"

.field private static final UNKNOWN_SCAN_POLICY:I = -0x2

.field private static sInstance:Lcom/sonymobile/scan3d/analytics/SBDPUtil;


# instance fields
.field private mAppContext:Landroid/content/Context;

.field private mExecutor:Ljava/util/concurrent/Executor;

.field private mMethodAddAppDataJSON:Ljava/lang/reflect/Method;

.field private mPackageName:Ljava/lang/String;

.field private mQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;",
            ">;"
        }
    .end annotation
.end field

.field private mSessionId:Ljava/util/UUID;

.field private mVersionCode:I

.field private mVersionName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 33
    const-class v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 70
    sput-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sInstance:Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    .line 80
    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mVersionName:Ljava/lang/String;

    const/4 v0, -0x1

    .line 81
    iput v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mVersionCode:I

    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mSessionId:Ljava/util/UUID;

    .line 93
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mExecutor:Ljava/util/concurrent/Executor;

    .line 98
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mQueue:Ljava/util/List;

    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mAppContext:Landroid/content/Context;

    .line 102
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mSessionId:Ljava/util/UUID;

    .line 104
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    const/4 v1, 0x0

    .line 106
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    .line 107
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    .line 109
    iget-object v0, p1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    iput-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mVersionName:Ljava/lang/String;

    .line 110
    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I

    iput p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mVersionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 112
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    const-string v2, "Error getting package info: "

    invoke-static {v0, v2, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    :try_start_1
    const-string p1, "com.sonyericsson.idd.api.Idd"

    .line 116
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string v0, "addAppDataJSON"

    const/4 v2, 0x4

    .line 117
    new-array v2, v2, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v1

    const/4 v1, 0x1

    const-class v3, Ljava/lang/String;

    aput-object v3, v2, v1

    const/4 v1, 0x2

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v2, v1

    const/4 v1, 0x3

    const-class v3, Lorg/json/JSONObject;

    aput-object v3, v2, v1

    invoke-virtual {p1, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mMethodAddAppDataJSON:Ljava/lang/reflect/Method;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ExceptionInInitializerError; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 120
    :catch_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    const-string v0, "Idd.addAppDataJSON is not supported"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 32
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/sonymobile/scan3d/analytics/SBDPUtil;
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    monitor-enter v0

    .line 125
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sInstance:Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    if-nez v1, :cond_0

    .line 126
    new-instance v1, Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sInstance:Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    .line 128
    :cond_0
    sget-object p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sInstance:Lcom/sonymobile/scan3d/analytics/SBDPUtil;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private isIddSupported()Z
    .locals 1

    .line 141
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mMethodAddAppDataJSON:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static declared-synchronized resetInstance()V
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;

    monitor-enter v0

    const/4 v1, 0x0

    .line 132
    :try_start_0
    sput-object v1, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sInstance:Lcom/sonymobile/scan3d/analytics/SBDPUtil;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 133
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private declared-synchronized sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 8
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lorg/json/JSONObject;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    monitor-enter p0

    .line 242
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->isIddSupported()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "type"

    .line 243
    invoke-virtual {p3, v0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "json_version"

    const-string v0, "2"

    .line 244
    invoke-virtual {p3, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "session_id"

    .line 245
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mSessionId:Ljava/util/UUID;

    invoke-virtual {p3, p2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 247
    new-instance p2, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;

    iget-object v2, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mMethodAddAppDataJSON:Ljava/lang/reflect/Method;

    iget-object v4, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mVersionName:Ljava/lang/String;

    iget v5, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mVersionCode:I

    const/4 v7, 0x0

    move-object v1, p2

    move-object v3, p1

    move-object v6, p3

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;-><init>(Ljava/lang/reflect/Method;Ljava/lang/String;Ljava/lang/String;ILorg/json/JSONObject;Lcom/sonymobile/scan3d/analytics/SBDPUtil$1;)V

    .line 249
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mAppContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/sonymobile/scan3d/utils/SystemUtils;->isDataAllowed(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 250
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mQueue:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;

    .line 251
    iget-object v1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mExecutor:Ljava/util/concurrent/Executor;

    new-array v0, v0, [Ljava/lang/Void;

    invoke-virtual {p3, v1, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 253
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mQueue:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 254
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mExecutor:Ljava/util/concurrent/Executor;

    new-array p3, v0, [Ljava/lang/Void;

    invoke-virtual {p2, p1, p3}, Lcom/sonymobile/scan3d/analytics/SBDPUtil$IddSender;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 256
    :cond_1
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mQueue:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    :cond_2
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public pushAppView(Ljava/lang/String;Z)V
    .locals 2

    .line 162
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "screen"

    .line 164
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    if-eqz p2, :cond_0

    const-string p1, "screenview"

    goto :goto_0

    :cond_0
    const-string p1, "screenview-exit"

    .line 166
    :goto_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    invoke-direct {p0, p2, p1, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 168
    sget-object p2, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_1
    return-void
.end method

.method public pushConfigValues(Lorg/json/JSONObject;)V
    .locals 2

    .line 220
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    const-string v1, "config-values"

    invoke-direct {p0, v0, v1, p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 222
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public pushEngineTiming(Lorg/json/JSONObject;)V
    .locals 2

    .line 146
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    const-string v1, "timing-engine"

    invoke-direct {p0, v0, v1, p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 149
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public pushEvent(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 6

    const/4 v5, -0x2

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    .line 173
    invoke-virtual/range {v0 .. v5}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->pushEvent(Ljava/lang/String;Ljava/lang/String;JI)V

    return-void
.end method

.method public pushEvent(Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 2

    .line 177
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "action"

    .line 179
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "label"

    .line 180
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "hits"

    .line 181
    invoke-virtual {v0, p1, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const/4 p1, -0x2

    if-le p5, p1, :cond_0

    const-string p1, "mode"

    .line 183
    invoke-virtual {v0, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 185
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    const-string p2, "event"

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 188
    sget-object p2, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public pushScanEvent(Lorg/json/JSONObject;)V
    .locals 2

    .line 155
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    const-string v1, "scanEvent"

    invoke-direct {p0, v0, v1, p1}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 157
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public pushSignInEvent(Ljava/lang/String;I)V
    .locals 2

    .line 193
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "signin_action"

    .line 195
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "signin_session_id"

    .line 196
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 197
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    const-string p2, "signinEvent"

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 199
    sget-object p2, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public pushSignInEvent(Ljava/lang/String;IILjava/lang/String;)V
    .locals 2
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 204
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "signin_action"

    .line 206
    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "signin_session_id"

    .line 207
    invoke-virtual {v0, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p1, "signin_result_code"

    .line 208
    invoke-virtual {v0, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    if-eqz p4, :cond_0

    const-string p1, "signin_exception"

    .line 210
    invoke-virtual {v0, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->mPackageName:Ljava/lang/String;

    const-string p2, "signinEvent"

    invoke-direct {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->sendDataToIdd(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 214
    sget-object p2, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
