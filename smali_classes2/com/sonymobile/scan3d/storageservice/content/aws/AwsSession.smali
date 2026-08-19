.class public final Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;
.super Ljava/lang/Object;
.source "AwsSession.java"


# static fields
.field private static final ATTRIB_COGNITO_ID:Ljava/lang/String; = "cognito_id"

.field private static final ATTRIB_CONTENT_ID:Ljava/lang/String; = "content"

.field private static final ATTRIB_COUNTRY:Ljava/lang/String; = "country"

.field private static final ATTRIB_EMAIL:Ljava/lang/String; = "email"

.field private static final ATTRIB_FIREBASE_TOKEN:Ljava/lang/String; = "firebase_token"

.field private static final ATTRIB_GIVEN_NAME:Ljava/lang/String; = "given_name"

.field private static final ATTRIB_GOOGLE_ID:Ljava/lang/String; = "google_id"

.field private static final ATTRIB_JOB_TYPE:Ljava/lang/String; = "job_type"

.field private static final ATTRIB_KEY:Ljava/lang/String; = "key"

.field private static final ATTRIB_LANGUAGE:Ljava/lang/String; = "lang"

.field private static final ATTRIB_PROTOCOL_VERSION:Ljava/lang/String; = "protocol_version"

.field private static final ATTRIB_RECEIVING_REQUEST:Ljava/lang/String; = "receiving_request"

.field private static final ATTRIB_REQUEST_TYPE:Ljava/lang/String; = "request_type"

.field private static final ATTRIB_SESSION_ID:Ljava/lang/String; = "session_id"

.field private static final ATTRIB_USE_ENCRYPTION:Ljava/lang/String; = "use_encryption"

.field private static final JSON_INDENT:I = 0x3

.field private static final PROTOCOL_VERSION:I = 0x1

.field public static final REQUEST_TYPE_DELETE_ACCOUNT:Ljava/lang/String; = "delete_account_request"

.field public static final REQUEST_TYPE_EXECUTE:Ljava/lang/String; = "execution_request"

.field public static final REQUEST_TYPE_EXTRACT_DATA:Ljava/lang/String; = "extract_data_request"

.field public static final REQUEST_TYPE_INIT:Ljava/lang/String; = "init_request"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.aws.AwsSession"


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    return-void
.end method

.method private getTransferUtility()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 534
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getS3(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/s3/AmazonS3;

    move-result-object v0

    .line 536
    invoke-static {}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->builder()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility$Builder;

    move-result-object v1

    .line 537
    invoke-virtual {v1, v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility$Builder;->s3Client(Lcom/amazonaws/services/s3/AmazonS3;)Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    .line 538
    invoke-virtual {v0, v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility$Builder;->context(Landroid/content/Context;)Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility$Builder;

    move-result-object v0

    .line 539
    invoke-virtual {v0}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility$Builder;->build()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    move-result-object v0

    return-object v0
.end method

.method private postJobToSqs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 513
    :try_start_0
    new-instance v0, Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    invoke-direct {v0}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;-><init>()V

    .line 514
    invoke-virtual {v0, p3}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->withQueueUrl(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    move-result-object p3

    .line 515
    invoke-virtual {p3, p1}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->withMessageBody(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    move-result-object p1

    .line 516
    invoke-virtual {p1, p2}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->withMessageDeduplicationId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    move-result-object p1

    .line 517
    invoke-virtual {p1, p4}, Lcom/amazonaws/services/sqs/model/SendMessageRequest;->withMessageGroupId(Ljava/lang/String;)Lcom/amazonaws/services/sqs/model/SendMessageRequest;

    move-result-object p1

    .line 519
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getSqs(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/sqs/AmazonSQS;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/amazonaws/services/sqs/AmazonSQS;->sendMessage(Lcom/amazonaws/services/sqs/model/SendMessageRequest;)Lcom/amazonaws/services/sqs/model/SendMessageResult;

    move-result-object p1

    .line 520
    invoke-virtual {p1}, Lcom/amazonaws/services/sqs/model/SendMessageResult;->getMessageId()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 522
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->TAG:Ljava/lang/String;

    const-string p3, "Exception while sending message."

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method


# virtual methods
.method public clearCredentials()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 202
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->clearCredentials(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method public delete(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 262
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getS3(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/s3/AmazonS3;

    move-result-object v0

    .line 263
    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/s3/AmazonS3;->deleteObject(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 265
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;

    const-string v0, "Error while deleting an object."

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public doesContentExist(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 217
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getS3(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/s3/AmazonS3;

    move-result-object v0

    .line 218
    invoke-interface {v0, p1, p2}, Lcom/amazonaws/services/s3/AmazonS3;->doesObjectExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    move-exception p1

    .line 220
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;

    const-string v0, "Error while checking if content exists"

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public download(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 300
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getTransferUtility()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    move-result-object v0

    .line 301
    invoke-virtual {v0, p1, p2, p3}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->download(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    move-result-object p1

    .line 302
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;-><init>(Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;)V

    return-object p2
.end method

.method public getIdentityId()Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 176
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getCognitoId(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 178
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;

    const-string v2, "Error while fetching the cognito id."

    invoke-direct {v1, v2, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public listObjects(Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/amazonaws/services/s3/model/S3ObjectSummary;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 236
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 238
    new-instance v1, Lcom/amazonaws/services/s3/model/ListObjectsV2Request;

    invoke-direct {v1}, Lcom/amazonaws/services/s3/model/ListObjectsV2Request;-><init>()V

    .line 239
    invoke-virtual {v1, p1}, Lcom/amazonaws/services/s3/model/ListObjectsV2Request;->withBucketName(Ljava/lang/String;)Lcom/amazonaws/services/s3/model/ListObjectsV2Request;

    move-result-object p1

    .line 240
    invoke-virtual {p1, p2}, Lcom/amazonaws/services/s3/model/ListObjectsV2Request;->withPrefix(Ljava/lang/String;)Lcom/amazonaws/services/s3/model/ListObjectsV2Request;

    move-result-object p1

    .line 242
    :cond_0
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getS3(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/s3/AmazonS3;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/amazonaws/services/s3/AmazonS3;->listObjectsV2(Lcom/amazonaws/services/s3/model/ListObjectsV2Request;)Lcom/amazonaws/services/s3/model/ListObjectsV2Result;

    move-result-object p2

    .line 243
    invoke-virtual {p2}, Lcom/amazonaws/services/s3/model/ListObjectsV2Result;->getObjectSummaries()Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 244
    invoke-virtual {p2}, Lcom/amazonaws/services/s3/model/ListObjectsV2Result;->getNextContinuationToken()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/amazonaws/services/s3/model/ListObjectsV2Request;->setContinuationToken(Ljava/lang/String;)V

    .line 245
    invoke-virtual {p2}, Lcom/amazonaws/services/s3/model/ListObjectsV2Result;->isTruncated()Z

    move-result p2
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p2, :cond_0

    return-object v0

    :catch_0
    move-exception p1

    .line 248
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;

    const-string v0, "Error while listing objects."

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public postDeleteAccountJob()Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 432
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v0

    .line 434
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "request_type"

    const-string v3, "delete_account_request"

    .line 435
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "cognito_id"

    .line 436
    invoke-virtual {v1, v2, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "firebase_token"

    .line 437
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "protocol_version"

    const/4 v3, 0x1

    .line 438
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 v2, 0x3

    .line 440
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 441
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/Config;->getGdprExecuteJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 446
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v1, v3, v2, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postJobToSqs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    .line 448
    :goto_0
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->TAG:Ljava/lang/String;

    const-string v2, "Failed to send delete account message"

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    :goto_1
    return-object v0
.end method

.method public postExecuteImprovementJob(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 468
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v0

    .line 470
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "request_type"

    const-string v3, "execution_request"

    .line 471
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "content"

    .line 472
    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "cognito_id"

    .line 473
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "firebase_token"

    .line 474
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object v3

    invoke-virtual {v3}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "job_type"

    .line 475
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "session_id"

    .line 476
    invoke-virtual {v1, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "key"

    .line 477
    invoke-virtual {v1, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "use_encryption"

    .line 478
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result p3

    invoke-virtual {v1, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string p1, "protocol_version"

    .line 479
    invoke-virtual {v1, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 p1, 0x3

    .line 481
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 482
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessExecuteJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    .line 487
    new-instance p4, Ljava/lang/StringBuilder;

    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getIdentifier()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 488
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postJobToSqs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 490
    :goto_0
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->TAG:Ljava/lang/String;

    const-string p3, "Failed to send execute improvement message."

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public postExtractDataJob(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 396
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v0

    .line 397
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    .line 399
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "request_type"

    const-string v4, "extract_data_request"

    .line 400
    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "session_id"

    .line 401
    invoke-virtual {v2, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "cognito_id"

    .line 402
    invoke-virtual {v2, v3, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v3, "key"

    .line 403
    invoke-virtual {v2, v3, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p5, "email"

    .line 404
    invoke-virtual {v2, p5, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "given_name"

    .line 405
    invoke-virtual {v2, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "google_id"

    .line 406
    invoke-virtual {v2, p2, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "lang"

    .line 407
    invoke-virtual {v1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "country"

    .line 408
    invoke-virtual {v1}, Ljava/util/Locale;->getCountry()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "use_encryption"

    .line 409
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result p3

    invoke-virtual {v2, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    const-string p2, "firebase_token"

    .line 410
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object p3

    invoke-virtual {p3}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v2, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p2, "protocol_version"

    const/4 p3, 0x1

    .line 411
    invoke-virtual {v2, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 p2, 0x3

    .line 413
    invoke-virtual {v2, p2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p2

    .line 414
    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/Config;->getGdprExecuteJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p3

    .line 415
    invoke-direct {p0, p2, p1, p3, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postJobToSqs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 417
    :goto_0
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->TAG:Ljava/lang/String;

    const-string p3, "Failed to send extract data message"

    invoke-static {p2, p3, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public postInitKeyJob(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 357
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v0

    .line 359
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "request_type"

    const-string v3, "init_request"

    .line 360
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v2, "receiving_request"

    .line 361
    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "cognito_id"

    .line 362
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getIdentityId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "firebase_token"

    .line 363
    invoke-static {}, Lcom/google/firebase/iid/FirebaseInstanceId;->getInstance()Lcom/google/firebase/iid/FirebaseInstanceId;

    move-result-object v2

    invoke-virtual {v2}, Lcom/google/firebase/iid/FirebaseInstanceId;->getToken()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "protocol_version"

    const/4 v2, 0x1

    .line 364
    invoke-virtual {v1, p1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const/4 p1, 0x3

    .line 366
    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    .line 367
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessInitJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 372
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    .line 373
    invoke-direct {p0, p1, v2, v1, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->postJobToSqs(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 375
    :goto_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->TAG:Ljava/lang/String;

    const-string v1, "Failed to send init message"

    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public refreshCredentials()Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 191
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->refreshCredentials(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Z

    move-result v0
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    move-exception v0

    .line 193
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;

    const-string v2, "Error while refreshing credentials."

    invoke-direct {v1, v2, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public removeAllFinishedTransfers()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 332
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getTransferUtility()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    move-result-object v0

    const/4 v1, 0x3

    .line 333
    new-array v1, v1, [Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    sget-object v2, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;->CANCELED:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    sget-object v2, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;->COMPLETED:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;->FAILED:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    .line 339
    sget-object v2, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferType;->ANY:Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferType;

    invoke-virtual {v0, v2, v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->getTransfersWithTypeAndStates(Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferType;[Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferState;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    .line 341
    invoke-virtual {v2}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;->getId()I

    move-result v2

    .line 342
    invoke-virtual {v0, v2}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->deleteTransferRecord(I)Z

    .line 343
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Removed transfer with id "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public resume(I)Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    if-lez p1, :cond_0

    .line 316
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getTransferUtility()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    move-result-object v0

    .line 317
    invoke-virtual {v0, p1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->resume(I)Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 320
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;

    invoke-direct {v1, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;-><init>(Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public upload(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 279
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->getTransferUtility()Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;

    move-result-object v0

    .line 280
    new-instance v1, Lcom/amazonaws/services/s3/model/ObjectMetadata;

    invoke-direct {v1}, Lcom/amazonaws/services/s3/model/ObjectMetadata;-><init>()V

    .line 281
    invoke-static {p3}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->getContentType(Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/amazonaws/services/s3/model/ObjectMetadata;->setContentType(Ljava/lang/String;)V

    .line 282
    new-instance v2, Ljava/util/Date;

    invoke-virtual {p3}, Ljava/io/File;->lastModified()J

    move-result-wide v3

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v1, v2}, Lcom/amazonaws/services/s3/model/ObjectMetadata;->setLastModified(Ljava/util/Date;)V

    .line 283
    invoke-virtual {p3}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/amazonaws/services/s3/model/ObjectMetadata;->setContentLength(J)V

    .line 285
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;->upload(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Lcom/amazonaws/services/s3/model/ObjectMetadata;)Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;

    move-result-object p1

    .line 286
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;

    invoke-direct {p2, v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;-><init>(Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferUtility;Lcom/amazonaws/mobileconnectors/s3/transferutility/TransferObserver;)V

    return-object p2
.end method
