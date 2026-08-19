.class Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;
.super Landroid/os/AsyncTask;
.source "SignoutActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SignoutTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->this$0:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$1;)V
    .locals 0

    .line 74
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;
    .locals 8

    .line 79
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->this$0:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;

    .line 80
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getRefreshToken(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 82
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->isCancelled()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_2

    .line 84
    :try_start_0
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->revokeRefreshToken(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object v0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/network/NetworkException; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    :catch_0
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 91
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 93
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->isCancelled()Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "sync_state=? OR sync_state=? OR sync_state=? OR sync_state=? OR sync_state=? OR sync_state=?"

    .line 94
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->access$000()[Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v3, v4}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 97
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v5

    const/4 v6, 0x3

    if-eq v5, v6, :cond_0

    .line 107
    invoke-interface {v4, p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->deleteAllFiles(Landroid/content/Context;)Z

    .line 108
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v4

    goto :goto_1

    .line 100
    :cond_0
    new-instance v5, Landroid/content/ContentValues;

    const/4 v6, 0x2

    invoke-direct {v5, v6}, Landroid/content/ContentValues;-><init>(I)V

    const-string v6, "sync_state"

    .line 101
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v6, "transfer_flags"

    .line 102
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 103
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-static {v4}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    .line 104
    invoke-virtual {v4, v5}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v4

    .line 111
    :goto_1
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 115
    :cond_1
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v3}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 116
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 115
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :try_start_1
    const-string v3, "com.sonymobile.scan3d.storageprovider"

    .line 119
    invoke-virtual {v0, v3, v1}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    .line 120
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->removeAccount(Landroid/content/Context;)Z

    move-result v2
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/content/OperationApplicationException; {:try_start_1 .. :try_end_1} :catch_1

    .line 126
    :catch_1
    :cond_2
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 74
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Ljava/lang/Boolean;)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->this$0:Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;->access$100(Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity;Z)V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 74
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/SignoutActivity$SignoutTask;->onPostExecute(Ljava/lang/Boolean;)V

    return-void
.end method
