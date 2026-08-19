.class Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;
.super Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;
.source "DriveActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "GetKeyExecution"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction<",
        "Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;",
        ">;"
    }
.end annotation


# instance fields
.field private mDriveService:Lcom/google/api/services/drive/Drive;

.field private mFileId:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/google/api/services/drive/Drive;)V
    .locals 0

    .line 178
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;-><init>()V

    .line 179
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->mDriveService:Lcom/google/api/services/drive/Drive;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/api/services/drive/Drive;Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$1;)V
    .locals 0

    .line 167
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;-><init>(Lcom/google/api/services/drive/Drive;)V

    return-void
.end method

.method private getFileId(Lcom/google/api/services/drive/Drive;)Ljava/lang/String;
    .locals 3

    .line 198
    :try_start_0
    invoke-virtual {p1}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/api/services/drive/Drive$Files;->list()Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    const-string v0, "appDataFolder"

    invoke-virtual {p1, v0}, Lcom/google/api/services/drive/Drive$Files$List;->setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/api/services/drive/Drive$Files$List;->execute()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/api/services/drive/model/FileList;

    .line 199
    invoke-virtual {p1}, Lcom/google/api/services/drive/model/FileList;->getFiles()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    const-string v1, "encryption_keys_v1.json"

    .line 200
    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 201
    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 205
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public static synthetic lambda$getRunningTask$0(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 185
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->getFileId(Lcom/google/api/services/drive/Drive;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->mFileId:Ljava/lang/String;

    .line 186
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->mFileId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/Drive$Files;->get(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$Get;

    move-result-object v0

    .line 187
    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Get;->executeMediaAsInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v1, 0x0

    .line 188
    :try_start_1
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toJsonUrlEncoded(Ljava/io/InputStream;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->from(Lorg/json/JSONObject;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_0

    .line 189
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    :cond_0
    return-object v1

    :catchall_0
    move-exception v2

    goto :goto_0

    :catch_0
    move-exception v1

    .line 186
    :try_start_3
    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    if-eqz v0, :cond_2

    if-eqz v1, :cond_1

    .line 189
    :try_start_4
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_1
    move-exception v0

    :try_start_5
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_2
    :goto_1
    throw v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-exception v0

    .line 190
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Error in reading keyfile from Drive"

    invoke-static {v1, v2, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 192
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->from(Lorg/json/JSONObject;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getRunningTask()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;",
            ">;"
        }
    .end annotation

    .line 184
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$GetKeyExecution$EnMnnSlCSLab4dqFXSQq5Nll4w4;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$GetKeyExecution$EnMnnSlCSLab4dqFXSQq5Nll4w4;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method
