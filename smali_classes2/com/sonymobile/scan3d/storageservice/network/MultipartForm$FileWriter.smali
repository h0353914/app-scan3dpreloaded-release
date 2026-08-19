.class Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;
.super Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;
.source "MultipartForm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileWriter"
.end annotation


# instance fields
.field private final mFile:Ljava/io/File;

.field private final mIsEncrypted:Z


# direct methods
.method constructor <init>(Ljava/io/File;Ljava/lang/String;ZZ)V
    .locals 0

    .line 263
    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;-><init>(Ljava/lang/String;Z)V

    .line 264
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mFile:Ljava/io/File;

    .line 265
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mIsEncrypted:Z

    return-void
.end method


# virtual methods
.method getFileName(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 270
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method getInputStream(Landroid/content/Context;)Ljava/io/InputStream;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 275
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mIsEncrypted:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mFile:Ljava/io/File;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->decryptAsStream(Landroid/content/Context;Ljava/io/File;)Ljava/io/InputStream;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/io/FileInputStream;

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mFile:Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    :goto_0
    return-object p1
.end method

.method size(Landroid/content/Context;)J
    .locals 2

    .line 281
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileWriter;->mFile:Ljava/io/File;

    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method
