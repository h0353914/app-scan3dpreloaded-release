.class public Lcom/sonymobile/scan3d/wallpaper/TiltSensor;
.super Ljava/lang/Object;
.source "TiltSensor.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field public static final MAX_TILT:F = 1.5707964f


# instance fields
.field private final mGLThread:Lcom/sonymobile/scan3d/GLThread;

.field private mNanosOfLastUpdate:J

.field private mRegisteredSensor:Z

.field private mScreenRotation:I

.field private mSensorManager:Landroid/hardware/SensorManager;

.field private mTilt:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/GLThread;)V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mRegisteredSensor:Z

    const-string v0, "sensor"

    .line 32
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/hardware/SensorManager;

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    const-string v0, "window"

    .line 33
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 34
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mScreenRotation:I

    .line 35
    iput-object p2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    return-void
.end method

.method private handleGyro(Landroid/hardware/SensorEvent;)V
    .locals 6

    .line 62
    iget-wide v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mNanosOfLastUpdate:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 63
    iget-wide v0, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iget-wide v2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mNanosOfLastUpdate:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    const v1, 0x4e6e6b28    # 1.0E9f

    div-float/2addr v0, v1

    .line 64
    iget v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mScreenRotation:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    goto :goto_0

    .line 78
    :pswitch_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v3

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v3

    mul-float/2addr v5, v0

    sub-float/2addr v4, v5

    aput v4, v1, v3

    .line 79
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v2

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v2

    mul-float/2addr v5, v0

    add-float/2addr v4, v5

    aput v4, v1, v2

    goto :goto_0

    .line 74
    :pswitch_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v3

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v2

    mul-float/2addr v5, v0

    sub-float/2addr v4, v5

    aput v4, v1, v3

    .line 75
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v2

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v3

    mul-float/2addr v5, v0

    sub-float/2addr v4, v5

    aput v4, v1, v2

    goto :goto_0

    .line 70
    :pswitch_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v3

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v3

    mul-float/2addr v5, v0

    add-float/2addr v4, v5

    aput v4, v1, v3

    .line 71
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v2

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v2

    mul-float/2addr v5, v0

    sub-float/2addr v4, v5

    aput v4, v1, v2

    goto :goto_0

    .line 66
    :pswitch_3
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v3

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v2

    mul-float/2addr v5, v0

    add-float/2addr v4, v5

    aput v4, v1, v3

    .line 67
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v1, v2

    iget-object v5, p1, Landroid/hardware/SensorEvent;->values:[F

    aget v5, v5, v3

    mul-float/2addr v5, v0

    add-float/2addr v4, v5

    aput v4, v1, v2

    .line 85
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v1, v0, v3

    aget v4, v0, v3

    mul-float/2addr v1, v4

    aget v4, v0, v2

    aget v0, v0, v2

    mul-float/2addr v4, v0

    add-float/2addr v1, v4

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const v1, 0x3fc90fdb

    cmpl-float v4, v0, v1

    if-lez v4, :cond_0

    div-float/2addr v1, v0

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    aget v4, v0, v3

    mul-float/2addr v4, v1

    aput v4, v0, v3

    .line 89
    aget v3, v0, v2

    mul-float/2addr v3, v1

    aput v3, v0, v2

    .line 93
    :cond_0
    iget-wide v0, p1, Landroid/hardware/SensorEvent;->timestamp:J

    iput-wide v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mNanosOfLastUpdate:J

    .line 94
    iget-object p1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mGLThread:Lcom/sonymobile/scan3d/GLThread;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/GLThread;->requestRender()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public getCurrentTilt()[F
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    return-object v0
.end method

.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 1

    .line 50
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mRegisteredSensor:Z

    if-eqz v0, :cond_0

    .line 51
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    const/4 v0, 0x0

    .line 52
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mRegisteredSensor:Z

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 3

    const-wide/16 v0, 0x0

    .line 39
    iput-wide v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mNanosOfLastUpdate:J

    const/4 v0, 0x2

    .line 40
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mTilt:[F

    .line 41
    iget-object v0, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 44
    iget-object v1, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v0, v2}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 45
    iput-boolean v2, p0, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->mRegisteredSensor:Z

    :cond_0
    return-void

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .locals 0

    .line 58
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/wallpaper/TiltSensor;->handleGyro(Landroid/hardware/SensorEvent;)V

    return-void
.end method
