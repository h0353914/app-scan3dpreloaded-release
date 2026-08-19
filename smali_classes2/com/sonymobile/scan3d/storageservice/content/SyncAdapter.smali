.class final Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;
.super Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;
.source "SyncAdapter.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.SyncAdapter"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 0

    .line 54
    invoke-direct {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/content/AbstractAuthenticatedSyncAdapter;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method private static isLogUploaded(I)Z
    .locals 0

    and-int/lit8 p0, p0, 0x8

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public onAuthenticatedSync(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Landroid/content/ContentProviderClient;Ljava/lang/String;)Z
    .locals 17
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;,
            Landroid/os/RemoteException;,
            Landroid/content/OperationApplicationException;,
            Ljava/lang/InterruptedException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    .line 62
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    const-string v3, "onAuthenticatedSync(): Start"

    invoke-static {v2, v3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;

    invoke-direct {v2}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;-><init>()V

    .line 65
    invoke-static/range {p3 .. p3}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->createMap(Landroid/content/ContentProviderClient;)Ljava/util/Map;

    move-result-object v3

    move-object/from16 v4, p4

    .line 67
    invoke-static {v0, v4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->listMetadata(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object v4

    .line 68
    invoke-interface {v4}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map;

    .line 70
    invoke-static/range {p1 .. p2}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->listLogs(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Ljava/util/List;

    move-result-object v5

    if-eqz v4, :cond_c

    .line 74
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 75
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v10

    .line 76
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v11

    .line 77
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v12

    .line 78
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v13

    .line 79
    invoke-interface {v4, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;

    if-eqz v14, :cond_8

    .line 88
    invoke-static {v13}, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->isLogUploaded(I)Z

    move-result v15

    if-nez v15, :cond_0

    invoke-interface {v5, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_0

    or-int/lit8 v13, v13, 0x8

    .line 95
    invoke-static {v10}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v15

    const-string v9, "transfer_flags"

    .line 96
    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v15, v9, v13}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v9

    .line 97
    invoke-virtual {v9}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v9

    .line 99
    invoke-virtual {v2, v9}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    goto :goto_1

    .line 100
    :cond_0
    invoke-static {v13}, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->isLogUploaded(I)Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v5, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    and-int/lit8 v9, v13, -0x9

    .line 106
    invoke-static {v10}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v13

    const-string v15, "transfer_flags"

    .line 107
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v13, v15, v9}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v9

    .line 108
    invoke-virtual {v9}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v9

    .line 109
    invoke-virtual {v2, v9}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    :cond_1
    :goto_1
    packed-switch v12, :pswitch_data_0

    :pswitch_0
    move-object/from16 v16, v3

    .line 220
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onAuthenticatedSync(): Nothing to do for "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 115
    :pswitch_1
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addDeleteOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    .line 116
    invoke-static {v0, v1, v6}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->deleteLog(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    move-object/from16 v16, v3

    goto/16 :goto_3

    .line 214
    :pswitch_2
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addModifyOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    move-object/from16 v16, v3

    goto/16 :goto_3

    .line 217
    :pswitch_3
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addDownloadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    move-object/from16 v16, v3

    goto/16 :goto_3

    .line 135
    :pswitch_4
    sget-object v12, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    const-string v13, "onAuthenticatedSync(): Found synced file."

    invoke-static {v12, v13}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 136
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isValid()Z

    move-result v12

    if-eqz v12, :cond_6

    .line 137
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getName()Ljava/lang/String;

    move-result-object v12

    .line 138
    invoke-interface {v14}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->getName()Ljava/lang/String;

    move-result-object v13

    .line 139
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isVisible()Z

    move-result v15

    .line 140
    invoke-interface {v14}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->isVisible()Z

    move-result v9

    .line 141
    invoke-interface {v14}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->getShareHash()Ljava/lang/String;

    move-result-object v8

    .line 142
    invoke-interface {v6}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSharedMeshes()I

    move-result v6

    .line 143
    invoke-interface {v14}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->getSharedMeshes()I

    move-result v14

    .line 144
    new-instance v7, Landroid/content/ContentValues;

    move-object/from16 v16, v3

    const/4 v3, 0x4

    invoke-direct {v7, v3}, Landroid/content/ContentValues;-><init>(I)V

    .line 146
    invoke-static {v12, v13}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    const-string v3, "name"

    .line 147
    invoke-virtual {v7, v3, v13}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    if-eqz v9, :cond_3

    if-eq v14, v6, :cond_3

    const-string v3, "shared_meshes"

    .line 153
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v7, v3, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_3
    if-eq v15, v9, :cond_5

    const-string v3, "visible"

    .line 157
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v7, v3, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v3, "share_hash"

    .line 158
    invoke-virtual {v7, v3, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "shared_meshes"

    .line 159
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v7, v3, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v3, "upload"

    .line 161
    invoke-static {v10, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    if-eqz v9, :cond_4

    .line 169
    new-instance v6, Landroid/content/ContentValues;

    const/4 v9, 0x3

    invoke-direct {v6, v9}, Landroid/content/ContentValues;-><init>(I)V

    const-string v9, "provider"

    .line 170
    sget-object v12, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 171
    invoke-virtual {v12}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v12

    .line 170
    invoke-virtual {v6, v9, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "uid"

    .line 172
    invoke-virtual {v6, v9, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "state"

    const/4 v9, 0x2

    .line 173
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 176
    invoke-static {v3}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 177
    invoke-virtual {v3, v6}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 175
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    goto :goto_2

    .line 181
    :cond_4
    invoke-static {v3}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    const-string v6, "provider=?"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/String;

    sget-object v9, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 183
    invoke-virtual {v9}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v9

    const/4 v12, 0x0

    aput-object v9, v8, v12

    .line 182
    invoke-virtual {v3, v6, v8}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 184
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 185
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    .line 189
    :cond_5
    :goto_2
    invoke-virtual {v7}, Landroid/content/ContentValues;->size()I

    move-result v3

    if-lez v3, :cond_7

    .line 191
    invoke-static {v10}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 192
    invoke-virtual {v3, v7}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 190
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    goto :goto_3

    :cond_6
    move-object/from16 v16, v3

    .line 199
    invoke-interface {v6, v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->deleteAllFiles(Landroid/content/Context;)Z

    .line 200
    new-instance v3, Landroid/content/ContentValues;

    const/4 v7, 0x2

    invoke-direct {v3, v7}, Landroid/content/ContentValues;-><init>(I)V

    const-string v7, "sync_state"

    const/4 v8, 0x1

    .line 201
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v7, "transfer_flags"

    const/4 v8, -0x1

    .line 202
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v3, v7, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 204
    invoke-static {v10}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v7

    .line 205
    invoke-virtual {v7, v3}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 206
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 208
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    .line 209
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addDownloadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_3

    :pswitch_5
    move-object/from16 v16, v3

    .line 129
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    const-string v7, "onAuthenticatedSync(): Found server file."

    invoke-static {v3, v7}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addDownloadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_3

    :pswitch_6
    move-object/from16 v16, v3

    .line 120
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    const-string v6, "onAuthenticatedSync(): Found local file."

    invoke-static {v3, v6}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    invoke-static {v10}, Landroid/content/ContentProviderOperation;->newUpdate(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    const-string v6, "sync_state"

    const/4 v7, 0x0

    .line 123
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v3, v6, v7}, Landroid/content/ContentProviderOperation$Builder;->withValue(Ljava/lang/String;Ljava/lang/Object;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 124
    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 125
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    .line 226
    :cond_7
    :goto_3
    invoke-interface {v4, v11}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    :cond_8
    move-object/from16 v16, v3

    packed-switch v12, :pswitch_data_1

    .line 256
    :pswitch_7
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "onAuthenticatedSync(): Nothing to do for local file "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, " with sync state "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 250
    :pswitch_8
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addUploadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_4

    .line 241
    :pswitch_9
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onAuthenticatedSync(): Found server file for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ", removing it."

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 243
    invoke-interface {v6, v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->deleteAllFiles(Landroid/content/Context;)Z

    .line 245
    invoke-static {v10}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 244
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    .line 247
    invoke-static {v0, v1, v6}, Lcom/sonymobile/scan3d/storageservice/network/PostProcessApi;->deleteLog(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    goto :goto_4

    .line 235
    :pswitch_a
    invoke-virtual {v2, v6}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addUploadOperation(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V

    :goto_4
    move-object/from16 v3, v16

    goto/16 :goto_0

    .line 264
    :cond_9
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_5
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;

    .line 265
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v4

    .line 266
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->toContentValues()Landroid/content/ContentValues;

    move-result-object v6

    const-string v7, "sync_state"

    const/4 v8, 0x1

    .line 267
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v6, v7, v9}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 269
    invoke-interface {v5, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a

    const-string v4, "transfer_flags"

    const/16 v7, 0x8

    .line 274
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 277
    :cond_a
    sget-object v4, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v4}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    .line 278
    invoke-virtual {v4, v6}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v4

    .line 279
    invoke-virtual {v2, v4}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    move-result v4

    .line 281
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->isVisible()Z

    move-result v6

    if-eqz v6, :cond_b

    .line 286
    new-instance v6, Landroid/content/ContentValues;

    const/4 v7, 0x3

    invoke-direct {v6, v7}, Landroid/content/ContentValues;-><init>(I)V

    const-string v9, "provider"

    .line 287
    sget-object v10, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->WEBVIEWER:Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    .line 288
    invoke-virtual {v10}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;->name()Ljava/lang/String;

    move-result-object v10

    .line 287
    invoke-virtual {v6, v9, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "uid"

    .line 289
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->getShareHash()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v6, v9, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "state"

    const/4 v9, 0x2

    .line 290
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v3, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 292
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-static {v3}, Landroid/content/ContentProviderOperation;->newInsert(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    const-string v10, "parent_id"

    .line 293
    invoke-virtual {v3, v10, v4}, Landroid/content/ContentProviderOperation$Builder;->withValueBackReference(Ljava/lang/String;I)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    .line 294
    invoke-virtual {v3, v6}, Landroid/content/ContentProviderOperation$Builder;->withValues(Landroid/content/ContentValues;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v3

    .line 295
    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->addContentProviderOperation(Landroid/content/ContentProviderOperation;)I

    goto/16 :goto_5

    :cond_b
    const/4 v7, 0x3

    const/4 v9, 0x2

    goto/16 :goto_5

    .line 300
    :cond_c
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/SyncAdapter;->TAG:Ljava/lang/String;

    const-string v3, "onAuthenticatedSync(): End"

    invoke-static {v1, v3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v1, p3

    .line 301
    invoke-virtual {v2, v0, v1}, Lcom/sonymobile/scan3d/storageservice/content/SyncTransaction;->apply(Landroid/content/Context;Landroid/content/ContentProviderClient;)Z

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_9
        :pswitch_7
        :pswitch_a
        :pswitch_9
    .end packed-switch
.end method
