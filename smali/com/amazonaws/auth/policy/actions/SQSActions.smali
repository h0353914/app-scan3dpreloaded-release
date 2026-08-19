.class public final enum Lcom/amazonaws/auth/policy/actions/SQSActions;
.super Ljava/lang/Enum;
.source "SQSActions.java"

# interfaces
.implements Lcom/amazonaws/auth/policy/Action;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/amazonaws/auth/policy/actions/SQSActions;",
        ">;",
        "Lcom/amazonaws/auth/policy/Action;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum AddPermission:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum AllSQSActions:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum ChangeMessageVisibility:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum ChangeMessageVisibilityBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum CreateQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum DeleteMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum DeleteMessageBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum DeleteQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum GetQueueAttributes:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum GetQueueUrl:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum ListDeadLetterSourceQueues:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum ListQueues:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum PurgeQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum ReceiveMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum RemovePermission:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum SendMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum SendMessageBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

.field public static final enum SetQueueAttributes:Lcom/amazonaws/auth/policy/actions/SQSActions;


# instance fields
.field private final action:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 25
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "AllSQSActions"

    const-string v2, "sqs:*"

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->AllSQSActions:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 28
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "AddPermission"

    const-string v2, "sqs:AddPermission"

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->AddPermission:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 31
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "ChangeMessageVisibility"

    const-string v2, "sqs:ChangeMessageVisibility"

    const/4 v5, 0x2

    invoke-direct {v0, v1, v5, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->ChangeMessageVisibility:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 34
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "ChangeMessageVisibilityBatch"

    const-string v2, "sqs:ChangeMessageVisibilityBatch"

    const/4 v6, 0x3

    invoke-direct {v0, v1, v6, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->ChangeMessageVisibilityBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 37
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "CreateQueue"

    const-string v2, "sqs:CreateQueue"

    const/4 v7, 0x4

    invoke-direct {v0, v1, v7, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->CreateQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 40
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "DeleteMessage"

    const-string v2, "sqs:DeleteMessage"

    const/4 v8, 0x5

    invoke-direct {v0, v1, v8, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->DeleteMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 43
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "DeleteMessageBatch"

    const-string v2, "sqs:DeleteMessageBatch"

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->DeleteMessageBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 46
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "DeleteQueue"

    const-string v2, "sqs:DeleteQueue"

    const/4 v10, 0x7

    invoke-direct {v0, v1, v10, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->DeleteQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 49
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "GetQueueAttributes"

    const-string v2, "sqs:GetQueueAttributes"

    const/16 v11, 0x8

    invoke-direct {v0, v1, v11, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->GetQueueAttributes:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 52
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "GetQueueUrl"

    const-string v2, "sqs:GetQueueUrl"

    const/16 v12, 0x9

    invoke-direct {v0, v1, v12, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->GetQueueUrl:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 55
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "ListDeadLetterSourceQueues"

    const-string v2, "sqs:ListDeadLetterSourceQueues"

    const/16 v13, 0xa

    invoke-direct {v0, v1, v13, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->ListDeadLetterSourceQueues:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 58
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "ListQueues"

    const-string v2, "sqs:ListQueues"

    const/16 v14, 0xb

    invoke-direct {v0, v1, v14, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->ListQueues:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 61
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "PurgeQueue"

    const-string v2, "sqs:PurgeQueue"

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->PurgeQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 64
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "ReceiveMessage"

    const-string v2, "sqs:ReceiveMessage"

    const/16 v15, 0xd

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->ReceiveMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 67
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "RemovePermission"

    const-string v2, "sqs:RemovePermission"

    const/16 v15, 0xe

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->RemovePermission:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 70
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "SendMessage"

    const-string v2, "sqs:SendMessage"

    const/16 v15, 0xf

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->SendMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 73
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "SendMessageBatch"

    const-string v2, "sqs:SendMessageBatch"

    const/16 v15, 0x10

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->SendMessageBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

    .line 76
    new-instance v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    const-string v1, "SetQueueAttributes"

    const-string v2, "sqs:SetQueueAttributes"

    const/16 v15, 0x11

    invoke-direct {v0, v1, v15, v2}, Lcom/amazonaws/auth/policy/actions/SQSActions;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->SetQueueAttributes:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v0, 0x12

    .line 23
    new-array v0, v0, [Lcom/amazonaws/auth/policy/actions/SQSActions;

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->AllSQSActions:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->AddPermission:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->ChangeMessageVisibility:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->ChangeMessageVisibilityBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->CreateQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v7

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->DeleteMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v8

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->DeleteMessageBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v9

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->DeleteQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v10

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->GetQueueAttributes:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v11

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->GetQueueUrl:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v12

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->ListDeadLetterSourceQueues:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v13

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->ListQueues:Lcom/amazonaws/auth/policy/actions/SQSActions;

    aput-object v1, v0, v14

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->PurgeQueue:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->ReceiveMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v2, 0xd

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->RemovePermission:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v2, 0xe

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->SendMessage:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v2, 0xf

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->SendMessageBatch:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v2, 0x10

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazonaws/auth/policy/actions/SQSActions;->SetQueueAttributes:Lcom/amazonaws/auth/policy/actions/SQSActions;

    const/16 v2, 0x11

    aput-object v1, v0, v2

    sput-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->$VALUES:[Lcom/amazonaws/auth/policy/actions/SQSActions;

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

    .line 80
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 81
    iput-object p3, p0, Lcom/amazonaws/auth/policy/actions/SQSActions;->action:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazonaws/auth/policy/actions/SQSActions;
    .locals 1

    .line 23
    const-class v0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/amazonaws/auth/policy/actions/SQSActions;

    return-object p0
.end method

.method public static values()[Lcom/amazonaws/auth/policy/actions/SQSActions;
    .locals 1

    .line 23
    sget-object v0, Lcom/amazonaws/auth/policy/actions/SQSActions;->$VALUES:[Lcom/amazonaws/auth/policy/actions/SQSActions;

    invoke-virtual {v0}, [Lcom/amazonaws/auth/policy/actions/SQSActions;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazonaws/auth/policy/actions/SQSActions;

    return-object v0
.end method


# virtual methods
.method public getActionName()Ljava/lang/String;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/amazonaws/auth/policy/actions/SQSActions;->action:Ljava/lang/String;

    return-object v0
.end method
