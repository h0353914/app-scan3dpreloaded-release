.class abstract Lcom/sonymobile/scan3d/storageservice/content/Task;
.super Landroid/os/AsyncTask;
.source "Task.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/Cancellable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;",
        "Lcom/sonymobile/scan3d/storageservice/Cancellable;"
    }
.end annotation


# static fields
.field private static final NUM_UNIQUE_IDS:I = 0x3e8

.field private static sIdCounter:I


# instance fields
.field private final mEnqueuesWork:Z

.field private final mIsConcurrent:Z

.field private final mNotificationId:I

.field private final mParams:Landroid/app/job/JobParameters;

.field private volatile mReschedule:Z

.field private final mService:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/storageservice/content/TaskService;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZ)V
    .locals 1

    .line 73
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 74
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mService:Ljava/lang/ref/WeakReference;

    .line 75
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mParams:Landroid/app/job/JobParameters;

    .line 76
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mEnqueuesWork:Z

    .line 77
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/content/Task;->newId()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mNotificationId:I

    .line 78
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mIsConcurrent:Z

    return-void
.end method

.method private static newId()I
    .locals 1

    .line 191
    sget v0, Lcom/sonymobile/scan3d/storageservice/content/Task;->sIdCounter:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/sonymobile/scan3d/storageservice/content/Task;->sIdCounter:I

    rem-int/lit16 v0, v0, 0x3e8

    add-int/lit8 v0, v0, 0x1

    neg-int v0, v0

    return v0
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    .line 125
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/content/Task;->cancel(Z)Z

    return-void
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 19
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method protected final varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 2

    .line 83
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/content/TaskService;

    if-eqz p1, :cond_2

    .line 86
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->getForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 89
    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mNotificationId:I

    invoke-virtual {p1, v1, v0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->startForeground(ILandroid/app/Notification;)V

    .line 92
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/Task;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_1

    .line 93
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mParams:Landroid/app/job/JobParameters;

    invoke-virtual {p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V

    :cond_1
    if-eqz v0, :cond_2

    const/4 v0, 0x1

    .line 97
    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->stopForeground(Z)V

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method abstract doWork(Landroid/content/Context;Landroid/app/job/JobParameters;)V
.end method

.method getForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public final isConcurrent()Z
    .locals 1

    .line 120
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mIsConcurrent:Z

    return v0
.end method

.method isForeground(Landroid/content/Context;)Z
    .locals 0

    .line 155
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->getForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method onFailed(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method onFinished(Landroid/content/Context;)V
    .locals 0

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 19
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected final onPostExecute(Ljava/lang/Void;)V
    .locals 3

    .line 105
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mService:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/content/TaskService;

    if-eqz p1, :cond_0

    .line 108
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/Task;->onFinished(Landroid/content/Context;)V

    .line 109
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mParams:Landroid/app/job/JobParameters;

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mEnqueuesWork:Z

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mReschedule:Z

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/content/TaskService;->onTaskFinished(Landroid/app/job/JobParameters;ZZ)V

    :cond_0
    return-void
.end method

.method setReschedule(Z)V
    .locals 0

    .line 145
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/content/Task;->mReschedule:Z

    return-void
.end method
