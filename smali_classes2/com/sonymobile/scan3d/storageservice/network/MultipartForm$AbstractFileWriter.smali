.class abstract Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;
.super Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;
.source "MultipartForm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "AbstractFileWriter"
.end annotation


# static fields
.field private static final MAX_BUFFER_SIZE:I = 0x4000


# instance fields
.field private final mAddMime:Z

.field private final mFieldName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Z)V
    .locals 0

    .line 143
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;-><init>()V

    .line 144
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->mFieldName:Ljava/lang/String;

    .line 145
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->mAddMime:Z

    return-void
.end method

.method private static getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 231
    invoke-static {p0}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 233
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return-object p0
.end method

.method private writeFormFileHeader(Ljava/io/DataOutputStream;Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Content-Disposition: form-data; name=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->mFieldName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\"; filename=\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 214
    invoke-static {p2}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    .line 215
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->mAddMime:Z

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Content-Transfer-Encoding: binary\r\n"

    .line 216
    invoke-virtual {p1, v0}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 217
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Content-Type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\r\n"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "\r\n"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p2, "Content-Transfer-Encoding: binary\r\n\r\n"

    .line 219
    invoke-virtual {p1, p2}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    :goto_0
    return-void
.end method


# virtual methods
.method abstract getFileName(Landroid/content/Context;)Ljava/lang/String;
.end method

.method abstract getInputStream(Landroid/content/Context;)Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public onWrite(Landroid/content/Context;Ljava/io/DataOutputStream;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;JJ)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 167
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->getFileName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 172
    invoke-direct {p0, p2, v0}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->writeFormFileHeader(Ljava/io/DataOutputStream;Ljava/lang/String;)V

    const/16 v0, 0x4000

    .line 174
    new-array v0, v0, [B

    .line 177
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;->getInputStream(Landroid/content/Context;)Ljava/io/InputStream;

    move-result-object p1

    const/4 v1, 0x0

    .line 179
    :goto_0
    :try_start_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_1

    .line 186
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v3, 0x0

    .line 187
    invoke-virtual {p2, v0, v3, v2}, Ljava/io/DataOutputStream;->write([BII)V

    int-to-long v2, v2

    add-long/2addr p6, v2

    .line 191
    invoke-virtual {p3, p4, p5, p6, p7}, Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;->reportNetworkProgress(JJ)V

    goto :goto_0

    .line 193
    :cond_0
    new-instance p2, Ljava/lang/RuntimeException;

    const-string p3, "The multi part upload request was interrupted."

    invoke-direct {p2, p3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    if-eqz p1, :cond_2

    .line 197
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_2
    const-string p1, "\r\n"

    .line 198
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    return-wide p6

    :catchall_0
    move-exception p2

    goto :goto_1

    :catch_0
    move-exception p2

    move-object v1, p2

    .line 177
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    if-eqz p1, :cond_4

    if-eqz v1, :cond_3

    .line 197
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    :catch_1
    move-exception p1

    invoke-virtual {v1, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_3
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_4
    :goto_2
    throw p2

    .line 169
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Could not extract a file name."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
