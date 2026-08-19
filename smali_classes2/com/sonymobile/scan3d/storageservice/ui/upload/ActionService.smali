.class public final Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;
.super Landroid/app/Service;
.source "ActionService.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;,
        Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;
    }
.end annotation


# static fields
.field private static final ACTION_INIT:Ljava/lang/String; = "com.sonymobile.scan3d.action.INIT"

.field private static final MESSAGE_INIT:I = 0x0

.field private static final MESSAGE_TRANSFER:I = 0x1

.field private static final SELECTION:Ljava/lang/String; = "state=? OR state=?"

.field private static final SELECTION_ARGS:[Ljava/lang/String;

.field private static final WORKER_THREAD_NAME:Ljava/lang/String; = "UploadService#WorkerThread"


# instance fields
.field private mExecutor:Ljava/util/concurrent/ExecutorService;

.field private mHandler:Landroid/os/Handler;

.field private mLooper:Landroid/os/Looper;

.field private mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x2

    .line 71
    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    .line 72
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 73
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->SELECTION_ARGS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 39
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->onRunInit(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;I)V
    .locals 0

    .line 39
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->onRunUploadTask(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;I)V

    return-void
.end method

.method static executeTask(Landroid/content/Context;Landroid/content/Intent;Lcom/sonymobile/scan3d/storageservice/network/Credentials;)V
    .locals 3

    .line 236
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 237
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "com.sonymobile.scan3d.extra.CREDENTIALS"

    .line 241
    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 243
    new-instance p2, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;

    invoke-direct {p2, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 244
    invoke-virtual {p2, v0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 245
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 246
    invoke-virtual {p2, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 247
    invoke-virtual {p0, p2}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method

.method public static init(Landroid/content/Context;)V
    .locals 2

    .line 223
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.sonymobile.scan3d.action.INIT"

    .line 224
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 225
    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method private onRunInit(I)V
    .locals 2

    .line 341
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 342
    iput p1, v0, Landroid/os/Message;->arg1:I

    .line 343
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method

.method private onRunUploadTask(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;I)V
    .locals 5

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    .line 326
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getId()I

    move-result v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    const/4 v4, 0x0

    invoke-virtual {p1, p0, v3, v4, v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->getStartNotification(Landroid/content/Context;Lcom/sonymobile/scan3d/utils/notification/Notifier;ZZ)Landroid/app/Notification;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->notify(ILandroid/app/Notification;)V

    .line 329
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mHandler:Landroid/os/Handler;

    invoke-static {v1, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 330
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 331
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 332
    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 4

    .line 293
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 295
    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;

    if-eqz v0, :cond_1

    .line 298
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    invoke-virtual {v0, p0, v2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionTask;->execute(Landroid/app/Service;Lcom/sonymobile/scan3d/utils/notification/Notifier;)V

    .line 307
    :cond_1
    :goto_0
    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->stopSelfResult(I)Z

    move-result p1

    if-eqz p1, :cond_2

    .line 312
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    .line 313
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$UploadRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v2, "state=? OR state=?"

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->SELECTION_ARGS:[Ljava/lang/String;

    invoke-virtual {p1, v0, v2, v3}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_2
    return v1
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    .line 253
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 254
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    .line 256
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "UploadService#WorkerThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 257
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 259
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mLooper:Landroid/os/Looper;

    .line 260
    new-instance v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mLooper:Landroid/os/Looper;

    invoke-direct {v0, v1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mHandler:Landroid/os/Handler;

    const-string v0, "upload"

    .line 261
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mNotifier:Lcom/sonymobile/scan3d/utils/notification/Notifier;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 266
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 267
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 268
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 2

    if-eqz p1, :cond_1

    .line 274
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p2

    const-string v0, "com.sonymobile.scan3d.action.INIT"

    .line 276
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const/4 v0, 0x0

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    .line 277
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;

    invoke-direct {p1, p0, p3, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;ILcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$1;)V

    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-array p3, v0, [Ljava/lang/Void;

    invoke-virtual {p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$InitTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 279
    :cond_0
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;

    invoke-direct {p2, p0, p3, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;ILcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$1;)V

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService;->mExecutor:Ljava/util/concurrent/ExecutorService;

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/content/Intent;

    aput-object p1, v1, v0

    invoke-virtual {p2, p3, v1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/ActionService$SetupTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_1
    :goto_0
    const/4 p1, 0x3

    return p1
.end method
