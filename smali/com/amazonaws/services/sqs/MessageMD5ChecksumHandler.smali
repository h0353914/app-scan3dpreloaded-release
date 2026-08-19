.class public Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;
.super Lcom/amazonaws/handlers/AbstractRequestHandler;
.source "MessageMD5ChecksumHandler.java"


# static fields
.field private static final BINARY_LIST_TYPE_FIELD_INDEX:B = 0x4t

.field private static final BINARY_TYPE_FIELD_INDEX:B = 0x2t

.field private static final INTEGER_SIZE_IN_BYTES:I = 0x4

.field private static final MD5_MISMATCH_ERROR_MESSAGE:Ljava/lang/String; = "MD5 returned by SQS does not match the calculation on the original request. (MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

.field private static final MD5_MISMATCH_ERROR_MESSAGE_WITH_ID:Ljava/lang/String; = "MD5 returned by SQS does not match the calculation on the original request. (Message ID: %s, MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

.field private static final MESSAGE_ATTRIBUTES:Ljava/lang/String; = "message attributes"

.field private static final MESSAGE_BODY:Ljava/lang/String; = "message body"

.field private static final STRING_LIST_TYPE_FIELD_INDEX:B = 0x3t

.field private static final STRING_TYPE_FIELD_INDEX:B = 0x1t

.field private static final log:Lorg/apache/commons/logging/Log;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 76
    const-class v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    sput-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 55
    invoke-direct {p0}, Lcom/amazonaws/handlers/AbstractRequestHandler;-><init>()V

    return-void
.end method

.method private static calculateMessageAttributesMd5(Ljava/util/Map;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/amazonaws/services/sqs/model/MessageAttributeValue;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 236
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Message attribtues: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 239
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 240
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    :try_start_0
    const-string v1, "MD5"

    .line 244
    invoke-static {v1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 246
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 247
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;

    .line 250
    invoke-static {v1, v2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 252
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getDataType()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/lang/String;)V

    .line 255
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getStringValue()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_2

    const/4 v2, 0x1

    .line 256
    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update(B)V

    .line 257
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getStringValue()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/lang/String;)V

    goto :goto_0

    .line 258
    :cond_2
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getBinaryValue()Ljava/nio/ByteBuffer;

    move-result-object v2

    if-eqz v2, :cond_3

    const/4 v2, 0x2

    .line 259
    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update(B)V

    .line 260
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getBinaryValue()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/nio/ByteBuffer;)V

    goto :goto_0

    .line 261
    :cond_3
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getStringListValues()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_4

    const/4 v2, 0x3

    .line 262
    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update(B)V

    .line 263
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getStringListValues()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 264
    invoke-static {v1, v3}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/lang/String;)V

    goto :goto_1

    .line 266
    :cond_4
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getBinaryListValues()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_1

    const/4 v2, 0x4

    .line 267
    invoke-virtual {v1, v2}, Ljava/security/MessageDigest;->update(B)V

    .line 268
    invoke-virtual {v3}, Lcom/amazonaws/services/sqs/model/MessageAttributeValue;->getBinaryListValues()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/nio/ByteBuffer;

    .line 269
    invoke-static {v1, v3}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 279
    :cond_5
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    invoke-static {p0}, Lcom/amazonaws/util/BinaryUtils;->toHex([B)Ljava/lang/String;

    move-result-object p0

    .line 280
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 281
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected  MD5 of message attributes: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_6
    return-object p0

    :catch_0
    move-exception p0

    .line 274
    new-instance v0, Lcom/amazonaws/AmazonClientException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to calculate the MD5 hash of the message attributes. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static calculateMessageBodyMd5(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 214
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Message body: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 219
    :cond_0
    :try_start_0
    sget-object v0, Lcom/amazonaws/util/StringUtils;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-static {p0}, Lcom/amazonaws/util/Md5Utils;->computeMD5Hash([B)[B

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    invoke-static {p0}, Lcom/amazonaws/util/BinaryUtils;->toHex([B)Ljava/lang/String;

    move-result-object p0

    .line 225
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 226
    sget-object v0, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->log:Lorg/apache/commons/logging/Log;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Expected  MD5 of message body: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    :cond_1
    return-object p0

    :catch_0
    move-exception p0

    .line 221
    new-instance v0, Lcom/amazonaws/AmazonClientException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to calculate the MD5 hash of the message body. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    invoke-virtual {p0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method private static receiveMessageResultMd5Check(Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;)V
    .locals 8

    .line 143
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;->getMessages()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 144
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;->getMessages()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazonaws/services/sqs/model/Message;

    .line 145
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/Message;->getBody()Ljava/lang/String;

    move-result-object v1

    .line 146
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfBody()Ljava/lang/String;

    move-result-object v2

    .line 147
    invoke-static {v1}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->calculateMessageBodyMd5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 148
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x3

    if-eqz v3, :cond_2

    .line 155
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/Message;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 156
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 157
    invoke-virtual {v0}, Lcom/amazonaws/services/sqs/model/Message;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v0

    .line 158
    invoke-static {v1}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->calculateMessageAttributesMd5(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 159
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 160
    :cond_1
    new-instance p0, Lcom/amazonaws/AmazonClientException;

    new-array v2, v7, [Ljava/lang/Object;

    const-string v3, "message attributes"

    aput-object v3, v2, v6

    aput-object v1, v2, v5

    aput-object v0, v2, v4

    const-string v0, "MD5 returned by SQS does not match the calculation on the original request. (MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 149
    :cond_2
    new-instance p0, Lcom/amazonaws/AmazonClientException;

    new-array v0, v7, [Ljava/lang/Object;

    const-string v3, "message body"

    aput-object v3, v0, v6

    aput-object v1, v0, v5

    aput-object v2, v0, v4

    const-string v1, "MD5 returned by SQS does not match the calculation on the original request. (MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    return-void
.end method

.method private static sendMessageBatchOperationMd5Check(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;)V
    .locals 9

    .line 177
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 178
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;->getEntries()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 179
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;->getEntries()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    .line 180
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 184
    :cond_0
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_4

    .line 185
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;->getSuccessful()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_1
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;

    .line 186
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    .line 187
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v2

    .line 188
    invoke-static {v1}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->calculateMessageBodyMd5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 189
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    const/4 v4, 0x3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x4

    if-eqz v3, :cond_3

    .line 196
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object v1

    .line 195
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;

    .line 196
    invoke-virtual {v1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequestEntry;->getMessageAttributes()Ljava/util/Map;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 197
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    .line 198
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object v2

    .line 199
    invoke-static {v1}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->calculateMessageAttributesMd5(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v1

    .line 200
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    goto :goto_1

    .line 201
    :cond_2
    new-instance p0, Lcom/amazonaws/AmazonClientException;

    new-array v0, v8, [Ljava/lang/Object;

    const-string v3, "message attributes"

    aput-object v3, v0, v7

    .line 203
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v6

    aput-object v1, v0, v5

    aput-object v2, v0, v4

    const-string p1, "MD5 returned by SQS does not match the calculation on the original request. (Message ID: %s, MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

    .line 201
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 190
    :cond_3
    new-instance p0, Lcom/amazonaws/AmazonClientException;

    new-array v0, v8, [Ljava/lang/Object;

    const-string v3, "message body"

    aput-object v3, v0, v7

    .line 192
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageBatchResultEntry;->getId()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v6

    aput-object v1, v0, v5

    aput-object v2, v0, v4

    const-string p1, "MD5 returned by SQS does not match the calculation on the original request. (Message ID: %s, MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

    .line 190
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    return-void
.end method

.method private static sendMessageOperationMd5Check(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/services/sqs/model/SendMessageResult;)V
    .locals 7

    .line 115
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageBody()Ljava/lang/String;

    move-result-object v0

    .line 116
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageBody()Ljava/lang/String;

    move-result-object v1

    .line 117
    invoke-static {v0}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->calculateMessageBodyMd5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x3

    if-eqz v2, :cond_2

    .line 125
    invoke-virtual {p0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->getMessageAttributes()Ljava/util/Map;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 126
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 127
    invoke-static {p0}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->calculateMessageAttributesMd5(Ljava/util/Map;)Ljava/lang/String;

    move-result-object p0

    .line 128
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMD5OfMessageAttributes()Ljava/lang/String;

    move-result-object p1

    .line 129
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 130
    :cond_0
    new-instance v0, Lcom/amazonaws/AmazonClientException;

    new-array v1, v6, [Ljava/lang/Object;

    const-string v2, "message attributes"

    aput-object v2, v1, v5

    aput-object p0, v1, v4

    aput-object p1, v1, v3

    const-string p0, "MD5 returned by SQS does not match the calculation on the original request. (MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

    invoke-static {p0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void

    .line 119
    :cond_2
    new-instance p0, Lcom/amazonaws/AmazonClientException;

    new-array p1, v6, [Ljava/lang/Object;

    const-string v2, "message body"

    aput-object v2, p1, v5

    aput-object v0, p1, v4

    aput-object v1, p1, v3

    const-string v0, "MD5 returned by SQS does not match the calculation on the original request. (MD5 calculated by the %s: \"%s\", MD5 checksum returned: \"%s\")"

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/amazonaws/AmazonClientException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .line 292
    sget-object v0, Lcom/amazonaws/util/StringUtils;->UTF8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const/4 v0, 0x4

    .line 293
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    array-length v1, p1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 295
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 296
    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update([B)V

    return-void
.end method

.method private static updateLengthAndBytes(Ljava/security/MessageDigest;Ljava/nio/ByteBuffer;)V
    .locals 2

    .line 307
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 308
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v0

    const/4 v1, 0x4

    .line 309
    invoke-static {v1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 310
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/security/MessageDigest;->update([B)V

    .line 311
    invoke-virtual {p0, p1}, Ljava/security/MessageDigest;->update(Ljava/nio/ByteBuffer;)V

    return-void
.end method


# virtual methods
.method public afterResponse(Lcom/amazonaws/Request;Ljava/lang/Object;Lcom/amazonaws/util/TimingInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazonaws/Request<",
            "*>;",
            "Ljava/lang/Object;",
            "Lcom/amazonaws/util/TimingInfo;",
            ")V"
        }
    .end annotation

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    .line 82
    invoke-interface {p1}, Lcom/amazonaws/Request;->getOriginalRequest()Lcom/amazonaws/AmazonWebServiceRequest;

    move-result-object p3

    instance-of p3, p3, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    if-eqz p3, :cond_0

    instance-of p3, p2, Lcom/amazonaws/services/sqs/model/SendMessageResult;

    if-eqz p3, :cond_0

    .line 85
    invoke-interface {p1}, Lcom/amazonaws/Request;->getOriginalRequest()Lcom/amazonaws/AmazonWebServiceRequest;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    .line 86
    check-cast p2, Lcom/amazonaws/services/sqs/model/SendMessageResult;

    .line 87
    invoke-static {p1, p2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->sendMessageOperationMd5Check(Lcom/amazonaws/services/sqs/model/SendMessageRequest;Lcom/amazonaws/services/sqs/model/SendMessageResult;)V

    goto :goto_0

    .line 91
    :cond_0
    invoke-interface {p1}, Lcom/amazonaws/Request;->getOriginalRequest()Lcom/amazonaws/AmazonWebServiceRequest;

    move-result-object p3

    instance-of p3, p3, Lcom/amazonaws/services/sqs/model/ReceiveMessageRequest;

    if-eqz p3, :cond_1

    instance-of p3, p2, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    if-eqz p3, :cond_1

    .line 93
    check-cast p2, Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;

    .line 94
    invoke-static {p2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->receiveMessageResultMd5Check(Lcom/amazonaws/services/sqs/model/ReceiveMessageResult;)V

    goto :goto_0

    .line 98
    :cond_1
    invoke-interface {p1}, Lcom/amazonaws/Request;->getOriginalRequest()Lcom/amazonaws/AmazonWebServiceRequest;

    move-result-object p3

    instance-of p3, p3, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;

    if-eqz p3, :cond_2

    instance-of p3, p2, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    if-eqz p3, :cond_2

    .line 101
    invoke-interface {p1}, Lcom/amazonaws/Request;->getOriginalRequest()Lcom/amazonaws/AmazonWebServiceRequest;

    move-result-object p1

    check-cast p1, Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;

    .line 102
    check-cast p2, Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;

    .line 103
    invoke-static {p1, p2}, Lcom/amazonaws/services/sqs/MessageMD5ChecksumHandler;->sendMessageBatchOperationMd5Check(Lcom/amazonaws/services/sqs/model/SendMessageBatchRequest;Lcom/amazonaws/services/sqs/model/SendMessageBatchResult;)V

    :cond_2
    :goto_0
    return-void
.end method
