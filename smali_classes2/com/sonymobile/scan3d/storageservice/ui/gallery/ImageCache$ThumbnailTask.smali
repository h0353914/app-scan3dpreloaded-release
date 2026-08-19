.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;
.super Landroid/os/AsyncTask;
.source "ImageCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ThumbnailTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final mBitmap:Landroid/graphics/Bitmap;

.field private final mKey:I

.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;ILandroid/graphics/Bitmap;)V
    .locals 0

    .line 78
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 79
    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->mKey:I

    .line 80
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->mBitmap:Landroid/graphics/Bitmap;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;
    .locals 3

    .line 88
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    int-to-float p1, p1

    const/high16 v0, 0x41000000    # 8.0f

    div-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    .line 89
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->mBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 90
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->mBitmap:Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    invoke-static {v1, p1, v0, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 60
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->doInBackground([Ljava/lang/Void;)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/graphics/Bitmap;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 99
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;)Landroid/util/LruCache;

    move-result-object v0

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->mKey:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 103
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_1
    :goto_0
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 60
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->onPostExecute(Landroid/graphics/Bitmap;)V

    return-void
.end method
