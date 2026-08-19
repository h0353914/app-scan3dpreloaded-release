.class public Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;
.super Ljava/lang/Object;
.source "Encryption.java"


# static fields
.field private static final ENCRYPTION_ALGORITHM:Ljava/lang/String; = "AES/CBC/PKCS5Padding"

.field private static final IV_LENGTH:I = 0x10

.field private static sRand:Ljava/security/SecureRandom;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static cipherInputStream(Ljava/io/InputStream;[B)Ljavax/crypto/CipherInputStream;
    .locals 3
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidEncryptionKeyException;
        }
    .end annotation

    const/16 v0, 0x10

    .line 67
    new-array v1, v0, [B

    .line 68
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-eq v2, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/4 v0, 0x2

    .line 72
    invoke-static {v0, p1, v1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->initCipher(I[B[B)Ljavax/crypto/Cipher;

    move-result-object p1

    .line 73
    new-instance v0, Ljavax/crypto/CipherInputStream;

    invoke-direct {v0, p0, p1}, Ljavax/crypto/CipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V

    return-object v0
.end method

.method public static cipherOutputStream(Ljava/io/OutputStream;[B)Ljavax/crypto/CipherOutputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidEncryptionKeyException;
        }
    .end annotation

    const/16 v0, 0x10

    .line 42
    new-array v0, v0, [B

    .line 43
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->sRand:Ljava/security/SecureRandom;

    if-nez v1, :cond_0

    .line 44
    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    sput-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->sRand:Ljava/security/SecureRandom;

    .line 46
    :cond_0
    sget-object v1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->sRand:Ljava/security/SecureRandom;

    invoke-virtual {v1, v0}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 47
    invoke-virtual {p0, v0}, Ljava/io/OutputStream;->write([B)V

    .line 48
    invoke-virtual {p0}, Ljava/io/OutputStream;->flush()V

    const/4 v1, 0x1

    .line 49
    invoke-static {v1, p1, v0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->initCipher(I[B[B)Ljavax/crypto/Cipher;

    move-result-object p1

    .line 50
    new-instance v0, Ljavax/crypto/CipherOutputStream;

    invoke-direct {v0, p0, p1}, Ljavax/crypto/CipherOutputStream;-><init>(Ljava/io/OutputStream;Ljavax/crypto/Cipher;)V

    return-object v0
.end method

.method private static initCipher(I[B[B)Ljavax/crypto/Cipher;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;,
            Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidEncryptionKeyException;
        }
    .end annotation

    const-string v0, "AES/CBC/PKCS5Padding"

    .line 89
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    .line 91
    :try_start_0
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    const-string v2, "AES"

    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 92
    new-instance p1, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {p1, p2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 93
    invoke-virtual {v0, p0, v1, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p0

    .line 95
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "Could not create SecretKeySpec: "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 96
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidEncryptionKeyException;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/InvalidEncryptionKeyException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
