.class Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;
.super Ljava/lang/Object;
.source "CryptoFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;,
        Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$PasswordCrypto;
    }
.end annotation


# static fields
.field private static final ENCRYPTION_BITS:I = 0x100

.field private static final RANDOM_GENERATOR_ALGORITHM:Ljava/lang/String; = "SHA1PRNG"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static generateRandomKey()Ljava/lang/String;
    .locals 2

    .line 253
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->newSecretKey()Ljavax/crypto/SecretKey;

    move-result-object v0

    .line 254
    invoke-interface {v0}, Ljavax/crypto/SecretKey;->getEncoded()[B

    move-result-object v0

    const/16 v1, 0x8

    .line 255
    invoke-static {v0, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static getPasswordCrypto()Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 233
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$PasswordCrypto;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$PasswordCrypto;-><init>(Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$1;)V

    return-object v0
.end method

.method static getServerKeyCrypto(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;
    .locals 2

    .line 243
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$1;)V

    return-object v0
.end method

.method private static newSecretKey()Ljavax/crypto/SecretKey;
    .locals 3

    :try_start_0
    const-string v0, "AES"

    .line 265
    invoke-static {v0}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    const-string v1, "SHA1PRNG"

    .line 266
    invoke-static {v1}, Ljava/security/SecureRandom;->getInstance(Ljava/lang/String;)Ljava/security/SecureRandom;

    move-result-object v1

    const/16 v2, 0x100

    .line 267
    invoke-virtual {v0, v2, v1}, Ljavax/crypto/KeyGenerator;->init(ILjava/security/SecureRandom;)V

    .line 268
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    const/4 v0, 0x0

    return-object v0
.end method
