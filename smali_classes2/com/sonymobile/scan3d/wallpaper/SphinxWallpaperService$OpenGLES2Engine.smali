.class Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;
.super Landroid/service/wallpaper/WallpaperService$Engine;
.source "SphinxWallpaperService.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;
.implements Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OpenGLES2Engine"
.end annotation


# static fields
.field private static final MAX_ABS_SPIN_SPEED:F = 0.9f


# instance fields
.field private mAnimationHelper:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

.field private mAnimator:Ljava/lang/Runnable;

.field private mBackground:Lcom/sonymobile/scan3d/ViewerBackground;

.field mCurrentRotation:F

.field private mDefaultRotationDirection:F
    .annotation build Landroidx/annotation/FloatRange;
        from = -1.0
        fromInclusive = true
        to = 1.0
        toInclusive = true
    .end annotation
.end field

.field private mGLThread:Lcom/sonymobile/scan3d/GLThread;

.field private mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

.field private mMainHandler:Landroid/os/Handler;

.field private mPreviousOffset:F

.field private mRandom:Ljava/util/Random;

.field private mSpinSpeed:F
    .annotation build Landroidx/annotation/FloatRange;
        from = -0.8999999761581421
        fromInclusive = true
        to = 0.8999999761581421
        toInclusive = true
    .end annotation
.end field

.field private mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

.field private mUpdatePending:Z

.field private mUri:Landroid/net/Uri;

.field private mUseMovement:Z

.field private mUseRigged:Z

.field private mViewM:[F

.field private mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

.field final synthetic this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;


# direct methods
.method private constructor <init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;)V
    .locals 0

    .line 88
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-direct {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;-><init>(Landroid/service/wallpaper/WallpaperService;)V

    const/4 p1, 0x0

    .line 113
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    const/4 p1, 0x0

    .line 136
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    const/high16 p1, 0x3f800000    # 1.0f

    .line 141
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mDefaultRotationDirection:F

    const/high16 p1, 0x3f000000    # 0.5f

    .line 144
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mPreviousOffset:F

    .line 151
    new-instance p1, Ljava/util/Random;

    invoke-direct {p1}, Ljava/util/Random;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mRandom:Ljava/util/Random;

    .line 156
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mMainHandler:Landroid/os/Handler;

    .line 161
    new-instance p1, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$JgHP5M2iF-55A1bZbf1qLXY4qDU;

    invoke-direct {p1, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$JgHP5M2iF-55A1bZbf1qLXY4qDU;-><init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimator:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$1;)V
    .locals 0

    .line 88
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;-><init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;)V

    return-void
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)Lcom/sonymobile/scan3d/GLThread;
    .locals 0

    .line 88
    iget-object p0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    return-object p0
.end method

.method private applySavedObjectPose()V
    .locals 6

    .line 446
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    .line 447
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_lw_pose"

    const-string v2, ""

    .line 448
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 449
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 451
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "view_mat"

    .line 453
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/16 v1, 0x10

    .line 454
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    const/4 v1, 0x0

    move v2, v1

    .line 455
    :goto_0
    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 456
    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v4

    double-to-float v4, v4

    aput v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 458
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    invoke-virtual {v0, v2, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setViewMatrix([FI)V

    .line 459
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private calculateSpin(F)V
    .locals 3

    const v0, 0x3ce38e39

    mul-float/2addr p1, v0

    .line 361
    iget v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    const/4 v1, 0x0

    cmpg-float v2, v0, v1

    if-gez v2, :cond_1

    cmpg-float v0, p1, v0

    if-ltz v0, :cond_0

    cmpl-float v0, p1, v1

    if-lez v0, :cond_3

    .line 363
    :cond_0
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->setSpinSpeed(F)V

    .line 364
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mDefaultRotationDirection:F

    goto :goto_0

    :cond_1
    cmpl-float v0, p1, v0

    if-gtz v0, :cond_2

    cmpg-float v0, p1, v1

    if-gez v0, :cond_3

    .line 367
    :cond_2
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->setSpinSpeed(F)V

    .line 368
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mDefaultRotationDirection:F

    :cond_3
    :goto_0
    return-void
.end method

.method private getDefaultModelUri()Landroid/net/Uri;
    .locals 7

    .line 283
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v0, "_id"

    const-string v2, "created"

    .line 284
    filled-new-array {v0, v2}, [Ljava/lang/String;

    move-result-object v3

    .line 285
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    const-string v6, "created DESC"

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 286
    :try_start_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 287
    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    int-to-long v3, v3

    invoke-static {v2, v3, v4}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 289
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_0
    return-object v1

    :catchall_0
    move-exception v2

    goto :goto_0

    :catch_0
    move-exception v1

    .line 285
    :try_start_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_0
    if-eqz v0, :cond_2

    if-eqz v1, :cond_1

    .line 289
    :try_start_2
    invoke-interface {v0}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_1
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_2
    :goto_1
    throw v2

    :cond_3
    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_4
    return-object v1
.end method

.method private initGLThread()V
    .locals 4

    .line 206
    new-instance v0, Lcom/sonymobile/scan3d/GLThread;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/GLThread;-><init>(Ljava/lang/Object;Lcom/sonymobile/scan3d/GLThread$Renderer;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    .line 207
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->getSurfaceHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    new-instance v1, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine$1;-><init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)V

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 223
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->start()V

    .line 225
    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/GLThread;Lcom/sonymobile/scan3d/viewer/SphanRenderer;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimationHelper:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    .line 226
    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/GLThread;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    return-void
.end method

.method private initZipModel()Z
    .locals 4

    .line 257
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->getDefaultModelUri()Landroid/net/Uri;

    move-result-object v0

    :goto_0
    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 263
    :cond_1
    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-static {v2, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 264
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getSyncState()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_3

    .line 265
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 267
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseRigged:Z

    if-eqz v1, :cond_2

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 268
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 270
    :cond_2
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v0

    .line 273
    :goto_1
    invoke-static {}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->access$200()Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    .line 274
    :try_start_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-virtual {v3}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v0, v3}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v1

    .line 275
    monitor-exit v2

    goto :goto_2

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_3
    :goto_2
    return v1
.end method

.method public static synthetic lambda$ckLpck5pHtkVQI2EH3exRJdYlJo(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->updateModel()V

    return-void
.end method

.method public static synthetic lambda$new$0(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)V
    .locals 4

    .line 162
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-eqz v0, :cond_0

    .line 163
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getNumAnimations()I

    move-result v0

    if-lez v0, :cond_0

    .line 165
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mRandom:Ljava/util/Random;

    invoke-virtual {v3, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(II)Z

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 167
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimator:Ljava/lang/Runnable;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public static synthetic lambda$rotate$1(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;F)V
    .locals 8

    .line 382
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    move v5, p1

    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->transform(FFFFFFF)V

    return-void
.end method

.method private loadSharedPrefs()V
    .locals 4

    .line 233
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 234
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v2, 0x7f1001fa

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 235
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUri:Landroid/net/Uri;

    .line 236
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v2, 0x7f1001f8

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseRigged:Z

    .line 237
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v3, 0x7f1001f7

    .line 238
    invoke-virtual {v1, v3}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget-object v3, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 239
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/ViewerBackground;->name()Ljava/lang/String;

    move-result-object v3

    .line 237
    invoke-interface {v0, v1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/ViewerBackground;

    move-result-object v1

    iput-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 240
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v3, 0x7f1001f9

    .line 241
    invoke-virtual {v1, v3}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseMovement:Z

    return-void
.end method

.method private pause()V
    .locals 2

    .line 420
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->onPause()V

    .line 421
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setOnDrawFrameListener(Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;)V

    .line 422
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseMovement:Z

    if-eqz v0, :cond_0

    .line 423
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->onPause()V

    goto :goto_0

    .line 425
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimationHelper:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->pause()V

    :goto_0
    return-void
.end method

.method private restart(Z)V
    .locals 1

    if-eqz p1, :cond_0

    .line 431
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$ckLpck5pHtkVQI2EH3exRJdYlJo;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$ckLpck5pHtkVQI2EH3exRJdYlJo;-><init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    .line 434
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->onResume()V

    .line 435
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseMovement:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result p1

    if-nez p1, :cond_1

    const/high16 p1, 0x3f800000    # 1.0f

    .line 436
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    .line 437
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->onResume()V

    .line 438
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setOnDrawFrameListener(Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;)V

    goto :goto_0

    .line 439
    :cond_1
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result p1

    if-nez p1, :cond_2

    const/4 p1, 0x0

    .line 440
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    .line 441
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimationHelper:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->resume()V

    :cond_2
    :goto_0
    return-void
.end method

.method private rotate(F)V
    .locals 2

    .line 382
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    new-instance v1, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$SphinxWallpaperService$OpenGLES2Engine$6aSPlKcNr2vzAhUEcwBjzgT4qkg;-><init>(Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;F)V

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/GLThread;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method private saveObjectPose()V
    .locals 5

    .line 466
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object v0

    .line 467
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    .line 468
    invoke-virtual {v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    .line 469
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v3, "view_mat"

    .line 471
    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "pref_lw_pose"

    .line 472
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 473
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private setSpinSpeed(F)V
    .locals 1

    const v0, 0x3f666666    # 0.9f

    .line 378
    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const v0, -0x4099999a    # -0.9f

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    return-void
.end method

.method private updateModel()V
    .locals 2

    .line 322
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimator:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 324
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 325
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextDestroyed()V

    .line 326
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->removeMeshes()V

    .line 327
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 328
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->initZipModel()Z

    .line 329
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->applySavedObjectPose()V

    .line 330
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextCreated()V

    .line 331
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 334
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 335
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimator:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/view/SurfaceHolder;)V
    .locals 1

    .line 174
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onCreate(Landroid/view/SurfaceHolder;)V

    .line 176
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->loadSharedPrefs()V

    const/high16 p1, 0x3f000000    # 0.5f

    .line 178
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mPreviousOffset:F

    const/4 p1, 0x0

    .line 179
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    .line 180
    new-instance p1, Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-direct {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 181
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/ViewerBackground;->ordinal()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 184
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p1

    .line 185
    invoke-interface {p1, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 187
    new-instance p1, Lcom/sonymobile/scan3d/viewer/GestureHandler;

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-direct {p1, v0, p0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    .line 190
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->initZipModel()Z

    .line 192
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->initGLThread()V

    .line 194
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->applySavedObjectPose()V

    .line 196
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->onResume()V

    .line 199
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 200
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimator:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 2

    .line 246
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimator:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 247
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 248
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 249
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestExitAndWait()V

    .line 250
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->release()V

    const/4 v0, 0x0

    .line 251
    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 252
    invoke-super {p0}, Landroid/service/wallpaper/WallpaperService$Engine;->onDestroy()V

    return-void
.end method

.method public final onDoubleTap()Z
    .locals 1

    .line 529
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 530
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    const/4 v0, 0x1

    return v0
.end method

.method public onDown()Z
    .locals 1

    .line 550
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onDown()Z

    move-result v0

    return v0
.end method

.method public onDrawFrameDelta(J)V
    .locals 11

    .line 295
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->getCurrentTilt()[F

    move-result-object v0

    .line 299
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    float-to-int v2, v1

    div-int/lit8 v2, v2, 0x3c

    .line 300
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    neg-float v1, v1

    const/high16 v3, 0x43b40000    # 360.0f

    mul-float/2addr v1, v3

    iget v4, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    add-float/2addr v1, v4

    float-to-int v1, v1

    div-int/lit8 v1, v1, 0x3c

    add-int/2addr v2, v1

    .line 302
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const v4, 0x3b357bfc

    const/4 v5, 0x5

    if-eq v1, v5, :cond_0

    int-to-float v1, v2

    .line 303
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mDefaultRotationDirection:F

    .line 304
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    cmpg-float v1, v1, v4

    if-gez v1, :cond_0

    const v4, 0x3c62dafb

    .line 309
    :cond_0
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    const v2, 0x3f7ae148    # 0.98f

    mul-float/2addr v1, v2

    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->setSpinSpeed(F)V

    long-to-float p1, p1

    .line 310
    iget p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mSpinSpeed:F

    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mDefaultRotationDirection:F

    mul-float/2addr v1, v4

    add-float/2addr p2, v1

    mul-float/2addr p1, p2

    .line 312
    iget p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    add-float/2addr p2, p1

    rem-float/2addr p2, v3

    iput p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    .line 314
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewM:[F

    const/4 p2, 0x0

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v1, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setViewMatrix([FI)V

    :cond_1
    const/4 p1, 0x1

    .line 315
    aget p1, v0, p1

    const/high16 v1, 0x42340000    # 45.0f

    mul-float/2addr p1, v1

    const v2, 0x3fc90fdb

    div-float v7, p1, v2

    .line 316
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mCurrentRotation:F

    aget p2, v0, p2

    mul-float/2addr p2, v1

    div-float/2addr p2, v2

    sub-float v8, p1, p2

    .line 317
    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-virtual/range {v3 .. v10}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->transform(FFFFFFF)V

    return-void
.end method

.method public final onFling(FF)Z
    .locals 2

    .line 542
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const v1, 0x44bb8000    # 1500.0f

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    .line 543
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onFling(FF)Z

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onMoveSingleTap(FF)Z
    .locals 1

    .line 522
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->touchDrag(FF)V

    .line 523
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    const/4 p1, 0x1

    return p1
.end method

.method public onOffsetsChanged(FFFFII)V
    .locals 0

    .line 342
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-eqz p2, :cond_2

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result p2

    if-nez p2, :cond_2

    .line 343
    iget p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mPreviousOffset:F

    const/4 p3, 0x0

    cmpg-float p2, p2, p3

    if-gez p2, :cond_0

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mPreviousOffset:F

    :cond_0
    const/high16 p2, 0x43340000    # 180.0f

    .line 344
    iget p4, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mPreviousOffset:F

    sub-float p5, p1, p4

    mul-float/2addr p5, p2

    .line 345
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseMovement:Z

    if-eqz p2, :cond_1

    cmpl-float p2, p4, p3

    if-eqz p2, :cond_1

    .line 346
    invoke-direct {p0, p5}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->calculateSpin(F)V

    goto :goto_0

    .line 348
    :cond_1
    invoke-direct {p0, p5}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->rotate(F)V

    .line 349
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    goto :goto_0

    .line 351
    :cond_2
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-eqz p2, :cond_3

    .line 352
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    .line 354
    :cond_3
    :goto_0
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mPreviousOffset:F

    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 3

    .line 481
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "pref_lw_pose"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 482
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->applySavedObjectPose()V

    goto :goto_0

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v1, 0x7f1001fa

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    .line 484
    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 485
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :cond_1
    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUri:Landroid/net/Uri;

    goto :goto_0

    .line 486
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v1, 0x7f1001f7

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 487
    sget-object v0, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 488
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/ViewerBackground;->name()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 487
    invoke-static {p1}, Lcom/sonymobile/scan3d/ViewerBackground;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/ViewerBackground;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    goto :goto_0

    .line 489
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v1, 0x7f1001f8

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_4

    .line 490
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseRigged:Z

    goto :goto_0

    .line 491
    :cond_4
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->this$0:Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;

    const v2, 0x7f1001f9

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 492
    invoke-interface {p1, p2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUseMovement:Z

    .line 496
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isVisible()Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_5

    .line 497
    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->restart(Z)V

    goto :goto_1

    .line 499
    :cond_5
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUpdatePending:Z

    :goto_1
    return-void

    :cond_6
    return-void
.end method

.method public final onSingleTap()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)V
    .locals 4

    .line 387
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    .line 388
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimationHelper:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->setEnableAnimation(Z)V

    .line 389
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 390
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->setSpinSpeed(F)V

    .line 391
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getNumAnimations()I

    move-result v0

    if-lez v0, :cond_1

    .line 395
    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mRandom:Ljava/util/Random;

    invoke-virtual {v3, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    invoke-virtual {v2, v1, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(II)Z

    goto :goto_0

    .line 398
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-ne v0, v2, :cond_1

    .line 399
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mAnimationHelper:Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->setEnableAnimation(Z)V

    .line 401
    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->isPreview()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-eqz v0, :cond_2

    .line 402
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGestureHandler:Lcom/sonymobile/scan3d/viewer/GestureHandler;

    invoke-virtual {v0, p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->handleEvent(Landroid/view/MotionEvent;)Z

    :cond_2
    return-void
.end method

.method public onTransform(FFFFFFF)Z
    .locals 8

    .line 514
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mViewerRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    neg-float v1, p1

    neg-float v2, p2

    neg-float v3, p3

    neg-float v5, p4

    move v4, p5

    move v6, p6

    move v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->transform(FFFFFFF)V

    .line 516
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    const/4 p1, 0x1

    return p1
.end method

.method public onUp()Z
    .locals 1

    .line 555
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->saveObjectPose()V

    const/4 v0, 0x0

    return v0
.end method

.method public onVisibilityChanged(Z)V
    .locals 1

    .line 408
    invoke-super {p0, p1}, Landroid/service/wallpaper/WallpaperService$Engine;->onVisibilityChanged(Z)V

    .line 409
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    .line 411
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUpdatePending:Z

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->restart(Z)V

    const/4 p1, 0x0

    .line 412
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->mUpdatePending:Z

    goto :goto_0

    .line 414
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService$OpenGLES2Engine;->pause()V

    :cond_1
    :goto_0
    return-void
.end method
