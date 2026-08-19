.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;
.super Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;
.source "FaceMimicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SaveVideoTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask<",
        "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/net/Uri;",
        ">;"
    }
.end annotation


# instance fields
.field private final mDest:Ljava/io/File;

.field private final mListener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;

.field private final mSource:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Ljava/io/File;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;",
            ">;",
            "Ljava/io/File;",
            "Ljava/io/File;",
            "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;",
            ")V"
        }
    .end annotation

    .line 612
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 613
    iput-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mSource:Ljava/io/File;

    .line 614
    iput-object p3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mDest:Ljava/io/File;

    .line 615
    iput-object p4, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mListener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;[Ljava/lang/Void;)Landroid/net/Uri;
    .locals 1
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 621
    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mSource:Ljava/io/File;

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mDest:Ljava/io/File;

    invoke-static {p2, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->moveFile(Ljava/io/File;Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 622
    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mDest:Ljava/io/File;

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/utils/MediaStoreUtil;->insertVideo(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected bridge synthetic doInBackground(Landroid/app/Activity;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 584
    check-cast p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    check-cast p2, [Ljava/lang/Void;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->doInBackground(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;[Ljava/lang/Void;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Landroid/app/Activity;Ljava/lang/Object;)V
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 584
    check-cast p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    check-cast p2, Landroid/net/Uri;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->onPostExecute(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V

    return-void
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 631
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SaveVideoTask;->mListener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;

    invoke-interface {v0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$VideoRecorder$RecordingListener;->onRecordingStored(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V

    return-void
.end method
