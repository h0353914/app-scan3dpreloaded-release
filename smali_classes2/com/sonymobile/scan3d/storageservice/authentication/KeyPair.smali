.class public Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
.super Ljava/lang/Object;
.source "KeyPair.java"


# static fields
.field private static final ENCRYPTION_KEY:Ljava/lang/String; = "encryption_key"

.field private static final SIGNATURE_SECRET:Ljava/lang/String; = "signature_secret"


# instance fields
.field private final mEncryptionKey:Ljava/lang/String;

.field private final mSignatureSecretKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    .line 47
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    return-void
.end method

.method static from(Lorg/json/JSONObject;)Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    .locals 2

    :try_start_0
    const-string v0, "encryption_key"

    .line 136
    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "signature_secret"

    .line 137
    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 138
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    invoke-direct {v1, v0, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 140
    :catch_0
    new-instance p0, Ljava/lang/RuntimeException;

    const-string v0, "Could not construct the json object"

    invoke-direct {p0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static newKeyPair()Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;
    .locals 3

    .line 123
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->generateRandomKey()Ljava/lang/String;

    move-result-object v0

    .line 124
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->generateRandomKey()Ljava/lang/String;

    move-result-object v1

    .line 125
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    invoke-direct {v2, v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 109
    instance-of v0, p1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 110
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    .line 111
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    iget-object v2, p1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    invoke-static {v0, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    iget-object p1, p1, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    .line 112
    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method public getEncryptionKey()Ljava/lang/String;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    return-object v0
.end method

.method public getEncryptionKeyDecoded()[B
    .locals 2

    .line 65
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public getSignatureKey()Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    return-object v0
.end method

.method public getSignatureKeyDecoded()[B
    .locals 2

    .line 83
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v0

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x2

    .line 104
    new-array v0, v0, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method toJson()Lorg/json/JSONObject;
    .locals 3

    .line 93
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "encryption_key"

    .line 94
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mEncryptionKey:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v1, "signature_secret"

    .line 95
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->mSignatureSecretKey:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    .line 98
    :catch_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Could not create json object."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
