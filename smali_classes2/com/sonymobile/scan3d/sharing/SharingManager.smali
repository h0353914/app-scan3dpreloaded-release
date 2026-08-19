.class public Lcom/sonymobile/scan3d/sharing/SharingManager;
.super Ljava/lang/Object;
.source "SharingManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;,
        Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;
    }
.end annotation


# static fields
.field public static final SCAN_TYPE_DELIMITER:Ljava/lang/String; = ","

.field public static final kScanTypeAny:I = 0x7fffffff

.field private static sInstance:Lcom/sonymobile/scan3d/sharing/SharingManager;


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mExecutor:Ljava/util/concurrent/Executor;

.field private mListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;",
            ">;"
        }
    .end annotation
.end field

.field private mPlugins:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mListeners:Ljava/util/List;

    .line 84
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mExecutor:Ljava/util/concurrent/Executor;

    .line 108
    iput-object p1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mContext:Landroid/content/Context;

    .line 109
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.PACKAGE_ADDED"

    .line 110
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_CHANGED"

    .line 111
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.PACKAGE_REMOVED"

    .line 112
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "package"

    .line 113
    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 114
    new-instance v1, Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/sonymobile/scan3d/sharing/SharingManager$PackageChangedReceiver;-><init>(Lcom/sonymobile/scan3d/sharing/SharingManager;Lcom/sonymobile/scan3d/sharing/SharingManager$1;)V

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 115
    new-instance p1, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;

    invoke-direct {p1, p0, v2}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;-><init>(Lcom/sonymobile/scan3d/sharing/SharingManager;Lcom/sonymobile/scan3d/sharing/SharingManager$1;)V

    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mExecutor:Ljava/util/concurrent/Executor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/sharing/SharingManager$LoadPluginsTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/sharing/SharingManager;)Landroid/content/Context;
    .locals 0

    .line 76
    iget-object p0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/Map;
    .locals 0

    .line 76
    iget-object p0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$302(Lcom/sonymobile/scan3d/sharing/SharingManager;Ljava/util/Map;)Ljava/util/Map;
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    return-object p1
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/List;
    .locals 0

    .line 76
    iget-object p0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mListeners:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lcom/sonymobile/scan3d/sharing/SharingManager;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 76
    iget-object p0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mExecutor:Ljava/util/concurrent/Executor;

    return-object p0
.end method

.method public static getInstance()Lcom/sonymobile/scan3d/sharing/SharingManager;
    .locals 2

    .line 103
    sget-object v0, Lcom/sonymobile/scan3d/sharing/SharingManager;->sInstance:Lcom/sonymobile/scan3d/sharing/SharingManager;

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Init() should be called first!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static declared-synchronized init(Landroid/content/Context;)V
    .locals 2

    const-class v0, Lcom/sonymobile/scan3d/sharing/SharingManager;

    monitor-enter v0

    .line 96
    :try_start_0
    sget-object v1, Lcom/sonymobile/scan3d/sharing/SharingManager;->sInstance:Lcom/sonymobile/scan3d/sharing/SharingManager;

    if-nez v1, :cond_0

    .line 99
    new-instance v1, Lcom/sonymobile/scan3d/sharing/SharingManager;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/sharing/SharingManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/sonymobile/scan3d/sharing/SharingManager;->sInstance:Lcom/sonymobile/scan3d/sharing/SharingManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    monitor-exit v0

    return-void

    .line 97
    :cond_0
    :try_start_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v1, "Init() called twice, something is wrong"

    invoke-direct {p0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static parseType(Ljava/lang/String;)[I
    .locals 8

    .line 149
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    const-string v1, ","

    .line 150
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_5

    aget-object v4, p0, v3

    const/4 v5, -0x1

    .line 151
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    const/16 v7, 0x2a

    if-eq v6, v7, :cond_3

    const v7, 0x2fd65d

    if-eq v6, v7, :cond_2

    const v7, 0x300c5e

    if-eq v6, v7, :cond_1

    const v7, 0x30cde0

    if-eq v6, v7, :cond_0

    goto :goto_1

    :cond_0
    const-string v6, "head"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x1

    goto :goto_2

    :cond_1
    const-string v6, "food"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x2

    goto :goto_2

    :cond_2
    const-string v6, "face"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    move v4, v2

    goto :goto_2

    :cond_3
    const-string v6, "*"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4

    const/4 v4, 0x3

    goto :goto_2

    :cond_4
    :goto_1
    move v4, v5

    :goto_2
    packed-switch v4, :pswitch_data_0

    goto :goto_3

    :pswitch_0
    const v4, 0x7fffffff

    .line 162
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_1
    const/16 v4, 0x200

    .line 159
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_2
    const/16 v4, 0x101

    .line 156
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_3

    :pswitch_3
    const/16 v4, 0x100

    .line 153
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 168
    :cond_5
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p0

    new-array p0, p0, [I

    .line 170
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v3, v2, 0x1

    aput v1, p0, v2

    move v2, v3

    goto :goto_4

    :cond_6
    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private safeAddAllToSet(Ljava/util/Set;Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 238
    invoke-interface {p1, p2}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public getPlugins(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "I)",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;"
        }
    .end annotation

    .line 213
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 214
    :cond_0
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 215
    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {v1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/Set;

    invoke-direct {p0, v0, p2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->safeAddAllToSet(Ljava/util/Set;Ljava/util/Set;)V

    .line 216
    iget-object p2, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    const p2, 0x7fffffff

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->safeAddAllToSet(Ljava/util/Set;Ljava/util/Set;)V

    return-object v0
.end method

.method public getPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;",
            "I)",
            "Ljava/util/Set<",
            "Lcom/sonymobile/scan3d/sharing/Plugin;",
            ">;"
        }
    .end annotation

    .line 231
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 232
    :cond_0
    new-instance v0, Ljava/util/LinkedHashSet;

    invoke-direct {v0}, Ljava/util/LinkedHashSet;-><init>()V

    .line 233
    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/sharing/SharingManager;->safeAddAllToSet(Ljava/util/Set;Ljava/util/Set;)V

    return-object v0
.end method

.method public hasPlugins(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z
    .locals 0

    .line 184
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getPlugins(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 185
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public hasPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Z
    .locals 0

    .line 199
    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sharing/SharingManager;->getPluginsExact(Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)Ljava/util/Set;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 200
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public registerPluginUpdateListener(Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;)V
    .locals 1

    .line 129
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 130
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mPlugins:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 131
    invoke-interface {p1}, Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;->onPluginsChanged()V

    :cond_0
    return-void
.end method

.method public unregisterPluginUpdateListener(Lcom/sonymobile/scan3d/sharing/OnPluginUpdateListener;)V
    .locals 1

    .line 139
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/SharingManager;->mListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method
