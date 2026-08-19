.class Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;
.super Landroid/os/AsyncTask;
.source "ZipResourceManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ZipResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LoadZipResourceTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Lcom/android/vending/expansion/zipfile/ZipResourceFile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/ZipResourceManager;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/ZipResourceManager;)V
    .locals 0

    .line 172
    iput-object p1, p0, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;->this$0:Lcom/sonymobile/scan3d/ZipResourceManager;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/ZipResourceManager;Lcom/sonymobile/scan3d/ZipResourceManager$1;)V
    .locals 0

    .line 172
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;-><init>(Lcom/sonymobile/scan3d/ZipResourceManager;)V

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Lcom/android/vending/expansion/zipfile/ZipResourceFile;
    .locals 3

    .line 177
    :try_start_0
    new-instance v0, Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    const/4 v1, 0x0

    aget-object p1, p1, v1

    invoke-direct {v0, p1}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 179
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Failed to load expansion file: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 172
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;->doInBackground([Ljava/lang/String;)Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/android/vending/expansion/zipfile/ZipResourceFile;)V
    .locals 1

    .line 186
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->access$100()Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->access$100()Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 187
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/ZipResourceManager;->access$102(Lcom/android/vending/expansion/zipfile/ZipResourceFile;)Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    .line 188
    iget-object p1, p0, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;->this$0:Lcom/sonymobile/scan3d/ZipResourceManager;

    invoke-static {p1}, Lcom/sonymobile/scan3d/ZipResourceManager;->access$200(Lcom/sonymobile/scan3d/ZipResourceManager;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;

    .line 189
    invoke-interface {v0}, Lcom/sonymobile/scan3d/ZipResourceManager$ZipResourceFileListener;->onZipResourceLoaded()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 172
    check-cast p1, Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/ZipResourceManager$LoadZipResourceTask;->onPostExecute(Lcom/android/vending/expansion/zipfile/ZipResourceFile;)V

    return-void
.end method
