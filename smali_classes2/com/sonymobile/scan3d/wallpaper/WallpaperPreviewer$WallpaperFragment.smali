.class public Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;
.super Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;
.source "WallpaperPreviewer.java"

# interfaces
.implements Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;
.implements Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WallpaperFragment"
.end annotation


# static fields
.field private static final STATE_ANIMATION:Ljava/lang/String; = "state_animation"

.field private static final STATE_BACKGROUND:Ljava/lang/String; = "state_background"

.field private static final STATE_MODEL:Ljava/lang/String; = "state_model"

.field private static final STATE_ROTATION:Ljava/lang/String; = "state_rotation"

.field static final WALLPAPER_REQUEST:I = 0x1


# instance fields
.field private mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

.field private mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

.field private mAnimator:Ljava/lang/Runnable;

.field private mCurrentRotation:F

.field private mDefaultRotationDirection:F
    .annotation build Landroidx/annotation/FloatRange;
        from = -1.0
        fromInclusive = true
        to = 1.0
        toInclusive = true
    .end annotation
.end field

.field private mDisableAnimate:Z

.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mMainHandler:Landroid/os/Handler;

.field private mPrefAnimate:Z

.field private mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

.field private mPrefModel:Landroid/net/Uri;

.field private mPrefRotate:Z

.field private mRandom:Ljava/util/Random;

.field private mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

.field private mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

.field private mTransformedViewM:[F

.field private mViewM:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 170
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;-><init>()V

    .line 205
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mRandom:Ljava/util/Random;

    .line 210
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mMainHandler:Landroid/os/Handler;

    const/4 v0, 0x0

    .line 220
    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    .line 225
    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTransformedViewM:[F

    const/4 v0, 0x0

    .line 230
    iput v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 235
    iput v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDefaultRotationDirection:F

    .line 241
    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$QkjEqi-GumtxAwFQ9Qg89bLYtxs;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$QkjEqi-GumtxAwFQ9Qg89bLYtxs;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimator:Ljava/lang/Runnable;

    return-void
.end method

.method private applySavedObjectPose()V
    .locals 6

    .line 476
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "pref_lw_pose"

    const-string v2, ""

    .line 477
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 478
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    .line 482
    :cond_0
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "view_mat"

    .line 483
    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    const/16 v1, 0x10

    .line 484
    new-array v1, v1, [F

    iput-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    const/4 v1, 0x0

    move v2, v1

    .line 485
    :goto_0
    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 486
    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->getDouble(I)D

    move-result-wide v4

    double-to-float v4, v4

    aput v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 488
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    invoke-virtual {v0, v2, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setViewMatrix([FI)V

    .line 489
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    const/4 v0, 0x0

    .line 490
    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTransformedViewM:[F
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private getPickerIntent()Landroid/content/Intent;
    .locals 3

    .line 566
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 567
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "application/vnd.sony.scan3d"

    .line 568
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "pick_internal"

    const/4 v2, 0x1

    .line 569
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string v1, "com.sonymobile.scan3d.intent.extra.EXPLANATORY_TEXT"

    const v2, 0x7f10010c

    .line 570
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    return-object v0
.end method

.method private isRigged()Z
    .locals 1

    .line 557
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static synthetic lambda$G1mCeShEqifVqjPLGO3CwQAl_2U(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->loadModel()V

    return-void
.end method

.method public static synthetic lambda$QjHsOBM4wjjqu-EG55SCSnsOsLA(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->updateModel()V

    return-void
.end method

.method public static synthetic lambda$SJjlNK7fdxWU8pm0iPjIwkEErQg(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->updateBackground()V

    return-void
.end method

.method public static synthetic lambda$new$0(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V
    .locals 4

    .line 242
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getNumAnimations()I

    move-result v0

    if-lez v0, :cond_0

    .line 244
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mRandom:Ljava/util/Random;

    invoke-virtual {v3, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->startAnimation(II)Z

    .line 245
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    .line 246
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimator:Ljava/lang/Runnable;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public static synthetic lambda$onCreateView$1(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V
    .locals 1

    .line 275
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    return-void
.end method

.method public static synthetic lambda$onCreateView$2(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;Landroid/view/View;)V
    .locals 1

    .line 301
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getPickerIntent()Landroid/content/Intent;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 302
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WALLPAPER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    return-void
.end method

.method private loadModel()V
    .locals 3

    .line 497
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    if-eqz v0, :cond_3

    .line 498
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 499
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDisableAnimate:Z

    if-eqz v1, :cond_0

    goto :goto_0

    .line 502
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->load(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_1

    .line 500
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v2}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->load(Ljava/lang/String;Ljava/lang/String;)Z

    .line 504
    :goto_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 505
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTransformedViewM:[F

    if-eqz v0, :cond_2

    .line 506
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setViewMatrix([FI)V

    goto :goto_2

    .line 508
    :cond_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->applySavedObjectPose()V

    .line 511
    :cond_3
    :goto_2
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->startAnimating()V

    return-void
.end method

.method private loadState(Landroid/os/Bundle;)V
    .locals 1

    const-string v0, "state_animation"

    .line 362
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    const-string v0, "state_rotation"

    .line 363
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    const-string v0, "state_background"

    .line 364
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/ViewerBackground;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/ViewerBackground;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    const-string v0, "state_model"

    .line 365
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 366
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 367
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->setModel(Landroid/net/Uri;)V

    .line 368
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->updateAnimateState()V

    :cond_0
    return-void
.end method

.method private readPreferences()V
    .locals 4

    .line 456
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/PreferenceUtils;->updatePreferences(Landroid/content/Context;)V

    .line 457
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    const v1, 0x7f1001fa

    .line 458
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f1001f8

    .line 459
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    const v2, 0x7f1001f9

    .line 460
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    iput-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    const v2, 0x7f1001f7

    .line 461
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 462
    invoke-virtual {v3}, Lcom/sonymobile/scan3d/ViewerBackground;->name()Ljava/lang/String;

    move-result-object v3

    .line 461
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 464
    invoke-static {v0}, Lcom/sonymobile/scan3d/ViewerBackground;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/ViewerBackground;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 466
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 467
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->setModel(Landroid/net/Uri;)V

    .line 468
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->updateAnimateState()V

    :cond_0
    return-void
.end method

.method private saveSharedPrefs()V
    .locals 3

    .line 575
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 576
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001f8

    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001f9

    .line 577
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001f7

    .line 578
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/ViewerBackground;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const v1, 0x7f1001fa

    .line 579
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefModel:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    return-void
.end method

.method private setModel(Landroid/net/Uri;)V
    .locals 1

    .line 545
    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefModel:Landroid/net/Uri;

    .line 546
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefModel:Landroid/net/Uri;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 547
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->isRigged()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDisableAnimate:Z

    return-void
.end method

.method private setupAnimationMenu(Landroid/view/View;)V
    .locals 4

    const v0, 0x7f090052

    .line 413
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    .line 414
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDisableAnimate:Z

    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    invoke-virtual {p1, v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addSettingsMenu(ZZZ)V

    .line 416
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 417
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_SIMPLE:Lcom/sonymobile/scan3d/ViewerBackground;

    const v2, 0x7f08006a

    const v3, 0x7f100371

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 419
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_DEFAULT:Lcom/sonymobile/scan3d/ViewerBackground;

    const v2, 0x7f08006c

    const v3, 0x7f100373

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 422
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_OUTDOORS:Lcom/sonymobile/scan3d/ViewerBackground;

    const v2, 0x7f080069

    const v3, 0x7f100370

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 424
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;

    sget-object v1, Lcom/sonymobile/scan3d/ViewerBackground;->BACKGROUND_STUDIO:Lcom/sonymobile/scan3d/ViewerBackground;

    const v2, 0x7f08006b

    const v3, 0x7f100372

    invoke-direct {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;-><init>(Ljava/lang/Object;II)V

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 427
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v2, p1, v1}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addPickerMenu(ILjava/util/ArrayList;I)V

    .line 428
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    invoke-virtual {p1, p0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->addAnimationMenuListener(Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu$AnimationMenuListener;)V

    .line 429
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    const v0, 0x7f06001e

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setup(I)V

    return-void
.end method

.method private shouldRestartWallpaperService()Z
    .locals 3

    .line 439
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    if-eqz v0, :cond_1

    .line 442
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getAppTasks()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$AppTask;

    .line 443
    invoke-virtual {v1}, Landroid/app/ActivityManager$AppTask;->getTaskInfo()Landroid/app/ActivityManager$RecentTaskInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 444
    iget-object v2, v1, Landroid/app/ActivityManager$RecentTaskInfo;->topActivity:Landroid/content/ComponentName;

    if-eqz v2, :cond_0

    .line 445
    iget-object v1, v1, Landroid/app/ActivityManager$RecentTaskInfo;->topActivity:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer;

    .line 446
    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    .line 445
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0
.end method

.method private startAnimating()V
    .locals 1

    .line 254
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->stopAnimating()V

    .line 255
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDisableAnimate:Z

    if-nez v0, :cond_0

    .line 256
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimator:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method

.method private stopAnimating()V
    .locals 2

    .line 264
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimator:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method private updateAnimateState()V
    .locals 3

    .line 551
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationMenu:Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;

    if-eqz v0, :cond_0

    .line 552
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDisableAnimate:Z

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/fragments/component/AnimationMenu;->setFaceAnimationsSwitchState(ZZ)V

    :cond_0
    return-void
.end method

.method private updateBackground()V
    .locals 2

    .line 525
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 526
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method

.method private updateModel()V
    .locals 2

    .line 515
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->resetView()V

    .line 516
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextDestroyed()V

    .line 517
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->removeMeshes()V

    .line 518
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->ordinal()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setBackground(I)V

    .line 519
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->loadModel()V

    .line 520
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->onGLContextCreated()V

    .line 521
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    return-void
.end method


# virtual methods
.method public getContentLayout()I
    .locals 1

    const v0, 0x7f0c0076

    return v0
.end method

.method public getNavigationAccessibility()I
    .locals 1

    const v0, 0x7f10002b

    return v0
.end method

.method public getNavigationDrawable()I
    .locals 1

    const v0, 0x7f0800d1

    return v0
.end method

.method protected getToolBarActionText()I
    .locals 1

    const v0, 0x7f1000ed

    return v0
.end method

.method protected onActionClick()V
    .locals 3

    .line 384
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->saveSharedPrefs()V

    .line 385
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->shouldRestartWallpaperService()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 386
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    iget-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    invoke-static {v0, v1, v2}, Lcom/sonymobile/scan3d/wallpaper/SphinxWallpaperService;->setAsWallpaper(Landroid/content/Context;Landroid/net/Uri;Z)V

    .line 388
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    if-nez p2, :cond_0

    .line 532
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    goto :goto_2

    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_3

    if-eqz p3, :cond_3

    .line 534
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    .line 535
    iget-object v2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefModel:Landroid/net/Uri;

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    .line 536
    :goto_0
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->setModel(Landroid/net/Uri;)V

    .line 537
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->isRigged()Z

    move-result v1

    iput-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    .line 538
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->updateAnimateState()V

    .line 539
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    if-eqz v0, :cond_2

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$G1mCeShEqifVqjPLGO3CwQAl_2U;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$G1mCeShEqifVqjPLGO3CwQAl_2U;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    goto :goto_1

    :cond_2
    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$QjHsOBM4wjjqu-EG55SCSnsOsLA;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$QjHsOBM4wjjqu-EG55SCSnsOsLA;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    :goto_1
    invoke-virtual {v1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 541
    :cond_3
    :goto_2
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onAnimateChanged(Z)V
    .locals 1

    .line 584
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    .line 585
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$QjHsOBM4wjjqu-EG55SCSnsOsLA;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$QjHsOBM4wjjqu-EG55SCSnsOsLA;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    .line 393
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    const/4 v0, 0x1

    return v0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 271
    invoke-super {p0, p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object p1

    .line 273
    new-instance p2, Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const p2, 0x7f0900e1

    .line 274
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    iput-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    .line 275
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    new-instance v1, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$NPI18jCfSjRq10Tp_AENM5vYN90;

    invoke-direct {v1, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$NPI18jCfSjRq10Tp_AENM5vYN90;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    invoke-virtual {p2, v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->start(Lcom/sonymobile/scan3d/viewer/SphanRenderer;Ljava/lang/Runnable;)V

    .line 276
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    if-nez p3, :cond_0

    .line 279
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->readPreferences()V

    goto :goto_0

    .line 281
    :cond_0
    invoke-direct {p0, p3}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->loadState(Landroid/os/Bundle;)V

    .line 284
    :goto_0
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefModel:Landroid/net/Uri;

    if-nez p2, :cond_1

    .line 285
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getPickerIntent()Landroid/content/Intent;

    move-result-object p2

    const/4 p3, 0x1

    invoke-virtual {p0, p2, p3}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 286
    sget-object p2, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->WALLPAPER_SCREEN:Lcom/sonymobile/scan3d/analytics/ScreenEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/analytics/ScreenEvent;->send(Landroid/content/Context;)V

    .line 289
    :cond_1
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance p3, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$G1mCeShEqifVqjPLGO3CwQAl_2U;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$G1mCeShEqifVqjPLGO3CwQAl_2U;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    .line 292
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    if-eqz p2, :cond_2

    const/high16 p2, 0x3f800000    # 1.0f

    .line 293
    iput p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    .line 294
    iput p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDefaultRotationDirection:F

    .line 296
    :cond_2
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->setupAnimationMenu(Landroid/view/View;)V

    const p2, 0x7f090196

    .line 299
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    .line 300
    new-instance p3, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$mOAsLVSjgvhrPaKunyI1Msb3QHs;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$mOAsLVSjgvhrPaKunyI1Msb3QHs;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    invoke-virtual {p2, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 306
    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance p3, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment$1;

    invoke-direct {p3, p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment$1;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->setTouchListener(Lcom/sonymobile/scan3d/NativeGLTextureView$TouchListener;)V

    .line 317
    new-instance p2, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object p3

    invoke-virtual {p3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p3

    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    .line 318
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->getGLThread()Lcom/sonymobile/scan3d/GLThread;

    move-result-object v0

    invoke-direct {p2, p3, v0}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/GLThread;)V

    iput-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    return-object p1
.end method

.method public onDestroy()V
    .locals 0

    .line 347
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onDestroy()V

    return-void
.end method

.method public onDrawFrameDelta(J)V
    .locals 11

    .line 606
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->getCurrentTilt()[F

    move-result-object v0

    .line 608
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    float-to-int v2, v1

    div-int/lit8 v2, v2, 0x3c

    .line 609
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    neg-float v1, v1

    const/high16 v3, 0x43b40000    # 360.0f

    mul-float/2addr v1, v3

    iget v4, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    add-float/2addr v1, v4

    float-to-int v1, v1

    div-int/lit8 v1, v1, 0x3c

    add-int/2addr v2, v1

    .line 612
    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v1

    const/4 v4, 0x5

    if-eq v1, v4, :cond_0

    int-to-float v1, v2

    .line 613
    invoke-static {v1}, Ljava/lang/Math;->signum(F)F

    move-result v1

    iput v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDefaultRotationDirection:F

    :cond_0
    long-to-float p1, p1

    .line 616
    iget p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDefaultRotationDirection:F

    const v1, 0x3bc49ba6    # 0.006f

    mul-float/2addr p2, v1

    mul-float/2addr p1, p2

    .line 618
    iget p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    add-float/2addr p2, p1

    rem-float/2addr p2, v3

    iput p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    .line 620
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    iget-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mViewM:[F

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setViewMatrix([FI)V

    const/4 p1, 0x1

    .line 621
    aget p1, v0, p1

    const/high16 p2, 0x42340000    # 45.0f

    mul-float/2addr p1, p2

    const v2, 0x3fc90fdb

    div-float v7, p1, v2

    .line 622
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    aget v0, v0, v1

    mul-float/2addr v0, p2

    div-float/2addr v0, v2

    sub-float v8, p1, v0

    .line 623
    iget-object v3, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v9, 0x0

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-virtual/range {v3 .. v10}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->transform(FFFFFFF)V

    .line 624
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getViewMatrix()[F

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTransformedViewM:[F

    return-void
.end method

.method public onItemPicked(Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;)V
    .locals 1

    .line 590
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/fragments/component/Pickable;->getIdentifier()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/ViewerBackground;

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    .line 591
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$SJjlNK7fdxWU8pm0iPjIwkEErQg;

    invoke-direct {v0, p0}, Lcom/sonymobile/scan3d/wallpaper/-$$Lambda$WallpaperPreviewer$WallpaperFragment$SJjlNK7fdxWU8pm0iPjIwkEErQg;-><init>(Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;)V

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method protected onNavigationClick()V
    .locals 1

    .line 409
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method

.method public onPause()V
    .locals 2

    .line 336
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onPause()V

    .line 337
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 338
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->unregisterOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 339
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->stopAnimating()V

    .line 340
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setOnDrawFrameListener(Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;)V

    .line 341
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->onPause()V

    .line 342
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    .line 325
    invoke-super {p0}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onResume()V

    .line 326
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 327
    invoke-interface {v0, p0}, Landroid/content/SharedPreferences;->registerOnSharedPreferenceChangeListener(Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;)V

    .line 328
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->onResume()V

    .line 329
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mTiltSensor:Lcom/sonymobile/scan3d/wallpaper/TiltSensor;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->onResume()V

    .line 330
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v0, p0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->setOnDrawFrameListener(Lcom/sonymobile/scan3d/viewer/SphanRenderer$OnDrawFrameListener;)V

    .line 331
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->startAnimating()V

    return-void
.end method

.method public onRotateChanged(Z)V
    .locals 2

    .line 596
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    if-eq p1, v0, :cond_1

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p1, :cond_0

    move v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 597
    :goto_0
    iput v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mCurrentRotation:F

    .line 598
    iput v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mDefaultRotationDirection:F

    .line 599
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mAnimationView:Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanGLTextureView;->requestRender()V

    .line 600
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    :cond_1
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .line 352
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/BaseViewerFragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    const-string v0, "state_animation"

    .line 353
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefAnimate:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "state_rotation"

    .line 354
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefRotate:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "state_background"

    .line 355
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefBackground:Lcom/sonymobile/scan3d/ViewerBackground;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/ViewerBackground;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->mPrefModel:Landroid/net/Uri;

    if-eqz v0, :cond_0

    const-string v1, "state_model"

    .line 357
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0

    const-string p1, "pref_lw_pose"

    .line 629
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 630
    invoke-direct {p0}, Lcom/sonymobile/scan3d/wallpaper/WallpaperPreviewer$WallpaperFragment;->applySavedObjectPose()V

    :cond_0
    return-void
.end method
