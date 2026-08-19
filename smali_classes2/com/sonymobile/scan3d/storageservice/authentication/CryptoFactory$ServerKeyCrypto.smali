.class Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;
.super Ljava/lang/Object;
.source "CryptoFactory.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ServerKeyCrypto"
.end annotation


# static fields
.field private static final IV_SIZE:I = 0x10


# instance fields
.field private mAesKey:[B


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 157
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const/16 v0, 0x8

    invoke-static {p1, v0}, Landroid/util/Base64;->decode([BI)[B

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;->mAesKey:[B

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$1;)V
    .locals 0

    .line 138
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method private static concatenate([B[B)[B
    .locals 3

    .line 194
    array-length v0, p0

    array-length v1, p1

    add-int/2addr v0, v1

    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    .line 195
    array-length p0, p0

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, p0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private static getEncoding([B)[B
    .locals 4

    .line 218
    array-length v0, p0

    const/16 v1, 0x10

    sub-int/2addr v0, v1

    new-array v0, v0, [B

    .line 219
    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {p0, v1, v0, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v0
.end method

.method private static getIv([B)[B
    .locals 3

    const/16 v0, 0x10

    .line 206
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 207
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method


# virtual methods
.method public decrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/16 v0, 0xa

    .line 176
    invoke-static {p1, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    .line 177
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;->getIv([B)[B

    move-result-object v0

    .line 178
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;->getEncoding([B)[B

    move-result-object p1

    .line 179
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;->mAesKey:[B

    const-string v3, "AES"

    invoke-direct {v1, v2, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    const-string v2, "AES/CBC/PKCS5Padding"

    .line 180
    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    .line 181
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v0, 0x2

    .line 182
    invoke-virtual {v2, v0, v1, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 183
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public encrypt(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    const/16 v0, 0x10

    .line 162
    new-array v0, v0, [B

    .line 163
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    .line 164
    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    const-string v1, "AES/CBC/PKCS5Padding"

    .line 165
    invoke-static {v1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v1

    .line 166
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;->mAesKey:[B

    const-string v4, "AES"

    invoke-direct {v2, v3, v4}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 167
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v4, 0x1

    .line 168
    invoke-virtual {v1, v4, v2, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 169
    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v1, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    .line 170
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory$ServerKeyCrypto;->concatenate([B[B)[B

    move-result-object p1

    const/16 v0, 0xa

    invoke-static {p1, v0}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    .line 171
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
