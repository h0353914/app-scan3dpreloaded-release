.class abstract Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;
.super Landroid/os/AsyncTask;
.source "NonLeakyAsyncTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Clazz:",
        "Landroid/app/Activity;",
        "Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask<",
        "TParams;TProgress;TResult;>;"
    }
.end annotation


# instance fields
.field private final mThis:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "TClazz;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "TClazz;>;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 44
    iput-object p1, p0, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method


# virtual methods
.method protected varargs abstract doInBackground(Landroid/app/Activity;[Ljava/lang/Object;)Ljava/lang/Object;
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TClazz;[TParams;)TResult;"
        }
    .end annotation
.end method

.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation build Landroidx/annotation/AnyThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation

    .line 71
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 73
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;->doInBackground(Landroid/app/Activity;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected abstract onPostExecute(Landroid/app/Activity;Ljava/lang/Object;)V
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TClazz;TResult;)V"
        }
    .end annotation
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;->mThis:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    if-eqz v0, :cond_0

    .line 84
    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;->onPostExecute(Landroid/app/Activity;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
