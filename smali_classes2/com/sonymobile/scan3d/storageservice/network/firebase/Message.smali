.class Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;
.super Ljava/lang/Object;
.source "Message.java"


# static fields
.field static final CRITICAL_FAILURE:I = 0x3

.field private static final DEFAULT_PROTOCOL_VERSION:I = 0x0

.field static final GENERAL_FAILURE:I = 0x2

.field private static final MESSAGE_AES_KEY:Ljava/lang/String; = "key"

.field private static final MESSAGE_ID:Ljava/lang/String; = "message_id"

.field private static final MESSAGE_PROTOCOL_VERSION:Ljava/lang/String; = "protocol_version"

.field private static final MESSAGE_RECEIVING_REQUEST:Ljava/lang/String; = "receiving_request"

.field private static final MESSAGE_REQUEST_TYPE:Ljava/lang/String; = "request_type"

.field private static final MESSAGE_S3_KEY:Ljava/lang/String; = "s3_key"

.field private static final MESSAGE_SESSION:Ljava/lang/String; = "session_id"

.field private static final MESSAGE_STATE:Ljava/lang/String; = "state"

.field static final NO_INPUT_FAILURE:I = 0x5

.field static final START:I = 0x0

.field static final SUCCESS:I = 0x1

.field static final TIMEOUT_FAILURE:I = 0x4

.field private static final UNKNOWN:I = -0x1


# instance fields
.field private mAesKey:Ljava/lang/String;

.field private mMessageId:Ljava/lang/String;

.field private mProtocolVersion:I

.field private mReceivingRequest:Ljava/lang/String;

.field private mRequestType:Ljava/lang/String;

.field private mS3Key:Ljava/lang/String;

.field private mSession:Ljava/lang/String;

.field private mState:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 129
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mProtocolVersion:I

    return-void
.end method

.method static from(Ljava/util/Map;)Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;"
        }
    .end annotation

    .line 216
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;-><init>()V

    .line 218
    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 219
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 221
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v3

    const/4 v4, -0x1

    sparse-switch v3, :sswitch_data_0

    goto :goto_1

    :sswitch_0
    const-string v3, "session_id"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x3

    goto :goto_2

    :sswitch_1
    const-string v3, "request_type"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    goto :goto_2

    :sswitch_2
    const-string v3, "state"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_2

    :sswitch_3
    const-string v3, "key"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x7

    goto :goto_2

    :sswitch_4
    const-string v3, "s3_key"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x6

    goto :goto_2

    :sswitch_5
    const-string v3, "protocol_version"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    goto :goto_2

    :sswitch_6
    const-string v3, "receiving_request"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x4

    goto :goto_2

    :sswitch_7
    const-string v3, "message_id"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x5

    goto :goto_2

    :cond_0
    :goto_1
    move v1, v4

    :goto_2
    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 257
    :pswitch_0
    iput-object v2, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mAesKey:Ljava/lang/String;

    goto :goto_0

    .line 254
    :pswitch_1
    iput-object v2, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mS3Key:Ljava/lang/String;

    goto :goto_0

    .line 251
    :pswitch_2
    iput-object v2, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mMessageId:Ljava/lang/String;

    goto :goto_0

    .line 248
    :pswitch_3
    iput-object v2, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mReceivingRequest:Ljava/lang/String;

    goto/16 :goto_0

    .line 245
    :pswitch_4
    iput-object v2, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mSession:Ljava/lang/String;

    goto/16 :goto_0

    .line 242
    :pswitch_5
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mProtocolVersion:I

    goto/16 :goto_0

    .line 226
    :pswitch_6
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    packed-switch v1, :pswitch_data_1

    .line 237
    iput v4, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mState:I

    goto/16 :goto_0

    .line 234
    :pswitch_7
    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mState:I

    goto/16 :goto_0

    .line 223
    :pswitch_8
    iput-object v2, v0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mRequestType:Ljava/lang/String;

    goto/16 :goto_0

    :cond_1
    return-object v0

    :sswitch_data_0
    .sparse-switch
        -0x64c65fad -> :sswitch_7
        -0x5b10e3d0 -> :sswitch_6
        -0x453cc5cf -> :sswitch_5
        -0x38c73440 -> :sswitch_4
        0x19e5f -> :sswitch_3
        0x68ac491 -> :sswitch_2
        0x4dae96ea -> :sswitch_1
        0x630ddf64 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_7
    .end packed-switch
.end method


# virtual methods
.method getAesKey()Ljava/lang/String;
    .locals 1

    .line 179
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mAesKey:Ljava/lang/String;

    return-object v0
.end method

.method getMessageId()Ljava/lang/String;
    .locals 1

    .line 188
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mMessageId:Ljava/lang/String;

    return-object v0
.end method

.method getProtocolVersion()I
    .locals 1

    .line 197
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mProtocolVersion:I

    return v0
.end method

.method getReceivingRequest()Ljava/lang/String;
    .locals 1

    .line 206
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mReceivingRequest:Ljava/lang/String;

    return-object v0
.end method

.method getRequestType()Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mRequestType:Ljava/lang/String;

    return-object v0
.end method

.method getS3Key()Ljava/lang/String;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mS3Key:Ljava/lang/String;

    return-object v0
.end method

.method getSession()Ljava/lang/String;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mSession:Ljava/lang/String;

    return-object v0
.end method

.method getState()I
    .locals 1

    .line 142
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/firebase/Message;->mState:I

    return v0
.end method
