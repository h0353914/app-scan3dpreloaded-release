.class public final enum Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;
.super Ljava/lang/Enum;
.source "AccountUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;,
        Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

.field private static final ACCOUNT_PREFS:Ljava/lang/String; = "account"

.field public static final GOOGLE_ACCOUNT_ID:Ljava/lang/String; = "accounts.google.com"

.field public static final enum INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

.field private static final KEY_ACCOUNT_NAME:Ljava/lang/String; = "ACCOUNT_NAME"

.field public static final KEY_AUTH_TOKEN:Ljava/lang/String; = "AUTH_TOKEN"

.field private static final KEY_DELETE_ONGOING:Ljava/lang/String; = "deleting_account"

.field private static final KEY_DISPLAY_NAME:Ljava/lang/String; = "DISPLAY_NAME"

.field private static final KEY_EXPIRY_TIME:Ljava/lang/String; = "EXPIRY_TIME"

.field private static final KEY_EXTRACT_ONGOING:Ljava/lang/String; = "extract_ongoing"

.field private static final KEY_SIGNIN_SESSION_ID:Ljava/lang/String; = "signin_session_id"

.field private static final KEY_UD_REFRESH_TOKEN:Ljava/lang/String; = "REFRESH_TOKEN"

.field private static final TAG:Ljava/lang/String;

.field private static mCustomAccountUtils:Lcom/sonymobile/scan3d/storageservice/authentication/CustomAccountUtils;


# instance fields
.field private mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 38
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    const-string v1, "INSTANCE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    const/4 v0, 0x1

    .line 33
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    .line 43
    const-class v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static acceptPostProcessing(Landroid/content/Context;)V
    .locals 2

    const v0, 0x7f1001e4

    .line 282
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 283
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 284
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const/4 v1, 0x1

    .line 285
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 286
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method static addAccount(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;Ljava/lang/String;)V
    .locals 2

    const-string v0, "account"

    const/4 v1, 0x0

    .line 535
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 536
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "ACCOUNT_NAME"

    .line 537
    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p1, "DISPLAY_NAME"

    .line 538
    invoke-interface {v0, p1, p3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 539
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 540
    invoke-static {p0, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->updateToken(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V

    return-void
.end method

.method public static generateSignInSessionID(Landroid/content/Context;)I
    .locals 3

    const-string v0, "account"

    const/4 v1, 0x0

    .line 310
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "signin_session_id"

    .line 312
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 313
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v1, "signin_session_id"

    add-int/lit8 v2, v0, 0x1

    .line 314
    invoke-interface {p0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    .line 315
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return v0
.end method

.method public static getAccountName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "ACCOUNT_NAME"

    .line 397
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getUserData(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    const/high16 v1, 0x10000000

    .line 470
    :try_start_0
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->getPasswordCrypto()Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;

    move-result-object v2

    const-string v3, "AUTH_TOKEN"

    .line 471
    invoke-static {p0, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getUserData(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 473
    invoke-interface {v2, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/network/NetworkException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    goto :goto_0

    :cond_0
    move-object v2, v0

    :goto_0
    if-eqz v2, :cond_1

    .line 476
    :try_start_1
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->isExpired(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 477
    :cond_1
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getRefreshToken(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 480
    invoke-static {p0, v3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->refreshAuthToken(Landroid/content/Context;Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;

    move-result-object v3

    .line 481
    invoke-interface {v3}, Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;->execute()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;

    if-eqz v3, :cond_3

    .line 484
    invoke-static {p0, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->updateToken(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V

    .line 485
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->getTokenData()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Lcom/sonymobile/scan3d/storageservice/network/NetworkException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :cond_2
    move-object v0, v2

    :cond_3
    :goto_1
    if-nez v0, :cond_5

    .line 495
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->removeAccount(Landroid/content/Context;)Z

    if-eqz p1, :cond_5

    .line 498
    new-instance p1, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;

    invoke-direct {p1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 499
    :goto_2
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 500
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_5

    :catchall_0
    move-exception v0

    goto :goto_3

    :catch_0
    move-object v0, v2

    goto :goto_4

    :catchall_1
    move-exception v2

    move-object v4, v2

    move-object v2, v0

    move-object v0, v4

    :goto_3
    if-nez v2, :cond_4

    .line 495
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->removeAccount(Landroid/content/Context;)Z

    if-eqz p1, :cond_4

    .line 498
    new-instance p1, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;

    invoke-direct {p1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 499
    invoke-virtual {p1, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 500
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 503
    :cond_4
    throw v0

    :catch_1
    :goto_4
    if-nez v0, :cond_5

    .line 495
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->removeAccount(Landroid/content/Context;)Z

    if-eqz p1, :cond_5

    .line 498
    new-instance p1, Landroid/content/Intent;

    const-class v2, Lcom/sonymobile/scan3d/storageservice/authentication/SigninActivity;

    invoke-direct {p1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_2

    .line 504
    :cond_5
    :goto_5
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->TAG:Ljava/lang/String;

    const-string p1, "getAuthToken() - end"

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static getAuthenticationToken(Landroid/content/Context;Z)Ljava/lang/String;
    .locals 1

    .line 451
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mCustomAccountUtils:Lcom/sonymobile/scan3d/storageservice/authentication/CustomAccountUtils;

    if-eqz v0, :cond_0

    .line 452
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/CustomAccountUtils;->getAuthToken()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 454
    :cond_0
    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getAuthToken(Landroid/content/Context;Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDisplayName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "DISPLAY_NAME"

    .line 387
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getUserData(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static getRefreshToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 368
    :try_start_0
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->getPasswordCrypto()Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;

    move-result-object v0

    const-string v1, "REFRESH_TOKEN"

    .line 369
    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getUserData(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 371
    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getUserData(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "account"

    const/4 v1, 0x0

    .line 428
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v0, 0x0

    .line 429
    invoke-interface {p0, p1, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static isDeleteOngoing(Landroid/content/Context;)Z
    .locals 2

    const-string v0, "account"

    const/4 v1, 0x0

    .line 340
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "deleting_account"

    .line 342
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method private static isExpired(Landroid/content/Context;)Z
    .locals 2

    const-string v0, "EXPIRY_TIME"

    .line 407
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->getUserData(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 411
    :try_start_0
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    .line 412
    new-instance p0, Ljava/util/Date;

    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0, v0}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 414
    :catch_0
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->TAG:Ljava/lang/String;

    const-string v0, "Could not parse expiry time."

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 p0, 0x1

    :goto_0
    return p0
.end method

.method public static isExtractDataOngoing(Landroid/content/Context;)Z
    .locals 2

    const-string v0, "account"

    const/4 v1, 0x0

    .line 296
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "extract_ongoing"

    .line 298
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isPostProcessAccepted(Landroid/content/Context;)Z
    .locals 2

    const v0, 0x7f1001e4

    .line 271
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 272
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const/4 v1, 0x0

    .line 273
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isSignedIn(Landroid/content/Context;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public static removeAccount(Landroid/content/Context;)Z
    .locals 5

    const-string v0, "account"

    const/4 v1, 0x0

    .line 241
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 242
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 244
    invoke-interface {v0}, Landroid/content/SharedPreferences;->getAll()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "signin_session_id"

    .line 246
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 247
    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_0

    .line 250
    :cond_1
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 252
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->startSession(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;

    move-result-object p0

    .line 254
    :try_start_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;->clearCredentials()V
    :try_end_0
    .catch Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSessionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x1

    .line 259
    :goto_1
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->endSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_3

    .line 257
    :catch_0
    :try_start_1
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->TAG:Ljava/lang/String;

    const-string v2, "Could not invalidate aws credentials."

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :goto_2
    return v1

    .line 259
    :goto_3
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->INSTANCE:Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;

    invoke-virtual {v1, p0}, Lcom/sonymobile/scan3d/storageservice/content/aws/Aws;->endSession(Lcom/sonymobile/scan3d/storageservice/content/aws/AwsSession;)V

    .line 260
    throw v0
.end method

.method public static setCustomAccountUtils(Lcom/sonymobile/scan3d/storageservice/authentication/CustomAccountUtils;)V
    .locals 0

    .line 438
    sput-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mCustomAccountUtils:Lcom/sonymobile/scan3d/storageservice/authentication/CustomAccountUtils;

    return-void
.end method

.method public static setDeleteOngoing(Landroid/content/Context;Z)V
    .locals 2

    const-string v0, "account"

    const/4 v1, 0x0

    .line 352
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 354
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "deleting_account"

    .line 355
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 356
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method public static setExtractDataOngoing(Landroid/content/Context;Z)V
    .locals 2

    const-string v0, "account"

    const/4 v1, 0x0

    .line 326
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 328
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "extract_ongoing"

    .line 329
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 330
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private static updateToken(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;)V
    .locals 4

    .line 515
    :try_start_0
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->getPasswordCrypto()Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;

    move-result-object v0

    const-string v1, "account"

    const/4 v2, 0x0

    .line 516
    invoke-virtual {p0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 517
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "REFRESH_TOKEN"

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->getRefreshToken()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "AUTH_TOKEN"

    .line 518
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->getTokenData()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "EXPIRY_TIME"

    .line 519
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->getExpirationTime()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catch_1
    move-exception p1

    .line 521
    :goto_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->removeAccount(Landroid/content/Context;)Z

    .line 522
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Account removed due to exception: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;
    .locals 1

    .line 33
    const-class v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;
    .locals 1

    .line 33
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;

    return-object v0
.end method


# virtual methods
.method public registerListener(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V
    .locals 2

    .line 204
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    if-nez v0, :cond_0

    .line 205
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$1;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    const-string v0, "account"

    const/4 v1, 0x0

    .line 207
    invoke-virtual {p1, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 209
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 212
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->addListener(Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V

    return-void
.end method

.method public unregisterListener(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    if-eqz v0, :cond_0

    .line 223
    invoke-virtual {v0, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->removeListener(Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$AccountListener;)V

    .line 225
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "account"

    const/4 v0, 0x0

    .line 226
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 228
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    invoke-interface {p1, p2}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    const/4 p1, 0x0

    .line 229
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils;->mInternalListener:Lcom/sonymobile/scan3d/storageservice/authentication/AccountUtils$InternalListener;

    :cond_0
    return-void
.end method
