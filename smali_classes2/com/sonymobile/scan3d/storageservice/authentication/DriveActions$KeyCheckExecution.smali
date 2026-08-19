.class Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;
.super Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;
.source "DriveActions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "KeyCheckExecution"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private mDriveService:Lcom/google/api/services/drive/Drive;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lcom/google/api/services/drive/Drive;)V
    .locals 1

    .line 67
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;-><init>()V

    .line 68
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mContext:Ljava/lang/ref/WeakReference;

    .line 69
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mDriveService:Lcom/google/api/services/drive/Drive;

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/google/api/services/drive/Drive;Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$1;)V
    .locals 0

    .line 52
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;-><init>(Landroid/content/Context;Lcom/google/api/services/drive/Drive;)V

    return-void
.end method

.method private exists()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 92
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$bsqQQkLiZB6eBfcUiZbPH-QwmCk;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$bsqQQkLiZB6eBfcUiZbPH-QwmCk;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$wd59rTZ1W_Je_9RfGoFQVHAYtPo;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$wd59rTZ1W_Je_9RfGoFQVHAYtPo;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)V

    .line 94
    invoke-virtual {v0, v1}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method

.method private hasEncryptionKeyFile(Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/google/api/services/drive/model/File;",
            ">;)Z"
        }
    .end annotation

    .line 155
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

    .line 156
    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public static synthetic lambda$exists$1(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)Lcom/google/api/services/drive/model/FileList;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files;->list()Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v0

    const-string v1, "appDataFolder"

    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/Drive$Files$List;->setSpaces(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Files$List;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$List;->execute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/FileList;

    return-object v0
.end method

.method public static synthetic lambda$exists$2(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 95
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/FileList;

    .line 96
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->isSuccessful()Z

    move-result v1

    if-nez v1, :cond_1

    .line 97
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getException()Ljava/lang/Exception;

    move-result-object p1

    if-nez p1, :cond_0

    .line 99
    new-instance p1, Ljava/lang/Exception;

    const-string v0, "Unable to query files"

    invoke-direct {p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 101
    :cond_0
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Query task failed"

    invoke-virtual {p1}, Ljava/lang/Exception;->fillInStackTrace()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 102
    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forException(Ljava/lang/Exception;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    :cond_1
    if-nez v0, :cond_2

    const/4 p1, 0x0

    .line 106
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1

    .line 108
    :cond_2
    invoke-virtual {v0}, Lcom/google/api/services/drive/model/FileList;->getFiles()Ljava/util/List;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->hasEncryptionKeyFile(Ljava/util/List;)Z

    move-result p1

    .line 109
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->KEY_CHECK_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    if-eqz p1, :cond_3

    sget-object v2, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->HAS_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 111
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->ordinal()I

    move-result v2

    goto :goto_0

    :cond_3
    sget-object v2, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->HAS_NO_METADATA:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    .line 113
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->ordinal()I

    move-result v2

    .line 109
    :goto_0
    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    .line 114
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {p1}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public static synthetic lambda$getRunningTask$0(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;Lcom/google/android/gms/tasks/Task;)Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 75
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 77
    sget-object v0, Lcom/sonymobile/scan3d/analytics/SignInEvent;->KEY_CHECK_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/Context;

    sget-object v2, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->DRIVE_KEY_EXISTS:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->ordinal()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    return-object p1

    .line 80
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/analytics/SignInEvent;->KEY_CHECK_EXECUTION:Lcom/sonymobile/scan3d/analytics/SignInEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    sget-object v1, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->TRY_START_UPLOAD:Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/analytics/SignInEvent$KeyCheckExecutionType;->ordinal()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/SignInEvent;->send(Landroid/content/Context;I)V

    .line 81
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->upload()Lcom/google/android/gms/tasks/Task;

    move-result-object p1

    return-object p1
.end method

.method public static synthetic lambda$upload$3(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)Ljava/lang/Boolean;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 126
    new-instance v0, Lcom/google/api/services/drive/model/File;

    invoke-direct {v0}, Lcom/google/api/services/drive/model/File;-><init>()V

    const-string v1, "encryption_keys_v1.json"

    .line 127
    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/model/File;->setName(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    const-string v1, "appDataFolder"

    .line 128
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/model/File;->setParents(Ljava/util/List;)Lcom/google/api/services/drive/model/File;

    .line 129
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->JSON:Lcom/sonymobile/scan3d/storageservice/network/ContentType;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/network/ContentType;->toMimeString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/api/services/drive/model/File;->setMimeType(Ljava/lang/String;)Lcom/google/api/services/drive/model/File;

    .line 132
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mContext:Ljava/lang/ref/WeakReference;

    invoke-virtual {v3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    .line 133
    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "encryption_keys_v1.json"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 134
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->writeKey(Ljava/io/OutputStream;)V

    .line 136
    new-instance v2, Lcom/google/api/client/http/FileContent;

    const-string v3, "application/json"

    invoke-direct {v2, v3, v1}, Lcom/google/api/client/http/FileContent;-><init>(Ljava/lang/String;Ljava/io/File;)V

    .line 138
    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->mDriveService:Lcom/google/api/services/drive/Drive;

    invoke-virtual {v3}, Lcom/google/api/services/drive/Drive;->files()Lcom/google/api/services/drive/Drive$Files;

    move-result-object v3

    invoke-virtual {v3, v0, v2}, Lcom/google/api/services/drive/Drive$Files;->create(Lcom/google/api/services/drive/model/File;Lcom/google/api/client/http/AbstractInputStreamContent;)Lcom/google/api/services/drive/Drive$Files$Create;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/api/services/drive/Drive$Files$Create;->execute()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/api/services/drive/model/File;

    .line 140
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    if-nez v1, :cond_0

    .line 141
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Failed to delete temp file."

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    :cond_0
    invoke-virtual {v0}, Lcom/google/api/services/drive/model/File;->getId()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method private upload()Lcom/google/android/gms/tasks/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 125
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$rf6d9vb0GXCVS6RTRZoPted-hQI;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$rf6d9vb0GXCVS6RTRZoPted-hQI;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)V

    invoke-static {v0, v1}, Lcom/google/android/gms/tasks/Tasks;->call(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Callable;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getRunningTask()Lcom/google/android/gms/tasks/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/android/gms/tasks/Task<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 74
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->exists()Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;->getExecutor()Ljava/util/concurrent/Executor;

    move-result-object v1

    new-instance v2, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$zudg14Ztjj6O-jJaa8aQVAzdAp4;

    invoke-direct {v2, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/-$$Lambda$DriveActions$KeyCheckExecution$zudg14Ztjj6O-jJaa8aQVAzdAp4;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;)V

    invoke-virtual {v0, v1, v2}, Lcom/google/android/gms/tasks/Task;->continueWithTask(Ljava/util/concurrent/Executor;Lcom/google/android/gms/tasks/Continuation;)Lcom/google/android/gms/tasks/Task;

    move-result-object v0

    return-object v0
.end method
