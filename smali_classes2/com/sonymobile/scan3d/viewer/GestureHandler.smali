.class public final Lcom/sonymobile/scan3d/viewer/GestureHandler;
.super Ljava/lang/Object;
.source "GestureHandler.java"

# interfaces
.implements Landroid/view/GestureDetector$OnGestureListener;
.implements Landroid/view/GestureDetector$OnDoubleTapListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;
    }
.end annotation


# static fields
.field private static final ONE_FINGER:I = 0x1

.field private static final RADIANS_TO_DEGREES:F = 57.295776f

.field private static final ROTATION_FACTOR_XY:F = 0.2f

.field private static final TRANSLATION_FACTOR_XY:F = 1.0f

.field private static final TWO_FINGERS:I = 0x2


# instance fields
.field private mDensity:F

.field private mDetector:Landroid/view/GestureDetector;

.field private mDualMode:Z

.field private mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

.field private mXCoord:F

.field private mXSecondCoord:F

.field private mYCoord:F

.field private mYSecondCoord:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;)V
    .locals 1

    .line 160
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 161
    new-instance v0, Landroid/view/GestureDetector;

    invoke-direct {v0, p1, p0}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDetector:Landroid/view/GestureDetector;

    .line 162
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    .line 163
    new-instance p2, Landroid/util/DisplayMetrics;

    invoke-direct {p2}, Landroid/util/DisplayMetrics;-><init>()V

    const-string v0, "window"

    .line 164
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/WindowManager;

    .line 165
    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 166
    iget p1, p2, Landroid/util/DisplayMetrics;->density:F

    iput p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDensity:F

    return-void
.end method

.method private calculateAngle(FFFF)F
    .locals 2

    sub-float/2addr p4, p2

    float-to-double v0, p4

    sub-float/2addr p3, p1

    float-to-double p1, p3

    .line 311
    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p1

    double-to-float p1, p1

    .line 312
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYSecondCoord:F

    iget p3, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYCoord:F

    sub-float/2addr p2, p3

    float-to-double p2, p2

    iget p4, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXSecondCoord:F

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXCoord:F

    sub-float/2addr p4, v0

    float-to-double v0, p4

    invoke-static {p2, p3, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p2

    double-to-float p2, p2

    sub-float/2addr p1, p2

    const p2, 0x42652ee0

    mul-float/2addr p1, p2

    return p1
.end method

.method private calculateScale(FFFF)F
    .locals 1

    .line 327
    invoke-static {p1, p2, p3, p4}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->distance(FFFF)F

    move-result p1

    .line 328
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXCoord:F

    iget p3, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYCoord:F

    iget p4, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXSecondCoord:F

    iget v0, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYSecondCoord:F

    invoke-static {p2, p3, p4, v0}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->distance(FFFF)F

    move-result p2

    div-float/2addr p1, p2

    return p1
.end method

.method private static distance(FFFF)F
    .locals 0

    sub-float/2addr p0, p2

    sub-float/2addr p1, p3

    mul-float/2addr p0, p0

    mul-float/2addr p1, p1

    add-float/2addr p0, p1

    float-to-double p0, p0

    .line 344
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p0

    double-to-float p0, p0

    return p0
.end method

.method private handleTwoFingerMotion(Landroid/view/MotionEvent;)Z
    .locals 12

    .line 280
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    .line 281
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    const/4 v2, 0x1

    .line 282
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    .line 283
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    .line 285
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v4, 0x2

    if-eq p1, v4, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 287
    :cond_0
    invoke-direct {p0, v0, v1, v3, v2}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->calculateAngle(FFFF)F

    move-result v10

    add-float p1, v3, v0

    .line 288
    iget v4, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXSecondCoord:F

    iget v5, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXCoord:F

    add-float/2addr v4, v5

    sub-float/2addr p1, v4

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr p1, v4

    add-float v5, v2, v1

    .line 289
    iget v6, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYSecondCoord:F

    iget v7, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYCoord:F

    add-float/2addr v6, v7

    sub-float/2addr v5, v6

    div-float v6, v5, v4

    .line 290
    invoke-direct {p0, v0, v1, v3, v2}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->calculateScale(FFFF)F

    move-result v11

    .line 291
    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    neg-float v5, p1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-interface/range {v4 .. v11}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onTransform(FFFFFFF)Z

    move-result p1

    .line 296
    :goto_0
    iput v3, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXSecondCoord:F

    .line 297
    iput v2, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYSecondCoord:F

    return p1
.end method


# virtual methods
.method public handleEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    .line 177
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    .line 178
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    .line 181
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eq v3, v4, :cond_1

    .line 188
    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 189
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v5, :cond_0

    .line 190
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onUp()Z

    move-result v3

    .line 192
    :cond_0
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDualMode:Z

    move v0, v3

    goto :goto_0

    .line 183
    :cond_1
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler;->handleTwoFingerMotion(Landroid/view/MotionEvent;)Z

    move-result p1

    .line 184
    iput-boolean v5, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDualMode:Z

    move v0, p1

    .line 196
    :goto_0
    iput v1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mXCoord:F

    .line 197
    iput v2, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mYCoord:F

    :cond_2
    return v0
.end method

.method public onDoubleTap(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 213
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onDoubleTap()Z

    move-result p1

    return p1
.end method

.method public final onDoubleTapEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public final onDown(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 227
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onDown()Z

    move-result p1

    return p1
.end method

.method public final onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 269
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    invoke-interface {p1, p3, p4}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onFling(FF)Z

    move-result p1

    return p1
.end method

.method public final onLongPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public final onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 8

    .line 249
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDualMode:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 250
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    const/high16 p2, 0x3f800000    # 1.0f

    mul-float v0, p3, p2

    mul-float/2addr p2, p4

    invoke-interface {p1, v0, p2}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onMoveSingleTap(FF)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    .line 253
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const p1, 0x3e4ccccd    # 0.2f

    mul-float/2addr p3, p1

    iget p2, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDensity:F

    div-float v4, p3, p2

    mul-float/2addr p4, p1

    div-float v5, p4, p2

    const/4 v6, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-interface/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onTransform(FFFFFFF)Z

    move-result p1

    return p1
.end method

.method public final onShowPress(Landroid/view/MotionEvent;)V
    .locals 0

    return-void
.end method

.method public final onSingleTapConfirmed(Landroid/view/MotionEvent;)Z
    .locals 0

    .line 206
    iget-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mDualMode:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/GestureHandler;->mListener:Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;

    invoke-interface {p1}, Lcom/sonymobile/scan3d/viewer/GestureHandler$GestureListener;->onSingleTap()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
