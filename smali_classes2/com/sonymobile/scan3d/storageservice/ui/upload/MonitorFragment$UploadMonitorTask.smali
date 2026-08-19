.class Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;
.super Landroid/os/AsyncTask;
.source "MonitorFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UploadMonitorTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/storageservice/provider/Upload;",
        ">;"
    }
.end annotation


# instance fields
.field private mFragment:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;)V
    .locals 1

    .line 129
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 130
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;->mFragment:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;
    .locals 2

    .line 136
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    if-eqz p1, :cond_0

    .line 139
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 142
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;)Landroid/net/Uri;

    move-result-object v1

    .line 143
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->getServiceProvider()Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;

    move-result-object p1

    .line 142
    invoke-static {v0, v1, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->getUpload(Landroid/content/Context;Landroid/net/Uri;Lcom/sonymobile/scan3d/storageservice/ui/upload/ServiceProvider;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 117
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;->doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/storageservice/provider/Upload;)V
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;->mFragment:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;

    if-eqz v0, :cond_0

    .line 153
    invoke-static {v0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment;Lcom/sonymobile/scan3d/storageservice/provider/Upload;)V

    :cond_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 117
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/MonitorFragment$UploadMonitorTask;->onPostExecute(Lcom/sonymobile/scan3d/storageservice/provider/Upload;)V

    return-void
.end method
