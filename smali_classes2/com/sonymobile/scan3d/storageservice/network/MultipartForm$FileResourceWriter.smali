.class Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;
.super Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;
.source "MultipartForm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/network/MultipartForm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FileResourceWriter"
.end annotation


# instance fields
.field private final mResourceId:I


# direct methods
.method constructor <init>(ILjava/lang/String;Z)V
    .locals 0

    .line 303
    invoke-direct {p0, p2, p3}, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$AbstractFileWriter;-><init>(Ljava/lang/String;Z)V

    .line 304
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;->mResourceId:I

    return-void
.end method


# virtual methods
.method getFileName(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .line 309
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 310
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 311
    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;->mResourceId:I

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v0, v2}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    .line 312
    invoke-virtual {v0}, Landroid/util/TypedValue;->coerceToString()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 316
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 317
    array-length v0, p1

    sub-int/2addr v0, v2

    aget-object p1, p1, v0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method getInputStream(Landroid/content/Context;)Ljava/io/InputStream;
    .locals 1

    .line 324
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;->mResourceId:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p1

    return-object p1
.end method

.method size(Landroid/content/Context;)J
    .locals 4

    const-wide/16 v0, 0x0

    .line 331
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/network/MultipartForm$FileResourceWriter;->mResourceId:I

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    const/4 v2, 0x0

    .line 332
    :try_start_1
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    move-result v0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    int-to-long v0, v0

    if-eqz p1, :cond_2

    .line 333
    :try_start_2
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catchall_0
    move-exception v3

    goto :goto_0

    :catch_0
    move-exception v2

    .line 331
    :try_start_3
    throw v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    if-eqz p1, :cond_1

    if-eqz v2, :cond_0

    .line 333
    :try_start_4
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_1
    move-exception p1

    :try_start_5
    invoke-virtual {v2, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    :cond_1
    :goto_1
    throw v3
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    :catch_2
    :cond_2
    :goto_2
    return-wide v0
.end method
