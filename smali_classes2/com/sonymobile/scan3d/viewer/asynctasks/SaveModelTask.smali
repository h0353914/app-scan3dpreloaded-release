.class public Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;
.super Landroid/os/AsyncTask;
.source "SaveModelTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;",
        ">;"
    }
.end annotation


# instance fields
.field private final mContext:Landroid/content/Context;

.field private mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Ljava/lang/String;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mContext:Landroid/content/Context;

    .line 42
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copy()Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 43
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mName:Ljava/lang/String;

    return-void
.end method

.method private createDateStampedFileName()Ljava/lang/String;
    .locals 3

    .line 83
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyyMMdd_HHmmss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 84
    new-instance v1, Ljava/util/Date;

    invoke-direct {v1}, Ljava/util/Date;-><init>()V

    .line 85
    invoke-virtual {v0, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    .line 87
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/results"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/3DCreator_"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".obj.zip"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;
    .locals 3

    .line 48
    new-instance p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;-><init>()V

    .line 49
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mName:Ljava/lang/String;

    iput-object v1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->name:Ljava/lang/String;

    .line 52
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->createDateStampedFileName()Ljava/lang/String;

    move-result-object v1

    .line 53
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v2, v1, v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->exportZip(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-object v1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->path:Ljava/lang/String;

    .line 54
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getScanType()I

    move-result v0

    iput v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->scanType:I

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 27
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;

    move-result-object p1

    return-object p1
.end method

.method protected onCancelled(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V
    .locals 0

    .line 73
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    const/4 p1, 0x0

    .line 74
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-void
.end method

.method protected bridge synthetic onCancelled(Ljava/lang/Object;)V
    .locals 0

    .line 27
    check-cast p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->onCancelled(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V

    return-void
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V
    .locals 4

    .line 60
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    const/4 v0, 0x0

    .line 61
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 62
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->path:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 63
    new-instance v0, Ljava/io/File;

    iget-object v1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->path:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 64
    new-instance v1, Landroid/content/ContentValues;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/content/ContentValues;-><init>(I)V

    const-string v2, "name"

    .line 65
    iget-object v3, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->name:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "scan_type"

    .line 66
    iget p1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;->scanType:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 67
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->mContext:Landroid/content/Context;

    invoke-static {p1, v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->storeFile(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 27
    check-cast p1, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask;->onPostExecute(Lcom/sonymobile/scan3d/viewer/asynctasks/SaveModelTask$Result;)V

    return-void
.end method
