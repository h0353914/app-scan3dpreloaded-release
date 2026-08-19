.class Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;
.super Ljava/util/LinkedHashMap;
.source "AmazonSQSBufferedAsyncClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "CachingMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/LinkedHashMap<",
        "Ljava/lang/String;",
        "Lcom/amazonaws/services/sqs/buffered/QueueBuffer;",
        ">;"
    }
.end annotation


# static fields
.field private static final MAX_ENTRIES:I = 0x64

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field final synthetic this$0:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;


# direct methods
.method public constructor <init>(Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;IFZ)V
    .locals 0

    .line 421
    iput-object p1, p0, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;->this$0:Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient;

    .line 422
    invoke-direct {p0, p2, p3, p4}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    return-void
.end method


# virtual methods
.method protected removeEldestEntry(Ljava/util/Map$Entry;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/buffered/QueueBuffer;",
            ">;)Z"
        }
    .end annotation

    .line 427
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/buffered/AmazonSQSBufferedAsyncClient$CachingMap;->size()I

    move-result p1

    const/16 v0, 0x64

    if-le p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
