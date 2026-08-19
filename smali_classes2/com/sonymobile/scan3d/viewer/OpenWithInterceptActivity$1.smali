.class Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;
.super Landroid/os/AsyncTask;
.source "OpenWithInterceptActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->startScanValidation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Landroid/net/Uri;",
        "Ljava/lang/Void;",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)V
    .locals 0

    .line 92
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method protected doInBackground([Landroid/net/Uri;)Landroid/net/Uri;
    .locals 11

    const/4 v0, 0x0

    .line 96
    aget-object p1, p1, v0

    const/4 v0, 0x0

    .line 97
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_2

    if-eqz v1, :cond_7

    .line 107
    :try_start_1
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-static {v2}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->access$000(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)Ljava/io/File;

    move-result-object v2

    .line 108
    invoke-static {v2, v1}, Lcom/sonymobile/scan3d/storageservice/network/StreamUtils;->saveToDisc(Ljava/io/File;Ljava/io/InputStream;)V

    .line 110
    invoke-static {v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->validScan3dFile(Ljava/io/File;)Z

    move-result v3
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_1

    if-eqz v1, :cond_0

    .line 132
    :try_start_2
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_2

    :cond_0
    return-object v0

    .line 115
    :cond_1
    :try_start_3
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-static {v3}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->access$100(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)Ljava/io/File;

    move-result-object v3

    .line 116
    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 120
    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    const-string v5, ""

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v9, 0x101

    move-object v6, v3

    invoke-static/range {v4 .. v9}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->insertFromFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Landroid/net/Uri;

    move-result-object v2

    if-nez v2, :cond_3

    .line 125
    sget-object v4, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Deleting scan file after failing to create record: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    move-result v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 125
    invoke-static {v4, v3}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    :cond_2
    move-object v2, v0

    :cond_3
    :goto_0
    if-eqz v1, :cond_4

    .line 132
    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_2

    :cond_4
    return-object v2

    :catchall_0
    move-exception v2

    move-object v3, v0

    goto :goto_1

    :catch_0
    move-exception v2

    .line 97
    :try_start_5
    throw v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :catchall_1
    move-exception v3

    move-object v10, v3

    move-object v3, v2

    move-object v2, v10

    :goto_1
    if-eqz v1, :cond_6

    if-eqz v3, :cond_5

    .line 132
    :try_start_6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    :catch_1
    move-exception v1

    :try_start_7
    invoke-virtual {v3, v1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_5
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_6
    :goto_2
    throw v2

    :cond_7
    if-eqz v1, :cond_8

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/lang/SecurityException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_3

    :catch_2
    move-exception v1

    .line 135
    sget-object v2, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Could not read "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "due to: "

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/SecurityException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :catch_3
    move-exception p1

    .line 133
    sget-object v1, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->TAG:Ljava/lang/String;

    const-string v2, "Exception when copying external file."

    invoke-static {v1, v2, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_8
    :goto_3
    return-object v0
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 92
    check-cast p1, [Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->doInBackground([Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/net/Uri;)V
    .locals 2

    if-nez p1, :cond_0

    .line 143
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f100362

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object p1

    .line 144
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 145
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->finish()V

    goto :goto_0

    .line 148
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->access$202(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;Landroid/net/Uri;)Landroid/net/Uri;

    .line 149
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->this$0:Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;

    invoke-static {p1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;->access$300(Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity;)V

    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 92
    check-cast p1, Landroid/net/Uri;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/OpenWithInterceptActivity$1;->onPostExecute(Landroid/net/Uri;)V

    return-void
.end method
