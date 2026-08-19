.class public Lcom/sonymobile/scan3d/storageservice/authentication/DriveActionsUtil;
.super Ljava/lang/Object;
.source "DriveActionsUtil.java"


# static fields
.field private static sCustomDriveActions:Lcom/sonymobile/scan3d/storageservice/authentication/CustomDriveActions;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getGoogleDrive(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/api/services/drive/Drive;
    .locals 2

    const-string v0, "https://www.googleapis.com/auth/drive.appdata"

    .line 64
    invoke-static {v0}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->usingOAuth2(Landroid/content/Context;Ljava/util/Collection;)Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    move-result-object p0

    .line 65
    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getAccount()Landroid/accounts/Account;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;->setSelectedAccount(Landroid/accounts/Account;)Lcom/google/api/client/googleapis/extensions/android/gms/auth/GoogleAccountCredential;

    .line 67
    new-instance p1, Lcom/google/api/services/drive/Drive$Builder;

    invoke-static {}, Lcom/google/api/client/extensions/android/http/AndroidHttp;->newCompatibleTransport()Lcom/google/api/client/http/HttpTransport;

    move-result-object v0

    new-instance v1, Lcom/google/api/client/json/gson/GsonFactory;

    invoke-direct {v1}, Lcom/google/api/client/json/gson/GsonFactory;-><init>()V

    invoke-direct {p1, v0, v1, p0}, Lcom/google/api/services/drive/Drive$Builder;-><init>(Lcom/google/api/client/http/HttpTransport;Lcom/google/api/client/json/JsonFactory;Lcom/google/api/client/http/HttpRequestInitializer;)V

    const p0, 0x7f10005c

    .line 68
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Lcom/google/api/services/drive/Drive$Builder;->setApplicationName(Ljava/lang/String;)Lcom/google/api/services/drive/Drive$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/api/services/drive/Drive$Builder;->build()Lcom/google/api/services/drive/Drive;

    move-result-object p0

    return-object p0
.end method

.method public static getKeysExecuteWait(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/concurrent/ExecutionException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 47
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActionsUtil;->sCustomDriveActions:Lcom/sonymobile/scan3d/storageservice/authentication/CustomDriveActions;

    if-nez v0, :cond_0

    .line 48
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;

    move-result-object p0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;->executeWait()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    return-object p0

    .line 50
    :cond_0
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/CustomDriveActions;->getKeys()Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object p0

    return-object p0
.end method

.method public static setCustomDriveActions(Lcom/sonymobile/scan3d/storageservice/authentication/CustomDriveActions;)V
    .locals 0

    .line 34
    sput-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActionsUtil;->sCustomDriveActions:Lcom/sonymobile/scan3d/storageservice/authentication/CustomDriveActions;

    return-void
.end method
