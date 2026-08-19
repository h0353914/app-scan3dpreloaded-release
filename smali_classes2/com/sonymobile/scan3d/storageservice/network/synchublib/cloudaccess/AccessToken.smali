.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;
.super Ljava/lang/Object;
.source "AccessToken.java"


# instance fields
.field private mExpirationTime:J

.field private mRefreshToken:Ljava/lang/String;

.field private mTokenData:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mTokenData:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mRefreshToken:Ljava/lang/String;

    .line 24
    iput-wide p3, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mExpirationTime:J

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 60
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mTokenData:Ljava/lang/String;

    if-nez v0, :cond_0

    goto :goto_0

    .line 63
    :cond_0
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->getTokenData()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public getExpirationTime()J
    .locals 2

    .line 38
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mExpirationTime:J

    return-wide v0
.end method

.method public getRefreshToken()Ljava/lang/String;
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mRefreshToken:Ljava/lang/String;

    return-object v0
.end method

.method public getTokenData()Ljava/lang/String;
    .locals 1

    .line 31
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mTokenData:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mTokenData:Ljava/lang/String;

    invoke-static {v0}, Ljava/util/Objects;->hashCode(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isValid()Z
    .locals 4

    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/sonymobile/scan3d/storageservice/network/synchublib/cloudaccess/AccessToken;->mExpirationTime:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
