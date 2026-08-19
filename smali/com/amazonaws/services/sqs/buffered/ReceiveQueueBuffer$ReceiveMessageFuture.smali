.class Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;
.super Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;
.source "ReceiveQueueBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ReceiveMessageFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture<",
        "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
        "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
        ">;"
    }
.end annotation


# instance fields
.field private requestedSize:I

.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;


# direct methods
.method constructor <init>(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;I)V
    .locals 1

    const/4 v0, 0x0

    .line 353
    invoke-direct {p0, p1, v0, p2}, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;-><init>(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;I)V

    return-void
.end method

.method constructor <init>(Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback<",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;",
            "Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;",
            ">;I)V"
        }
    .end annotation

    .line 357
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;->this$0:Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer;

    .line 358
    invoke-direct {p0, p2}, Lcom/amazonaws/services/sqs/buffered/QueueBufferFuture;-><init>(Lcom/amazonaws/services/sqs/buffered/QueueBufferCallback;)V

    .line 359
    iput p3, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;->requestedSize:I

    return-void
.end method


# virtual methods
.method public getRequestedSize()I
    .locals 1

    .line 363
    iget v0, p0, Lcom/amazonaws/services/sqs/buffered/ReceiveQueueBuffer$ReceiveMessageFuture;->requestedSize:I

    return v0
.end method
