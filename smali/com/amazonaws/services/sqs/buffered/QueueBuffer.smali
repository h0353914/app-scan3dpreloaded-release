.class Lcom/amazonaws/services/sqs/buffered/QueueBuffer;
.super Ljava/lang/Object;
.source "QueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazonaws/services/sqs/buffered/QueueBuffer$DaemonThreadFactory;
    }
.end annotation


# static fields
.field static executor:Ljava/util/concurrent/ExecutorService;


# instance fields
.field config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

.field private final realSqs:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

.field private final receiveBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

.field private final sendBuffer:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 66
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer$DaemonThreadFactory;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer$DaemonThreadFactory;-><init>(Lcom/amazonaws/services/sqs/buffered/QueueBuffer$1;)V

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newCachedThreadPool(Ljava/util/concurrent/ThreadFactory;)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->executor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method constructor <init>(Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;Ljava/lang/String;Lcom/amazonaws/services/sqs/AmazonSQSAsync;)V
    .locals 2

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p3, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->realSqs:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    .line 70
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 71
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    sget-object v1, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-direct {v0, p3, v1, p1, p2}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;-><init>(Lcom/amazonaws/services/sqs/AmazonSQS;Ljava/util/concurrent/Executor;Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendBuffer:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 72
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    sget-object v1, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->executor:Ljava/util/concurrent/ExecutorService;

    invoke-direct {v0, p3, v1, p1, p2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;-><init>(Lcom/amazonaws/services/sqs/AmazonSQS;Ljava/util/concurrent/Executor;Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    return-void
.end method

.method private waitForFuture(Ljava/util/concurrent/Future;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<ResultType:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Future<",
            "TResultType;>;)TResultType;"
        }
    .end annotation

    .line 226
    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 238
    invoke-virtual {p1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 240
    instance-of v1, v0, Lcom/amazonaws/AmazonClientException;

    if-eqz v1, :cond_0

    .line 241
    check-cast v0, Lcom/amazonaws/AmazonClientException;

    throw v0

    .line 244
    :cond_0
    new-instance v0, Lcom/amazonaws/AmazonClientException;

    const-string v1, "Caught an exception while waiting for request to complete..."

    invoke-direct {v0, v1}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    .line 246
    invoke-virtual {v0, p1}, Lcom/amazonaws/AmazonClientException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 247
    throw v0

    :catch_1
    move-exception p1

    .line 228
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 229
    new-instance v0, Lcom/amazonaws/AmazonClientException;

    const-string v1, "Thread interrupted while waiting for execution result"

    invoke-direct {v0, v1}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    .line 231
    invoke-virtual {v0, p1}, Lcom/amazonaws/AmazonClientException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 232
    throw v0
.end method


# virtual methods
.method public changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 146
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;

    invoke-direct {v0, p2, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;-><init>(Lcom/amazonaws/handlers/AsyncHandler;Lcom/amazonaws/AmazonWebServiceRequest;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 150
    :goto_0
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendBuffer:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    .line 151
    invoke-virtual {p2, p1, v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    .line 152
    invoke-virtual {p1, p0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setBuffer(Lcom/amazonaws/services/sqs/buffered/QueueBuffer;)V

    return-object p1
.end method

.method public changeMessageVisibilitySync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V
    .locals 2

    .line 161
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendBuffer:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    .line 162
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->waitForFuture(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    return-void
.end method

.method public deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 115
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;

    invoke-direct {v0, p2, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;-><init>(Lcom/amazonaws/handlers/AsyncHandler;Lcom/amazonaws/AmazonWebServiceRequest;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 118
    :goto_0
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendBuffer:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-virtual {p2, p1, v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    .line 120
    invoke-virtual {p1, p0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setBuffer(Lcom/amazonaws/services/sqs/buffered/QueueBuffer;)V

    return-object p1
.end method

.method public deleteMessageSync(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V
    .locals 1

    const/4 v0, 0x0

    .line 131
    invoke-virtual {p0, p1, v0}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 132
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->waitForFuture(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    return-void
.end method

.method public receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;"
        }
    .end annotation

    .line 176
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getAttributeNames()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v0, v1

    goto :goto_1

    :cond_1
    :goto_0
    move v0, v2

    .line 177
    :goto_1
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 178
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMessageAttributeNames()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    move v3, v1

    goto :goto_3

    :cond_3
    :goto_2
    move v3, v2

    .line 179
    :goto_3
    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    invoke-virtual {v4}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightReceiveBatches()I

    move-result v4

    if-lez v4, :cond_4

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 180
    invoke-virtual {v4}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxDoneReceiveBatches()I

    move-result v4

    if-lez v4, :cond_4

    move v1, v2

    :cond_4
    if-eqz v3, :cond_6

    if-eqz v0, :cond_6

    if-eqz v1, :cond_6

    .line 182
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getVisibilityTimeout()Ljava/lang/Integer;

    move-result-object v0

    if-nez v0, :cond_6

    const/4 v0, 0x0

    if-eqz p2, :cond_5

    .line 185
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;

    invoke-direct {v0, p2, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;-><init>(Lcom/amazonaws/handlers/AsyncHandler;Lcom/amazonaws/AmazonWebServiceRequest;)V

    .line 189
    :cond_5
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    .line 190
    invoke-virtual {p2, p1, v0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->receiveMessageAsync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    .line 191
    invoke-virtual {p1, p0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setBuffer(Lcom/amazonaws/services/sqs/buffered/QueueBuffer;)V

    return-object p1

    .line 194
    :cond_6
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->realSqs:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {p2, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->receiveMessageAsync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public receiveMessageSync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;
    .locals 1

    const/4 v0, 0x0

    .line 204
    invoke-virtual {p0, p1, v0}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 205
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->waitForFuture(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    return-object p1
.end method

.method public sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/SendMessageResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/SendMessageResult;",
            ">;"
        }
    .end annotation

    if-eqz p2, :cond_0

    .line 85
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;

    invoke-direct {v0, p2, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;-><init>(Lcom/amazonaws/handlers/AsyncHandler;Lcom/amazonaws/AmazonWebServiceRequest;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 88
    :goto_0
    iget-object p2, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendBuffer:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-virtual {p2, p1, v0}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    .line 90
    invoke-virtual {p1, p0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setBuffer(Lcom/amazonaws/services/sqs/buffered/QueueBuffer;)V

    return-object p1
.end method

.method public sendMessageSync(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 1

    const/4 v0, 0x0

    .line 100
    invoke-virtual {p0, p1, v0}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    .line 101
    invoke-direct {p0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->waitForFuture(Ljava/util/concurrent/Future;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageResult;

    return-object p1
.end method

.method public shutdown()V
    .locals 1

    .line 215
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveBuffer:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->shutdown()V

    return-void
.end method
