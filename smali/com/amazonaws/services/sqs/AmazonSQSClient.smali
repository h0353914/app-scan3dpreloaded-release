.class public Lcom/amazonaws/services/sqs/AmazonSQSClient;
.super Lcom/amazonaws/AmazonWebServiceClient;
.source "AmazonSQSClient.java"

# interfaces
.implements Lcom/amazonaws/services/sqs/AmazonSQS;


# instance fields
.field private awsCredentialsProvider:Lcom/amazonaws/auth/AWSCredentialsProvider;

.field protected final exceptionUnmarshallers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/amazonaws/transform/Unmarshaller<",
            "Lcom/amazonaws/AmazonServiceException;",
            "Lorg/w3c/dom/Node;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 162
    new-instance v0, Lcom/amazonaws/auth/DefaultAWSCredentialsProviderChain;

    invoke-direct {v0}, Lcom/amazonaws/auth/DefaultAWSCredentialsProviderChain;-><init>()V

    new-instance v1, Lcom/amazonaws/ClientConfiguration;

    invoke-direct {v1}, Lcom/amazonaws/ClientConfiguration;-><init>()V

    invoke-direct {p0, v0, v1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/ClientConfiguration;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 186
    new-instance v0, Lcom/amazonaws/auth/DefaultAWSCredentialsProviderChain;

    invoke-direct {v0}, Lcom/amazonaws/auth/DefaultAWSCredentialsProviderChain;-><init>()V

    invoke-direct {p0, v0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/auth/AWSCredentials;)V
    .locals 1

    .line 211
    new-instance v0, Lcom/amazonaws/ClientConfiguration;

    invoke-direct {v0}, Lcom/amazonaws/ClientConfiguration;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentials;Lcom/amazonaws/ClientConfiguration;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/auth/AWSCredentials;Lcom/amazonaws/ClientConfiguration;)V
    .locals 1

    .line 239
    new-instance v0, Lcom/amazonaws/internal/StaticCredentialsProvider;

    invoke-direct {v0, p1}, Lcom/amazonaws/internal/StaticCredentialsProvider;-><init>(Lcom/amazonaws/auth/AWSCredentials;)V

    invoke-direct {p0, v0, p2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/auth/AWSCredentialsProvider;)V
    .locals 1

    .line 265
    new-instance v0, Lcom/amazonaws/ClientConfiguration;

    invoke-direct {v0}, Lcom/amazonaws/ClientConfiguration;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V
    .locals 1

    .line 296
    new-instance v0, Lcom/amazonaws/http/UrlHttpClient;

    invoke-direct {v0, p2}, Lcom/amazonaws/http/UrlHttpClient;-><init>(Lcom/amazonaws/ClientConfiguration;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;Lcom/amazonaws/http/HttpClient;)V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;Lcom/amazonaws/http/HttpClient;)V
    .locals 0

    .line 344
    invoke-static {p2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->adjustClientConfiguration(Lcom/amazonaws/ClientConfiguration;)Lcom/amazonaws/ClientConfiguration;

    move-result-object p2

    invoke-direct {p0, p2, p3}, Lcom/amazonaws/AmazonWebServiceClient;-><init>(Lcom/amazonaws/ClientConfiguration;Lcom/amazonaws/http/HttpClient;)V

    .line 142
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    .line 346
    iput-object p1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->awsCredentialsProvider:Lcom/amazonaws/auth/AWSCredentialsProvider;

    .line 348
    invoke-direct {p0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->init()V

    return-void
.end method

.method public constructor <init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;Lcom/amazonaws/metrics/RequestMetricCollector;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 319
    invoke-static {p2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->adjustClientConfiguration(Lcom/amazonaws/ClientConfiguration;)Lcom/amazonaws/ClientConfiguration;

    move-result-object p2

    invoke-direct {p0, p2, p3}, Lcom/amazonaws/AmazonWebServiceClient;-><init>(Lcom/amazonaws/ClientConfiguration;Lcom/amazonaws/metrics/RequestMetricCollector;)V

    .line 142
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    .line 321
    iput-object p1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->awsCredentialsProvider:Lcom/amazonaws/auth/AWSCredentialsProvider;

    .line 323
    invoke-direct {p0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->init()V

    return-void
.end method

.method private static adjustClientConfiguration(Lcom/amazonaws/ClientConfiguration;)Lcom/amazonaws/ClientConfiguration;
    .locals 0

    return-object p0
.end method

.method private init()V
    .locals 3

    .line 352
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/BatchEntryIdsNotDistinctExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/BatchEntryIdsNotDistinctExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 353
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/BatchRequestTooLongExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/BatchRequestTooLongExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 354
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/EmptyBatchRequestExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/EmptyBatchRequestExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/InvalidAttributeNameExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/InvalidAttributeNameExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/InvalidBatchEntryIdExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/InvalidBatchEntryIdExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 357
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/InvalidIdFormatExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/InvalidIdFormatExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/InvalidMessageContentsExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/InvalidMessageContentsExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 359
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/MessageNotInflightExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/MessageNotInflightExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 360
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/OverLimitExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/OverLimitExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 361
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/PurgeQueueInProgressExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/PurgeQueueInProgressExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/QueueDeletedRecentlyExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/QueueDeletedRecentlyExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 363
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/QueueDoesNotExistExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/QueueDoesNotExistExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 364
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/QueueNameExistsExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/QueueNameExistsExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 365
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/ReceiptHandleIsInvalidExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/ReceiptHandleIsInvalidExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 366
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/TooManyEntriesInBatchRequestExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/TooManyEntriesInBatchRequestExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 367
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/services/sqs/model/transform/UnsupportedOperationExceptionUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/services/sqs/model/transform/UnsupportedOperationExceptionUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 368
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    new-instance v1, Lcom/amazonaws/transform/StandardErrorUnmarshaller;

    invoke-direct {v1}, Lcom/amazonaws/transform/StandardErrorUnmarshaller;-><init>()V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const-string v0, "sqs.us-east-1.amazonaws.com"

    .line 371
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->setEndpoint(Ljava/lang/String;)V

    const-string v0, "sqs"

    .line 372
    iput-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endpointPrefix:Ljava/lang/String;

    .line 374
    new-instance v0, Lcom/amazonaws/handlers/HandlerChainFactory;

    invoke-direct {v0}, Lcom/amazonaws/handlers/HandlerChainFactory;-><init>()V

    .line 375
    iget-object v1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->requestHandler2s:Ljava/util/List;

    const-string v2, "/com/amazonaws/services/sqs/request.handlers"

    invoke-virtual {v0, v2}, Lcom/amazonaws/handlers/HandlerChainFactory;->newRequestHandlerChain(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 377
    iget-object v1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->requestHandler2s:Ljava/util/List;

    const-string v2, "/com/amazonaws/services/sqs/request.handler2s"

    invoke-virtual {v0, v2}, Lcom/amazonaws/handlers/HandlerChainFactory;->newRequestHandler2Chain(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method private invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            "Y:",
            "Lcom/amazonaws/AmazonWebServiceRequest;",
            ">(",
            "Lcom/amazonaws/Request<",
            "TY;>;",
            "Lcom/amazonaws/transform/Unmarshaller<",
            "TX;",
            "Lcom/amazonaws/transform/StaxUnmarshallerContext;",
            ">;",
            "Lcom/amazonaws/http/ExecutionContext;",
            ")",
            "Lcom/amazonaws/Response<",
            "TX;>;"
        }
    .end annotation

    .line 2765
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endpoint:Ljava/net/URI;

    invoke-interface {p1, v0}, Lcom/amazonaws/Request;->setEndpoint(Ljava/net/URI;)V

    .line 2766
    iget v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->timeOffset:I

    invoke-interface {p1, v0}, Lcom/amazonaws/Request;->setTimeOffset(I)V

    .line 2767
    invoke-interface {p1}, Lcom/amazonaws/Request;->getOriginalRequest()Lcom/amazonaws/AmazonWebServiceRequest;

    move-result-object v0

    .line 2769
    iget-object v1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->awsCredentialsProvider:Lcom/amazonaws/auth/AWSCredentialsProvider;

    invoke-interface {v1}, Lcom/amazonaws/auth/AWSCredentialsProvider;->getCredentials()Lcom/amazonaws/auth/AWSCredentials;

    move-result-object v1

    .line 2770
    invoke-virtual {v0}, Lcom/amazonaws/AmazonWebServiceRequest;->getRequestCredentials()Lcom/amazonaws/auth/AWSCredentials;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 2771
    invoke-virtual {v0}, Lcom/amazonaws/AmazonWebServiceRequest;->getRequestCredentials()Lcom/amazonaws/auth/AWSCredentials;

    move-result-object v1

    .line 2774
    :cond_0
    invoke-virtual {p3, v1}, Lcom/amazonaws/http/ExecutionContext;->setCredentials(Lcom/amazonaws/auth/AWSCredentials;)V

    .line 2776
    new-instance v0, Lcom/amazonaws/http/StaxResponseHandler;

    invoke-direct {v0, p2}, Lcom/amazonaws/http/StaxResponseHandler;-><init>(Lcom/amazonaws/transform/Unmarshaller;)V

    .line 2777
    new-instance p2, Lcom/amazonaws/http/DefaultErrorResponseHandler;

    iget-object v1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->exceptionUnmarshallers:Ljava/util/List;

    invoke-direct {p2, v1}, Lcom/amazonaws/http/DefaultErrorResponseHandler;-><init>(Ljava/util/List;)V

    .line 2779
    iget-object v1, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->client:Lcom/amazonaws/http/AmazonHttpClient;

    invoke-virtual {v1, p1, v0, p2, p3}, Lcom/amazonaws/http/AmazonHttpClient;->execute(Lcom/amazonaws/Request;Lcom/amazonaws/http/HttpResponseHandler;Lcom/amazonaws/http/HttpResponseHandler;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public addPermission(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 437
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 438
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 439
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 443
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/AddPermissionRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/AddPermissionRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/AddPermissionRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 445
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 446
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 448
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
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

    .line 2377
    new-instance v0, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;-><init>()V

    .line 2378
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2379
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;->setLabel(Ljava/lang/String;)V

    .line 2380
    invoke-virtual {v0, p3}, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;->setAWSAccountIds(Ljava/util/Collection;)V

    .line 2381
    invoke-virtual {v0, p4}, Lcom/amazonaws/services/sqs/model/AddPermissionRequest;->setActions(Ljava/util/Collection;)V

    .line 2382
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->addPermission(Lcom/amazonaws/services/sqs/model/AddPermissionRequest;)V

    return-void
.end method

.method public changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 515
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 516
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 517
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 521
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityRequestMarshaller;-><init>()V

    .line 522
    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 524
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 525
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 527
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public changeMessageVisibility(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 2462
    new-instance v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;-><init>()V

    .line 2463
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2464
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->setReceiptHandle(Ljava/lang/String;)V

    .line 2465
    invoke-virtual {v0, p3}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;->setVisibilityTimeout(Ljava/lang/Integer;)V

    .line 2466
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->changeMessageVisibility(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityRequest;)V

    return-void
.end method

.method public changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 579
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 580
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 581
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 585
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestMarshaller;-><init>()V

    .line 586
    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 588
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 589
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ChangeMessageVisibilityBatchResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 591
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 593
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
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

    .line 2526
    new-instance v0, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;-><init>()V

    .line 2527
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2528
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 2529
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->changeMessageVisibilityBatch(Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchRequest;)Lcom/amazonaws/services/sqs/model/ChangeMessageVisibilityBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public createQueue(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 686
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 687
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 688
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 692
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/CreateQueueRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/CreateQueueRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/CreateQueueRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 694
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 695
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/CreateQueueResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/CreateQueueResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 696
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/CreateQueueResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 698
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public createQueue(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1736
    new-instance v0, Lcom/amazonaws/services/sqs/model/CreateQueueRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/CreateQueueRequest;-><init>()V

    .line 1737
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/CreateQueueRequest;->setQueueName(Ljava/lang/String;)V

    .line 1738
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createQueue(Lcom/amazonaws/services/sqs/model/CreateQueueRequest;)Lcom/amazonaws/services/sqs/model/CreateQueueResult;

    move-result-object p1

    return-object p1
.end method

.method public deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 746
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 747
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 748
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 752
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 754
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 755
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 757
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public deleteMessage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 2160
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;-><init>()V

    .line 2161
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2162
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;->setReceiptHandle(Ljava/lang/String;)V

    .line 2163
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->deleteMessage(Lcom/amazonaws/services/sqs/model/DeleteMessageRequest;)V

    return-void
.end method

.method public deleteMessageBatch(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 806
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 807
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 808
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 812
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 814
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 815
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/DeleteMessageBatchResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 817
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 819
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
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

    .line 2045
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;-><init>()V

    .line 2046
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2047
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 2048
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->deleteMessageBatch(Lcom/amazonaws/services/sqs/model/DeleteMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/DeleteMessageBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public deleteQueue(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 861
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 862
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 863
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 867
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/DeleteQueueRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/DeleteQueueRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/DeleteQueueRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 869
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 870
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 872
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public deleteQueue(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1784
    new-instance v0, Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;-><init>()V

    .line 1785
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 1786
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->deleteQueue(Lcom/amazonaws/services/sqs/model/DeleteQueueRequest;)V

    return-void
.end method

.method public getCachedResponseMetadata(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/ResponseMetadata;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 2759
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSClient;->client:Lcom/amazonaws/http/AmazonHttpClient;

    invoke-virtual {v0, p1}, Lcom/amazonaws/http/AmazonHttpClient;->getResponseMetadataForRequest(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/ResponseMetadata;

    move-result-object p1

    return-object p1
.end method

.method public getQueueAttributes(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 910
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 911
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 912
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 916
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/GetQueueAttributesRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/GetQueueAttributesRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/GetQueueAttributesRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 918
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 919
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/GetQueueAttributesResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/GetQueueAttributesResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 921
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 923
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1617
    new-instance v0, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;-><init>()V

    .line 1618
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 1619
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;->setAttributeNames(Ljava/util/Collection;)V

    .line 1620
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->getQueueAttributes(Lcom/amazonaws/services/sqs/model/GetQueueAttributesRequest;)Lcom/amazonaws/services/sqs/model/GetQueueAttributesResult;

    move-result-object p1

    return-object p1
.end method

.method public getQueueUrl(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 956
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 957
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 958
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 962
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 964
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 965
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/GetQueueUrlResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 966
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 968
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public getQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1825
    new-instance v0, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;-><init>()V

    .line 1826
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;->setQueueName(Ljava/lang/String;)V

    .line 1827
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->getQueueUrl(Lcom/amazonaws/services/sqs/model/GetQueueUrlRequest;)Lcom/amazonaws/services/sqs/model/GetQueueUrlResult;

    move-result-object p1

    return-object p1
.end method

.method public listDeadLetterSourceQueues(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1000
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1001
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1002
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1006
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ListDeadLetterSourceQueuesRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ListDeadLetterSourceQueuesRequestMarshaller;-><init>()V

    .line 1007
    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/ListDeadLetterSourceQueuesRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1009
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1010
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ListDeadLetterSourceQueuesResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ListDeadLetterSourceQueuesResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 1012
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1014
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public listQueues()Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 2071
    new-instance v0, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;-><init>()V

    .line 2072
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->listQueues(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;

    move-result-object v0

    return-object v0
.end method

.method public listQueues(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1039
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1040
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1041
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1045
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ListQueuesRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ListQueuesRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/ListQueuesRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1047
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1048
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ListQueuesResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ListQueuesResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 1049
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1051
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public listQueues(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 2103
    new-instance v0, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;-><init>()V

    .line 2104
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/ListQueuesRequest;->setQueueNamePrefix(Ljava/lang/String;)V

    .line 2105
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->listQueues(Lcom/amazonaws/services/sqs/model/ListQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListQueuesResult;

    move-result-object p1

    return-object p1
.end method

.method public purgeQueue(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1087
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1088
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1089
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1093
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/PurgeQueueRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/PurgeQueueRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/PurgeQueueRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/PurgeQueueRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1095
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1096
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1098
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1202
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1203
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1204
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1208
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ReceiveMessageRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ReceiveMessageRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/ReceiveMessageRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1210
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1211
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/ReceiveMessageResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/ReceiveMessageResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 1212
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1214
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public receiveMessage(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1935
    new-instance v0, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;-><init>()V

    .line 1936
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 1937
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->receiveMessage(Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;)Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    move-result-object p1

    return-object p1
.end method

.method public removePermission(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1236
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1237
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1238
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1242
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/RemovePermissionRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/RemovePermissionRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/RemovePermissionRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1244
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1245
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1247
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public removePermission(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 2280
    new-instance v0, Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;-><init>()V

    .line 2281
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2282
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;->setLabel(Ljava/lang/String;)V

    .line 2283
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->removePermission(Lcom/amazonaws/services/sqs/model/RemovePermissionRequest;)V

    return-void
.end method

.method public sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1288
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1289
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1290
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1294
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/SendMessageRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/SendMessageRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1296
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1297
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/SendMessageResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/SendMessageResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 1298
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/SendMessageResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1300
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
.end method

.method public sendMessage(Ljava/lang/String;Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageResult;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1986
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;-><init>()V

    .line 1987
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 1988
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->setMessageBody(Ljava/lang/String;)V

    .line 1989
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;

    move-result-object p1

    return-object p1
.end method

.method public sendMessageBatch(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1376
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1377
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1378
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1382
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1384
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1385
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/SendMessageBatchResultStaxUnmarshaller;-><init>()V

    invoke-direct {p0, p1, v3, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;

    move-result-object v2

    .line 1387
    invoke-virtual {v2}, Lcom/amazonaws/Response;->getAwsResponse()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1389
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-object v0

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
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

    .line 2247
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;-><init>()V

    .line 2248
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2249
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;->setEntries(Ljava/util/Collection;)V

    .line 2250
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->sendMessageBatch(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;)Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    move-result-object p1

    return-object p1
.end method

.method public setQueueAttributes(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazonaws/AmazonServiceException;,
            Lcom/amazonaws/AmazonClientException;
        }
    .end annotation

    .line 1420
    invoke-virtual {p0, p1}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->createExecutionContext(Lcom/amazonaws/AmazonWebServiceRequest;)Lcom/amazonaws/http/ExecutionContext;

    move-result-object v0

    .line 1421
    invoke-virtual {v0}, Lcom/amazonaws/http/ExecutionContext;->getAwsRequestMetrics()Lcom/amazonaws/util/AWSRequestMetrics;

    move-result-object v1

    .line 1422
    sget-object v2, Lcom/amazonaws/util/AWSRequestMetrics$Field;->ClientExecuteTime:Lcom/amazonaws/util/AWSRequestMetrics$Field;

    invoke-virtual {v1, v2}, Lcom/amazonaws/util/AWSRequestMetrics;->startEvent(Lcom/amazonaws/metrics/MetricType;)V

    const/4 v2, 0x0

    .line 1426
    :try_start_0
    new-instance v3, Lcom/amazonaws/services/sqs/model/transform/SetQueueAttributesRequestMarshaller;

    invoke-direct {v3}, Lcom/amazonaws/services/sqs/model/transform/SetQueueAttributesRequestMarshaller;-><init>()V

    invoke-virtual {v3, p1}, Lcom/amazonaws/services/sqs/model/transform/SetQueueAttributesRequestMarshaller;->marshall(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)Lcom/amazonaws/Request;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 1428
    :try_start_1
    invoke-interface {p1, v1}, Lcom/amazonaws/Request;->setAWSRequestMetrics(Lcom/amazonaws/util/AWSRequestMetrics;)V

    .line 1429
    invoke-direct {p0, p1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->invoke(Lcom/amazonaws/Request;Lcom/amazonaws/transform/Unmarshaller;Lcom/amazonaws/http/ExecutionContext;)Lcom/amazonaws/Response;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1431
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    return-void

    :catchall_0
    move-exception v0

    goto :goto_0

    :catchall_1
    move-exception v0

    move-object p1, v2

    :goto_0
    invoke-virtual {p0, v1, p1, v2}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->endClientExecution(Lcom/amazonaws/util/AWSRequestMetrics;Lcom/amazonaws/Request;Lcom/amazonaws/Response;)V

    throw v0
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

    .line 2732
    new-instance v0, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;-><init>()V

    .line 2733
    invoke-virtual {v0, p1}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->setQueueUrl(Ljava/lang/String;)V

    .line 2734
    invoke-virtual {v0, p2}, Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;->setAttributes(Ljava/util/Map;)V

    .line 2735
    invoke-virtual {p0, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;->setQueueAttributes(Lcom/amazonaws/services/sqs/model/SetQueueAttributesRequest;)V

    return-void
.end method
