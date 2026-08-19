.class public Lcom/sonymobile/scan3d/ToastAnimationSet;
.super Ljava/lang/Object;
.source "ToastAnimationSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/ToastAnimationSet$DelayAction;,
        Lcom/sonymobile/scan3d/ToastAnimationSet$AnimationAction;,
        Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;,
        Lcom/sonymobile/scan3d/ToastAnimationSet$Builder;,
        Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;
    }
.end annotation


# instance fields
.field mAnimationQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private mIsRunning:Z

.field private mToastAnimationListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 255
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mAnimationQueue:Ljava/util/List;

    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mIsRunning:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/sonymobile/scan3d/ToastAnimationSet$1;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;-><init>()V

    return-void
.end method

.method static synthetic access$302(Lcom/sonymobile/scan3d/ToastAnimationSet;Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;)Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;
    .locals 0

    .line 19
    iput-object p1, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mToastAnimationListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    return-object p1
.end method

.method static synthetic access$600(Lcom/sonymobile/scan3d/ToastAnimationSet;Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/ToastAnimationSet;->notifyAnimationStart(Landroid/view/View;Landroid/view/animation/Animation;)V

    return-void
.end method

.method static synthetic access$700(Lcom/sonymobile/scan3d/ToastAnimationSet;Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 0

    .line 19
    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/ToastAnimationSet;->notifyAnimationEnd(Landroid/view/View;Landroid/view/animation/Animation;)V

    return-void
.end method

.method static synthetic access$800(Lcom/sonymobile/scan3d/ToastAnimationSet;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->handleNext()V

    return-void
.end method

.method static synthetic access$900(Lcom/sonymobile/scan3d/ToastAnimationSet;)Landroid/os/Handler;
    .locals 0

    .line 19
    iget-object p0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method private handleNext()V
    .locals 2

    .line 286
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mIsRunning:Z

    if-eqz v0, :cond_1

    .line 288
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 289
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mAnimationQueue:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;

    .line 290
    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/ToastAnimationSet$IAsyncAction;->execute(Lcom/sonymobile/scan3d/ToastAnimationSet;)V

    goto :goto_0

    .line 292
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->notifyAllAnimationsComplete()V

    :cond_1
    :goto_0
    return-void
.end method

.method private isEmpty()Z
    .locals 1

    .line 336
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mAnimationQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private notifyAllAnimationsComplete()V
    .locals 1

    .line 325
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mToastAnimationListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    if-eqz v0, :cond_0

    .line 326
    invoke-interface {v0, p0}, Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;->onAllAnimationsComplete(Lcom/sonymobile/scan3d/ToastAnimationSet;)V

    :cond_0
    return-void
.end method

.method private notifyAnimationEnd(Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 1

    .line 316
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mToastAnimationListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    if-eqz v0, :cond_0

    .line 317
    invoke-interface {v0, p1, p2}, Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;->onAnimationEnd(Landroid/view/View;Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method

.method private notifyAnimationStart(Landroid/view/View;Landroid/view/animation/Animation;)V
    .locals 1

    .line 304
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mToastAnimationListener:Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;

    if-eqz v0, :cond_0

    .line 305
    invoke-interface {v0, p1, p2}, Lcom/sonymobile/scan3d/ToastAnimationSet$ToastAnimationListener;->onAnimationStart(Landroid/view/View;Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    .line 45
    iget-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mAnimationQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    .line 46
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mIsRunning:Z

    return-void
.end method

.method public execute()V
    .locals 2

    .line 264
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mIsRunning:Z

    if-nez v0, :cond_1

    .line 269
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mHandler:Landroid/os/Handler;

    .line 271
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 272
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/ToastAnimationSet;->mIsRunning:Z

    .line 273
    invoke-direct {p0}, Lcom/sonymobile/scan3d/ToastAnimationSet;->handleNext()V

    :cond_0
    return-void

    .line 265
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Error: The toast animation set is already executing."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
