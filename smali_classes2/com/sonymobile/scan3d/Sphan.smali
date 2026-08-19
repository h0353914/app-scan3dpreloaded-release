.class public Lcom/sonymobile/scan3d/Sphan;
.super Ljava/lang/Object;
.source "Sphan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;
    }
.end annotation


# static fields
.field public static final BG_COUNT:I = 0x4

.field public static final BG_DEFAULT:I = 0x1

.field public static final BG_OUTDOORS:I = 0x2

.field public static final BG_SIMPLE:I = 0x0

.field public static final BG_STUDIO_SMALL:I = 0x3


# instance fields
.field private mAnimationListener:Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;

.field private mNativeHandle:J

.field private mRefCounter:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 50
    invoke-static {}, Lcom/sonymobile/scan3d/Sphan;->classInit()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    invoke-static {p1}, Lcom/sonymobile/scan3d/Sphan;->initAssets(Landroid/content/res/AssetManager;)V

    .line 56
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphan;->nativeConstructor()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/Sphan;->mNativeHandle:J

    const-wide/16 v0, 0x1

    .line 57
    iput-wide v0, p0, Lcom/sonymobile/scan3d/Sphan;->mRefCounter:J

    return-void
.end method

.method private static native classInit()V
.end method

.method private static native initAssets(Landroid/content/res/AssetManager;)V
.end method

.method private native nativeConstructor()J
.end method

.method private native nativeDestructor()V
.end method

.method private declared-synchronized onAnimationStopped(I)V
    .locals 1

    monitor-enter p0

    .line 489
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/Sphan;->mAnimationListener:Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;

    if-eqz v0, :cond_0

    .line 490
    iget-object v0, p0, Lcom/sonymobile/scan3d/Sphan;->mAnimationListener:Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;

    invoke-interface {v0, p1}, Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;->animationStopped(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 492
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public declared-synchronized acquire()V
    .locals 4

    monitor-enter p0

    .line 61
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Sphan;->mRefCounter:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/Sphan;->mRefCounter:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 62
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public native enableAnimationListener(Z)V
.end method

.method public native exportGlb(Ljava/lang/String;)Z
.end method

.method public native exportGlbZip(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public native getAnimationDuration(II)F
.end method

.method public getAnimationName(I)Ljava/lang/String;
    .locals 1

    .line 90
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Sphan;->getMeshCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0, p1}, Lcom/sonymobile/scan3d/Sphan;->getAnimationName(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public native getAnimationName(II)Ljava/lang/String;
.end method

.method public native getMeshCount()I
.end method

.method public getNumAnimations()I
    .locals 1

    .line 78
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Sphan;->getMeshCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/Sphan;->getNumAnimations(I)I

    move-result v0

    return v0
.end method

.method public native getNumAnimations(I)I
.end method

.method public native getViewMatrix()[F
.end method

.method public hasLoadedMeshes()Z
    .locals 1

    .line 161
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Sphan;->getMeshCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public native isEffectActive()Z
.end method

.method public native isMeshVisible(I)Z
.end method

.method public native load(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public native loadContent(Ljava/lang/String;Ljava/lang/String;Z)I
.end method

.method public native loadZippedContent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)I
.end method

.method public native lookAt(IFF)Z
.end method

.method public native onDown()Z
.end method

.method public native onFling(FF)Z
.end method

.method public native onGLContextCreated()V
.end method

.method public native onGLContextDestroyed()V
.end method

.method public declared-synchronized release()V
    .locals 4

    monitor-enter p0

    .line 65
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Sphan;->mRefCounter:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/Sphan;->mRefCounter:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 66
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphan;->nativeDestructor()V

    .line 67
    iput-wide v2, p0, Lcom/sonymobile/scan3d/Sphan;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public native removeMeshes()V
.end method

.method public native render(F)Z
.end method

.method public native resetCamera()V
.end method

.method public native resetView()V
.end method

.method public native setBackground(I)V
.end method

.method public native setCamera(ILjava/lang/String;)Z
.end method

.method public native setMeshVisible(IZ)Z
.end method

.method public declared-synchronized setNativeAnimationListener(Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;)V
    .locals 0

    monitor-enter p0

    .line 171
    :try_start_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/Sphan;->mAnimationListener:Lcom/sonymobile/scan3d/Sphan$NativeAnimationListener;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 172
    :goto_0
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/Sphan;->enableAnimationListener(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public native setPlainShading(Z)V
.end method

.method public native setPostProcShading(Z)V
.end method

.method public native setProgress(F)V
.end method

.method public native setUntexturedShading(Z)V
.end method

.method public native setViewMatrix([FI)V
.end method

.method public showRiggedMesh()V
    .locals 1

    const/4 v0, 0x1

    .line 150
    invoke-virtual {p0, v0, v0}, Lcom/sonymobile/scan3d/Sphan;->setMeshVisible(IZ)Z

    const/4 v0, 0x0

    .line 151
    invoke-virtual {p0, v0, v0}, Lcom/sonymobile/scan3d/Sphan;->setMeshVisible(IZ)Z

    return-void
.end method

.method public showStaticMesh()V
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 139
    invoke-virtual {p0, v1, v0}, Lcom/sonymobile/scan3d/Sphan;->setMeshVisible(IZ)Z

    .line 140
    invoke-virtual {p0, v0, v1}, Lcom/sonymobile/scan3d/Sphan;->setMeshVisible(IZ)Z

    return-void
.end method

.method public startAnimation(I)Z
    .locals 2

    .line 101
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Sphan;->getMeshCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0, p1, v1}, Lcom/sonymobile/scan3d/Sphan;->startMeshAnimation(IIZ)Z

    move-result p1

    return p1
.end method

.method public startAnimation(II)Z
    .locals 1

    const/4 v0, 0x1

    .line 109
    invoke-virtual {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/Sphan;->startAnimation(IIZ)Z

    move-result p1

    return p1
.end method

.method public native startAnimation(IIZ)Z
.end method

.method public startAnimationNoWarmup(II)Z
    .locals 1

    const/4 v0, 0x0

    .line 117
    invoke-virtual {p0, p1, p2, v0}, Lcom/sonymobile/scan3d/Sphan;->startAnimation(IIZ)Z

    move-result p1

    return p1
.end method

.method public native startMeshAnimation(IIZ)Z
.end method

.method public native startNamedAnimation(ILjava/lang/String;Z)Z
.end method

.method public native startProgressEffect()V
.end method

.method public native stopAnimation(I)Z
.end method

.method public native stopEffect()V
.end method

.method public native stopFling()V
.end method

.method public stopIdleAnimation()V
    .locals 2

    .line 125
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/Sphan;->getMeshCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 126
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/Sphan;->stopAnimation(I)Z

    move-result v0

    if-nez v0, :cond_0

    .line 127
    const-class v0, Lcom/sonymobile/scan3d/Sphan;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Animation was not stopped"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-void
.end method

.method public native surfaceChanged(II)V
.end method

.method public native touchDrag(FF)V
.end method

.method public native transform(FFFFFFF)V
.end method

.method public native unload(I)Z
.end method

.method public native unloadDownTo(I)Z
.end method
