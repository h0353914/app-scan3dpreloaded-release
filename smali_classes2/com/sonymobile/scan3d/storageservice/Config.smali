.class public final Lcom/sonymobile/scan3d/storageservice/Config;
.super Ljava/lang/Object;
.source "Config.java"


# static fields
.field public static final GOOGLE_PLAY_PACKAGE_NAME:Ljava/lang/String; = "com.android.vending"

.field private static final PATH_SEPARATOR:Ljava/lang/String; = "/"

.field private static final QUERY_EQUALS:Ljava/lang/String; = "="

.field private static final QUERY_SEPARATOR:Ljava/lang/String; = "&"

.field private static final QUERY_START:Ljava/lang/String; = "?"

.field private static final TEST_HIDE_GOOGLE_PLAY:Z = false

.field private static final WEBVIEWER_QUERY_TYPE:Ljava/lang/String; = "type"

.field private static mCustomConfig:Lcom/sonymobile/scan3d/storageservice/CustomConfig;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static customizePromotionsList(Landroid/content/Context;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;)V"
        }
    .end annotation

    .line 260
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 274
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->isGooglePlayEnabled(Landroid/content/Context;)Z

    move-result p0

    if-nez p0, :cond_1

    .line 275
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 276
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->isGooglePlayRequired()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 277
    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 281
    :cond_1
    invoke-interface {p1, v0}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public static encrypt(Landroid/content/Context;)Z
    .locals 1

    .line 90
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f050006

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method private static getApplicationInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ApplicationInfo;
    .locals 1

    .line 312
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static getGdprExecuteJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f100170

    .line 173
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPostProcessCognitoIdentityPool(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f10008c

    .line 120
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPostProcessExecuteJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f1001b0

    .line 162
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPostProcessInitJobSqsUrl(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f1001b1

    .line 151
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPostProcessLogBucket(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f1001b2

    .line 140
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getRevokeRefreshTokenUrl(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 208
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const v1, 0x7f100247

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 193
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/Config;->mCustomConfig:Lcom/sonymobile/scan3d/storageservice/CustomConfig;

    if-eqz v0, :cond_0

    .line 194
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/storageservice/CustomConfig;->getSyncHubServiceHost(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const v0, 0x7f1002bd

    .line 196
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getSynchubServerClientId(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const v0, 0x7f1002be

    .line 183
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getTokenScope(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    const-string v0, "audience:server:client_id:"

    .line 130
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->getSynchubServerClientId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getWebViewerShareUrl(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)Ljava/lang/String;
    .locals 2

    .line 220
    new-instance v0, Ljava/lang/StringBuilder;

    const v1, 0x7f10037a

    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p0, "/"

    .line 221
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 222
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "?"

    .line 223
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "type"

    .line 224
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "="

    .line 225
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable;->getShareType()Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;

    move-result-object p0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->getCloudContentType()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static isGooglePlayEnabled(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "com.android.vending"

    .line 291
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/Config;->getApplicationInfo(Landroid/content/Context;Ljava/lang/String;)Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 292
    iget-boolean p0, p0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isPostProcessEnabled(Landroid/content/Context;)Z
    .locals 1

    .line 110
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f05000a

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method public static isProviderEnabled(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 4

    .line 242
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object p0

    .line 243
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p0, v2

    .line 244
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static isSigninMandatory(Landroid/content/Context;)Z
    .locals 1

    .line 100
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f050007

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p0

    return p0
.end method

.method public static setCustomConfigImpl(Lcom/sonymobile/scan3d/storageservice/CustomConfig;)V
    .locals 0

    .line 80
    sput-object p0, Lcom/sonymobile/scan3d/storageservice/Config;->mCustomConfig:Lcom/sonymobile/scan3d/storageservice/CustomConfig;

    return-void
.end method
