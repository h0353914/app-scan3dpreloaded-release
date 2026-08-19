.class Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;
.super Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;
.source "FaceMimicActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SavePictureTask"
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

.field private final mListener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;

.field private final mSnapshot:Landroid/graphics/Bitmap;


# direct methods
.method constructor <init>(Ljava/util/concurrent/atomic/AtomicReference;Landroid/graphics/Bitmap;Ljava/io/File;Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;",
            ">;",
            "Landroid/graphics/Bitmap;",
            "Ljava/io/File;",
            "Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;",
            ")V"
        }
    .end annotation

    .line 552
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/sfmc/NonLeakyAsyncTask;-><init>(Ljava/util/concurrent/atomic/AtomicReference;)V

    .line 553
    iput-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mSnapshot:Landroid/graphics/Bitmap;

    .line 554
    iput-object p4, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mListener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;

    .line 555
    iput-object p3, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mDest:Ljava/io/File;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;[Ljava/lang/Void;)Landroid/net/Uri;
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .line 561
    iget-object p2, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mSnapshot:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mDest:Ljava/io/File;

    invoke-static {p2, v0}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->access$100(Landroid/graphics/Bitmap;Ljava/io/File;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 562
    new-instance p2, Landroid/content/ContentValues;

    const/4 v0, 0x3

    invoke-direct {p2, v0}, Landroid/content/ContentValues;-><init>(I)V

    const-string v0, "title"

    .line 563
    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mDest:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "mime_type"

    const-string v1, "image/jpeg"

    .line 564
    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "_data"

    .line 565
    iget-object v1, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mDest:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 567
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    sget-object v0, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 568
    invoke-virtual {p1, v0, p2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

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

    .line 524
    check-cast p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    check-cast p2, [Ljava/lang/Void;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->doInBackground(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;[Ljava/lang/Void;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic onPostExecute(Landroid/app/Activity;Ljava/lang/Object;)V
    .locals 0
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 524
    check-cast p1, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;

    check-cast p2, Landroid/net/Uri;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->onPostExecute(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V

    return-void
.end method

.method protected onPostExecute(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V
    .locals 1
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 577
    iget-object v0, p0, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$SavePictureTask;->mListener:Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;

    invoke-interface {v0, p1, p2}, Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity$PictureSaver$SaveListener;->onPictureSaved(Lcom/sonymobile/scan3d/sfmc/FaceMimicActivity;Landroid/net/Uri;)V

    return-void
.end method
