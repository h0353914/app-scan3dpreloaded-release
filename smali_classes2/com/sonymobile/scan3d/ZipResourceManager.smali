.class public Lcom/sonymobile/scan3d/ZipResourceManager;
.super Ljava/lang/Object;
.source "ZipResourceManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;,
        Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;
    }
.end annotation


# static fields
.field private static mFoundObb:Z = false

.field private static sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;

.field private static sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;


# instance fields
.field public final EXPANSION_FILE_PATH:Ljava/lang/String;

.field private mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 4

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->mListeners:Ljava/util/List;

    .line 130
    invoke-static {p1}, Lcom/sonymobile/scan3d/ZipResourceManager;->initializeExpansionFilePath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->EXPANSION_FILE_PATH:Ljava/lang/String;

    .line 131
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->EXPANSION_FILE_PATH:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 132
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    .line 133
    sput-boolean p1, Lcom/sonymobile/scan3d/ZipResourceManager;->mFoundObb:Z

    .line 134
    new-instance v0, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;-><init>(Lcom/sonymobile/scan3d/ZipResourceManager;Lcom/sonymobile/scan3d/ZipResourceManager$1;)V

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v2

    new-array p1, p1, [Ljava/lang/String;

    iget-object v3, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->EXPANSION_FILE_PATH:Ljava/lang/String;

    aput-object v3, p1, v1

    invoke-virtual {v0, v2, p1}, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1

    .line 138
    :cond_0
    sput-boolean v1, Lcom/sonymobile/scan3d/ZipResourceManager;->mFoundObb:Z

    .line 139
    new-instance v0, Lcom/android/vending/expansion/zipfile/AssetResourceFile;

    invoke-direct {v0, p1}, Lcom/android/vending/expansion/zipfile/AssetResourceFile;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/sonymobile/scan3d/ZipResourceManager;->sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    .line 140
    iget-object p1, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->mListeners:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;

    .line 141
    invoke-interface {v0}, Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;->onZipResourceLoaded()V

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method

.method static synthetic access$100()Lcom/android/vending/expansion/zipfile/ZipResourceFile;
    .locals 1

    .line 22
    sget-object v0, Lcom/sonymobile/scan3d/ZipResourceManager;->sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/android/vending/expansion/zipfile/ZipResourceFile;
    .locals 0

    .line 22
    sput-object p0, Lcom/sonymobile/scan3d/ZipResourceManager;->sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-object p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/ZipResourceManager;)Ljava/util/List;
    .locals 0

    .line 22
    iget-object p0, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->mListeners:Ljava/util/List;

    return-object p0
.end method

.method public static expansionLoaded()Z
    .locals 2

    .line 87
    sget-object v0, Lcom/sonymobile/scan3d/ZipResourceManager;->sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 88
    invoke-virtual {v0}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;->numberOfEntries()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public static getInstance()Lcom/sonymobile/scan3d/ZipResourceManager;
    .locals 2

    .line 101
    sget-object v0, Lcom/sonymobile/scan3d/ZipResourceManager;->sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;

    if-eqz v0, :cond_0

    return-object v0

    .line 102
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call init() before trying to get instance!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static getZipResourceFile()Lcom/android/vending/expansion/zipfile/ZipResourceFile;
    .locals 1

    .line 203
    sget-object v0, Lcom/sonymobile/scan3d/ZipResourceManager;->sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    return-object v0
.end method

.method public static declared-synchronized init(Landroid/content/Context;)V
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/ZipResourceManager;

    monitor-enter v0

    .line 59
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/ZipResourceManager;->sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;

    if-nez v1, :cond_0

    .line 62
    new-instance v1, Lcom/sonymobile/scan3d/ZipResourceManager;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/ZipResourceManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/sonymobile/scan3d/ZipResourceManager;->sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    monitor-exit v0

    return-void

    .line 60
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "init() called twice, something is wrong"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static initializeExpansionFilePath(Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    .line 110
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 113
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1c

    if-lt v1, v3, :cond_0

    .line 114
    invoke-virtual {v0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v0

    invoke-static {p0, v0, v1, v2}, Lcom/android/vending/expansion/zipfile/APKExpansionSupport;->getAPKExpansionFiles(Landroid/content/Context;JI)[Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 116
    :cond_0
    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    int-to-long v0, v0

    invoke-static {p0, v0, v1, v2}, Lcom/android/vending/expansion/zipfile/APKExpansionSupport;->getAPKExpansionFiles(Landroid/content/Context;JI)[Ljava/lang/String;

    move-result-object p0

    .line 118
    :goto_0
    array-length v0, p0

    if-lez v0, :cond_1

    .line 119
    aget-object p0, p0, v2

    goto :goto_1

    :cond_1
    const-string p0, ""
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-object p0

    .line 124
    :catch_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "We cannot fail finding the expansion file!"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static newInstance(Ljava/lang/String;)Lcom/android/vending/expansion/zipfile/ZipResourceFile;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 218
    sget-boolean v0, Lcom/sonymobile/scan3d/ZipResourceManager;->mFoundObb:Z

    if-eqz v0, :cond_0

    .line 219
    new-instance v0, Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-direct {v0, p0}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 221
    :cond_0
    sget-object p0, Lcom/sonymobile/scan3d/ZipResourceManager;->sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;

    if-eqz p0, :cond_1

    .line 224
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getZipResourceFile()Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object p0

    return-object p0

    .line 222
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Init() not called before trying to get ZipResourceFIle instance"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static declared-synchronized reload(Landroid/content/Context;)V
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/ZipResourceManager;

    monitor-enter v0

    .line 66
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/ZipResourceManager;->sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;

    if-eqz v1, :cond_0

    .line 69
    new-instance v1, Lcom/sonymobile/scan3d/ZipResourceManager;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/ZipResourceManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/sonymobile/scan3d/ZipResourceManager;->sInstance:Lcom/sonymobile/scan3d/ZipResourceManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    monitor-exit v0

    return-void

    .line 67
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "reload() called before init()"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static usingOBB()Z
    .locals 1

    .line 78
    sget-boolean v0, Lcom/sonymobile/scan3d/ZipResourceManager;->mFoundObb:Z

    return v0
.end method


# virtual methods
.method public addZipResourceFileListener(Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 156
    iget-object v0, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 157
    sget-object v0, Lcom/sonymobile/scan3d/ZipResourceManager;->sZipFile:Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    if-eqz v0, :cond_0

    .line 158
    invoke-interface {p1}, Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;->onZipResourceLoaded()V

    :cond_0
    return-void
.end method

.method public removeZipResourceFileListener(Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;)V
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/sonymobile/scan3d/ZipResourceManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method
