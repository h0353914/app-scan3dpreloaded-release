.class public Lcom/sonymobile/scan3d/Sphinx;
.super Ljava/lang/Object;
.source "Sphinx.java"


# instance fields
.field private mGlThreadId:J

.field private mNativeHandle:J


# direct methods
.method public constructor <init>(II)V
    .locals 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/Sphinx;->mGlThreadId:J

    .line 20
    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/Sphinx;->nativeConstructor(II)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/sonymobile/scan3d/Sphinx;->mNativeHandle:J

    return-void
.end method

.method private checkHandle()V
    .locals 4

    .line 170
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Sphinx;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not initialized / Already released!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private native getEnvironmentErrors()[Ljava/lang/Object;
.end method

.method public static native initAssets(Landroid/content/res/AssetManager;)V
.end method

.method private static native nativeConstructor(II)J
.end method

.method private native nativeDestructor()V
.end method

.method private native nativeDone()V
.end method

.method private native nativeGetLastBasename()Ljava/lang/String;
.end method

.method private native nativeGetScanType()I
.end method

.method private native nativeGetSculpt3DInputController()I
.end method

.method private native nativeGetState()I
.end method

.method private native nativeInit()V
.end method

.method private native nativePopHint()Lcom/sonymobile/scan3d/SphinxHint;
.end method

.method private native nativeRender()V
.end method

.method private native nativeRunOneIteration()V
.end method

.method private native nativeSetBlobScaleZoom(F)V
.end method

.method private native nativeSetCameraTemperature(I)Z
.end method

.method private native nativeSetDisplaySize(II)V
.end method

.method private native nativeSetEnvCondition(IF)V
.end method

.method private native nativeSetImageProvider(J)V
.end method

.method private native nativeSetNextDebugMode(I)V
.end method

.method private native nativeSetNextState(Z)Z
.end method

.method public static native resetCameraCalibration()V
.end method

.method public static native setupEnvironment(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
.end method

.method private threadCheck()V
    .locals 4

    .line 174
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Sphinx;->mGlThreadId:J

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    return-void

    .line 175
    :cond_0
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Must be called from GL thread!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public native clearEnvironmentErrors()V
.end method

.method public done()V
    .locals 0

    .line 56
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 57
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 58
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeDone()V

    return-void
.end method

.method public getErrors()[Lcom/sonymobile/scan3d/EnvironmentError;
    .locals 1

    .line 74
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->getEnvironmentErrors()[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/EnvironmentError;

    return-object v0
.end method

.method public getLastLogFile()Ljava/lang/String;
    .locals 2

    .line 125
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 126
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeGetLastBasename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".log.zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLastResultFile()Ljava/lang/String;
    .locals 2

    .line 130
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 131
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeGetLastBasename()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".obj.zip"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getScanType()I
    .locals 1

    .line 135
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 136
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeGetScanType()I

    move-result v0

    return v0
.end method

.method public getState()Lcom/sonymobile/scan3d/SphinxState;
    .locals 2

    .line 37
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 38
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 39
    invoke-static {}, Lcom/sonymobile/scan3d/SphinxState;->values()[Lcom/sonymobile/scan3d/SphinxState;

    move-result-object v0

    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeGetState()I

    move-result v1

    aget-object v0, v0, v1

    return-object v0
.end method

.method public init()V
    .locals 0

    .line 50
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 51
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 52
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeInit()V

    return-void
.end method

.method public isDone()Z
    .locals 2

    .line 43
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 44
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 45
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeGetState()I

    move-result v0

    .line 46
    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateDone:Lcom/sonymobile/scan3d/SphinxState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/SphinxState;->ordinal()I

    move-result v1

    if-eq v0, v1, :cond_1

    sget-object v1, Lcom/sonymobile/scan3d/SphinxState;->kStateDestroyed:Lcom/sonymobile/scan3d/SphinxState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/SphinxState;->ordinal()I

    move-result v1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public popHint()Lcom/sonymobile/scan3d/SphinxHint;
    .locals 1

    .line 108
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 109
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativePopHint()Lcom/sonymobile/scan3d/SphinxHint;

    move-result-object v0

    return-object v0
.end method

.method public release()V
    .locals 2

    .line 24
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 25
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 26
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeDestructor()V

    const-wide/16 v0, 0x0

    .line 27
    iput-wide v0, p0, Lcom/sonymobile/scan3d/Sphinx;->mNativeHandle:J

    return-void
.end method

.method public render()V
    .locals 0

    .line 62
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 63
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 64
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeRender()V

    return-void
.end method

.method public runOneIteration()V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 69
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 70
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->nativeRunOneIteration()V

    return-void
.end method

.method public setBlobScaleZoom(F)V
    .locals 0

    .line 113
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 114
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 115
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetBlobScaleZoom(F)V

    return-void
.end method

.method public setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)Z
    .locals 0

    .line 119
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 120
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 121
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;->ordinal()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetCameraTemperature(I)Z

    move-result p1

    return p1
.end method

.method public setDisplaySize(II)V
    .locals 0

    .line 78
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 79
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 80
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetDisplaySize(II)V

    return-void
.end method

.method public setEnvCondition(Lcom/sonymobile/scan3d/SphinxEnvCondition;F)V
    .locals 0

    .line 96
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 97
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 98
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/SphinxEnvCondition;->ordinal()I

    move-result p1

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetEnvCondition(IF)V

    return-void
.end method

.method public setImageProvider(J)V
    .locals 0

    .line 84
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 85
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 86
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetImageProvider(J)V

    return-void
.end method

.method public native setLocaleIsRTL(Z)V
.end method

.method public setNextDebugMode(I)V
    .locals 0

    .line 90
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 91
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 92
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetNextDebugMode(I)V

    return-void
.end method

.method public setNextState(Z)Z
    .locals 0

    .line 102
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->threadCheck()V

    .line 103
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Sphinx;->checkHandle()V

    .line 104
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/Sphinx;->nativeSetNextState(Z)Z

    move-result p1

    return p1
.end method

.method public native setPassword(Ljava/lang/String;)V
.end method
