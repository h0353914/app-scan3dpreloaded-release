.class public Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;
.super Ljava/lang/Object;
.source "AmazonSQSBufferedAsyncClient.java"

# interfaces
.implements Lcom/amazonaws/services/sqs/AmazonSQSAsync;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;
    }
.end annotation


# static fields
.field public static final USER_AGENT:Ljava/lang/String;


# instance fields
.field private final bufferConfigExemplar:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

.field private final buffers:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;

.field private final realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-class v1, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    invoke-static {}, Lcom/amazonaws/util/VersionInfoUtils;->getVersion()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/services/sqs/AmazonSQSAsync;)V
    .locals 1

    .line 96
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;-><init>(Lcom/amazonaws/services/sqs/AmazonSQSAsync;Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/services/sqs/AmazonSQSAsync;Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;)V
    .locals 4

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;

    const/16 v1, 0x10

    const/high16 v2, 0x3f400000    # 0.75f

    const/4 v3, 0x1

    invoke-direct {v0, p0, v1, v2, v3}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;-><init>(Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;IFZ)V

    iput-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->buffers:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;

    .line 102
    invoke-virtual {p2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;->validate()V

    .line 103
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    .line 104
    iput-object p2, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->bufferConfigExemplar:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    return-void
.end method

.method private declared-synchronized getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;
    .locals 3

    monitor-enter p0

    .line 408
    :try_start_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->buffers:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;

    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    if-nez v0, :cond_0

    .line 410
    new-instance v0, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->bufferConfigExemplar:Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;

    invoke-direct {v0, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;-><init>(Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;)V

    .line 411
    new-instance v1, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    iget-object v2, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-direct {v1, v0, p1, v2}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;-><init>(Lcom/amazonaws/services/sqs/buffered/QueueBufferConfig;Ljava/lang/String;Lcom/amazonaws/services/sqs/AmazonSQSAsync;)V

    .line 412
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->buffers:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;

    invoke-virtual {v0, p1, v1}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, v1

    .line 414
    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public addPermission(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 373
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 374
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->addPermission(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)V

    return-void
.end method

.method public addPermission(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 680
    new-instance v0, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->addPermission(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)V

    return-void
.end method

.method public addPermissionAsync(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/AddPermissionRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 366
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 367
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->addPermissionAsync(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public addPermissionAsync(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/AddPermissionRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/AddPermissionRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 570
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->addPermissionAsync(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 138
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 139
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 140
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->changeMessageVisibilitySync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V

    return-void
.end method

.method public changeMessageVisibility(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 616
    new-instance v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    invoke-direct {v0, p1, p2, p3}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V

    return-void
.end method

.method public changeMessageVisibilityAsync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 204
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 205
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    const/4 v1, 0x0

    .line 206
    invoke-virtual {v0, p1, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public changeMessageVisibilityAsync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 437
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 438
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 439
    invoke-virtual {v0, p1, p2}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 130
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 131
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public changeMessageVisibilityBatch(Ljava/lang/String;Ljava/util/List;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequestEntry;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 608
    new-instance v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public changeMessageVisibilityBatchAsync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 196
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 197
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->changeMessageVisibilityBatchAsync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public changeMessageVisibilityBatchAsync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 487
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->changeMessageVisibilityBatchAsync(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public createQueue(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 358
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 359
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->createQueue(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;

    move-result-object p1

    return-object p1
.end method

.method public createQueue(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 673
    new-instance v0, Lcom/amazonaws/services/sqs/model/CreateQueueRequest;

    invoke-direct {v0, p1}, Lcom/amazonaws/services/sqs/model/CreateQueueRequest;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->createQueue(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;

    move-result-object p1

    return-object p1
.end method

.method public createQueueAsync(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/CreateQueueRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/CreateQueueResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 351
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 352
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->createQueueAsync(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public createQueueAsync(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/CreateQueueRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/CreateQueueRequest;",
            "Lcom/amazonaws/services/sqs/model/CreateQueueResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/CreateQueueResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 562
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->createQueueAsync(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 179
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 180
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 181
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->deleteMessageSync(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V

    return-void
.end method

.method public deleteMessage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 686
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V

    return-void
.end method

.method public deleteMessageAsync(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 394
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 395
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    const/4 v1, 0x0

    .line 396
    invoke-virtual {v0, p1, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessageAsync(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 468
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 469
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 470
    invoke-virtual {v0, p1, p2}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessageBatch(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 172
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 173
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->deleteMessageBatch(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessageBatch(Ljava/lang/String;Ljava/util/List;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequestEntry;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 667
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->deleteMessageBatch(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessageBatchAsync(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 241
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 242
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->deleteMessageBatchAsync(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessageBatchAsync(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 553
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->deleteMessageBatchAsync(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public deleteQueue(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 328
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 329
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->deleteQueue(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)V

    return-void
.end method

.method public deleteQueue(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 642
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;

    invoke-direct {v0, p1}, Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->deleteQueue(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)V

    return-void
.end method

.method public deleteQueueAsync(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 321
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 322
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->deleteQueueAsync(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public deleteQueueAsync(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 537
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->deleteQueueAsync(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public getCachedResponseMetadata(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/ResponseMetadata;
    .locals 1

    .line 386
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 387
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getCachedResponseMetadata(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/ResponseMetadata;

    move-result-object p1

    return-object p1
.end method

.method public getQueueAttributes(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 300
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 301
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getQueueAttributes(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;

    move-result-object p1

    return-object p1
.end method

.method public getQueueAttributes(Ljava/lang/String;Ljava/util/List;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;"
        }
    .end annotation

    .line 691
    new-instance v0, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQueueAttributes(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;

    move-result-object p1

    return-object p1
.end method

.method public getQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 292
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 293
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public getQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 513
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public getQueueUrl(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 277
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 278
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getQueueUrl(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;

    move-result-object p1

    return-object p1
.end method

.method public getQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 623
    new-instance v0, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;

    invoke-direct {v0, p1}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQueueUrl(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;

    move-result-object p1

    return-object p1
.end method

.method public getQueueUrlAsync(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 262
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 263
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getQueueUrlAsync(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public getQueueUrlAsync(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 496
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->getQueueUrlAsync(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public listDeadLetterSourceQueues(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 577
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 578
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listDeadLetterSourceQueues(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;

    move-result-object p1

    return-object p1
.end method

.method public listDeadLetterSourceQueuesAsync(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 585
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 586
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listDeadLetterSourceQueuesAsync(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public listDeadLetterSourceQueuesAsync(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;",
            "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 594
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listDeadLetterSourceQueuesAsync(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public listQueues()Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 380
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listQueues()Lcom/amazonaws/services/sqs/model/ListQueuesResult;

    move-result-object v0

    return-object v0
.end method

.method public listQueues(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 343
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 344
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listQueues(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;

    move-result-object p1

    return-object p1
.end method

.method public listQueues(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 660
    new-instance v0, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;

    invoke-direct {v0, p1}, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->listQueues(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;

    move-result-object p1

    return-object p1
.end method

.method public listQueuesAsync(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ListQueuesRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ListQueuesResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 336
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 337
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listQueuesAsync(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public listQueuesAsync(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ListQueuesRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/ListQueuesRequest;",
            "Lcom/amazonaws/services/sqs/model/ListQueuesResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ListQueuesResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 545
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->listQueuesAsync(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public purgeQueue(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 314
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 315
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->purgeQueue(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;)V

    return-void
.end method

.method public purgeQueueAsync(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 307
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 308
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->purgeQueueAsync(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public purgeQueueAsync(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 530
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->purgeQueueAsync(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 163
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 164
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 165
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveMessageSync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    move-result-object p1

    return-object p1
.end method

.method public receiveMessage(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 654
    new-instance v0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    invoke-direct {v0, p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    move-result-object p1

    return-object p1
.end method

.method public receiveMessageAsync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 232
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 233
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    const/4 v1, 0x0

    .line 234
    invoke-virtual {v0, p1, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public receiveMessageAsync(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 458
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 459
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 460
    invoke-virtual {v0, p1, p2}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public removePermission(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 284
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 285
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->removePermission(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)V

    return-void
.end method

.method public removePermission(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 629
    new-instance v0, Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->removePermission(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)V

    return-void
.end method

.method public removePermissionAsync(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 270
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 271
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->removePermissionAsync(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public removePermissionAsync(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 504
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->removePermissionAsync(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 154
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 155
    sget-object v1, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v1}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 156
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendMessageSync(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;

    move-result-object p1

    return-object p1
.end method

.method public sendMessage(Ljava/lang/String;Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 648
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageAsync(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Ljava/util/concurrent/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SendMessageRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/SendMessageResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 222
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 223
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    const/4 v1, 0x0

    .line 224
    invoke-virtual {v0, p1, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageAsync(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 447
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 448
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getQueueUrl()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->getQBuffer(Ljava/lang/String;)Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    move-result-object v0

    .line 449
    invoke-virtual {v0, p1, p2}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageBatch(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 147
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 148
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->sendMessageBatch(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageBatch(Ljava/lang/String;Ljava/util/List;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;",
            ">;)",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 636
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->sendMessageBatch(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageBatchAsync(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 214
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 215
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->sendMessageBatchAsync(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageBatchAsync(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 522
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->sendMessageBatchAsync(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public setEndpoint(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 247
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->setEndpoint(Ljava/lang/String;)V

    return-void
.end method

.method public setQueueAttributes(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 122
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 123
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->setQueueAttributes(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)V

    return-void
.end method

.method public setQueueAttributes(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 601
    new-instance v0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;

    invoke-direct {v0, p1, p2}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->setQueueAttributes(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)V

    return-void
.end method

.method public setQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;",
            ")",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 254
    sget-object v0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->USER_AGENT:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/amazonaws/services/sqs/buffered/ResultConverter;->appendUserAgent(Lcom/amazonaws/AmazonWebServiceRequest;Ljava/lang/String;)Lcom/amazonaws/AmazonWebServiceRequest;

    .line 255
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->setQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public setQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;",
            "Lcom/amazonaws/handlers/AsyncHandler<",
            "Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;",
            "Ljava/lang/Void;",
            ">;)",
            "Ljava/util/concurrent/Future<",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 478
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->setQueueAttributesAsync(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;Lcom/amazonaws/handlers/AsyncHandler;)Ljava/util/concurrent/Future;

    move-result-object p1

    return-object p1
.end method

.method public setRegion(Lcom/amazonaws/regions/Region;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->setRegion(Lcom/amazonaws/regions/Region;)V

    return-void
.end method

.method public shutdown()V
    .locals 2

    .line 186
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->buffers:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;

    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;

    .line 187
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/buffered/QueueBuffer;->shutdown()V

    goto :goto_0

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;->realSQS:Lcom/amazonaws/services/sqs/AmazonSQSAsync;

    invoke-interface {v0}, Lcom/amazonaws/services/sqs/AmazonSQSAsync;->shutdown()V

    return-void
.end method
