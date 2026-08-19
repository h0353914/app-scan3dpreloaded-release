.class public Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;
.super Ljava/lang/Object;
.source "AnimatedDrawableBackendImpl.java"

# interfaces
.implements Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableBackend;


# instance fields
.field private final mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

.field private final mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

.field private final mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

.field private final mDurationMs:I

.field private final mFrameDurationsMs:[I

.field private final mFrameInfos:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

.field private final mFrameTimestampsMs:[I

.field private final mRenderDstRect:Landroid/graphics/Rect;

.field private final mRenderSrcRect:Landroid/graphics/Rect;

.field private final mRenderedBounds:Landroid/graphics/Rect;

.field private mTempBitmap:Landroid/graphics/Bitmap;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;Landroid/graphics/Rect;)V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderSrcRect:Landroid/graphics/Rect;

    .line 40
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderDstRect:Landroid/graphics/Rect;

    .line 49
    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    .line 50
    iput-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

    .line 51
    invoke-virtual {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;->getImage()Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    .line 52
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getFrameDurations()[I

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameDurationsMs:[I

    .line 53
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameDurationsMs:[I

    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;->fixFrameDurations([I)V

    .line 54
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameDurationsMs:[I

    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;->getTotalDurationFromFrameDurations([I)I

    move-result p1

    iput p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mDurationMs:I

    .line 55
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameDurationsMs:[I

    invoke-virtual {p1, p2}, Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;->getFrameTimeStampsFromDurations([I)[I

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameTimestampsMs:[I

    .line 56
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-static {p1, p3}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->getBoundsToUse(Lcom/facebook/imagepipeline/animated/base/AnimatedImage;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    .line 57
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getFrameCount()I

    move-result p1

    new-array p1, p1, [Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameInfos:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    const/4 p1, 0x0

    .line 58
    :goto_0
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getFrameCount()I

    move-result p2

    if-ge p1, p2, :cond_0

    .line 59
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameInfos:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    iget-object p3, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {p3, p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getFrameInfo(I)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    move-result-object p3

    aput-object p3, p2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private declared-synchronized clearTempBitmap()V
    .locals 1

    monitor-enter p0

    .line 249
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 250
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    .line 251
    iput-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static getBoundsToUse(Lcom/facebook/imagepipeline/animated/base/AnimatedImage;Landroid/graphics/Rect;)Landroid/graphics/Rect;
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 65
    new-instance p1, Landroid/graphics/Rect;

    invoke-interface {p0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getWidth()I

    move-result v1

    invoke-interface {p0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getHeight()I

    move-result p0

    invoke-direct {p1, v0, v0, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object p1

    .line 67
    :cond_0
    new-instance v1, Landroid/graphics/Rect;

    .line 70
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-interface {p0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getWidth()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 71
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    invoke-interface {p0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getHeight()I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    invoke-direct {v1, v0, v0, v2, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    return-object v1
.end method

.method private declared-synchronized prepareTempBitmapForThisSize(II)V
    .locals 1

    monitor-enter p0

    .line 190
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    .line 191
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    if-lt v0, p1, :cond_0

    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    if-ge v0, p2, :cond_1

    .line 192
    :cond_0
    invoke-direct {p0}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->clearTempBitmap()V

    .line 194
    :cond_1
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_2

    .line 195
    sget-object v0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    .line 197
    :cond_2
    iget-object p1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 198
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private renderImageDoesNotSupportScaling(Landroid/graphics/Canvas;Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;)V
    .locals 5

    .line 224
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getWidth()I

    move-result v0

    .line 225
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getHeight()I

    move-result v1

    .line 226
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getXOffset()I

    move-result v2

    .line 227
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getYOffset()I

    move-result v3

    .line 228
    monitor-enter p0

    .line 229
    :try_start_0
    invoke-direct {p0, v0, v1}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->prepareTempBitmapForThisSize(II)V

    .line 230
    iget-object v4, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-interface {p2, v0, v1, v4}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->renderFrame(IILandroid/graphics/Bitmap;)V

    .line 233
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderSrcRect:Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-virtual {p2, v4, v4, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 234
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderDstRect:Landroid/graphics/Rect;

    invoke-virtual {p2, v4, v4, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 236
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    int-to-float p2, v2

    int-to-float v0, v3

    .line 237
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 238
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderSrcRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderDstRect:Landroid/graphics/Rect;

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 239
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 240
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private renderImageSupportsScaling(Landroid/graphics/Canvas;Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;)V
    .locals 8

    .line 201
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-double v0, v0

    iget-object v2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getWidth()I

    move-result v2

    int-to-double v2, v2

    div-double/2addr v0, v2

    .line 202
    iget-object v2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-double v2, v2

    iget-object v4, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v4}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getHeight()I

    move-result v4

    int-to-double v4, v4

    div-double/2addr v2, v4

    .line 204
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getWidth()I

    move-result v4

    int-to-double v4, v4

    mul-double/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Math;->round(D)J

    move-result-wide v4

    long-to-int v4, v4

    .line 205
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getHeight()I

    move-result v5

    int-to-double v5, v5

    mul-double/2addr v5, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->round(D)J

    move-result-wide v5

    long-to-int v5, v5

    .line 206
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getXOffset()I

    move-result v6

    int-to-double v6, v6

    mul-double/2addr v6, v0

    double-to-int v0, v6

    .line 207
    invoke-interface {p2}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->getYOffset()I

    move-result v1

    int-to-double v6, v1

    mul-double/2addr v6, v2

    double-to-int v1, v6

    .line 209
    monitor-enter p0

    .line 210
    :try_start_0
    iget-object v2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v2

    .line 211
    iget-object v3, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    .line 213
    invoke-direct {p0, v2, v3}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->prepareTempBitmapForThisSize(II)V

    .line 214
    iget-object v6, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-interface {p2, v4, v5, v6}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->renderFrame(IILandroid/graphics/Bitmap;)V

    .line 216
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderSrcRect:Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-virtual {p2, v4, v4, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 217
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderDstRect:Landroid/graphics/Rect;

    add-int/2addr v2, v0

    add-int/2addr v3, v1

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Rect;->set(IIII)V

    .line 219
    iget-object p2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderSrcRect:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderDstRect:Landroid/graphics/Rect;

    const/4 v2, 0x0

    invoke-virtual {p1, p2, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 220
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public declared-synchronized dropCaches()V
    .locals 1

    monitor-enter p0

    .line 245
    :try_start_0
    invoke-direct {p0}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->clearTempBitmap()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 246
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public forNewBounds(Landroid/graphics/Rect;)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableBackend;
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-static {v0, p1}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->getBoundsToUse(Lcom/facebook/imagepipeline/animated/base/AnimatedImage;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    move-result-object v0

    .line 143
    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p0

    .line 147
    :cond_0
    new-instance v0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;

    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    iget-object v2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

    invoke-direct {v0, v1, v2, p1}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;-><init>(Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;Landroid/graphics/Rect;)V

    return-object v0
.end method

.method public getAnimatedImageResult()Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

    return-object v0
.end method

.method public getDurationMs()I
    .locals 1

    .line 81
    iget v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mDurationMs:I

    return v0
.end method

.method public getDurationMsForFrame(I)I
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameDurationsMs:[I

    aget p1, v0, p1

    return p1
.end method

.method public getFrameCount()I
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getFrameCount()I

    move-result v0

    return v0
.end method

.method public getFrameForPreview()I
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;->getFrameForPreview()I

    move-result v0

    return v0
.end method

.method public getFrameForTimestampMs(I)I
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameTimestampsMs:[I

    invoke-virtual {v0, v1, p1}, Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;->getFrameForTimestampMs([II)I

    move-result p1

    return p1
.end method

.method public getFrameInfo(I)Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameInfos:[Lcom/facebook/imagepipeline/animated/base/AnimatedDrawableFrameInfo;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getHeight()I
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getHeight()I

    move-result v0

    return v0
.end method

.method public getLoopCount()I
    .locals 1

    .line 91
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getLoopCount()I

    move-result v0

    return v0
.end method

.method public declared-synchronized getMemoryUsage()I
    .locals 3

    monitor-enter p0

    const/4 v0, 0x0

    .line 156
    :try_start_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    .line 157
    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedDrawableUtil:Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;

    iget-object v2, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mTempBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v1, v2}, Lcom/facebook/imagepipeline/animated/util/AnimatedDrawableUtil;->getSizeOfBitmap(Landroid/graphics/Bitmap;)I

    move-result v1

    add-int/2addr v0, v1

    .line 159
    :cond_0
    iget-object v1, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getSizeInBytes()I

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/2addr v0, v1

    .line 160
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getPreDecodedFrame(I)Lcom/facebook/common/references/CloseableReference;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/facebook/common/references/CloseableReference<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation

    .line 165
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;->getDecodedFrame(I)Lcom/facebook/common/references/CloseableReference;

    move-result-object p1

    return-object p1
.end method

.method public getRenderedHeight()I
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    return v0
.end method

.method public getRenderedWidth()I
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mRenderedBounds:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    return v0
.end method

.method public getTimestampMsForFrame(I)I
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameTimestampsMs:[I

    array-length v0, v0

    invoke-static {p1, v0}, Lcom/facebook/common/internal/Preconditions;->checkElementIndex(II)I

    .line 127
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mFrameTimestampsMs:[I

    aget p1, v0, p1

    return p1
.end method

.method public getWidth()I
    .locals 1

    .line 96
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getWidth()I

    move-result v0

    return v0
.end method

.method public hasPreDecodedFrame(I)Z
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImageResult:Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;

    invoke-virtual {v0, p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageResult;->hasDecodedFrame(I)Z

    move-result p1

    return p1
.end method

.method public renderFrame(ILandroid/graphics/Canvas;)V
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v0, p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->getFrame(I)Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;

    move-result-object p1

    .line 177
    :try_start_0
    iget-object v0, p0, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->mAnimatedImage:Lcom/facebook/imagepipeline/animated/base/AnimatedImage;

    invoke-interface {v0}, Lcom/facebook/imagepipeline/animated/base/AnimatedImage;->doesRenderSupportScaling()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 178
    invoke-direct {p0, p2, p1}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->renderImageSupportsScaling(Landroid/graphics/Canvas;Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;)V

    goto :goto_0

    .line 180
    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/facebook/imagepipeline/animated/impl/AnimatedDrawableBackendImpl;->renderImageDoesNotSupportScaling(Landroid/graphics/Canvas;Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    :goto_0
    invoke-interface {p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->dispose()V

    return-void

    :catchall_0
    move-exception p2

    invoke-interface {p1}, Lcom/facebook/imagepipeline/animated/base/AnimatedImageFrame;->dispose()V

    .line 184
    throw p2
.end method
