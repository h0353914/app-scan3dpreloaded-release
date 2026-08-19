.class Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture$2;
.super Ljava/lang/Object;
.source "QueueBufferFuture.java"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->setFailure(Ljava/lang/Exception;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;


# direct methods
.method constructor <init>(Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture$2;->this$0:Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic call()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture$2;->call()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public call()Ljava/lang/Void;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 99
    iget-object v0, p0, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture$2;->this$0:Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-static {v0}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->access$100(Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;)Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;

    move-result-object v0

    iget-object v1, p0, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture$2;->this$0:Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;

    invoke-static {v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;->access$200(Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;)Ljava/lang/Exception;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;->onError(Ljava/lang/Exception;)V

    const/4 v0, 0x0

    return-object v0
.end method
