.class Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient$19;
.super Ljava/lang/Object;
.source "AmazonSQSAsyncClient.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient;->listDeadLetterSourceQueuesAsync(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Ljava/util/concurrent/Future;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient;

.field final synthetic val$listDeadLetterSourceQueuesRequest:Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;


# direct methods
.method constructor <init>(Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient;Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)V
    .locals 0

    .line 1487
    iput-object p1, p0, Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient$19;->this$0:Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient;

    iput-object p2, p0, Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient$19;->val$listDeadLetterSourceQueuesRequest:Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1489
    iget-object v0, p0, Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient$19;->this$0:Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient;

    iget-object v1, p0, Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient$19;->val$listDeadLetterSourceQueuesRequest:Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient;->listDeadLetterSourceQueues(Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesRequest;)Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1487
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/AmazonSQSAsyncClient$19;->call()Lcom/amazonaws/services/sqs/model/ListDeadLetterSourceQueuesResult;

    move-result-object v0

    return-object v0
.end method
