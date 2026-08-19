.class public Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;
.super Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;
.source "WebViewerActionTask.java"


# static fields
.field private static final MAX_RETRIES:I = 0x3

.field private static final POLL_TIME:J

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.ui.upload.webviewer.WebViewerActionTask"


# instance fields
.field private mShareUid:Ljava/lang/String;

.field private mSharedMeshes:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 48
    sget-object v0, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x5

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->POLL_TIME:J

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)V
    .locals 0

    .line 76
    invoke-direct/range {p0 .. p6}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Landroid/net/Uri;Landroid/os/Bundle;)V

    return-void
.end method

.method private share(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
    .locals 6

    .line 157
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/Credentials;->getToken()Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    .line 159
    :try_start_0
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->isSynced()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 160
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->uploadPublicly(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Z

    move-result p3

    goto :goto_0

    .line 161
    :cond_0
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->uploadPrivately(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 163
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v4, "sync_state"

    const/4 v5, 0x2

    .line 165
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 166
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v5

    invoke-virtual {v4, v5, v1, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 167
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->uploadPublicly(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Z

    move-result p3

    goto :goto_0

    :cond_1
    move p3, v0

    :goto_0
    if-eqz p3, :cond_2

    .line 172
    new-instance p4, Landroid/content/ContentValues;

    const/4 v1, 0x3

    invoke-direct {p4, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "visible"

    .line 173
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "share_hash"

    .line 174
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mShareUid:Ljava/lang/String;

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "shared_meshes"

    .line 175
    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mSharedMeshes:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p4, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 177
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2, p4, v3, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 181
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->TAG:Ljava/lang/String;

    const-string p3, "share(): Sharing failed"

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    move p3, v0

    .line 184
    :cond_2
    :goto_1
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mShareUid:Ljava/lang/String;

    invoke-direct {p1, p3, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;-><init>(ZLjava/lang/String;)V

    return-object p1
.end method

.method private unshare(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 200
    :try_start_0
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/storageservice/network/Credentials;->getToken()Ljava/lang/String;

    move-result-object p3

    invoke-static {p1, v2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->unshareModel(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p3

    .line 201
    invoke-interface {p3}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz p3, :cond_0

    .line 205
    :try_start_1
    new-instance v2, Landroid/content/ContentValues;

    const/4 v3, 0x2

    invoke-direct {v2, v3}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "visible"

    .line 206
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v3, "shared_meshes"

    .line 207
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 208
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object p2

    invoke-virtual {p1, p2, v2, v0, v0}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    move p3, v1

    .line 212
    :goto_0
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->TAG:Ljava/lang/String;

    const-string v1, "unshare(): Unsharing failed"

    invoke-static {p2, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 215
    :cond_0
    :goto_1
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    invoke-direct {p1, p3, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;-><init>(ZLjava/lang/String;)V

    return-object p1
.end method

.method private static uploadPrivately(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 226
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getTransferFlags()I

    move-result v0

    .line 227
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    .line 229
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActionsUtil;->getKeysExecuteWait(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v2

    .line 230
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getUploadableContent(Landroid/content/Context;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;

    .line 231
    invoke-virtual {v4, v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->isTransferred(I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 232
    invoke-virtual {v4, p1, v2, p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->upload(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 234
    invoke-virtual {v4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$Uploadable;->getTransferFlag()I

    move-result v4

    or-int/2addr v0, v4

    .line 235
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4, v5}, Landroid/content/ContentValues;-><init>(I)V

    const-string v5, "transfer_flags"

    .line 236
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 237
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v5

    const/4 v6, 0x0

    invoke-virtual {v5, v1, v4, v6, v6}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :cond_2
    return v5
.end method

.method private uploadPublicly(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 264
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSharedMeshes()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mSharedMeshes:I

    .line 266
    invoke-static {p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->waitUntilAvailablePrivately(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 267
    invoke-static {p1, p4}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->getPublicUploads(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p4, 0x1

    move v0, v1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;

    .line 268
    invoke-virtual {v0, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->upload(Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 269
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->getType()I

    move-result v2

    if-eq v2, p4, :cond_0

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 275
    :cond_0
    :pswitch_0
    iget v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mSharedMeshes:I

    shl-int v2, p4, v2

    or-int/2addr v2, v3

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mSharedMeshes:I

    .line 282
    :goto_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$PublicUploadable;->getShareUid()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 284
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->mShareUid:Ljava/lang/String;

    :cond_1
    move v0, p4

    goto :goto_0

    :cond_2
    move v1, v0

    :cond_3
    return v1

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static waitUntilAvailablePrivately(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 309
    invoke-static {p0, p2}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->listMetadata(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object p0

    const/4 p2, 0x0

    move v0, p2

    .line 312
    :cond_0
    sget-wide v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->POLL_TIME:J

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 313
    invoke-interface {p0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    .line 314
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    goto :goto_0

    :cond_1
    move v1, p2

    :goto_0
    if-nez v1, :cond_2

    add-int/2addr v0, v2

    const/4 v2, 0x3

    if-lt v0, v2, :cond_0

    :cond_2
    return v1
.end method


# virtual methods
.method public execute(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Landroid/os/Bundle;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;
    .locals 2

    .line 128
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    const-string v1, "com.sonymobile.scan3d.extra.SHAREABLE"

    invoke-virtual {p5, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p5

    invoke-direct {v0, p5}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;-><init>(Landroid/os/Bundle;)V

    .line 130
    sget-object p5, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask$1;->$SwitchMap$com$sonymobile$scan3d$storageservice$ui$upload$Action:[I

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->ordinal()I

    move-result p2

    aget p2, p5, p2

    packed-switch p2, :pswitch_data_0

    .line 138
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    const/4 p2, 0x0

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;-><init>(ZLjava/lang/String;)V

    goto :goto_0

    .line 135
    :pswitch_0
    invoke-direct {p0, p1, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->unshare(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    move-result-object p1

    goto :goto_0

    .line 132
    :pswitch_1
    invoke-direct {p0, p1, p3, p4, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/webviewer/WebViewerActionTask;->share(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Lcom/sonymobile/scan3d/storageservice/network/Credentials;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask$ActionResult;

    move-result-object p1

    :goto_0
    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCompletedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 1

    .line 90
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    if-ne p1, v0, :cond_0

    const p1, 0x7f100334

    return p1

    .line 93
    :cond_0
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getCompletedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p1

    return p1
.end method

.method public getFailedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 1

    .line 99
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    if-ne p1, v0, :cond_0

    const p1, 0x7f100335

    return p1

    .line 102
    :cond_0
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getFailedText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p1

    return p1
.end method

.method public getFailedTitle(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 1

    .line 108
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    if-ne p1, v0, :cond_0

    const p1, 0x7f100262

    return p1

    .line 111
    :cond_0
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getFailedTitle(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p1

    return p1
.end method

.method public getNoFurtherActionText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 1

    .line 117
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    if-ne p1, v0, :cond_0

    const p1, 0x7f100344

    return p1

    .line 120
    :cond_0
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getNoFurtherActionText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p1

    return p1
.end method

.method public getOngoingText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I
    .locals 1

    .line 81
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->UNSHARE:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    if-ne p1, v0, :cond_0

    const p1, 0x7f100336

    return p1

    .line 84
    :cond_0
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getOngoingText(Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;)I

    move-result p1

    return p1
.end method
