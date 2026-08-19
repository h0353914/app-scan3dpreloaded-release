.class public Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "ConnectionUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.utils.ConnectionUtils"

.field private static mCustomConnection:Lcom/sonymobile/scan3d/storageservice/utils/CustomConnection;


# instance fields
.field private mConnectivityManager:Landroid/net/ConnectivityManager;

.field private mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 68
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    const/4 v0, 0x0

    .line 56
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    const-string v0, "connectivity"

    .line 70
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    return-void
.end method

.method private addListener(Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;I)V
    .locals 6

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    if-nez v0, :cond_2

    .line 167
    new-instance v0, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    .line 175
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v1}, Landroid/net/ConnectivityManager;->getAllNetworks()[Landroid/net/Network;

    move-result-object v1

    .line 176
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    .line 177
    iget-object v5, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v5, v4}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    move-result-object v4

    .line 178
    invoke-virtual {v4, p2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 179
    invoke-virtual {v0, p2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    goto :goto_1

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 185
    :cond_1
    :goto_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v0

    invoke-virtual {p2, v0, p0}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 186
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    :cond_2
    return-void
.end method

.method private static hasDataConnection(Landroid/net/NetworkInfo;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p0, :cond_0

    .line 136
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->TAG:Ljava/lang/String;

    const-string v1, "No active network connection."

    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 140
    :cond_0
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Active network type: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isAvailable()Z

    move-result v1

    if-nez v1, :cond_1

    .line 143
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->TAG:Ljava/lang/String;

    const-string v1, "Active network is not available!"

    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 147
    :cond_1
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p0

    if-nez p0, :cond_2

    .line 148
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->TAG:Ljava/lang/String;

    const-string v1, "Active network is not connected!"

    invoke-static {p0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    .line 152
    :cond_2
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->TAG:Ljava/lang/String;

    const-string v0, "Active network is available and connected."

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x1

    return p0
.end method

.method public static isInternetConnectionAvailable(Landroid/content/Context;)Z
    .locals 1

    const-string v0, "connectivity"

    .line 208
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 209
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 210
    invoke-virtual {p0}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static isWifiConnection(Landroid/content/Context;)Z
    .locals 2

    const-string v0, "connectivity"

    .line 197
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/ConnectivityManager;

    .line 199
    invoke-virtual {p0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object p0

    .line 200
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasDataConnection(Landroid/net/NetworkInfo;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/net/NetworkInfo;->getType()I

    move-result p0

    if-ne p0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public static setCustomConnection(Lcom/sonymobile/scan3d/storageservice/utils/CustomConnection;)V
    .locals 0

    .line 79
    sput-object p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mCustomConnection:Lcom/sonymobile/scan3d/storageservice/utils/CustomConnection;

    return-void
.end method


# virtual methods
.method public addWifiListener(Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;)V
    .locals 1

    const/4 v0, 0x1

    .line 113
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->addListener(Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;I)V

    return-void
.end method

.method public hasDataConnection()Z
    .locals 1

    .line 88
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mCustomConnection:Lcom/sonymobile/scan3d/storageservice/utils/CustomConnection;

    if-eqz v0, :cond_0

    .line 89
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/storageservice/utils/CustomConnection;->hasDataConnection()Z

    move-result v0

    return v0

    .line 91
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 92
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasDataConnection(Landroid/net/NetworkInfo;)Z

    move-result v0

    return v0
.end method

.method public hasWifiConnection()Z
    .locals 3

    .line 101
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v0

    .line 102
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasDataConnection(Landroid/net/NetworkInfo;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 103
    invoke-virtual {v0}, Landroid/net/NetworkInfo;->getType()I

    move-result v0

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return v2
.end method

.method public onAvailable(Landroid/net/Network;)V
    .locals 0

    .line 219
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    if-eqz p1, :cond_0

    .line 221
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasWifiConnection()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 222
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;->onWifiConnected()V

    :cond_0
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 0

    .line 229
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    if-eqz p1, :cond_0

    .line 231
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->hasWifiConnection()Z

    move-result p1

    if-nez p1, :cond_0

    .line 232
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;->onWifiDisconnected()V

    :cond_0
    return-void
.end method

.method public removeListener()V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mConnectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v0, p0}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    const/4 v0, 0x0

    .line 123
    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils;->mListener:Lcom/sonymobile/scan3d/storageservice/utils/ConnectionUtils$ConnectionListener;

    :cond_0
    return-void
.end method
