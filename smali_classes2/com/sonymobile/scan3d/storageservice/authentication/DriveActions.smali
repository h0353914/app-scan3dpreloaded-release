.class public final Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;
.super Ljava/lang/Object;
.source "DriveActions.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;,
        Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;
    }
.end annotation


# static fields
.field private static final APP_DATA_FOLDER:Ljava/lang/String; = "appDataFolder"

.field private static final TAG:Ljava/lang/String; = "DriveActions"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 34
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static getKeys(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;",
            ">;"
        }
    .end annotation

    .line 230
    invoke-static {p0}, Lcom/google/android/gms/auth/api/signin/GoogleSignIn;->getLastSignedInAccount(Landroid/content/Context;)Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    move-result-object v0

    .line 231
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActionsUtil;->getGoogleDrive(Landroid/content/Context;Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)Lcom/google/api/services/drive/Drive;

    move-result-object p0

    const/4 v0, 0x0

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$GetKeyExecution;-><init>(Lcom/google/api/services/drive/Drive;Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$1;)V

    return-object v1
.end method

.method static handleDriveKey(Landroid/content/Context;Lcom/google/api/services/drive/Drive;)Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/google/api/services/drive/Drive;",
            ")",
            "Lcom/sonymobile/scan3d/storageservice/authentication/DriveAction<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 220
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$KeyCheckExecution;-><init>(Landroid/content/Context;Lcom/google/api/services/drive/Drive;Lcom/sonymobile/scan3d/storageservice/authentication/DriveActions$1;)V

    return-object v0
.end method
