.class final Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;
.super Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;
.source "SyncHubApi.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->download(Landroid/content/Context;Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;)Lcom/sonymobile/scan3d/storageservice/network/IRestExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor<",
        "Ljava/lang/Object;",
        "Ljava/io/File;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1154
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/AbstractRestExecutor;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic getNetworkRequest(Ljava/lang/String;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1154
    check-cast p2, Ljava/lang/Void;

    invoke-virtual {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;->getNetworkRequest(Ljava/lang/String;Ljava/lang/Void;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    move-result-object p1

    return-object p1
.end method

.method public getNetworkRequest(Ljava/lang/String;Ljava/lang/Void;[Ljava/lang/Object;)Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;
    .locals 0

    .line 1239
    new-instance p2, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;

    sget-object p3, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;->GET:Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;

    invoke-direct {p2, p1, p3}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;-><init>(Ljava/lang/String;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest$Method;)V

    return-object p2
.end method

.method public getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/io/File;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1158
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 1159
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;->getInput()[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v1, v1, v2

    check-cast v1, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;

    .line 1160
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;->getInput()[Ljava/lang/Object;

    move-result-object v3

    const/4 v4, 0x1

    aget-object v3, v3, v4

    check-cast v3, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;

    .line 1164
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getStatusCode()I

    move-result v5

    const/4 v6, 0x0

    const/16 v7, 0xc8

    if-ne v5, v7, :cond_e

    .line 1165
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getHeaders()Ljava/util/Map;

    move-result-object v5

    const-string v7, "x-amz-meta-signature"

    .line 1171
    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "x-amz-meta-signature"

    .line 1172
    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    .line 1173
    invoke-interface {v7, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    goto :goto_0

    :cond_0
    move-object v7, v6

    :goto_0
    const-string v8, "x-amz-meta-content-id"

    .line 1175
    invoke-interface {v5, v8}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    const-string v8, "x-amz-meta-content-id"

    .line 1176
    invoke-interface {v5, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    goto :goto_1

    :cond_1
    move-object v8, v6

    :goto_1
    const-string v9, "x-amz-meta-checksum"

    .line 1179
    invoke-interface {v5, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    const-string v9, "x-amz-meta-checksum"

    .line 1180
    invoke-interface {v5, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    invoke-interface {v9, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    goto :goto_2

    :cond_2
    move-object v9, v6

    :goto_2
    const-string v10, "x-amz-meta-file-name"

    .line 1183
    invoke-interface {v5, v10}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_3

    const-string v10, "x-amz-meta-file-name"

    .line 1184
    invoke-interface {v5, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    goto :goto_3

    :cond_3
    move-object v5, v6

    :goto_3
    if-eqz v7, :cond_e

    if-eqz v8, :cond_e

    if-eqz v5, :cond_e

    .line 1189
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$CloudContent;->isEncrypted()Z

    move-result v1

    .line 1190
    invoke-static {v0, v8, v5}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getScanFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    .line 1192
    :try_start_0
    invoke-interface {p1}, Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;->getInputStream()Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    if-eqz v1, :cond_8

    .line 1198
    :try_start_1
    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getTempDirectory(Landroid/content/Context;)Ljava/io/File;

    move-result-object v1

    .line 1199
    new-instance v8, Ljava/io/File;

    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v8, v1, v10}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1201
    invoke-static {v8, p1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->saveToDisc(Ljava/io/File;Ljava/io/InputStream;)V

    .line 1202
    invoke-static {v8}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object v10

    .line 1203
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getSignatureKeyDecoded()[B

    move-result-object v11

    invoke-static {v8, v11}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getSignature(Ljava/io/File;[B)Ljava/lang/String;

    move-result-object v11
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_5
    .catchall {:try_start_1 .. :try_end_1} :catchall_6

    .line 1206
    :try_start_2
    new-instance v12, Ljava/io/FileInputStream;

    invoke-direct {v12, v8}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 1208
    :try_start_3
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getEncryptionKeyDecoded()[B

    move-result-object v3

    .line 1207
    invoke-static {v12, v3}, Lcom/sonymobile/scan3d/storageservice/network/synchublib/Encryption;->cipherInputStream(Ljava/io/InputStream;[B)Ljavax/crypto/CipherInputStream;

    move-result-object v3
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 1209
    :try_start_4
    invoke-static {v0, v3, v5}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->saveToDiskEncrypted(Landroid/content/Context;Ljava/io/InputStream;Ljava/io/File;)V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz v3, :cond_4

    .line 1210
    :try_start_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :cond_4
    :try_start_6
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 1212
    :try_start_7
    invoke-static {v1, v4}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z
    :try_end_7
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_5
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    move v0, v2

    goto :goto_8

    :catchall_0
    move-exception v0

    move-object v7, v6

    goto :goto_4

    :catch_0
    move-exception v0

    .line 1206
    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception v7

    move-object v13, v7

    move-object v7, v0

    move-object v0, v13

    :goto_4
    if-eqz v3, :cond_6

    if-eqz v7, :cond_5

    .line 1210
    :try_start_9
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    goto :goto_5

    :catch_1
    move-exception v3

    :try_start_a
    invoke-virtual {v7, v3}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_5

    :cond_5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    :cond_6
    :goto_5
    throw v0
    :try_end_a
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception v0

    move-object v3, v6

    goto :goto_6

    :catch_2
    move-exception v0

    .line 1206
    :try_start_b
    throw v0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception v3

    move-object v13, v3

    move-object v3, v0

    move-object v0, v13

    :goto_6
    if-eqz v3, :cond_7

    .line 1210
    :try_start_c
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V
    :try_end_c
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    goto :goto_7

    :catch_3
    move-exception v7

    :try_start_d
    invoke-virtual {v3, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_7

    :cond_7
    invoke-virtual {v12}, Ljava/io/FileInputStream;->close()V

    :goto_7
    throw v0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_4

    :catchall_4
    move-exception v0

    .line 1212
    :try_start_e
    invoke-static {v1, v4}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    .line 1213
    throw v0

    .line 1215
    :cond_8
    invoke-static {v5, p1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->saveToDisc(Ljava/io/File;Ljava/io/InputStream;)V

    .line 1216
    invoke-static {v5}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getChecksum(Ljava/io/File;)Ljava/lang/String;

    move-result-object v10

    .line 1217
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/storageservice/authentication/KeyPair;->getSignatureKeyDecoded()[B

    move-result-object v0

    invoke-static {v5, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getSignature(Ljava/io/File;[B)Ljava/lang/String;

    move-result-object v11
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_5
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    move v0, v4

    .line 1222
    :goto_8
    :try_start_f
    invoke-static {v9, v10}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_9

    .line 1223
    invoke-static {v7, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0
    :try_end_f
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_4
    .catchall {:try_start_f .. :try_end_f} :catchall_5

    if-eqz v0, :cond_9

    move v2, v4

    :cond_9
    if-eqz p1, :cond_a

    .line 1225
    :try_start_10
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    :cond_a
    if-nez v2, :cond_f

    .line 1227
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result p1

    if-eqz p1, :cond_f

    .line 1228
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$000()Ljava/lang/String;

    move-result-object p1

    const-string v0, "Deleted file."

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    :catchall_5
    move-exception v1

    move v2, v0

    move-object v0, v1

    goto :goto_a

    :catch_4
    move-exception v1

    move v2, v0

    move-object v6, v1

    goto :goto_9

    :catchall_6
    move-exception v0

    goto :goto_a

    :catch_5
    move-exception v0

    move-object v6, v0

    .line 1192
    :goto_9
    :try_start_11
    throw v6
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_6

    :goto_a
    if-eqz p1, :cond_c

    if-eqz v6, :cond_b

    .line 1225
    :try_start_12
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_12
    .catch Ljava/lang/Throwable; {:try_start_12 .. :try_end_12} :catch_6
    .catchall {:try_start_12 .. :try_end_12} :catchall_7

    goto :goto_b

    :catch_6
    move-exception p1

    :try_start_13
    invoke-virtual {v6, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_b

    :cond_b
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_c
    :goto_b
    throw v0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_7

    :catchall_7
    move-exception p1

    if-nez v2, :cond_d

    .line 1227
    invoke-virtual {v5}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 1228
    invoke-static {}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Deleted file."

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1231
    :cond_d
    throw p1

    :cond_e
    move-object v5, v6

    :cond_f
    :goto_c
    return-object v5
.end method

.method public bridge synthetic getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1154
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/SyncHubApi$7;->getOutput(Lcom/sonymobile/scan3d/storageservice/network/IHttpResponse;)Ljava/io/File;

    move-result-object p1

    return-object p1
.end method
