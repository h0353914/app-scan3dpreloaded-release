.class Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;
.super Landroid/util/LruCache;
.source "ImageCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/util/LruCache<",
        "Ljava/lang/Integer;",
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;


# direct methods
.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;I)V
    .locals 0

    .line 117
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-direct {p0, p2}, Landroid/util/LruCache;-><init>(I)V

    return-void
.end method


# virtual methods
.method protected entryRemoved(ZLjava/lang/Integer;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    .locals 0

    if-eqz p1, :cond_0

    .line 132
    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;)Landroid/util/LruCache;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    .line 133
    new-instance p1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;

    iget-object p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;->this$0:Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    invoke-direct {p1, p4, p2, p3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;ILandroid/graphics/Bitmap;)V

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    return-void
.end method

.method protected bridge synthetic entryRemoved(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 117
    check-cast p2, Ljava/lang/Integer;

    check-cast p3, Landroid/graphics/Bitmap;

    check-cast p4, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;->entryRemoved(ZLjava/lang/Integer;Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method protected sizeOf(Ljava/lang/Integer;Landroid/graphics/Bitmap;)I
    .locals 0

    .line 124
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p1

    div-int/lit16 p1, p1, 0x400

    return p1
.end method

.method protected bridge synthetic sizeOf(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 117
    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1, p2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;->sizeOf(Ljava/lang/Integer;Landroid/graphics/Bitmap;)I

    move-result p1

    return p1
.end method
