.class Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;
.super Ljava/lang/Object;
.source "ToastAnimationSet.java"

# interfaces
.implements Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/ToastAnimationSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DelayAction"
.end annotation


# instance fields
.field private mDelayMs:J


# direct methods
.method private constructor <init>(J)V
    .locals 0

    .line 240
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 241
    iput-wide p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;->mDelayMs:J

    return-void
.end method

.method synthetic constructor <init>(JLcom/sonymobile/scan3d/ToastAnimationSet$1;)V
    .locals 0

    .line 228
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;-><init>(J)V

    return-void
.end method

.method static synthetic lambda$execute$0(Lcom/sonymobile/scan3d/ToastAnimationSet;)V
    .locals 0

    .line 248
    invoke-static {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->access$800(Lcom/sonymobile/scan3d/ToastAnimationSet;)V

    return-void
.end method


# virtual methods
.method public execute(Lcom/sonymobile/scan3d/ToastAnimationSet;)V
    .locals 4

    .line 248
    invoke-static {p1}, Lcom/sonymobile/scan3d/ToastAnimationSet;->access$900(Lcom/sonymobile/scan3d/ToastAnimationSet;)Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lcom/sonymobile/scan3d/-$$Lambda$ToastAnimationSet$DelayAction$X6lkdg4kKaOrNCQFyxnIizoMx4g;

    invoke-direct {v1, p1}, Lcom/sonymobile/scan3d/-$$Lambda$ToastAnimationSet$DelayAction$X6lkdg4kKaOrNCQFyxnIizoMx4g;-><init>(Lcom/sonymobile/scan3d/ToastAnimationSet;)V

    iget-wide v2, p0, Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;->mDelayMs:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
