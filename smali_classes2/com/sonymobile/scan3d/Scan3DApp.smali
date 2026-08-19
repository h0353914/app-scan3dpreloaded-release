.class public Lcom/sonymobile/scan3d/Scan3DApp;
.super Landroid/app/Application;
.source "Scan3DApp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "sculpt3d"


# instance fields
.field private volatile mAssetManager:Landroid/content/res/AssetManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "Scan3D"

    .line 103
    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    const/4 v0, 0x0

    .line 39
    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3DApp;->mAssetManager:Landroid/content/res/AssetManager;

    return-void
.end method

.method public static isCustomFaceMimicEnabled()Z
    .locals 2

    const-string v0, "scan3d"

    const-string v1, "labs"

    .line 99
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isJapaneseLanguage()Z
    .locals 2

    .line 91
    sget-object v0, Ljava/util/Locale;->JAPANESE:Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->getISO3Language()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public static isPartOfBetaProgram(Landroid/content/Context;)Z
    .locals 3

    const-string v0, "scan3d"

    const-string v1, "labs"

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 81
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "com.android.vending"

    .line 82
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f100327

    .line 83
    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p0

    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    const/4 p0, 0x0

    return p0

    :cond_0
    return v1
.end method

.method public static synthetic lambda$onCreate$0(Lcom/sonymobile/scan3d/Scan3DApp;)V
    .locals 1

    const/4 v0, 0x0

    .line 60
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->cleanTempDir(Landroid/content/Context;Ljava/io/File;)Z

    return-void
.end method


# virtual methods
.method public onCreate()V
    .locals 4

    .line 43
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 45
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/Scan3DApp;->mAssetManager:Landroid/content/res/AssetManager;

    .line 46
    iget-object v0, p0, Lcom/sonymobile/scan3d/Scan3DApp;->mAssetManager:Landroid/content/res/AssetManager;

    invoke-static {v0}, Lcom/sonymobile/scan3d/Sphinx;->initAssets(Landroid/content/res/AssetManager;)V

    .line 48
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    iget-object v0, v0, Landroid/content/pm/ApplicationInfo;->dataDir:Ljava/lang/String;

    .line 49
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    .line 50
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    .line 51
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/Sphinx;->setupEnvironment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 53
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->setPackageName(Ljava/lang/String;)V

    .line 55
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Scan3DApp;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/ZipResourceManager;->init(Landroid/content/Context;)V

    .line 57
    invoke-static {p0}, Lcom/sonymobile/scan3d/sharing/SharingManager;->init(Landroid/content/Context;)V

    .line 58
    invoke-static {p0}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->setup(Landroid/content/Context;)V

    .line 59
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/content/Jobs;->initPersistentJobs(Landroid/content/Context;)V

    .line 60
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$Scan3DApp$fyWmH4U8PWRwQS56wCkjcrCKXc8;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/-$$Lambda$Scan3DApp$fyWmH4U8PWRwQS56wCkjcrCKXc8;-><init>(Lcom/sonymobile/scan3d/Scan3DApp;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 62
    invoke-static {p0}, Lcom/facebook/drawee/backends/pipeline/Fresco;->initialize(Landroid/content/Context;)V

    .line 69
    invoke-static {p0}, Lcom/sonymobile/scan3d/utils/SystemUtils;->isDataAllowed(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/sonymobile/scan3d/utils/SystemUtils;->isGooglePlayServicesAvailable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-static {p0}, Lcom/sonymobile/scan3d/utils/SystemUtils;->initFirebase(Landroid/content/Context;)V

    :cond_0
    const-string v0, "sculpt3d"

    const-string v1, "Version name is 3.0.A.0.36"

    .line 73
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    new-instance v0, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;-><init>(Lcom/sonymobile/scan3d/Scan3DApp$1;)V

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Scan3DApp;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
