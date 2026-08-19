.class public Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;
.super Ljava/lang/Object;
.source "SendQueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;,
        Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;,
        Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;,
        Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;,
        Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;
    }
.end annotation


# static fields
.field private static log:Lorg/apache/commons/logging/Log;


# instance fields
.field private final changeMessageVisibilityLock:Ljava/lang/Object;

.field private final config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

.field private final deleteMessageLock:Ljava/lang/Object;

.field private final executor:Ljava/util/concurrent/Executor;

.field private final inflightChangeMessageVisibilityBatches:Ljava/util/concurrent/Semaphore;

.field private final inflightDeleteMessageBatches:Ljava/util/concurrent/Semaphore;

.field private final inflightSendMessageBatches:Ljava/util/concurrent/Semaphore;

.field private final openChangeMessageVisibilityBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;

.field private final openDeleteMessageBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;

.field private final openSendMessageBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;

.field private final qUrl:Ljava/lang/String;

.field private final sendMessageLock:Ljava/lang/Object;

.field private final sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    const-class v0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method constructor <init>(Lcom/amazonaws/services/sqs/AmazonSQS;Ljava/util/concurrent/Executor;Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;Ljava/lang/String;)V
    .locals 2

    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 87
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->sendMessageLock:Ljava/lang/Object;

    .line 92
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->deleteMessageLock:Ljava/lang/Object;

    .line 97
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->changeMessageVisibilityLock:Ljava/lang/Object;

    const/4 v0, 0x1

    .line 103
    new-array v1, v0, [Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;

    iput-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->openSendMessageBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;

    .line 109
    new-array v1, v0, [Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;

    iput-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->openDeleteMessageBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;

    .line 116
    new-array v1, v0, [Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;

    iput-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->openChangeMessageVisibilityBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;

    .line 136
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;

    .line 137
    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->executor:Ljava/util/concurrent/Executor;

    .line 138
    iput-object p3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 139
    iput-object p4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->qUrl:Ljava/lang/String;

    .line 140
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result p1

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    move p1, v0

    .line 144
    :goto_0
    new-instance p2, Ljava/util/concurrent/Semaphore;

    invoke-direct {p2, p1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightSendMessageBatches:Ljava/util/concurrent/Semaphore;

    .line 145
    new-instance p2, Ljava/util/concurrent/Semaphore;

    invoke-direct {p2, p1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightDeleteMessageBatches:Ljava/util/concurrent/Semaphore;

    .line 146
    new-instance p2, Ljava/util/concurrent/Semaphore;

    invoke-direct {p2, p1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightChangeMessageVisibilityBatches:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method static synthetic access$300(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    return-object p0
.end method

.method static synthetic access$400(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Ljava/lang/String;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->qUrl:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$500(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;
    .locals 0

    .line 60
    iget-object p0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;

    return-object p0
.end method

.method private newOutboundBatchTask(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<R:",
            "Lcom/amazonaws/AmazonWebServiceRequest;",
            "Result:",
            "Ljava/lang/Object;",
            ">(TR;)",
            "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask<",
            "TR;TResult;>;"
        }
    .end annotation

    .line 198
    instance-of v0, p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 199
    new-instance p1, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;

    invoke-direct {p1, p0, v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;)V

    return-object p1

    .line 200
    :cond_0
    instance-of v0, p1, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    if-eqz v0, :cond_1

    .line 201
    new-instance p1, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;

    invoke-direct {p1, p0, v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;)V

    return-object p1

    .line 202
    :cond_1
    instance-of v0, p1, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    if-eqz v0, :cond_2

    .line 203
    new-instance p1, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;

    invoke-direct {p1, p0, v1}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;)V

    return-object p1

    .line 206
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported request type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 184
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->changeMessageVisibilityLock:Ljava/lang/Object;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->openChangeMessageVisibilityBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$ChangeMessageVisibilityBatchTask;

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightChangeMessageVisibilityBatches:Ljava/util/concurrent/Semaphore;

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->submitOutboundRequest(Ljava/lang/Object;[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;Lcom/amazonaws/AmazonWebServiceRequest;Ljava/util/concurrent/Semaphore;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .line 171
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->deleteMessageLock:Ljava/lang/Object;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->openDeleteMessageBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$DeleteMessageBatchTask;

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightDeleteMessageBatches:Ljava/util/concurrent/Semaphore;

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    invoke-virtual/range {v0 .. v5}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->submitOutboundRequest(Ljava/lang/Object;[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;Lcom/amazonaws/AmazonWebServiceRequest;Ljava/util/concurrent/Semaphore;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    return-object p1
.end method

.method public flush()V
    .locals 3

    .line 220
    :try_start_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->sendMessageLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 221
    :try_start_1
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightSendMessageBatches:Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 222
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->acquire(I)V

    .line 223
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightSendMessageBatches:Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 224
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->release(I)V

    .line 225
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 226
    :try_start_2
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->deleteMessageLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 227
    :try_start_3
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightDeleteMessageBatches:Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 228
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->acquire(I)V

    .line 229
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightDeleteMessageBatches:Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 230
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->release(I)V

    .line 231
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 232
    :try_start_4
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->changeMessageVisibilityLock:Ljava/lang/Object;

    monitor-enter v0
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0

    .line 233
    :try_start_5
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightChangeMessageVisibilityBatches:Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 234
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->acquire(I)V

    .line 235
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightChangeMessageVisibilityBatches:Ljava/util/concurrent/Semaphore;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 236
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightOutboundBatches()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/Semaphore;->release(I)V

    .line 237
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    throw v1
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_0

    :catchall_1
    move-exception v1

    .line 231
    :try_start_7
    monitor-exit v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    throw v1
    :try_end_8
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_0

    :catchall_2
    move-exception v1

    .line 225
    :try_start_9
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :try_start_a
    throw v1
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_a .. :try_end_a} :catch_0

    .line 239
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :goto_0
    return-void
.end method

.method public getConfig()Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    return-object v0
.end method

.method public sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/SendMessageResult;",
            ">;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/SendMessageResult;",
            ">;"
        }
    .end annotation

    .line 160
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->sendMessageLock:Ljava/lang/Object;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->openSendMessageBatchTask:[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$SendMessageBatchTask;

    iget-object v4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->inflightSendMessageBatches:Ljava/util/concurrent/Semaphore;

    move-object v0, p0

    move-object v3, p1

    move-object v5, p2

    .line 161
    invoke-virtual/range {v0 .. v5}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->submitOutboundRequest(Ljava/lang/Object;[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;Lcom/amazonaws/AmazonWebServiceRequest;Ljava/util/concurrent/Semaphore;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object p1

    return-object p1
.end method

.method submitOutboundRequest(Ljava/lang/Object;[Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;Lcom/amazonaws/AmazonWebServiceRequest;Ljava/util/concurrent/Semaphore;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<OBT:",
            "Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask<",
            "TR;TResult;>;R:",
            "Lcom/amazonaws/AmazonWebServiceRequest;",
            "Result:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "[TOBT;TR;",
            "Ljava/util/concurrent/Semaphore;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "TR;TResult;>;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "TR;TResult;>;"
        }
    .end annotation

    .line 274
    :try_start_0
    monitor-enter p1
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x0

    .line 275
    :try_start_1
    aget-object v1, p2, v0

    if-eqz v1, :cond_0

    aget-object v1, p2, v0

    .line 276
    invoke-virtual {v1, p3, p5}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->addRequest(Lcom/amazonaws/AmazonWebServiceRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object v1

    if-nez v1, :cond_2

    .line 277
    :cond_0
    invoke-direct {p0, p3}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->newOutboundBatchTask(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;

    move-result-object v1

    .line 278
    invoke-virtual {p4}, Ljava/util/concurrent/Semaphore;->acquire()V

    .line 279
    aput-object v1, p2, v0

    .line 282
    aget-object v1, p2, v0

    new-instance v2, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;

    invoke-direct {v2, p0, p4}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$1;-><init>(Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;Ljava/util/concurrent/Semaphore;)V

    iput-object v2, v1, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->onCompleted:Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$Listener;

    .line 289
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 290
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Queue "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->qUrl:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " created new batch for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 292
    invoke-virtual {p4}, Ljava/util/concurrent/Semaphore;->availablePermits()I

    move-result p4

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p4, " free slots remain"

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    .line 290
    invoke-interface {v1, p4}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 296
    :cond_1
    aget-object p4, p2, v0

    invoke-virtual {p4, p3, p5}, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer$OutboundBatchTask;->addRequest(Lcom/amazonaws/AmazonWebServiceRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    move-result-object v1

    .line 297
    iget-object p4, p0, Lcom/amazonaws/services/sqs/buffered/SendQueueBuffer;->executor:Ljava/util/concurrent/Executor;

    aget-object p2, p2, v0

    invoke-interface {p4, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    if-eqz v1, :cond_3

    .line 306
    :cond_2
    monitor-exit p1

    return-object v1

    .line 302
    :cond_3
    new-instance p2, Lcom/amazonaws/AmazonClientException;

    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    const-string p5, "Failed to schedule request "

    invoke-virtual {p4, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, " for execution"

    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p2

    :catchall_0
    move-exception p2

    .line 306
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    :catch_0
    move-exception p1

    .line 309
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Thread;->interrupt()V

    .line 310
    new-instance p2, Lcom/amazonaws/AmazonClientException;

    const-string p3, "Interrupted while waiting for lock."

    invoke-direct {p2, p3}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    .line 312
    invoke-virtual {p2, p1}, Lcom/amazonaws/AmazonClientException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 313
    throw p2
.end method
