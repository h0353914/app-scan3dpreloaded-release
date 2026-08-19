.class final Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;
.super Lcom/sonymobile/scan3d/storageservice/content/AwsTask;
.source "ReceiveImprovementTask.java"


# static fields
.field private static final FILE_NAME:Ljava/lang/String; = "improved_scan.zip"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.content.ReceiveImprovementTask"

.field private static final TEMP_FILE_NAME:Ljava/lang/String; = "improved_cloud_scan.zip"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 72
    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/storageservice/content/AwsTask;-><init>(Lcom/sonymobile/scan3d/storageservice/content/TaskService;Landroid/app/job/JobParameters;ZZLcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    return-void
.end method

.method private createFileRecord(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Ljava/io/File;)Landroid/net/Uri;
    .locals 7

    .line 203
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 205
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getName()Ljava/lang/String;

    move-result-object v2

    .line 206
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getScanType()I

    move-result v6

    const/4 v4, 0x0

    const/16 v5, 0xa

    move-object v1, p1

    move-object v3, p3

    .line 205
    invoke-static/range {v1 .. v6}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 210
    sget-object p2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->toContentValues()Landroid/content/ContentValues;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    if-eqz p3, :cond_1

    .line 212
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 213
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->TAG:Ljava/lang/String;

    const-string p2, "Deleted improvement file after failing to create record"

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private download(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/io/File;)Ljava/io/File;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    .line 155
    new-instance v0, Ljava/io/File;

    const-string v1, "improved_cloud_scan.zip"

    invoke-direct {v0, p6, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 156
    new-instance v1, Ljava/io/File;

    const-string v2, "improved_scan.zip"

    invoke-direct {v1, p6, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 157
    invoke-virtual {p4}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getS3Path()Ljava/lang/String;

    move-result-object p4

    const/4 p6, 0x0

    .line 161
    :try_start_0
    invoke-virtual {p3, p2, p4}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->doesContentExist(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 162
    invoke-virtual {p3, p2, p4, v0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->download(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;

    move-result-object p2
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_8
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_7
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 164
    :try_start_1
    invoke-virtual {p2, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->monitor(Lcom/sonymobile/scan3d/storageservice/Cancellable;)Z

    move-result p3

    if-eqz p3, :cond_6

    .line 165
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 166
    invoke-virtual {p5}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKeyDecoded()[B

    move-result-object p3

    .line 168
    new-instance p4, Ljava/io/FileInputStream;

    invoke-direct {p4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_1 .. :try_end_1} :catch_6
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_5

    .line 170
    :try_start_2
    invoke-static {p4, p3}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->cipherInputStream(Ljava/io/InputStream;[B)Ljavax/crypto/CipherInputStream;

    move-result-object p3
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 171
    :try_start_3
    invoke-static {p1, p3, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->saveToDiskEncrypted(Landroid/content/Context;Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p3, :cond_0

    .line 172
    :try_start_4
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_0
    :try_start_5
    invoke-virtual {p4}, Ljava/io/FileInputStream;->close()V

    .line 175
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_6

    .line 176
    sget-object p1, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->TAG:Ljava/lang/String;

    const-string p3, "Could not delete src file."

    invoke-static {p1, p3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/security/GeneralSecurityException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    goto :goto_4

    :catchall_0
    move-exception p1

    move-object p5, p6

    goto :goto_0

    :catch_0
    move-exception p1

    .line 168
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception p5

    move-object v3, p5

    move-object p5, p1

    move-object p1, v3

    :goto_0
    if-eqz p3, :cond_2

    if-eqz p5, :cond_1

    .line 172
    :try_start_7
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    goto :goto_1

    :catch_1
    move-exception p3

    :try_start_8
    invoke-virtual {p5, p3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p3}, Ljava/io/InputStream;->close()V

    :cond_2
    :goto_1
    throw p1
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_2
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    :catchall_2
    move-exception p1

    move-object p3, p6

    goto :goto_2

    :catch_2
    move-exception p1

    .line 168
    :try_start_9
    throw p1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    :catchall_3
    move-exception p3

    move-object v3, p3

    move-object p3, p1

    move-object p1, v3

    :goto_2
    if-eqz p3, :cond_3

    .line 172
    :try_start_a
    invoke-virtual {p4}, Ljava/io/FileInputStream;->close()V
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_3
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_a .. :try_end_a} :catch_6
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_5
    .catch Ljava/security/GeneralSecurityException; {:try_start_a .. :try_end_a} :catch_4
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    goto :goto_3

    :catch_3
    move-exception p4

    :try_start_b
    invoke-virtual {p3, p4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_3
    invoke-virtual {p4}, Ljava/io/FileInputStream;->close()V

    :goto_3
    throw p1
    :try_end_b
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_b .. :try_end_b} :catch_6
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_5
    .catch Ljava/security/GeneralSecurityException; {:try_start_b .. :try_end_b} :catch_4
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    :cond_4
    move-object v1, v0

    goto :goto_4

    :catch_4
    move-exception p1

    goto :goto_7

    :catch_5
    move-exception p1

    goto :goto_7

    :catch_6
    move-exception p1

    goto :goto_7

    :cond_5
    move-object p2, p6

    :cond_6
    :goto_4
    if-eqz p2, :cond_7

    .line 187
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_7

    .line 188
    :goto_5
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->cancel()Z

    goto :goto_8

    :catchall_4
    move-exception p1

    move-object p2, p6

    goto :goto_9

    :catch_7
    move-exception p1

    goto :goto_6

    :catch_8
    move-exception p1

    goto :goto_6

    :catch_9
    move-exception p1

    :goto_6
    move-object p2, p6

    .line 185
    :goto_7
    :try_start_c
    sget-object p3, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->TAG:Ljava/lang/String;

    const-string p4, "Exception caught"

    invoke-static {p3, p4, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_5

    if-eqz p2, :cond_7

    .line 187
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->isRunning()Z

    move-result p1

    if-eqz p1, :cond_7

    goto :goto_5

    .line 191
    :cond_7
    :goto_8
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_8

    move-object p6, v1

    :cond_8
    return-object p6

    :catchall_5
    move-exception p1

    :goto_9
    if-eqz p2, :cond_9

    .line 187
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->isRunning()Z

    move-result p3

    if-eqz p3, :cond_9

    .line 188
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/content/aws/TransferControl;->cancel()Z

    .line 190
    :cond_9
    throw p1
.end method


# virtual methods
.method doWork(Landroid/content/Context;Landroid/app/job/JobParameters;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException;
        }
    .end annotation

    move-object/from16 v8, p0

    move-object/from16 v0, p1

    const/4 v9, 0x1

    const/4 v1, 0x0

    .line 92
    :try_start_0
    invoke-static/range {p1 .. p1}, Lcom/sonymobile/scan3d/storageservice/Config;->getPostProcessLogBucket(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    .line 93
    invoke-static/range {p1 .. p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object v2

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->executeWait()Ljava/lang/Object;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    .line 96
    invoke-static/range {p1 .. p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getImprovements(Landroid/content/Context;)Ljava/util/ArrayList;

    move-result-object v2

    .line 99
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move v13, v1

    :goto_0
    :try_start_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;

    .line 100
    invoke-virtual {v14}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->isDownloadable()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 102
    invoke-static/range {p1 .. p1}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getTempDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v15
    :try_end_1
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object v3, v10

    move-object/from16 v4, p3

    move-object v5, v14

    move-object v6, v11

    move-object v7, v15

    .line 105
    :try_start_2
    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->download(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    .line 107
    invoke-direct {v8, v0, v14, v1}, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->createFileRecord(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/Improvement;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 109
    :try_start_3
    invoke-static {v15, v9}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 113
    invoke-static {v1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v3

    .line 115
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v9}, Landroid/content/ContentValues;-><init>(I)V

    const-string v5, "file_set_id"

    .line 116
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v1, v5, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 117
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v14}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v1, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 118
    sget-object v1, Lcom/sonymobile/scan3d/analytics/HitEvent;->IMPROVEMENT_RECEIVED:Lcom/sonymobile/scan3d/analytics/HitEvent;

    const-wide/16 v2, 0x1

    invoke-virtual {v1, v0, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    goto :goto_1

    .line 121
    :cond_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1, v9}, Landroid/content/ContentValues;-><init>(I)V

    const-string v3, "fail_state"

    .line 123
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    .line 122
    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 124
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    invoke-virtual {v14}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v3, v4, v1, v2, v2}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 129
    :goto_1
    invoke-virtual {v14}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->getS3Path()Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, p3

    invoke-virtual {v2, v10, v1}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->delete(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    .line 109
    invoke-static {v15, v9}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    .line 110
    throw v0
    :try_end_3
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/GeneralAwsException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_1
    move-object/from16 v2, p3

    :goto_2
    move v13, v9

    goto :goto_0

    :cond_2
    xor-int/lit8 v0, v13, 0x1

    goto :goto_5

    :catchall_1
    move-exception v0

    goto :goto_6

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_3

    :catch_2
    move-exception v0

    :goto_3
    move v1, v13

    goto :goto_4

    :catchall_2
    move-exception v0

    move v13, v1

    goto :goto_6

    :catch_3
    move-exception v0

    goto :goto_4

    :catch_4
    move-exception v0

    goto :goto_4

    :catch_5
    move-exception v0

    .line 134
    :goto_4
    :try_start_4
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->TAG:Ljava/lang/String;

    const-string v3, "Work failed "

    invoke-static {v2, v3, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    xor-int/lit8 v0, v1, 0x1

    .line 136
    :goto_5
    invoke-virtual {v8, v0}, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->setReschedule(Z)V

    return-void

    :goto_6
    xor-int/lit8 v1, v13, 0x1

    invoke-virtual {v8, v1}, Lcom/sonymobile/scan3d/storageservice/content/ReceiveImprovementTask;->setReschedule(Z)V

    .line 137
    throw v0
.end method

.method getForegroundNotification(Landroid/content/Context;)Landroid/app/Notification;
    .locals 2

    const/4 v0, 0x0

    .line 77
    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/utils/notification/NotificationUtil;->newNotifier(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/notification/Notifier;

    move-result-object v0

    const/4 v1, 0x1

    .line 78
    invoke-virtual {v0, p1, v1}, Lcom/sonymobile/scan3d/utils/notification/Notifier;->newBuilder(Landroid/content/Context;I)Landroid/app/Notification$Builder;

    move-result-object v0

    const v1, 0x7f08010e

    .line 79
    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    const v1, 0x7f100245

    .line 80
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    const v1, 0x7f100242

    .line 81
    invoke-virtual {p1, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 82
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p1

    return-object p1
.end method
