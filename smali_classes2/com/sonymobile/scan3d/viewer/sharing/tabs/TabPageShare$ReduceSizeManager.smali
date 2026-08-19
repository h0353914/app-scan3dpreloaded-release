.class Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;
.super Ljava/lang/Object;
.source "TabPageShare.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ReduceSizeManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;,
        Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;


# instance fields
.field mListener:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;",
            ">;"
        }
    .end annotation
.end field

.field private mResult:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

.field private mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

.field private mTask:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 156
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    return-void
.end method

.method public static getInstance()Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;
    .locals 1

    .line 164
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->sInstance:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;

    if-nez v0, :cond_0

    .line 165
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->sInstance:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;

    .line 167
    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->sInstance:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;

    return-object v0
.end method


# virtual methods
.method public addListener(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;)V
    .locals 2

    if-eqz p1, :cond_1

    .line 183
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    .line 184
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 186
    :cond_0
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mListener:Ljava/lang/ref/WeakReference;

    .line 187
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    if-ne v0, v1, :cond_1

    .line 188
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    .line 189
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mResult:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;->onReductionDone(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    :cond_1
    return-void
.end method

.method isTaskRunning()Z
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method reductionDone(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mTask:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;

    if-ne v0, p1, :cond_1

    if-eqz v0, :cond_1

    .line 232
    sget-object p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->FINISHED:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    const/4 p1, 0x0

    .line 233
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mTask:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;

    .line 234
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mListener:Ljava/lang/ref/WeakReference;

    if-eqz p1, :cond_0

    .line 235
    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;

    if-eqz p1, :cond_1

    .line 237
    sget-object v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    .line 238
    invoke-interface {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;->onReductionDone(Lcom/sonymobile/scan3d/viewer/sharing/Shareable;)V

    goto :goto_0

    .line 242
    :cond_0
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mResult:Lcom/sonymobile/scan3d/viewer/sharing/Shareable;

    :cond_1
    :goto_0
    return-void
.end method

.method startReduction(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 217
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->IDLE:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    if-ne v0, v1, :cond_0

    .line 218
    new-instance v0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;

    invoke-direct {v0, p1, p2, p4}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;-><init>(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/sharing/Shareable;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mTask:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;

    .line 219
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mTask:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/String;

    const/4 p4, 0x0

    aput-object p3, p2, p4

    invoke-virtual {p1, p2}, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceGLTFSizeTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 220
    sget-object p1, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;->RUNNING:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mState:Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$TaskState;

    :cond_0
    return-void
.end method

.method unregisterListener(Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager$ReduceGLTFSizeListener;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 201
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mListener:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_0

    .line 202
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/sharing/tabs/TabPageShare$ReduceSizeManager;->mListener:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    return-void
.end method
