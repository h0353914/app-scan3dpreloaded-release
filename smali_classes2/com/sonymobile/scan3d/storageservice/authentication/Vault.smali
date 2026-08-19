.class public final Lcom/sonymobile/scan3d/storageservice/authentication/Vault;
.super Ljava/lang/Object;
.source "Vault.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;,
        Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;
    }
.end annotation


# static fields
.field private static final DIGEST_SHA1:Ljava/lang/String; = "sha1"

.field static final FILE_NAME_ENCRYPTION_KEY:Ljava/lang/String; = "encryption_keys_v1.json"

.field private static final KEY_PASSWORD_SECRET:Ljava/lang/String; = "password"

.field private static final PASSWORD_PREFERENCE_FILE:Ljava/lang/String; = "password_preferences"

.field private static final PREVIEW_FILE_JPEG:Ljava/lang/String; = "preview.jpeg"

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.storageservice.authentication.Vault"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 177
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 509
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->copy(Ljava/io/InputStream;)Ljava/io/InputStream;

    move-result-object p0

    .line 510
    invoke-static {p0}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v0

    const/4 v1, 0x0

    .line 511
    :try_start_0
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    move-result p0

    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 512
    :goto_0
    invoke-interface {v0, p0}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    .line 514
    invoke-interface {v0}, Ljava/nio/channels/ReadableByteChannel;->close()V

    :cond_1
    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    move-exception p0

    move-object v1, p0

    .line 510
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    if-eqz v0, :cond_3

    if-eqz v1, :cond_2

    .line 514
    :try_start_2
    invoke-interface {v0}, Ljava/nio/channels/ReadableByteChannel;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_2
    invoke-interface {v0}, Ljava/nio/channels/ReadableByteChannel;->close()V

    :cond_3
    :goto_2
    throw p0
.end method

.method public static decrypt(Landroid/content/Context;Ljava/io/File;Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 291
    new-instance v0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;-><init>()V

    .line 294
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p1, p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setInputFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x0

    invoke-virtual {v0, p0, p1}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setOutputFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->run()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 301
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    return-void

    .line 298
    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Could not copy decrypted file to buffer."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    .line 301
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    .line 302
    throw p0
.end method

.method public static decrypt(Landroid/content/Context;Ljava/io/File;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 313
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->decrypt(Ljava/io/File;Ljava/lang/String;)[B

    move-result-object p0

    return-object p0
.end method

.method static decrypt(Ljava/io/File;Ljava/lang/String;)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 424
    new-instance v0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;-><init>()V

    .line 427
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p1}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setInputFile(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 428
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setOutputBuffer(Ljava/lang/String;)V

    .line 430
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->run()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 431
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->getOutputBuffer()Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 432
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ByteBufferInputStream;-><init>(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 433
    :try_start_1
    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 434
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 439
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    return-object p0

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p0

    .line 432
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    if-eqz p0, :cond_0

    .line 434
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_1

    :catch_1
    move-exception v1

    :try_start_5
    invoke-virtual {p0, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :goto_1
    throw p1

    .line 436
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Could not copy decrypted file to buffer."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception p0

    .line 439
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    .line 440
    throw p0
.end method

.method public static decryptAsStream(Landroid/content/Context;Ljava/io/File;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 325
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->decrypt(Landroid/content/Context;Ljava/io/File;)[B

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public static encryptForCloud(Landroid/content/Context;Ljava/io/File;Ljava/io/File;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 279
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2, p3, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->encryptForCloud(Ljava/io/File;Ljava/io/File;[BLjava/lang/String;)V

    return-void
.end method

.method static encryptForCloud(Ljava/io/File;Ljava/io/File;[BLjava/lang/String;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 400
    new-instance v0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;-><init>()V

    .line 403
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p3}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setInputFile(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    .line 404
    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setOutputBuffer(Ljava/lang/String;)V

    .line 406
    new-instance p3, Ljava/io/FileOutputStream;

    invoke-direct {p3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 407
    :try_start_1
    invoke-static {p3, p2}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->cipherOutputStream(Ljava/io/OutputStream;[B)Ljavax/crypto/CipherOutputStream;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 408
    :try_start_2
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->stream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 409
    :try_start_3
    invoke-static {p2, p1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz p2, :cond_0

    .line 410
    :try_start_4
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_0
    if-eqz p1, :cond_1

    :try_start_5
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    :cond_1
    :try_start_6
    invoke-virtual {p3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_5

    .line 412
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    return-void

    :catchall_0
    move-exception v1

    move-object v2, p0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 406
    :try_start_7
    throw v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :catchall_1
    move-exception v2

    move-object v3, v2

    move-object v2, v1

    move-object v1, v3

    :goto_0
    if-eqz p2, :cond_3

    if-eqz v2, :cond_2

    .line 410
    :try_start_8
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    goto :goto_1

    :catch_1
    move-exception p2

    :try_start_9
    invoke-virtual {v2, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_3
    :goto_1
    throw v1
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    :catchall_2
    move-exception p2

    move-object v1, p0

    goto :goto_2

    :catch_2
    move-exception p2

    .line 406
    :try_start_a
    throw p2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    :catchall_3
    move-exception v1

    move-object v3, v1

    move-object v1, p2

    move-object p2, v3

    :goto_2
    if-eqz p1, :cond_5

    if-eqz v1, :cond_4

    .line 410
    :try_start_b
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    goto :goto_3

    :catch_3
    move-exception p1

    :try_start_c
    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_3

    :cond_4
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    :cond_5
    :goto_3
    throw p2
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_4
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :catchall_4
    move-exception p1

    goto :goto_4

    :catch_4
    move-exception p0

    .line 406
    :try_start_d
    throw p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :goto_4
    if-eqz p0, :cond_6

    .line 410
    :try_start_e
    invoke-virtual {p3}, Ljava/io/FileOutputStream;->close()V
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_5
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    goto :goto_5

    :catch_5
    move-exception p2

    :try_start_f
    invoke-virtual {p0, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_5

    :cond_6
    invoke-virtual {p3}, Ljava/io/FileOutputStream;->close()V

    :goto_5
    throw p1
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    :catchall_5
    move-exception p0

    .line 412
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    .line 413
    throw p0
.end method

.method public static encryptWithServerKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 265
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->getServerKeyCrypto(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;

    move-result-object p0

    .line 266
    invoke-interface {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static extract(Landroid/content/Context;Ljava/io/File;)Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    new-instance v0, Ljava/util/zip/ZipInputStream;

    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v0, v1}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    const/4 p1, 0x0

    .line 204
    :try_start_0
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1

    move-object v2, p1

    :goto_0
    if-eqz v1, :cond_1

    if-nez v2, :cond_1

    .line 207
    invoke-virtual {v1}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v1

    .line 208
    sget-object v3, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Found in zip file: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "preview.jpeg"

    .line 210
    invoke-virtual {v3, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 211
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v1

    move-object v2, v1

    .line 213
    :cond_0
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    goto :goto_0

    .line 215
    :cond_1
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->close()V

    if-eqz v2, :cond_3

    .line 218
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getSha1UniqueIdentifier()Ljava/lang/String;

    move-result-object v0

    .line 219
    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getResultsDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p0

    .line 220
    new-instance v1, Ljava/io/File;

    const-string v3, "preview.jpeg"

    invoke-direct {v1, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 222
    new-instance p0, Ljava/io/ByteArrayInputStream;

    invoke-direct {p0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    .line 223
    :try_start_1
    invoke-static {v1, p0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->saveToDisc(Ljava/io/File;Ljava/io/InputStream;)V

    .line 224
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;

    invoke-direct {v2, v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault$ExtractionResult;-><init>(Ljava/lang/String;Ljava/io/File;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 225
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    move-object p1, v2

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 222
    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    if-eqz p1, :cond_2

    .line 225
    :try_start_3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_2

    :catch_1
    move-exception p0

    invoke-virtual {p1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_2
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :goto_2
    throw v0

    .line 227
    :cond_3
    sget-object p0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->TAG:Ljava/lang/String;

    const-string v0, "Preview file is missing"

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    return-object p1

    :catchall_1
    move-exception p0

    goto :goto_4

    :catch_2
    move-exception p0

    move-object p1, p0

    .line 203
    :try_start_4
    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_4
    if-eqz p1, :cond_4

    .line 215
    :try_start_5
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    invoke-virtual {p1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_5

    :cond_4
    invoke-virtual {v0}, Ljava/util/zip/ZipInputStream;->close()V

    :goto_5
    throw p0
.end method

.method static generateKeyFile(Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/InputStream;
    .locals 2

    .line 463
    new-instance v0, Ljava/io/ByteArrayInputStream;

    .line 464
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->toJson()Lorg/json/JSONObject;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0
.end method

.method public static getChecksum(Ljava/io/File;)Ljava/lang/String;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 338
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    const-string p0, "sha1"

    .line 339
    invoke-static {p0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p0

    const/16 v2, 0x400

    .line 340
    new-array v2, v2, [B

    .line 343
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/FileInputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    const/4 v4, 0x0

    .line 344
    invoke-virtual {p0, v2, v4, v3}, Ljava/security/MessageDigest;->update([BII)V

    goto :goto_0

    .line 346
    :cond_0
    invoke-virtual {p0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0

    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->toHexString([B)Ljava/lang/String;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 347
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_3

    :catchall_0
    move-exception p0

    move-object v2, v0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 338
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v2

    move-object v5, v2

    move-object v2, p0

    move-object p0, v5

    :goto_1
    if-eqz v2, :cond_1

    .line 347
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    :catch_1
    move-exception v1

    :try_start_5
    invoke-virtual {v2, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_1
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V

    :goto_2
    throw p0
    :try_end_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    move-object p0, v0

    :catch_3
    :goto_3
    if-eqz p0, :cond_2

    .line 350
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_2
    return-object v0
.end method

.method private static getDigest([B)[B
    .locals 1

    :try_start_0
    const-string v0, "sha1"

    .line 490
    invoke-static {v0}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v0

    .line 491
    invoke-virtual {v0, p0}, Ljava/security/MessageDigest;->update([B)V

    .line 492
    invoke-virtual {v0}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p0
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method public static getPassword(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 188
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/Config;->encrypt(Landroid/content/Context;)Z

    move-result v0

    const-string v1, "password"

    invoke-static {p0, v0, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static declared-synchronized getPassword(Landroid/content/Context;ZLjava/lang/String;)Ljava/lang/String;
    .locals 4

    const-class v0, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;

    monitor-enter v0

    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 531
    :try_start_0
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->getPasswordCrypto()Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;

    move-result-object p1

    const-string v2, "password_preferences"

    const/4 v3, 0x0

    .line 533
    invoke-virtual {p0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    .line 534
    invoke-interface {p0, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 537
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/CryptoFactory;->generateRandomKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->encrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 538
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    .line 539
    invoke-interface {p0, p2, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 540
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 542
    :cond_0
    invoke-interface {p1, v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Crypto;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_0

    .line 544
    :catch_0
    :try_start_1
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "Could not decrypt the key."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    monitor-exit v0

    throw p0

    .line 547
    :cond_1
    :goto_1
    monitor-exit v0

    return-object v1
.end method

.method public static getSha1UniqueIdentifier()Ljava/lang/String;
    .locals 2

    .line 238
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    .line 239
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getDigest([B)[B

    move-result-object v0

    .line 240
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->toHexString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getSignature(Ljava/io/File;[B)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 364
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/util/SignatureUtil;->getSignature(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    move-object p0, v0

    :goto_0
    if-eqz p0, :cond_1

    .line 366
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method public static saveToDiskEncrypted(Landroid/content/Context;Ljava/io/InputStream;Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 252
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p2, p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->saveToDiskEncrypted(Ljava/io/InputStream;Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method

.method static saveToDiskEncrypted(Ljava/io/InputStream;Ljava/io/File;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 377
    new-instance v0, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;-><init>()V

    .line 380
    :try_start_0
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->createBuffer(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setInputBuffer(Ljava/nio/ByteBuffer;Ljava/lang/String;)V

    .line 381
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0, p2}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->setOutputFile(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->run()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    .line 386
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    return-void

    .line 383
    :cond_0
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Could not save buffer to file."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    .line 386
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/SphinxZipCopy;->release()V

    .line 387
    throw p0
.end method

.method private static toHexString([B)Ljava/lang/String;
    .locals 5

    .line 474
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 475
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    add-int/lit16 v3, v3, 0x100

    const/16 v4, 0x10

    .line 476
    invoke-static {v3, v4}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 478
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static writeKey(Ljava/io/OutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 451
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->newKeyPair()Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->generateKeyFile(Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Ljava/io/InputStream;

    move-result-object v0

    .line 452
    :try_start_0
    invoke-static {v0, p0}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 453
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_0
    return-void

    :catchall_0
    move-exception p0

    const/4 v1, 0x0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 451
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception p0

    :goto_0
    if-eqz v0, :cond_2

    if-eqz v1, :cond_1

    .line 453
    :try_start_2
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    :cond_2
    :goto_1
    throw p0
.end method
