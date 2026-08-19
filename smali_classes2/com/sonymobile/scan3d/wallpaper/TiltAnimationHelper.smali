.class public Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;
.super Ljava/lang/Object;
.source "TiltAnimationHelper.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;
    }
.end annotation


# static fields
.field private static final DO_ANIMATION_THRESHOLD:F = 3.0f

.field private static final SENSOR_NO_TILT_THRESHOLD:F = 0.2f

.field private static final TILT_DEGREES:I = 0x14


# instance fields
.field private mCurrentTilt:I

.field private mGLThread:Lcom/sonymobile/scan3d/GLThread;

.field private mHandler:Landroid/os/Handler;

.field private mIsAnimating:Z

.field private mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mSensorNoTiltCount:I

.field private mSensorSum:F

.field private mSensorTiltGround:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/GLThread;Lcom/sonymobile/scan3d/viewer/SphanRenderer;)V
    .locals 1

    .line 105
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorSum:F

    .line 50
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mHandler:Landroid/os/Handler;

    .line 106
    iput-object p3, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 107
    iput-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    const-string p2, "sensor"

    .line 108
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorManager:Landroid/hardware/SensorManager;

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Z
    .locals 0

    .line 23
    iget-boolean p0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mIsAnimating:Z

    return p0
.end method

.method static synthetic access$002(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;Z)Z
    .locals 0

    .line 23
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mIsAnimating:Z

    return p1
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)I
    .locals 0

    .line 23
    iget p0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mCurrentTilt:I

    return p0
.end method

.method static synthetic access$102(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)I
    .locals 0

    .line 23
    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mCurrentTilt:I

    return p1
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/GLThread;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    return-object p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;)Lcom/sonymobile/scan3d/viewer/SphanRenderer;
    .locals 0

    .line 23
    iget-object p0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    return-object p0
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 127
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v0, 0x1

    aget p1, p1, v0

    .line 128
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorSum:F

    add-float/2addr v1, p1

    iput v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorSum:F

    .line 130
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorSum:F

    iget v2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorTiltGround:F

    sub-float/2addr v1, v2

    .line 134
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    const v2, 0x3e4ccccd    # 0.2f

    cmpg-float p1, p1, v2

    const/4 v2, 0x0

    if-gez p1, :cond_0

    .line 135
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorNoTiltCount:I

    add-int/2addr p1, v0

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorNoTiltCount:I

    goto :goto_0

    .line 137
    :cond_0
    iput v2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorNoTiltCount:I

    .line 139
    :goto_0
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mIsAnimating:Z

    if-nez p1, :cond_5

    .line 140
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorNoTiltCount:I

    const/4 v0, 0x5

    if-le p1, v0, :cond_1

    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorSum:F

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorTiltGround:F

    :cond_1
    const/high16 p1, 0x40400000    # 3.0f

    cmpl-float v3, v1, p1

    if-lez v3, :cond_2

    .line 141
    iget v3, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mCurrentTilt:I

    const/16 v4, 0x14

    if-eq v3, v4, :cond_2

    .line 142
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    invoke-direct {v0, p0, v4}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_2
    const/high16 v3, -0x3fc00000    # -3.0f

    cmpg-float v4, v1, v3

    if-gez v4, :cond_3

    .line 143
    iget v4, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mCurrentTilt:I

    const/16 v5, -0x14

    if-eq v4, v5, :cond_3

    .line 144
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    invoke-direct {v0, p0, v5}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_3
    cmpg-float p1, v1, p1

    if-gez p1, :cond_4

    cmpl-float p1, v1, v3

    if-lez p1, :cond_4

    .line 145
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mCurrentTilt:I

    if-eqz p1, :cond_4

    .line 147
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    invoke-direct {v0, p0, v2}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    .line 148
    :cond_4
    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorNoTiltCount:I

    if-le p1, v0, :cond_5

    iget p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mCurrentTilt:I

    if-eqz p1, :cond_5

    .line 149
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mHandler:Landroid/os/Handler;

    new-instance v0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;

    invoke-direct {v0, p0, v2}, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper$TiltRunnable;-><init>(Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;I)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_5
    :goto_1
    return-void
.end method

.method public pause()V
    .locals 2

    .line 121
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 122
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public resume()V
    .locals 3

    .line 116
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    .line 117
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x3

    invoke-virtual {v1, p0, v0, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    return-void
.end method

.method public setEnableAnimation(Z)V
    .locals 0

    .line 112
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltAnimationHelper;->mIsAnimating:Z

    return-void
.end method
