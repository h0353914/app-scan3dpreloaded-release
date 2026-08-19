.class Lcom/sonymobile/scan3d/SphinxEngine;
.super Lcom/sonymobile/scan3d/GLEngine;
.source "SphinxEngine.java"

# interfaces
.implements Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;
.implements Ljava/lang/Runnable;


# static fields
.field private static final DEBUG:Z = true

.field private static final MAX_EVENTS:I = 0x5

.field static final MSG_BREAK_ESTABLISH:I = 0x8

.field static final MSG_CAMERA_OPENED:I = 0x3

.field static final MSG_CAMERA_TEMPERATURE_SHUTDOWN:I = 0x7

.field static final MSG_ENVIRONMENT_ERRORS:I = 0x1

.field static final MSG_FINISHED:I = 0x0

.field static final MSG_HINT:I = 0x2

.field static final MSG_RESTARTING:I = 0x6

.field static final MSG_STARTED:I = 0x4

.field static final MSG_STOPPED:I = 0x5

.field private static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.SphinxEngine"

.field private static final THREAD_NAME:Ljava/lang/String; = "SphinxThread"


# instance fields
.field private mBlobTime:J

.field private mContext:Landroid/content/Context;

.field private mCurrentState:Lcom/sonymobile/scan3d/SphinxState;

.field private mEnvConditions:Lcom/sonymobile/scan3d/EnvConditions;

.field private mEventQueue:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue<",
            "Lcom/sonymobile/scan3d/Event;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

.field private mPolicy:I

.field private mScaleTime:J

.field private mSculptTime:J

.field private mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

.field private mSize:Landroid/util/Size;

.field private mSphinx:Lcom/sonymobile/scan3d/Sphinx;

.field private mSprayPaintingTime:J

.field private mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method constructor <init>(Landroid/content/Context;ILandroid/os/Handler;)V
    .locals 2

    .line 188
    invoke-direct {p0}, Lcom/sonymobile/scan3d/GLEngine;-><init>()V

    const-wide/16 v0, 0x0

    .line 164
    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    .line 169
    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mBlobTime:J

    .line 174
    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    .line 179
    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    .line 189
    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    .line 190
    iput p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    .line 191
    iput-object p3, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mHandler:Landroid/os/Handler;

    .line 192
    new-instance p1, Lcom/sonymobile/scan3d/SphinxSettings;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcom/sonymobile/scan3d/SphinxSettings;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    .line 193
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 194
    new-instance p1, Ljava/util/concurrent/ArrayBlockingQueue;

    const/4 p2, 0x5

    invoke-direct {p1, p2}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEventQueue:Ljava/util/concurrent/BlockingQueue;

    return-void
.end method

.method private getFocusType()Lcom/sonymobile/scan3d/SphinxFocusType;
    .locals 3

    .line 731
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->useFrontCamera()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 732
    sget-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusFixed:Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object v0

    .line 734
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->getFocusType()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    const v2, 0x7f10015d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 735
    sget-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusAuto:Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object v0

    .line 736
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->getFocusType()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    const v2, 0x7f10015f

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 737
    sget-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusManual:Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object v0

    .line 738
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->getFocusType()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    const v2, 0x7f100161

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 739
    sget-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusTof:Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object v0

    .line 741
    :cond_3
    sget-object v0, Lcom/sonymobile/scan3d/SphinxFocusType;->kFocusFixed:Lcom/sonymobile/scan3d/SphinxFocusType;

    return-object v0
.end method

.method private handleAnalyticsStats(Lcom/sonymobile/scan3d/SphinxHint;)V
    .locals 2

    .line 664
    iget v0, p1, Lcom/sonymobile/scan3d/SphinxHint;->code:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    iget v0, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg2:I

    if-eqz v0, :cond_2

    .line 665
    iget p1, p1, Lcom/sonymobile/scan3d/SphinxHint;->arg1:I

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/16 v0, 0x11

    if-eq p1, v0, :cond_0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    .line 679
    :pswitch_0
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_STORAGE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 676
    :pswitch_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_LOW_BATTERY:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 670
    :pswitch_2
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_HOT:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 667
    :cond_0
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_CLOSE:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 673
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->WARNING_TOO_FAST:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handleAnalyticsStats(Lcom/sonymobile/scan3d/SphinxState;Lcom/sonymobile/scan3d/SphinxState;)V
    .locals 4

    .line 598
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine$1;->$SwitchMap$com$sonymobile$scan3d$SphinxState:[I

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/SphinxState;->ordinal()I

    move-result p2

    aget p2, v0, p2

    const-wide/16 v0, 0x0

    packed-switch p2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_0

    .line 637
    :pswitch_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCULPTING_LOST_TRACK:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 620
    :pswitch_2
    iget-wide v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    cmp-long p2, v2, v0

    if-nez p2, :cond_0

    .line 621
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    .line 622
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mBlobTime:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mBlobTime:J

    .line 624
    :cond_0
    sget-object p2, Lcom/sonymobile/scan3d/SphinxState;->kStateSculptingLostTrack:Lcom/sonymobile/scan3d/SphinxState;

    if-ne p1, p2, :cond_1

    .line 625
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->REGAINED_TRACK_DURING_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 627
    :cond_1
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->START_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 617
    :pswitch_3
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->LOST_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto/16 :goto_0

    .line 600
    :pswitch_4
    iget-wide v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    cmp-long p2, v2, v0

    if-nez p2, :cond_2

    .line 601
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    .line 603
    :cond_2
    sget-object p2, Lcom/sonymobile/scan3d/SphinxState;->kStateEstablishScaleLostTrack:Lcom/sonymobile/scan3d/SphinxState;

    if-ne p1, p2, :cond_3

    .line 604
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->REGAINED_TRACK_DURING_CALIBRATION:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 606
    :cond_3
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CALIBRATION_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 646
    :pswitch_5
    iget-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    cmp-long p1, p1, v0

    if-lez p1, :cond_4

    .line 647
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    sub-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    .line 649
    :cond_4
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SPRAY_PAINTING_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 640
    :pswitch_6
    iget-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    cmp-long p1, p1, v0

    if-nez p1, :cond_5

    .line 641
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    .line 643
    :cond_5
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SPRAY_PAINTING_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 631
    :pswitch_7
    iget-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    cmp-long p1, p1, v0

    if-lez p1, :cond_6

    .line 632
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    sub-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    .line 634
    :cond_6
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->STOP_SCULPTING:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 610
    :pswitch_8
    iget-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    cmp-long p1, p1, v0

    if-lez p1, :cond_7

    .line 611
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    sub-long/2addr p1, v0

    iput-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    .line 612
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mBlobTime:J

    .line 614
    :cond_7
    sget-object p1, Lcom/sonymobile/scan3d/analytics/ScanEvent;->CALIBRATION_ENDED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {p1, p2, v0}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private handleEvents()V
    .locals 4

    .line 316
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEventQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/Event;

    :goto_0
    if-eqz v0, :cond_1

    .line 317
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    if-nez v1, :cond_1

    .line 318
    sget-object v1, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleEvents(): type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getType()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 320
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getType()I

    move-result v1

    const/4 v2, 0x0

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_1

    .line 361
    :pswitch_1
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 362
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v2, v1}, Lcom/sonymobile/scan3d/Sphinx;->setLocaleIsRTL(Z)V

    goto/16 :goto_1

    .line 341
    :pswitch_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/Sphinx;->clearEnvironmentErrors()V

    goto/16 :goto_1

    .line 357
    :pswitch_3
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    invoke-virtual {v1, v3}, Lcom/sonymobile/scan3d/Sphinx;->setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)Z

    move-result v1

    const/4 v3, 0x7

    .line 358
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-direct {p0, v3, v1, v2, v2}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    goto/16 :goto_1

    .line 354
    :pswitch_4
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/Sphinx;->setCameraTemperature(Lcom/sonymobile/scan3d/SphinxCameraTemperatureState;)Z

    goto :goto_1

    .line 351
    :pswitch_5
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->restart()V

    goto :goto_1

    .line 329
    :pswitch_6
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->destroy()V

    .line 330
    invoke-virtual {p0, v2}, Lcom/sonymobile/scan3d/SphinxEngine;->setSurface(Landroid/view/Surface;)Z

    goto :goto_1

    .line 344
    :pswitch_7
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/sonymobile/scan3d/Sphinx;->setNextDebugMode(I)V

    goto :goto_1

    .line 347
    :pswitch_8
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    .line 348
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v2, v1}, Lcom/sonymobile/scan3d/Sphinx;->setBlobScaleZoom(F)V

    goto :goto_1

    .line 337
    :pswitch_9
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    .line 338
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v2, v1}, Lcom/sonymobile/scan3d/Sphinx;->setNextState(Z)Z

    goto :goto_1

    .line 322
    :pswitch_a
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/Surface;

    .line 323
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/SphinxEngine;->setSurface(Landroid/view/Surface;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 324
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg2()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Size;

    iput-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSize:Landroid/util/Size;

    .line 325
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSize:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/sonymobile/scan3d/SphinxEngine;->init(II)V

    goto :goto_1

    .line 333
    :pswitch_b
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getArg1()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 334
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {v2, v1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setFocusPosition(I)V

    .line 369
    :cond_0
    :goto_1
    sget-object v1, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/handleEvents(): type="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Event;->getType()I

    move-result v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEventQueue:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/Event;

    goto/16 :goto_0

    :cond_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_0
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_6
        :pswitch_0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method private init(II)V
    .locals 4

    .line 390
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "init("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ") mSphinx="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->destroy()V

    .line 393
    :cond_0
    new-instance v0, Lcom/sonymobile/scan3d/EnvConditions;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/sonymobile/scan3d/EnvConditions;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEnvConditions:Lcom/sonymobile/scan3d/EnvConditions;

    .line 394
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->useFrontCamera()Z

    move-result v0

    .line 395
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->getFocusType()Lcom/sonymobile/scan3d/SphinxFocusType;

    move-result-object v1

    .line 396
    new-instance v2, Lcom/sonymobile/scan3d/CameraImageProvider;

    iget-object v3, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, p0, v1, v0}, Lcom/sonymobile/scan3d/CameraImageProvider;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/CameraImageProvider$OnCameraStatusListener;Lcom/sonymobile/scan3d/SphinxFocusType;Z)V

    iput-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    .line 397
    invoke-static {}, Lcom/sonymobile/scan3d/PlatformTypeDetector;->detectPlatform()I

    move-result v0

    .line 399
    new-instance v1, Lcom/sonymobile/scan3d/Sphinx;

    iget v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-direct {v1, v0, v2}, Lcom/sonymobile/scan3d/Sphinx;-><init>(II)V

    iput-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    .line 400
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/Sphinx;->setLocaleIsRTL(Z)V

    .line 401
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/Sphinx;->setPassword(Ljava/lang/String;)V

    .line 403
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEnvConditions:Lcom/sonymobile/scan3d/EnvConditions;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/EnvConditions;->sendData(Lcom/sonymobile/scan3d/Sphinx;)V

    .line 405
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0, p1, p2}, Lcom/sonymobile/scan3d/Sphinx;->setDisplaySize(II)V

    .line 406
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/CameraImageProvider;->openCamera()V

    .line 407
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    iget-object p2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/CameraImageProvider;->getNativeHandle()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/Sphinx;->setImageProvider(J)V

    .line 408
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/Sphinx;->init()V

    .line 410
    sget-object p1, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string p2, "/init()"

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static isFinishedScanning(Lcom/sonymobile/scan3d/SphinxState;)Z
    .locals 1

    .line 553
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine$1;->$SwitchMap$com$sonymobile$scan3d$SphinxState:[I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxState;->ordinal()I

    move-result p0

    aget p0, v0, p0

    packed-switch p0, :pswitch_data_0

    const/4 p0, 0x0

    return p0

    :pswitch_0
    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_0
    .packed-switch 0x4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private isRunning()Z
    .locals 2

    .line 309
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/sonymobile/scan3d/SphinxState;->kStateDone:Lcom/sonymobile/scan3d/SphinxState;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mCurrentState:Lcom/sonymobile/scan3d/SphinxState;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private iterate()Z
    .locals 2

    .line 294
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 295
    :cond_0
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/SphinxEngine;->render(Lcom/sonymobile/scan3d/Sphinx;)Z

    move-result v0

    if-nez v0, :cond_1

    return v1

    .line 296
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->isDone()Z

    move-result v0

    if-eqz v0, :cond_2

    return v1

    .line 297
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->isStreaming()Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    .line 298
    :cond_3
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEnvConditions:Lcom/sonymobile/scan3d/EnvConditions;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/EnvConditions;->sendData(Lcom/sonymobile/scan3d/Sphinx;)V

    .line 299
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->runOneIteration()V

    const/4 v0, 0x1

    return v0
.end method

.method private notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V
    .locals 1

    .line 475
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p2, 0x5

    if-ne p1, p2, :cond_3

    .line 477
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mHandler:Landroid/os/Handler;

    invoke-static {p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 480
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mHandler:Landroid/os/Handler;

    invoke-static {v0, p1, p2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    if-eqz p3, :cond_1

    .line 482
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p1, Landroid/os/Message;->arg1:I

    :cond_1
    if-eqz p4, :cond_2

    .line 485
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p1, Landroid/os/Message;->arg2:I

    .line 487
    :cond_2
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_3
    :goto_0
    return-void
.end method

.method private onStateChanged(Lcom/sonymobile/scan3d/SphinxState;Lcom/sonymobile/scan3d/SphinxState;)V
    .locals 5

    .line 420
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onStateChanged(): old state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", new state="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine$1;->$SwitchMap$com$sonymobile$scan3d$SphinxState:[I

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/SphinxState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 448
    :pswitch_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->sendAnalyticsData()V

    .line 449
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->saveFileRecord()Landroid/net/Uri;

    move-result-object v0

    .line 450
    invoke-direct {p0, v2, v0, v3, v3}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    goto :goto_0

    .line 442
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->getErrors()[Lcom/sonymobile/scan3d/EnvironmentError;

    move-result-object v0

    .line 443
    array-length v4, v0

    if-lez v4, :cond_0

    .line 444
    invoke-direct {p0, v1, v0, v3, v3}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    goto :goto_0

    :pswitch_2
    const/4 v0, 0x4

    .line 436
    invoke-direct {p0, v0, v3, v3, v3}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 437
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useLamp()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 438
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/CameraImageProvider;->setLamp(Z)V

    goto :goto_0

    .line 424
    :pswitch_3
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SCAN_STARTED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v3}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 430
    :try_start_0
    sget-object v0, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->VALUES:Lcom/sonymobile/scan3d/analytics/CalibrationEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v3, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v3}, Lcom/sonymobile/scan3d/analytics/CalibrationEvent;->send(Landroid/content/Context;I)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 432
    sget-object v1, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3, v0}, Lcom/sonymobile/scan3d/logging/DebugLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 456
    :cond_0
    :goto_0
    invoke-static {p2}, Lcom/sonymobile/scan3d/SphinxEngine;->isFinishedScanning(Lcom/sonymobile/scan3d/SphinxState;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p1}, Lcom/sonymobile/scan3d/SphinxEngine;->isFinishedScanning(Lcom/sonymobile/scan3d/SphinxState;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 457
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useLamp()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 458
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/CameraImageProvider;->setLamp(Z)V

    .line 462
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/SphinxEngine;->handleAnalyticsStats(Lcom/sonymobile/scan3d/SphinxState;Lcom/sonymobile/scan3d/SphinxState;)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private restart()V
    .locals 2

    .line 378
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "restart()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    const/4 v1, 0x6

    .line 380
    invoke-direct {p0, v1, v0, v0, v0}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 381
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->destroy()V

    .line 382
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSize:Landroid/util/Size;

    invoke-virtual {v0}, Landroid/util/Size;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSize:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/SphinxEngine;->init(II)V

    .line 383
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "/restart()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private saveFileRecord()Landroid/net/Uri;
    .locals 10

    .line 500
    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    packed-switch v0, :pswitch_data_0

    .line 509
    :pswitch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x9

    move-object v3, v0

    move v6, v1

    goto :goto_0

    .line 505
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    const v1, 0x7f100333

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    move-object v3, v0

    move v6, v1

    .line 513
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->getLastLogFile()Ljava/lang/String;

    move-result-object v0

    .line 514
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/Sphinx;->getLastResultFile()Ljava/lang/String;

    move-result-object v1

    .line 515
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/Sphinx;->getScanType()I

    move-result v7

    .line 517
    new-instance v8, Ljava/io/File;

    invoke-direct {v8, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 518
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 521
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/Config;->isPostProcessEnabled(Landroid/content/Context;)Z

    move-result v0

    const/4 v9, 0x0

    if-nez v0, :cond_1

    .line 522
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_0

    .line 523
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to delete logfile "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/logging/NativeLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    move-object v1, v9

    .line 529
    :cond_1
    :goto_1
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    move-object v4, v8

    move-object v5, v1

    invoke-static/range {v2 .. v7}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;Ljava/io/File;II)Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 533
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    .line 534
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/ITransientFileSet;->toContentValues()Landroid/content/ContentValues;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v9

    goto :goto_2

    .line 536
    :cond_2
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleting scan file after failing to create record: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 536
    invoke-static {v0, v2}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v1, :cond_3

    .line 538
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 539
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Deleting log file after failing to create record: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 540
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 539
    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_2
    return-object v9

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method

.method private sendAnalyticsData()V
    .locals 11

    .line 693
    sget-object v0, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->ENGINE:Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget-wide v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mScaleTime:J

    iget-wide v4, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSculptTime:J

    iget-wide v6, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mBlobTime:J

    iget-wide v8, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSprayPaintingTime:J

    iget v10, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual/range {v0 .. v10}, Lcom/sonymobile/scan3d/analytics/EngineTimeEvent;->send(Landroid/content/Context;JJJJI)V

    .line 697
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine$1;->$SwitchMap$com$sonymobile$scan3d$SphinxFocusType:[I

    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->getFocusType()Lcom/sonymobile/scan3d/SphinxFocusType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/SphinxFocusType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 708
    :pswitch_0
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_TOF:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 705
    :pswitch_1
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_MANUAL:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 702
    :pswitch_2
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_AUTO:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    goto :goto_0

    .line 699
    :pswitch_3
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SETTING_FOCUS_TYPE_FIXED:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    .line 715
    :goto_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    const-string v1, "audio"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/AudioManager;

    const/4 v1, 0x3

    .line 716
    invoke-virtual {v0, v1}, Landroid/media/AudioManager;->getStreamVolume(I)I

    move-result v0

    if-lez v0, :cond_0

    .line 717
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useSound()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 718
    sget-object v0, Lcom/sonymobile/scan3d/analytics/ScanEvent;->SOUND_HEARD:Lcom/sonymobile/scan3d/analytics/ScanEvent;

    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/analytics/ScanEvent;->send(Landroid/content/Context;I)V

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private useFrontCamera()Z
    .locals 2

    .line 751
    iget v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mPolicy:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/16 v1, 0xe

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method destroy()V
    .locals 2

    .line 268
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "destroy()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEventQueue:Ljava/util/concurrent/BlockingQueue;

    if-eqz v0, :cond_0

    .line 271
    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->clear()V

    .line 274
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 275
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->closeCamera()V

    .line 276
    iput-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    .line 279
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    if-eqz v0, :cond_2

    .line 280
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->done()V

    .line 281
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->release()V

    .line 282
    iput-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    .line 285
    :cond_2
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "/destroy()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method isStopped()Z
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method

.method public onClose(Lcom/sonymobile/scan3d/CameraImageProvider;)V
    .locals 1

    .line 584
    sget-object p1, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v0, "CameraImageProvider onClose"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onOpen(Lcom/sonymobile/scan3d/CameraImageProvider;)V
    .locals 2

    .line 571
    sget-object p1, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v0, "Sphinx version: 3.0.A.0.36"

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 574
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->getFocusType()Lcom/sonymobile/scan3d/SphinxFocusType;

    move-result-object p1

    .line 575
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/SphinxFocusType;->ordinal()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x3

    invoke-direct {p0, v1, p1, v0, v0}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 577
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useEdgeEnhancement()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->setEdgeEnhancement(Z)V

    .line 578
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useNoiseReduction()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->setNoiseReduction(Z)V

    .line 579
    iget-object p1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mImageProvider:Lcom/sonymobile/scan3d/CameraImageProvider;

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSettings:Lcom/sonymobile/scan3d/SphinxSettings;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/SphinxSettings;->useAutoWhiteBalanceLock()Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/sonymobile/scan3d/CameraImageProvider;->setAWBLock(Z)V

    return-void
.end method

.method postEvent(Lcom/sonymobile/scan3d/Event;)Z
    .locals 1

    .line 255
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mEventQueue:Ljava/util/concurrent/BlockingQueue;

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public final run()V
    .locals 4

    .line 217
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "run()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, -0x4

    .line 218
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 219
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    const-string v1, "SphinxThread"

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 221
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->isRunning()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 223
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->handleEvents()V

    .line 225
    invoke-direct {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->iterate()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 226
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/Sphinx;->getState()Lcom/sonymobile/scan3d/SphinxState;

    move-result-object v0

    .line 230
    :goto_1
    iget-object v2, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mSphinx:Lcom/sonymobile/scan3d/Sphinx;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/Sphinx;->popHint()Lcom/sonymobile/scan3d/SphinxHint;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 231
    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/SphinxEngine;->handleAnalyticsStats(Lcom/sonymobile/scan3d/SphinxHint;)V

    const/4 v3, 0x2

    .line 232
    invoke-direct {p0, v3, v2, v1, v1}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    goto :goto_1

    .line 235
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mCurrentState:Lcom/sonymobile/scan3d/SphinxState;

    if-eq v1, v0, :cond_0

    .line 236
    invoke-direct {p0, v1, v0}, Lcom/sonymobile/scan3d/SphinxEngine;->onStateChanged(Lcom/sonymobile/scan3d/SphinxState;Lcom/sonymobile/scan3d/SphinxState;)V

    .line 237
    iput-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mCurrentState:Lcom/sonymobile/scan3d/SphinxState;

    goto :goto_0

    .line 241
    :cond_2
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/SphinxEngine;->destroy()V

    .line 242
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/SphinxEngine;->setSurface(Landroid/view/Surface;)Z

    const/4 v0, 0x5

    .line 243
    invoke-direct {p0, v0, v1, v1, v1}, Lcom/sonymobile/scan3d/SphinxEngine;->notify(ILjava/lang/Object;Ljava/lang/Integer;Ljava/lang/Integer;)V

    .line 244
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "/run()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method setSurface(Landroid/view/Surface;)Z
    .locals 3

    .line 260
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setSurface("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    invoke-super {p0, p1}, Lcom/sonymobile/scan3d/GLEngine;->setSurface(Landroid/view/Surface;)Z

    move-result p1

    return p1
.end method

.method stop()V
    .locals 2

    .line 202
    sget-object v0, Lcom/sonymobile/scan3d/SphinxEngine;->TAG:Ljava/lang/String;

    const-string v1, "stop()"

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/logging/NativeLog;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/sonymobile/scan3d/SphinxEngine;->mStopped:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method
