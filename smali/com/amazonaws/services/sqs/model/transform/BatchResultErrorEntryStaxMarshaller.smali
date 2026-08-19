.class Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;
.super Ljava/lang/Object;
.source "BatchResultErrorEntryStaxMarshaller.java"


# static fields
.field private static instance:Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;
    .locals 1

    .line 55
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;

    if-nez v0, :cond_0

    .line 56
    new-instance v0, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;-><init>()V

    sput-object v0, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;

    .line 57
    :cond_0
    sget-object v0, Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;->instance:Lcom/amazonaws/services/sqs/model/transform/BatchResultErrorEntryStaxMarshaller;

    return-object v0
.end method


# virtual methods
.method public marshall(Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;Lcom/amazonaws/Request;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;",
            "Lcom/amazonaws/Request<",
            "*>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 30
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 32
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getId()Ljava/lang/String;

    move-result-object v1

    .line 33
    invoke-static {v1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getSenderFault()Ljava/lang/Boolean;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "SenderFault"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 37
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getSenderFault()Ljava/lang/Boolean;

    move-result-object v1

    .line 38
    invoke-static {v1}, Lcom/amazonaws/util/StringUtils;->fromBoolean(Ljava/lang/Boolean;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    :cond_1
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getCode()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "Code"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getCode()Ljava/lang/String;

    move-result-object v1

    .line 43
    invoke-static {v1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    :cond_2
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getMessage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "Message"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 47
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/BatchResultErrorEntry;->getMessage()Ljava/lang/String;

    move-result-object p1

    .line 48
    invoke-static {p1}, Lcom/amazonaws/util/StringUtils;->fromString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {p2, p3, p1}, Lcom/amazonaws/Request;->addParameter(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-void
.end method
