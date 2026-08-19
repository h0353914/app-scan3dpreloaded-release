.class public final enum Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;
.super Ljava/lang/Enum;
.source "Aws.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

.field public static final enum INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

.field private static final REFRESH_THRESHOLD:J

.field private static final SOCKET_TIMEOUT:I = 0x2710

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

.field private mS3:Lcom/amazonaws/services/s3/AmazonS3;

.field private mSessions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;",
            ">;"
        }
    .end annotation
.end field

.field private mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 43
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    const/4 v0, 0x1

    .line 38
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    .line 49
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0xf

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    sput-wide v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->REFRESH_THRESHOLD:J

    .line 54
    const-class v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 38
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 79
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    return-void
.end method

.method private static authenticate(Lcom/amazonaws/auth/CognitoCredentialsProvider;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    .line 270
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "accounts.google.com"

    .line 271
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    invoke-virtual {p0, v0}, Lcom/amazonaws/auth/CognitoCredentialsProvider;->withLogins(Ljava/util/Map;)Lcom/amazonaws/auth/AWSCredentialsProvider;

    move-result-object p0

    invoke-interface {p0}, Lcom/amazonaws/auth/AWSCredentialsProvider;->refresh()V
    :try_end_0
    .catch Lcom/amazonaws/AmazonClientException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 275
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;

    const-string v0, "Failure when authenticating user."

    invoke-direct {p1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method

.method private ensureSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 241
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 242
    :cond_0
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;

    const-string v0, "Invalid session"

    invoke-direct {p1, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static getGoogleToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/google/android/gms/auth/GoogleAuthException;
        }
    .end annotation

    .line 255
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 256
    new-instance v1, Landroid/accounts/Account;

    const-string v2, "com.google"

    invoke-direct {v1, v0, v2}, Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getTokenScope(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v1, v0}, Lcom/google/android/gms/auth/GoogleAuthUtil;->getToken(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private shutdownAwsResources()V
    .locals 2

    const/4 v0, 0x0

    .line 228
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;

    .line 229
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;

    if-eqz v1, :cond_0

    .line 230
    invoke-interface {v1}, Lcom/amazonaws/services/sqs/AmazonSQS;->shutdown()V

    .line 231
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;

    :cond_0
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;
    .locals 1

    .line 38
    const-class v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;
    .locals 1

    .line 38
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    return-object v0
.end method


# virtual methods
.method declared-synchronized clearCredentials(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    monitor-enter p0

    .line 161
    :try_start_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->ensureSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 162
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    invoke-virtual {p1}, Lcom/amazonaws/auth/CognitoCredentialsProvider;->clear()V

    .line 164
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->invalidateSessions()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 165
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized endSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 2

    monitor-enter p0

    .line 119
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 120
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->shutdownAwsResources()V

    .line 122
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "endSession(): Number of active aws sessions "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 123
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized getCognitoId(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    monitor-enter p0

    .line 175
    :try_start_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->ensureSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 176
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    invoke-virtual {p1}, Lcom/amazonaws/auth/CognitoCredentialsProvider;->getIdentityId()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized getS3(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/s3/AmazonS3;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    monitor-enter p0

    .line 187
    :try_start_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->ensureSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 188
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized getSqs(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Lcom/amazonaws/services/sqs/AmazonSQS;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    monitor-enter p0

    .line 199
    :try_start_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->ensureSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 200
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized invalidateSessions()V
    .locals 1

    monitor-enter p0

    .line 216
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 217
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->shutdownAwsResources()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 218
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized isSessionless()Z
    .locals 1

    monitor-enter p0

    .line 209
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method declared-synchronized refreshCredentials(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;,
            Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException;
        }
    .end annotation

    monitor-enter p0

    .line 135
    :try_start_0
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->ensureSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 136
    new-instance p2, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-wide v2, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->REFRESH_THRESHOLD:J

    sub-long/2addr v0, v2

    invoke-direct {p2, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 137
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    invoke-virtual {v0}, Lcom/amazonaws/auth/CognitoCredentialsProvider;->getSessionCredentitalsExpiration()Ljava/util/Date;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 140
    invoke-virtual {v0, p2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_1

    .line 142
    :cond_0
    :try_start_1
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->getGoogleToken(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    .line 143
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->authenticate(Lcom/amazonaws/auth/CognitoCredentialsProvider;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/google/android/gms/auth/GoogleAuthException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 146
    :catch_0
    :try_start_2
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->TAG:Ljava/lang/String;

    const-string p2, "refreshCredentials(): Failed to refresh the token."

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move v2, v1

    .line 151
    :cond_1
    :goto_0
    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized startSession(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;
    .locals 3

    monitor-enter p0

    .line 88
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    if-nez v0, :cond_0

    .line 89
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessCognitoIdentityPool(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 91
    new-instance v1, Lcom/amazonaws/auth/CognitoCredentialsProvider;

    sget-object v2, Lcom/amazonaws/regions/Regions;->EU_WEST_1:Lcom/amazonaws/regions/Regions;

    invoke-direct {v1, v0, v2}, Lcom/amazonaws/auth/CognitoCredentialsProvider;-><init>(Ljava/lang/String;Lcom/amazonaws/regions/Regions;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    :cond_0
    const/4 v0, 0x0

    .line 95
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;

    if-nez v1, :cond_2

    .line 96
    :cond_1
    new-instance v0, Lcom/amazonaws/ClientConfiguration;

    invoke-direct {v0}, Lcom/amazonaws/ClientConfiguration;-><init>()V

    const/16 v1, 0x2710

    .line 97
    invoke-virtual {v0, v1}, Lcom/amazonaws/ClientConfiguration;->setSocketTimeout(I)V

    .line 100
    :cond_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;

    if-nez v1, :cond_3

    .line 101
    new-instance v1, Lcom/amazonaws/services/s3/AmazonS3Client;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    invoke-direct {v1, v2, v0}, Lcom/amazonaws/services/s3/AmazonS3Client;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;

    .line 102
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mS3:Lcom/amazonaws/services/s3/AmazonS3;

    sget-object v2, Lcom/amazonaws/regions/Regions;->EU_WEST_1:Lcom/amazonaws/regions/Regions;

    invoke-static {v2}, Lcom/amazonaws/regions/Region;->getRegion(Lcom/amazonaws/regions/Regions;)Lcom/amazonaws/regions/Region;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/amazonaws/services/s3/AmazonS3;->setRegion(Lcom/amazonaws/regions/Region;)V

    .line 105
    :cond_3
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;

    if-nez v1, :cond_4

    .line 106
    new-instance v1, Lcom/amazonaws/services/sqs/AmazonSQSClient;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mProvider:Lcom/amazonaws/auth/CognitoCredentialsProvider;

    invoke-direct {v1, v2, v0}, Lcom/amazonaws/services/sqs/AmazonSQSClient;-><init>(Lcom/amazonaws/auth/AWSCredentialsProvider;Lcom/amazonaws/ClientConfiguration;)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSqs:Lcom/amazonaws/services/sqs/AmazonSQS;

    .line 109
    :cond_4
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    invoke-direct {v0, p1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;-><init>(Landroid/content/Context;)V

    .line 110
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startSession(): Number of active aws sessions "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->mSessions:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 112
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
