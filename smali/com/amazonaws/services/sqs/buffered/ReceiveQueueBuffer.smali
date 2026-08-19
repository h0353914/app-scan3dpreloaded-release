.class public Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;
.super Ljava/lang/Object;
.source "ReceiveQueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;,
        Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;
    }
.end annotation


# static fields
.field private static log:Lorg/apache/commons/logging/Log;


# instance fields
.field private bufferCounter:J

.field private final config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

.field private final executor:Ljava/util/concurrent/Executor;

.field private finishedTasks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;",
            ">;"
        }
    .end annotation
.end field

.field private final futures:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList<",
            "Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;",
            ">;"
        }
    .end annotation
.end field

.field private volatile inflightReceiveMessageBatches:I

.field private final qUrl:Ljava/lang/String;

.field volatile shutDown:Z

.field private final sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;

.field private final taskSpawnSyncPoint:Ljava/lang/Object;

.field private volatile visibilityTimeoutNanos:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 54
    const-class v0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method constructor <init>(Lcom/amazonaws/services/sqs/AmazonSQS;Ljava/util/concurrent/Executor;Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;Ljava/lang/String;)V
    .locals 2

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    .line 64
    iput-wide v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->bufferCounter:J

    const-wide/16 v0, -0x1

    .line 72
    iput-wide v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->visibilityTimeoutNanos:J

    .line 84
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->taskSpawnSyncPoint:Ljava/lang/Object;

    const/4 v0, 0x0

    .line 87
    iput-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->shutDown:Z

    .line 90
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->futures:Ljava/util/LinkedList;

    .line 93
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    .line 97
    iput-object p3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    .line 98
    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->executor:Ljava/util/concurrent/Executor;

    .line 99
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;

    .line 100
    iput-object p4, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->qUrl:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Ljava/lang/String;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->qUrl:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/AmazonSQS;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;

    return-object p0
.end method

.method static synthetic access$200()Lorg/apache/commons/logging/Log;
    .locals 1

    .line 52
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    return-object v0
.end method

.method static synthetic access$300(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)J
    .locals 2

    .line 52
    iget-wide v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->visibilityTimeoutNanos:J

    return-wide v0
.end method

.method static synthetic access$400(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;
    .locals 0

    .line 52
    iget-object p0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    return-object p0
.end method

.method private fillFuture(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;)V
    .locals 8

    .line 192
    new-instance v0, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;-><init>()V

    .line 193
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    .line 194
    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;->setMessages(Ljava/util/Collection;)V

    .line 197
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    .line 198
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;

    .line 200
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->getException()Ljava/lang/Exception;

    move-result-object v3

    const/4 v4, 0x0

    move v5, v4

    .line 203
    :goto_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;->getRequestedSize()I

    move-result v6

    const/4 v7, 0x1

    if-ge v5, v6, :cond_1

    .line 205
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->removeMessage()Lcom/amazonaws/services/sqs/model/Message;

    move-result-object v6

    if-eqz v6, :cond_0

    .line 209
    invoke-virtual {v1, v6}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    move v5, v7

    goto :goto_1

    :cond_1
    move v5, v4

    :goto_1
    if-nez v5, :cond_2

    .line 219
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_2

    if-eqz v3, :cond_3

    :cond_2
    move v4, v7

    :cond_3
    if-eqz v4, :cond_4

    .line 221
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 223
    :cond_4
    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;->setMessages(Ljava/util/Collection;)V

    goto :goto_2

    :cond_5
    const/4 v3, 0x0

    :goto_2
    if-eqz v3, :cond_6

    .line 231
    invoke-virtual {p1, v3}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;->setFailure(Ljava/lang/Exception;)V

    goto :goto_3

    .line 233
    :cond_6
    invoke-virtual {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;->setSuccess(Ljava/lang/Object;)V

    .line 237
    :goto_3
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_8

    .line 238
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->getFirst()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;

    .line 239
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->getException()Ljava/lang/Exception;

    move-result-object p1

    if-eqz p1, :cond_7

    goto :goto_4

    .line 245
    :cond_7
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {p1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    goto :goto_3

    :cond_8
    :goto_4
    return-void
.end method

.method private issueFuture(ILcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;)",
            "Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;"
        }
    .end annotation

    .line 158
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->futures:Ljava/util/LinkedList;

    monitor-enter v0

    .line 159
    :try_start_0
    new-instance v1, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;

    invoke-direct {v1, p0, p2, p1}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;-><init>(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;I)V

    .line 160
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->futures:Ljava/util/LinkedList;

    invoke-virtual {p1, v1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 161
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    .line 162
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private satisfyFuturesFromBuffer()V
    .locals 3

    .line 171
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->futures:Ljava/util/LinkedList;

    monitor-enter v0

    .line 172
    :try_start_0
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 176
    :goto_0
    :try_start_1
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->futures:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 177
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->futures:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;

    .line 178
    invoke-direct {p0, v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->fillFuture(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;)V

    goto :goto_0

    .line 180
    :cond_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_0
    move-exception v2

    .line 180
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v2

    :catchall_1
    move-exception v1

    .line 181
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v1
.end method

.method private spawnMoreReceiveTasks()V
    .locals 8

    .line 256
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->shutDown:Z

    if-eqz v0, :cond_0

    return-void

    .line 259
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxDoneReceiveBatches()I

    move-result v0

    const/4 v1, 0x1

    if-ge v0, v1, :cond_1

    move v0, v1

    .line 262
    :cond_1
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    monitor-enter v2

    .line 263
    :try_start_0
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lt v3, v0, :cond_2

    .line 264
    monitor-exit v2

    return-void

    .line 270
    :cond_2
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lez v3, :cond_3

    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    .line 271
    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    iget v4, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    add-int/2addr v3, v4

    if-lt v3, v0, :cond_3

    .line 272
    monitor-exit v2

    return-void

    .line 273
    :cond_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 275
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->taskSpawnSyncPoint:Ljava/lang/Object;

    monitor-enter v0

    .line 276
    :try_start_1
    iget-wide v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->visibilityTimeoutNanos:J

    const-wide/16 v4, -0x1

    cmp-long v2, v2, v4

    if-nez v2, :cond_4

    .line 277
    new-instance v2, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;

    invoke-direct {v2}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;-><init>()V

    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->qUrl:Ljava/lang/String;

    .line 278
    invoke-virtual {v2, v3}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;->withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;

    move-result-object v2

    const-string v3, "VisibilityTimeout"

    filled-new-array {v3}, [Ljava/lang/String;

    move-result-object v3

    .line 279
    invoke-virtual {v2, v3}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;->withAttributeNames([Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;

    move-result-object v2

    .line 280
    sget-object v3, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 281
    iget-object v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->sqsClient:Lcom/amazonaws/services/sqs/AmazonSQS;

    .line 282
    invoke-interface {v3, v2}, Lcom/amazonaws/services/sqs/AmazonSQS;->getQueueAttributes(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;

    move-result-object v2

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;->getAttributes()Ljava/util/Map;

    move-result-object v2

    const-string v3, "VisibilityTimeout"

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 281
    invoke-static {v2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    .line 283
    sget-object v4, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v2, v3, v5}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->visibilityTimeoutNanos:J

    .line 287
    :cond_4
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->config:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->getMaxInflightReceiveBatches()I

    move-result v2

    if-lez v2, :cond_5

    goto :goto_0

    :cond_5
    move v2, v1

    .line 291
    :goto_0
    iget v3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    sub-int v3, v2, v3

    if-lez v3, :cond_7

    .line 293
    new-instance v3, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;

    invoke-direct {v3, p0, p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;-><init>(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;)V

    .line 294
    iget v4, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    add-int/2addr v4, v1

    iput v4, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    .line 295
    iget-wide v4, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->bufferCounter:J

    const-wide/16 v6, 0x1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->bufferCounter:J

    .line 296
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 297
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Spawned receive batch #"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v5, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->bufferCounter:J

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, " of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " inflight) for queue "

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->qUrl:Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->trace(Ljava/lang/Object;)V

    .line 301
    :cond_6
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->executor:Ljava/util/concurrent/Executor;

    invoke-interface {v1, v3}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 303
    :cond_7
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_1
    move-exception v0

    .line 273
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method


# virtual methods
.method public clear()V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    .line 333
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    monitor-enter v1

    .line 334
    :try_start_0
    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;

    .line 335
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 338
    invoke-virtual {v2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;->clear()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :catchall_0
    move-exception v0

    .line 335
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :cond_1
    return-void
.end method

.method public receiveMessageAsync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;)",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;"
        }
    .end annotation

    .line 129
    iget-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->shutDown:Z

    if-nez v0, :cond_1

    const/16 v0, 0xa

    .line 135
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getMaxNumberOfMessages()Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 138
    :cond_0
    invoke-direct {p0, v0, p2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->issueFuture(ILcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;

    move-result-object p1

    .line 142
    invoke-direct {p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->satisfyFuturesFromBuffer()V

    .line 145
    invoke-direct {p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->spawnMoreReceiveTasks()V

    return-object p1

    .line 130
    :cond_1
    new-instance p1, Lcom/amazonaws/AmazonClientException;

    const-string p2, "The client has been shut down."

    invoke-direct {p1, p2}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method reportBatchFinished(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageBatchTask;)V
    .locals 3

    .line 312
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    monitor-enter v0

    .line 313
    :try_start_0
    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 314
    sget-object p1, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {p1}, Lorg/apache/commons/logging/Log;->isTraceEnabled()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 315
    sget-object p1, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Queue "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->qUrl:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " now has "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->finishedTasks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " receive results cached "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 318
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 319
    iget-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->taskSpawnSyncPoint:Ljava/lang/Object;

    monitor-enter p1

    .line 320
    :try_start_1
    iget v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    .line 321
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 322
    invoke-direct {p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->satisfyFuturesFromBuffer()V

    .line 323
    invoke-direct {p0}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->spawnMoreReceiveTasks()V

    return-void

    :catchall_0
    move-exception v0

    .line 321
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_1
    move-exception p1

    .line 318
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public shutdown()V
    .locals 2

    const/4 v0, 0x1

    .line 109
    iput-boolean v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->shutDown:Z

    .line 111
    :goto_0
    :try_start_0
    iget v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;->inflightReceiveMessageBatches:I

    if-lez v0, :cond_0

    const-wide/16 v0, 0x64

    .line 112
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 114
    :catch_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    :cond_0
    return-void
.end method
