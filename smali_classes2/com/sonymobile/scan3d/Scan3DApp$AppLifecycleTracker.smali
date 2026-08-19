.class Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;
.super Ljava/lang/Object;
.source "Scan3DApp.java"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/Scan3DApp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AppLifecycleTracker"
.end annotation


# static fields
.field private static final MAX_DELAY_IN_MINUTES:I = 0xa


# instance fields
.field lastTimeInBackGround:J


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 112
    iput-wide v0, p0, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;->lastTimeInBackGround:J

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/Scan3DApp$1;)V
    .locals 0

    .line 110
    invoke-direct {p0}, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 4

    .line 123
    iget-wide v0, p0, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;->lastTimeInBackGround:J

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    return-void

    .line 127
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 128
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-wide v2, p0, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;->lastTimeInBackGround:J

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide v0

    const-wide/16 v2, 0xa

    cmp-long p1, v0, v2

    if-lez p1, :cond_1

    .line 135
    invoke-static {}, Lcom/sonymobile/scan3d/analytics/SBDPUtil;->resetInstance()V

    :cond_1
    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 2

    .line 151
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/Scan3DApp$AppLifecycleTracker;->lastTimeInBackGround:J

    return-void
.end method
