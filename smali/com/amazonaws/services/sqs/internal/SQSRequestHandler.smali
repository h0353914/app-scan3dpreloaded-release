.class public Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;
.super Lcom/amazonaws/handlers/AbstractRequestHandler;
.source "SQSRequestHandler.java"


# static fields
.field private static final nonstandardEndpointMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    .line 29
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "queue.amazonaws.com"

    const-string v2, "sqs.us-east-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "us-west-1.queue.amazonaws.com"

    const-string v2, "sqs.us-west-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "us-west-2.queue.amazonaws.com"

    const-string v2, "sqs.us-west-2.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "eu-west-1.queue.amazonaws.com"

    const-string v2, "sqs.eu-west-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "ap-southeast-1.queue.amazonaws.com"

    const-string v2, "sqs.ap-southeast-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "ap-northeast-1.queue.amazonaws.com"

    const-string v2, "sqs.ap-northeast-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "sa-east-1.queue.amazonaws.com"

    const-string v2, "sqs.sa-east-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "us-gov-west-1.queue.amazonaws.com"

    const-string v2, "sqs.us-gov-west-1.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    sget-object v0, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    const-string v1, "ap-southeast-2.queue.amazonaws.com"

    const-string v2, "sqs.ap-southeast-2.amazonaws.com"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Lcom/amazonaws/handlers/AbstractRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public beforeRequest(Lcom/amazonaws/Request;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/Request<",
            "*>;)V"
        }
    .end annotation

    .line 46
    invoke-interface {p1}, Lcom/amazonaws/Request;->getEndpoint()Ljava/net/URI;

    move-result-object v0

    .line 50
    sget-object v1, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 51
    sget-object v1, Lcom/amazonaws/services/sqs/internal/SQSRequestHandler;->nonstandardEndpointMap:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 52
    invoke-virtual {v0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 53
    invoke-static {v0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/amazonaws/Request;->setEndpoint(Ljava/net/URI;)V

    :cond_0
    return-void
.end method
