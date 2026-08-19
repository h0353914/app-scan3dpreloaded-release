.class Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;
.super Ljava/lang/Object;
.source "SyncTransaction.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.SyncTransaction"


# instance fields
.field private mContentProviderOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/content/ContentProviderOperation;",
            ">;"
        }
    .end annotation
.end field

.field private mNetworkOperations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mContentProviderOperations:Ljava/util/ArrayList;

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mNetworkOperations:Ljava/util/ArrayList;

    return-void
.end method

.method private addNetworkOperation(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V
    .locals 2

    .line 231
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mNetworkOperations:Ljava/util/ArrayList;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;

    invoke-direct {v1, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;-><init>(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method addContentProviderOperation(Landroid/content/ContentProviderOperation;)I
    .locals 1

    .line 117
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mContentProviderOperations:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 118
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mContentProviderOperations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    return p1
.end method

.method addDeleteOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 146
    invoke-direct {p0, v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addNetworkOperation(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V

    return-void
.end method

.method addDownloadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    const/4 v0, 0x4

    const/4 v1, 0x1

    .line 127
    invoke-direct {p0, v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addNetworkOperation(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V

    return-void
.end method

.method addModifyOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 155
    invoke-direct {p0, v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addNetworkOperation(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V

    return-void
.end method

.method addUploadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 2

    const/4 v0, 0x3

    const/4 v1, 0x1

    .line 136
    invoke-direct {p0, v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addNetworkOperation(ILcom/sonymobile/scan3d/storageservice/provider/IFileSet;Z)V

    return-void
.end method

.method apply(Landroid/content/Context;Landroid/content/ContentProviderClient;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 171
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mContentProviderOperations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_2

    .line 172
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mContentProviderOperations:Ljava/util/ArrayList;

    invoke-virtual {p2, v0}, Landroid/content/ContentProviderClient;->applyBatch(Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    move-result-object p2

    .line 173
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;-><init>()V

    .line 175
    array-length v2, p2

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_3

    aget-object v4, p2, v3

    .line 176
    iget-object v5, v4, Landroid/content/ContentProviderResult;->uri:Landroid/net/Uri;

    if-eqz v5, :cond_1

    .line 178
    iget-object v5, v4, Landroid/content/ContentProviderResult;->uri:Landroid/net/Uri;

    invoke-virtual {v0, v5}, Lcom/sonymobile/scan3d/storageservice/provider/Matcher;->match(Landroid/net/Uri;)I

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_1

    .line 180
    :cond_0
    iget-object v4, v4, Landroid/content/ContentProviderResult;->uri:Landroid/net/Uri;

    invoke-static {p1, v4}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v4

    .line 182
    invoke-virtual {p0, v4}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addDownloadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 191
    :cond_2
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->TAG:Ljava/lang/String;

    const-string v0, "No content provider transactions provided."

    invoke-static {p2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    :cond_3
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mNetworkOperations:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    const/4 v0, 0x1

    if-lez p2, :cond_a

    .line 198
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->mNetworkOperations:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v2, 0x0

    move v3, v0

    move-object v4, v2

    :cond_4
    :goto_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_9

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;

    .line 199
    invoke-virtual {v5}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->areKeysRequired()Z

    move-result v6

    if-eqz v6, :cond_7

    if-nez v4, :cond_5

    .line 203
    :try_start_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object v6

    invoke-virtual {v6}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->executeWait()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v6

    goto :goto_3

    :catch_0
    move-exception v6

    .line 205
    sget-object v7, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->TAG:Ljava/lang/String;

    const-string v8, "Could not get keys"

    invoke-static {v7, v8, v6}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    :goto_3
    if-eqz v4, :cond_4

    .line 210
    invoke-virtual {v5, p1, v4}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z

    move-result v5

    if-eqz v5, :cond_6

    if-eqz v3, :cond_6

    move v3, v0

    goto :goto_2

    :cond_6
    move v3, v1

    goto :goto_2

    .line 213
    :cond_7
    invoke-virtual {v5, p1, v2}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction$NetworkOperation;->execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Z

    move-result v5

    if-eqz v5, :cond_8

    if-eqz v3, :cond_8

    move v3, v0

    goto :goto_2

    :cond_8
    move v3, v1

    goto :goto_2

    :cond_9
    move v0, v3

    goto :goto_4

    .line 217
    :cond_a
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->TAG:Ljava/lang/String;

    const-string p2, "No network transactions provided."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    :goto_4
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "All jobs where submitted "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0
.end method
