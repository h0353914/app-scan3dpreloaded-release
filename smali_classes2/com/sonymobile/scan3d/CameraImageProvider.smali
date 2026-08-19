.class public Lcom/sonymobile/scan3d/CameraImageProvider;
.super Ljava/lang/Object;
.source "CameraImageProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;
    }
.end annotation


# static fields
.field private static final PREVIEW_HEIGHT:I = 0x2d0

.field private static final PREVIEW_WIDTH:I = 0x500


# instance fields
.field private mGlThreadId:J

.field private mNativeHandle:J

.field private mOnStatusListener:Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;

.field private volatile mStreaming:Z

.field private mSurfaceTexture:Landroid/graphics/SurfaceTexture;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 39
    invoke-static {}, Lcom/sonymobile/scan3d/CameraImageProvider;->classInit()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;Lcom/sonymobile/scan3d/SphinxFocusType;Z)V
    .locals 2

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mGlThreadId:J

    .line 44
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/SphinxFocusType;->ordinal()I

    move-result p1

    invoke-direct {p0, p1, p4}, Lcom/sonymobile/scan3d/CameraImageProvider;->create(IZ)J

    move-result-wide p3

    iput-wide p3, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mNativeHandle:J

    .line 45
    iput-object p2, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mOnStatusListener:Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;

    const/4 p1, 0x0

    .line 46
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mStreaming:Z

    return-void
.end method

.method private static native classInit()V
.end method

.method private native create(IZ)J
.end method

.method private native createTexture(II)I
.end method

.method private native destroy()V
.end method

.method private onUpdateTexImage()J
    .locals 2

    .line 107
    iget-object v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 108
    iget-object v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->getTimestamp()J

    move-result-wide v0

    return-wide v0
.end method

.method private native setCameraSetting(II)V
.end method

.method private native setSurface(Landroid/view/Surface;)V
.end method

.method private native start()V
.end method

.method private native stop()V
.end method

.method private threadCheck()V
    .locals 4

    .line 112
    iget-wide v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mGlThreadId:J

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 113
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must be called from GL thread!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public closeCamera()V
    .locals 1

    const/4 v0, 0x0

    .line 60
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mStreaming:Z

    .line 61
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->stop()V

    .line 63
    iget-object v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    if-eqz v0, :cond_0

    .line 64
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    const/4 v0, 0x0

    .line 65
    iput-object v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 68
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mOnStatusListener:Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;

    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;->onClose(Lcom/sonymobile/scan3d/CameraImageProvider;)V

    return-void
.end method

.method public getNativeHandle()J
    .locals 2

    .line 101
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->threadCheck()V

    .line 102
    iget-wide v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mNativeHandle:J

    return-wide v0
.end method

.method public isStreaming()Z
    .locals 1

    .line 72
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mStreaming:Z

    return v0
.end method

.method public openCamera()V
    .locals 4

    const/16 v0, 0x2d0

    const/16 v1, 0x500

    .line 50
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->createTexture(II)I

    move-result v2

    .line 51
    new-instance v3, Landroid/graphics/SurfaceTexture;

    invoke-direct {v3, v2}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    iput-object v3, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    .line 52
    iget-object v2, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v2, v1, v0}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 53
    new-instance v0, Landroid/view/Surface;

    iget-object v1, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mSurfaceTexture:Landroid/graphics/SurfaceTexture;

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->setSurface(Landroid/view/Surface;)V

    .line 54
    iget-object v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mOnStatusListener:Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;

    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;->onOpen(Lcom/sonymobile/scan3d/CameraImageProvider;)V

    .line 55
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->start()V

    const/4 v0, 0x1

    .line 56
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/CameraImageProvider;->mStreaming:Z

    return-void
.end method

.method public setAWBLock(Z)V
    .locals 1

    .line 86
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->threadCheck()V

    .line 87
    sget-object v0, Lcom/sonymobile/scan3d/CameraSettingType;->kSettingAWBLock:Lcom/sonymobile/scan3d/CameraSettingType;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraSettingType;->ordinal()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setCameraSetting(II)V

    return-void
.end method

.method public setEdgeEnhancement(Z)V
    .locals 1

    .line 76
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->threadCheck()V

    .line 77
    sget-object v0, Lcom/sonymobile/scan3d/CameraSettingType;->kSettingEdgeEnhancement:Lcom/sonymobile/scan3d/CameraSettingType;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraSettingType;->ordinal()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setCameraSetting(II)V

    return-void
.end method

.method public setFocusPosition(I)V
    .locals 1

    .line 96
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->threadCheck()V

    .line 97
    sget-object v0, Lcom/sonymobile/scan3d/CameraSettingType;->kSettingManualFocusPosition:Lcom/sonymobile/scan3d/CameraSettingType;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraSettingType;->ordinal()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setCameraSetting(II)V

    return-void
.end method

.method public setLamp(Z)V
    .locals 1

    .line 91
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->threadCheck()V

    .line 92
    sget-object v0, Lcom/sonymobile/scan3d/CameraSettingType;->kSettingLamp:Lcom/sonymobile/scan3d/CameraSettingType;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraSettingType;->ordinal()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setCameraSetting(II)V

    return-void
.end method

.method public setNoiseReduction(Z)V
    .locals 1

    .line 81
    invoke-direct {p0}, Lcom/sonymobile/scan3d/CameraImageProvider;->threadCheck()V

    .line 82
    sget-object v0, Lcom/sonymobile/scan3d/CameraSettingType;->kSettingNoiseReduction:Lcom/sonymobile/scan3d/CameraSettingType;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraSettingType;->ordinal()I

    move-result v0

    invoke-direct {p0, v0, p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setCameraSetting(II)V

    return-void
.end method
