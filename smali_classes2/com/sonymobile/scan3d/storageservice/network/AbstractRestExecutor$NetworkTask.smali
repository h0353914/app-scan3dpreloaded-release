.class Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;
.super Landroid/os/AsyncTask;
.source "AbstractRestExecutor.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;
.implements Lcom/sonymobile/scan3d/storageservice/Cancellable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "NetworkTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Output:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;",
        "TOutput;>;",
        "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener<",
        "TOutput;>;",
        "Lcom/sonymobile/scan3d/storageservice/Cancellable;"
    }
.end annotation


# instance fields
.field private mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;"
        }
    .end annotation
.end field

.field private mListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener<",
            "TOutput;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener<",
            "TOutput;>;)V"
        }
    .end annotation

    .line 108
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 109
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    .line 110
    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mListener:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$1;)V
    .locals 0

    .line 88
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;-><init>(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;)V

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    .line 196
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->cancel(Z)Z

    return-void
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 88
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->doInBackground([Ljava/lang/Void;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Void;",
            ")TOutput;"
        }
    .end annotation

    .line 132
    :try_start_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    invoke-interface {p1, p0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/network/NetworkException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 134
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "doInBackground(): "

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method protected onCancelled(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TOutput;)V"
        }
    .end annotation

    .line 156
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    .line 157
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;

    if-eqz p1, :cond_0

    .line 160
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;->onExecutionCancelled(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V

    :cond_0
    return-void
.end method

.method public onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;",
            "Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;",
            ")V"
        }
    .end annotation

    .line 186
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->isCancelled()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    .line 187
    new-array p1, p1, [Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

    const/4 v0, 0x0

    aput-object p2, p1, v0

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->publishProgress([Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TOutput;)V"
        }
    .end annotation

    .line 169
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;

    if-eqz v0, :cond_0

    .line 172
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    invoke-interface {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;->onExecutionDone(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    .line 118
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;

    if-eqz v0, :cond_0

    .line 120
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    invoke-interface {v0, v1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;->onPreExecution(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;)V

    :cond_0
    return-void
.end method

.method protected varargs onProgressUpdate([Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .locals 3

    .line 145
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;

    if-eqz v0, :cond_0

    .line 147
    array-length v1, p1

    if-lez v1, :cond_0

    .line 148
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->mExecutor:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    const/4 v2, 0x0

    aget-object p1, p1, v2

    invoke-interface {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;->onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    .line 88
    check-cast p1, [Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->onProgressUpdate([Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V

    return-void
.end method
