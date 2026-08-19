.class public Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;
.super Ljava/lang/Object;
.source "ImageCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$ThumbnailTask;
    }
.end annotation


# static fields
.field private static final CACHE_RATIO:F = 0.4f

.field private static final KB:I = 0x400

.field private static final MAX_MEMORY_RATIO:I = 0xa

.field private static final THUMBNAIL_CACHE_RATIO:F = 0.6f

.field private static final THUMBNAIL_SCALE_FACTOR:I = 0x8


# instance fields
.field private final mCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mCaching:Z

.field private final mThumbnailCache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/Integer;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Runtime;->maxMemory()J

    move-result-wide v0

    const-wide/16 v2, 0x2800

    div-long/2addr v0, v2

    long-to-int v0, v0

    int-to-float v0, v0

    const v1, 0x3ecccccd    # 0.4f

    mul-float/2addr v1, v0

    .line 114
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    const v2, 0x3f19999a    # 0.6f

    mul-float/2addr v0, v2

    .line 115
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    .line 117
    new-instance v2, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;

    invoke-direct {v2, p0, v1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$1;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;I)V

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCache:Landroid/util/LruCache;

    .line 138
    new-instance v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$2;

    invoke-direct {v1, p0, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache$2;-><init>(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;I)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mThumbnailCache:Landroid/util/LruCache;

    const/4 v0, 0x1

    .line 148
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCaching:Z

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;)Z
    .locals 0

    .line 15
    iget-boolean p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCaching:Z

    return p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;)Landroid/util/LruCache;
    .locals 0

    .line 15
    iget-object p0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mThumbnailCache:Landroid/util/LruCache;

    return-object p0
.end method


# virtual methods
.method public add(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 2

    .line 188
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 190
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mThumbnailCache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public getThumbnail(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mThumbnailCache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    return-object p1
.end method

.method public isCached(Ljava/lang/String;)Z
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public start()V
    .locals 1

    const/4 v0, 0x1

    .line 157
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCaching:Z

    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x0

    .line 166
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCaching:Z

    .line 167
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mCache:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    .line 168
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/ImageCache;->mThumbnailCache:Landroid/util/LruCache;

    invoke-virtual {v0}, Landroid/util/LruCache;->evictAll()V

    return-void
.end method
