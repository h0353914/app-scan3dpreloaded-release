.class abstract Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.super Ljava/lang/Object;
.source "AbstractRestExecutor.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.implements Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Input:",
        "Ljava/lang/Object;",
        "Output:",
        "Ljava/lang/Object;",
        "Token:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
        "TOutput;>;",
        "Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;"
    }
.end annotation


# static fields
.field private static final BACKOFF_TIME:I = 0x1f4

.field private static final DEFAULT_RETRIES:I = 0x5

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.network.AbstractRestExecutor"

.field private static sRandom:Ljava/util/Random;


# instance fields
.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

.field private mInput:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TInput;"
        }
    .end annotation
.end field

.field private mProgressListener:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener<",
            "TOutput;>;"
        }
    .end annotation
.end field

.field private mRequest:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

.field private mToken:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TToken;"
        }
    .end annotation
.end field

.field private mUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->sRandom:Ljava/util/Random;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 25
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private onExecute()Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-lez v1, :cond_1

    if-eqz v0, :cond_0

    .line 354
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->close()V

    .line 356
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->sRandom:Ljava/util/Random;

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    add-int/lit16 v0, v0, 0x1f4

    int-to-long v2, v0

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 358
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mRequest:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/Context;

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->execute(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    move-result-object v0

    add-int/lit8 v2, v1, 0x1

    .line 359
    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->retry(ILcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Z

    move-result v1

    if-nez v1, :cond_2

    return-object v0

    :cond_2
    move v1, v2

    goto :goto_0
.end method

.method private static retry(ILcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Z
    .locals 1

    const/4 v0, 0x5

    if-ge p0, v0, :cond_1

    if-eqz p1, :cond_0

    .line 372
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->isResponseReceived()Z

    move-result p0

    if-nez p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public final execute()Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TOutput;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation

    .line 297
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mUrl:Ljava/lang/String;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mToken:Ljava/lang/Object;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mInput:[Ljava/lang/Object;

    invoke-virtual {p0, v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->getNetworkRequest(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mRequest:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    .line 298
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mRequest:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->setProgressListener(Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$INetworkProgressListener;)V

    .line 301
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->onExecute()Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    .line 302
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    if-eqz v0, :cond_0

    .line 303
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 309
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->close(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 307
    :try_start_1
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/network/NetworkException;

    invoke-direct {v1, v0}, Lcom/sonymobile/scan3d/storageservice/network/NetworkException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 309
    :goto_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->close(Ljava/io/Closeable;)V

    .line 310
    throw v0
.end method

.method public final execute(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener<",
            "TOutput;>;)TOutput;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/network/NetworkException;
        }
    .end annotation

    .line 287
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mProgressListener:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;

    .line 288
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->execute()Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final executeAsync(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;)Lcom/sonymobile/scan3d/storageservice/Cancellable;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener<",
            "TOutput;>;)",
            "Lcom/sonymobile/scan3d/storageservice/Cancellable;"
        }
    .end annotation

    .line 318
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;-><init>(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorListener;Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$1;)V

    const/4 p1, 0x0

    .line 319
    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor$NetworkTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-object v0
.end method

.method protected final getContext()Landroid/content/Context;
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method protected getInput()[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[TInput;"
        }
    .end annotation

    .line 219
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mInput:[Ljava/lang/Object;

    return-object v0
.end method

.method public abstract getNetworkRequest(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "TToken;[TInput;)",
            "Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;",
            ")TOutput;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final getResponse()Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;
    .locals 1

    .line 278
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mHttpResponse:Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;

    return-object v0
.end method

.method public final varargs init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "TToken;[TInput;)",
            "Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor<",
            "TOutput;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/SafeVarargs;
    .end annotation

    .line 238
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mContext:Ljava/lang/ref/WeakReference;

    .line 239
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mUrl:Ljava/lang/String;

    .line 240
    iput-object p4, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mInput:[Ljava/lang/Object;

    .line 241
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mToken:Ljava/lang/Object;

    return-object p0
.end method

.method public onNetworkProgress(Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V
    .locals 0

    .line 332
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;->mProgressListener:Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;

    if-eqz p1, :cond_0

    .line 333
    invoke-interface {p1, p0, p2}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor$IRestExecutorProgressListener;->onExecutionProgress(Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;Lcom/sonymobile/scan3d/storageservice/network/TransferProgress;)V

    :cond_0
    return-void
.end method
