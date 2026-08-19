.class public final enum Lcom/amazonaws/services/sqs/model/QueueAttributeName;
.super Ljava/lang/Enum;
.source "QueueAttributeName.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/amazonaws/services/sqs/model/QueueAttributeName;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum All:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum ApproximateNumberOfMessages:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum ApproximateNumberOfMessagesDelayed:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum ApproximateNumberOfMessagesNotVisible:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum ContentBasedDeduplication:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum CreatedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum DelaySeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum FifoQueue:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum LastModifiedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum MaximumMessageSize:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum MessageRetentionPeriod:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum Policy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum QueueArn:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum ReceiveMessageWaitTimeSeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum RedrivePolicy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field public static final enum VisibilityTimeout:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

.field private static final enumMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/QueueAttributeName;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 26
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "All"

    const-string v2, "All"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->All:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 27
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "Policy"

    const-string v2, "Policy"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->Policy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 28
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "VisibilityTimeout"

    const-string v2, "VisibilityTimeout"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->VisibilityTimeout:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 29
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "MaximumMessageSize"

    const-string v2, "MaximumMessageSize"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->MaximumMessageSize:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 30
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "MessageRetentionPeriod"

    const-string v2, "MessageRetentionPeriod"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->MessageRetentionPeriod:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 31
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "ApproximateNumberOfMessages"

    const-string v2, "ApproximateNumberOfMessages"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessages:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 32
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "ApproximateNumberOfMessagesNotVisible"

    const-string v2, "ApproximateNumberOfMessagesNotVisible"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessagesNotVisible:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 33
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "CreatedTimestamp"

    const-string v2, "CreatedTimestamp"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->CreatedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 34
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "LastModifiedTimestamp"

    const-string v2, "LastModifiedTimestamp"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->LastModifiedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 35
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "QueueArn"

    const-string v2, "QueueArn"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->QueueArn:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 36
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "ApproximateNumberOfMessagesDelayed"

    const-string v2, "ApproximateNumberOfMessagesDelayed"

    const/16 v13, 0xa

    invoke-direct {v0, v1, v13, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessagesDelayed:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 37
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "DelaySeconds"

    const-string v2, "DelaySeconds"

    const/16 v14, 0xb

    invoke-direct {v0, v1, v14, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->DelaySeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 38
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "ReceiveMessageWaitTimeSeconds"

    const-string v2, "ReceiveMessageWaitTimeSeconds"

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ReceiveMessageWaitTimeSeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 39
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "RedrivePolicy"

    const-string v2, "RedrivePolicy"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->RedrivePolicy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 40
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "FifoQueue"

    const-string v2, "FifoQueue"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->FifoQueue:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 41
    new-instance v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const-string v1, "ContentBasedDeduplication"

    const-string v2, "ContentBasedDeduplication"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/services/sqs/model/QueueAttributeName;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ContentBasedDeduplication:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const/16 v0, 0x10

    .line 24
    new-array v0, v0, [Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->All:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->Policy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->VisibilityTimeout:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->MaximumMessageSize:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->MessageRetentionPeriod:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessages:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v8

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessagesNotVisible:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v9

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->CreatedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v10

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->LastModifiedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v11

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->QueueArn:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v12

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessagesDelayed:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v13

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->DelaySeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    aput-object v1, v0, v14

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ReceiveMessageWaitTimeSeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->RedrivePolicy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->FifoQueue:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ContentBasedDeduplication:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->$VALUES:[Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    .line 57
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "All"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->All:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "Policy"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->Policy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "VisibilityTimeout"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->VisibilityTimeout:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "MaximumMessageSize"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->MaximumMessageSize:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "MessageRetentionPeriod"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->MessageRetentionPeriod:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "ApproximateNumberOfMessages"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessages:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 63
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "ApproximateNumberOfMessagesNotVisible"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessagesNotVisible:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "CreatedTimestamp"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->CreatedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "LastModifiedTimestamp"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->LastModifiedTimestamp:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 66
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "QueueArn"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->QueueArn:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "ApproximateNumberOfMessagesDelayed"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ApproximateNumberOfMessagesDelayed:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "DelaySeconds"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->DelaySeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "ReceiveMessageWaitTimeSeconds"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ReceiveMessageWaitTimeSeconds:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "RedrivePolicy"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->RedrivePolicy:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "FifoQueue"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->FifoQueue:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    const-string v1, "ContentBasedDeduplication"

    sget-object v2, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->ContentBasedDeduplication:Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 45
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 46
    iput-object p3, p0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->value:Ljava/lang/String;

    return-void
.end method

.method public static fromValue(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/QueueAttributeName;
    .locals 3

    if-eqz p0, :cond_1

    .line 82
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 84
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 85
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->enumMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    return-object p0

    .line 87
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cannot create enum from "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " value!"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Value cannot be null or empty!"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/QueueAttributeName;
    .locals 1

    .line 24
    const-class v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    return-object p0
.end method

.method public static values()[Lcom/amazonaws/services/sqs/model/QueueAttributeName;
    .locals 1

    .line 24
    sget-object v0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->$VALUES:[Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    invoke-virtual {v0}, [Lcom/amazonaws/services/sqs/model/QueueAttributeName;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazonaws/services/sqs/model/QueueAttributeName;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/amazonaws/services/sqs/model/QueueAttributeName;->value:Ljava/lang/String;

    return-object v0
.end method
