.class Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;
.super Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;
.source "MultipartForm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FormTextFieldWriter"
.end annotation


# instance fields
.field private final mAddMime:Z

.field private final mField:Ljava/lang/String;

.field private final mValue:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 91
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormWriter;-><init>()V

    .line 92
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mField:Ljava/lang/String;

    .line 93
    iput-object p2, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mValue:Ljava/lang/String;

    .line 94
    iput-boolean p3, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mAddMime:Z

    return-void
.end method


# virtual methods
.method public onWrite(Landroid/content/Context;Ljava/io/DataOutputStream;Lcom/sonymobile/scan3d/storageservice/network/NetworkRequest;JJ)J
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Content-Disposition: form-data; name=\""

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mField:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\""

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\r\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 106
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mAddMime:Z

    if-eqz p1, :cond_0

    const-string p1, "Content-Type: text/plain; charset=utf-8\r\n\r\n"

    .line 107
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    .line 108
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mValue:Ljava/lang/String;

    sget-object p3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->write([B)V

    const-string p1, "\r\n"

    .line 109
    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    goto :goto_0

    .line 111
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\r\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p3, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FormTextFieldWriter;->mValue:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\r\n"

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/io/DataOutputStream;->writeBytes(Ljava/lang/String;)V

    :goto_0
    return-wide p6
.end method

.method public size(Landroid/content/Context;)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method
