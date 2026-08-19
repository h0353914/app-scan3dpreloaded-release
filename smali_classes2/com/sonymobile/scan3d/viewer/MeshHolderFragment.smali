.class public Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
.super Landroidx/fragment/app/Fragment;
.source "MeshHolderFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$DbObserverTask;,
        Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;,
        Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;,
        Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;,
        Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;
    }
.end annotation


# static fields
.field private static final KEY_PRINT_SELECTION:Ljava/lang/String; = "PRINT_SELECTION"

.field private static final KEY_URI:Ljava/lang/String; = "uri"


# instance fields
.field private mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mContentObserver:Landroid/database/ContentObserver;

.field private mContentResolver:Landroid/content/ContentResolver;

.field private mCurrentComputePrintMeshTask:Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

.field private mExecutor:Ljava/util/concurrent/Executor;

.field private mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

.field private mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field private mHandler:Landroid/os/Handler;

.field private mListener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

.field private mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mName:Ljava/lang/String;

.field private mOnChangeRunnable:Ljava/lang/Runnable;

.field private mOrgTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

.field private mPath:Ljava/lang/String;

.field private mPendingSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field private mPrevSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field private mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintEditorSeek:I

.field private mPrintError:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field private mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

.field private mScenography:Lcom/sonymobile/scan3d/ScenoID;

.field private mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

.field private mTextLimit:I

.field private mUri:Landroid/net/Uri;

.field private mUseUntexturedShading:Z

.field private mViewerViewMatrix:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 48
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mExecutor:Ljava/util/concurrent/Executor;

    .line 53
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 58
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mOrgTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 68
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    .line 89
    sget-object v0, Lcom/sonymobile/scan3d/ScenoID;->SCENO_TEXTURED:Lcom/sonymobile/scan3d/ScenoID;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mScenography:Lcom/sonymobile/scan3d/ScenoID;

    const/4 v0, 0x0

    .line 90
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUseUntexturedShading:Z

    const/4 v0, -0x1

    .line 93
    iput v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditorSeek:I

    return-void
.end method

.method static synthetic access$002(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mOrgTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-object p1
.end method

.method static synthetic access$1000(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-object p0
.end method

.method static synthetic access$102(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-object p0
.end method

.method static synthetic access$1402(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;)Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mCurrentComputePrintMeshTask:Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

    return-object p1
.end method

.method static synthetic access$1500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Ljava/lang/Runnable;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mOnChangeRunnable:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$202(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mName:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$302(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPath:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$400(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 0

    .line 43
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setModelContainer(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    return-void
.end method

.method static synthetic access$500(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mListener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    return-object p0
.end method

.method static synthetic access$600(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/os/Handler;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$700(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Landroid/net/Uri;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    return-object p0
.end method

.method static synthetic access$800(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;)Lcom/sonymobile/scan3d/viewer/ModelContainer;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-object p0
.end method

.method static synthetic access$902(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;
    .locals 0

    .line 43
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-object p1
.end method

.method private destroy()V
    .locals 2

    .line 425
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 431
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->release()V

    .line 432
    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 434
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    if-eqz v0, :cond_1

    .line 435
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->release()V

    .line 436
    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    .line 438
    :cond_1
    invoke-virtual {p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 439
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setModelContainer(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 440
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setAltPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 441
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setSocleModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 442
    invoke-direct {p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    return-void
.end method

.method public static getInstance(Landroidx/fragment/app/FragmentActivity;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
    .locals 1

    .line 136
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getInstance(Landroidx/fragment/app/FragmentActivity;Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    move-result-object p0

    return-object p0
.end method

.method public static getInstance(Landroidx/fragment/app/FragmentActivity;Landroid/net/Uri;)Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;
    .locals 3

    .line 140
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    move-result-object p0

    .line 141
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroidx/fragment/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    if-nez v0, :cond_0

    .line 143
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;-><init>()V

    .line 144
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "uri"

    .line 145
    invoke-virtual {v1, v2, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 146
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setArguments(Landroid/os/Bundle;)V

    .line 148
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->beginTransaction()Landroidx/fragment/app/FragmentTransaction;

    move-result-object p0

    .line 149
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Landroidx/fragment/app/FragmentTransaction;->add(Landroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/FragmentTransaction;

    .line 150
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentTransaction;->commit()I

    :cond_0
    return-object v0
.end method

.method public static synthetic lambda$computePrintMesh$3(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V
    .locals 4

    .line 242
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-interface {p1, v0, v1, v2, v3}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;->onPrintMeshComputed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    return-void
.end method

.method public static synthetic lambda$computePrintMesh$4(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V
    .locals 6

    .line 246
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintError:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-object v0, p1

    invoke-interface/range {v0 .. v5}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;->onPrintMeshFailed(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;)V

    return-void
.end method

.method public static synthetic lambda$setMeshLoadingListener$0(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V
    .locals 2

    .line 160
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-interface {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;->onMeshLoaded(Landroid/net/Uri;Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    return-void
.end method

.method public static synthetic lambda$setMeshLoadingListener$1(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;->onMeshLoadFailed(Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic lambda$setMeshLoadingListener$2(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    invoke-interface {p1, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;->onMeshLoading(Landroid/net/Uri;)V

    return-void
.end method

.method private loadMesh()V
    .locals 5

    .line 205
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADING:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mOrgTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 206
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/content/Context;)V

    .line 227
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mExecutor:Ljava/util/concurrent/Executor;

    const/4 v2, 0x1

    new-array v2, v2, [Landroid/net/Uri;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private setAltPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 618
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 619
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-void
.end method

.method private setModelContainer(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 412
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    if-eq v0, p1, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 413
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-void
.end method

.method private setPrintEditModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 608
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 609
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-void
.end method

.method private setSocleModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 613
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 614
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    return-void
.end method


# virtual methods
.method public computePrintMesh(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)Z
    .locals 14

    .line 235
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPendingPrintSelection()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object v0

    .line 237
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    sget-object v2, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    const/4 v3, 0x0

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    sget-object v2, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    if-ne v1, v2, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrevSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 239
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/PrintSelection;->matchesSelection(Lcom/sonymobile/scan3d/PrintSelection;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 240
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$4;->$SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadTaskState:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 246
    :pswitch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$yyv9oTe--MEfm2GNPfWZcNFLiRE;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 242
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$mUVnYTRF-RwBIVpcWBs1cZRtSxk;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$mUVnYTRF-RwBIVpcWBs1cZRtSxk;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return v3

    .line 254
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lcom/sonymobile/scan3d/viewer/-$$Lambda$5kRIYLxsSr-ktLzRQlSUW9mjCoY;

    invoke-direct {v2, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$5kRIYLxsSr-ktLzRQlSUW9mjCoY;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 256
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    .line 257
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Xperia "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/util/Calendar;->get(I)I

    move-result v5

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v5, "-"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v5, 0x2

    invoke-virtual {v1, v5}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/2addr v1, v4

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 259
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getScanType()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/sonymobile/scan3d/PrintSelection;->setScanType(I)V

    .line 260
    invoke-virtual {v0, v1}, Lcom/sonymobile/scan3d/PrintSelection;->setInscription(Ljava/lang/String;)V

    .line 261
    sget-object v1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_LOADING:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    iput-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    .line 263
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mCurrentComputePrintMeshTask:Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

    if-eqz v1, :cond_2

    invoke-virtual {v1, v4}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->cancel(Z)Z

    .line 264
    :cond_2
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintSelection;->clone()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object v8

    .line 265
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v7

    iget-object v9, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v10, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    const/4 v11, 0x1

    const/4 v12, 0x1

    move-object v5, v0

    move-object v6, p0

    move-object v13, p1

    invoke-direct/range {v5 .. v13}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$2;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;ZZLcom/sonymobile/scan3d/viewer/MeshHolderFragment$PrintMeshLoadingListener;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mCurrentComputePrintMeshTask:Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

    .line 289
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mCurrentComputePrintMeshTask:Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mExecutor:Ljava/util/concurrent/Executor;

    new-array v1, v3, [Ljava/lang/Void;

    invoke-virtual {p1, v0, v1}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public createOrGetFaceBlender()Lcom/sonymobile/scan3d/viewer/FaceBlender;
    .locals 1

    .line 312
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    if-nez v0, :cond_0

    .line 313
    new-instance v0, Lcom/sonymobile/scan3d/viewer/FaceBlender;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    .line 315
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    return-object v0
.end method

.method public createSphanRenderer(Landroid/content/Context;)Lcom/sonymobile/scan3d/viewer/SphanRenderer;
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 300
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 301
    new-instance v0, Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-direct {v0, p1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    .line 303
    :cond_0
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    return-object p1
.end method

.method public disableFileSetObserver()V
    .locals 2

    .line 557
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentResolver:Landroid/content/ContentResolver;

    if-eqz v0, :cond_0

    .line 558
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    const/4 v0, 0x0

    .line 559
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentResolver:Landroid/content/ContentResolver;

    :cond_0
    return-void
.end method

.method public enableFileSetObserver()V
    .locals 4

    .line 539
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_0

    .line 540
    new-instance v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$3;

    new-instance v1, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/fragment/app/FragmentActivity;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-direct {v0, p0, v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$3;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentObserver:Landroid/database/ContentObserver;

    .line 552
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentResolver:Landroid/content/ContentResolver;

    .line 553
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentResolver:Landroid/content/ContentResolver;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    invoke-interface {v1}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getUri()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    return-void
.end method

.method public getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;
    .locals 1

    .line 473
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 564
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mName:Ljava/lang/String;

    if-nez v0, :cond_0

    const-string v0, ""

    :cond_0
    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1

    .line 568
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPath:Ljava/lang/String;

    return-object v0
.end method

.method public getPendingPrintSelection()Lcom/sonymobile/scan3d/PrintSelection;
    .locals 1

    .line 417
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPendingSelection:Lcom/sonymobile/scan3d/PrintSelection;

    return-object v0
.end method

.method public getPrintEditorSeek()I
    .locals 1

    .line 627
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditorSeek:I

    return v0
.end method

.method public getScanPolicyMode()I
    .locals 1

    .line 586
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getScanPolicyMode()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getScanType()I
    .locals 1

    .line 577
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getScanType()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getScenography()Lcom/sonymobile/scan3d/ScenoID;
    .locals 1

    .line 446
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mScenography:Lcom/sonymobile/scan3d/ScenoID;

    return-object v0
.end method

.method public getTextLimit()I
    .locals 1

    .line 594
    iget v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mTextLimit:I

    return v0
.end method

.method public getViewerViewMatrix()[F
    .locals 1

    .line 332
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mViewerViewMatrix:[F

    if-eqz v0, :cond_0

    invoke-virtual {v0}, [F->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [F

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public loadMeshIntoSphan()Z
    .locals 3

    .line 390
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 397
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    if-nez v1, :cond_0

    .line 398
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 401
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 402
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public loadRiggedMesh()Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/AssertionError;
        }
    .end annotation

    .line 359
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    .line 360
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    if-eqz v0, :cond_3

    .line 361
    invoke-interface {v0}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getRiggedFileUrl()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 364
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 368
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/sonymobile/scan3d/storageservice/authentication/Vault;->getPassword(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 369
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v2}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->getMeshCount()I

    move-result v2

    const/4 v3, 0x2

    if-ge v2, v3, :cond_1

    .line 370
    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mSphanRenderer:Lcom/sonymobile/scan3d/viewer/SphanRenderer;

    invoke-virtual {v2, v0, v1}, Lcom/sonymobile/scan3d/viewer/SphanRenderer;->load(Ljava/lang/String;Ljava/lang/String;)Z

    .line 373
    :cond_1
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    return-object v0

    .line 365
    :cond_2
    :goto_0
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    return-object v0

    .line 375
    :cond_3
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;->FAILED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadRiggedMeshState;

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 180
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    const-string v0, "PRINT_SELECTION"

    .line 182
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/sonymobile/scan3d/PrintSelection;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPendingSelection:Lcom/sonymobile/scan3d/PrintSelection;

    goto :goto_0

    .line 184
    :cond_0
    new-instance p1, Lcom/sonymobile/scan3d/PrintSelection;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/PrintSelection;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPendingSelection:Lcom/sonymobile/scan3d/PrintSelection;

    :goto_0
    const/4 p1, 0x1

    .line 186
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setRetainInstance(Z)V

    .line 187
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "uri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/net/Uri;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    .line 188
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->loadMesh()V

    return-void
.end method

.method public onDestroy()V
    .locals 0

    .line 200
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->destroy()V

    .line 201
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    return-void
.end method

.method public onDetach()V
    .locals 1

    const/4 v0, 0x0

    .line 174
    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mListener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    .line 175
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDetach()V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "PRINT_SELECTION"

    .line 193
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getPendingPrintSelection()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 194
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onSaveInstanceState(Landroid/os/Bundle;)V

    return-void
.end method

.method public resetFaceBlender()V
    .locals 1

    .line 322
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFaceBlender:Lcom/sonymobile/scan3d/viewer/FaceBlender;

    if-eqz v0, :cond_0

    .line 323
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/FaceBlender;->reset()Z

    :cond_0
    return-void
.end method

.method public resetPendingPrintSelection()V
    .locals 1

    .line 421
    new-instance v0, Lcom/sonymobile/scan3d/PrintSelection;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/PrintSelection;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPendingSelection:Lcom/sonymobile/scan3d/PrintSelection;

    return-void
.end method

.method public setFileSetChangeRunnable(Ljava/lang/Runnable;)V
    .locals 0

    .line 485
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mOnChangeRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method public setMeshLoadingListener(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V
    .locals 2

    .line 156
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mListener:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;

    if-eqz p1, :cond_0

    .line 158
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$4;->$SwitchMap$com$sonymobile$scan3d$viewer$MeshHolderFragment$LoadTaskState:[I

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mOrgTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    invoke-virtual {v1}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$WWKrOtQrPtZT5ye-EK13mlbV9PU;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 163
    :pswitch_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$2Qy9yA5RJfibHjvgeSDW1UqPRmw;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$2Qy9yA5RJfibHjvgeSDW1UqPRmw;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 160
    :pswitch_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mHandler:Landroid/os/Handler;

    new-instance v1, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$f2O3trkndl6-kxyEi-J58npVOug;

    invoke-direct {v1, p0, p1}, Lcom/sonymobile/scan3d/viewer/-$$Lambda$MeshHolderFragment$f2O3trkndl6-kxyEi-J58npVOug;-><init>(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$MeshLoadingListener;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setName(Ljava/lang/String;)V
    .locals 4

    .line 463
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 464
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    const/4 v2, 0x1

    invoke-static {v0, v1, p1, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->updateName(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;Z)V

    .line 465
    sget-object v0, Lcom/sonymobile/scan3d/analytics/HitEvent;->RENAME:Lcom/sonymobile/scan3d/analytics/HitEvent;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const-wide/16 v2, 0x1

    invoke-virtual {v0, v1, v2, v3}, Lcom/sonymobile/scan3d/analytics/HitEvent;->send(Landroid/content/Context;J)V

    const/4 v0, 0x0

    .line 466
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 467
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mName:Ljava/lang/String;

    .line 468
    sget-object p1, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    :cond_0
    return-void
.end method

.method public setNotLoaded()V
    .locals 1

    .line 598
    sget-object v0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;->STATE_NOT_LOADED:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintTaskState:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment$LoadTaskState;

    return-void
.end method

.method public setPrintEditorSeek(I)V
    .locals 0

    .line 623
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintEditorSeek:I

    return-void
.end method

.method public setPrintLoadResult(Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;)V
    .locals 1

    .line 631
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printSelection:Lcom/sonymobile/scan3d/PrintSelection;

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrevSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 632
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 633
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->socleContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setSocleModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 634
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->altPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setAltPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 635
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printEditContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setPrintEditModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 636
    iget-object p1, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintError:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    return-void
.end method

.method public setPrintModel(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 1

    .line 602
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    if-eq v0, p1, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 603
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-nez p1, :cond_1

    .line 604
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->setNotLoaded()V

    :cond_1
    return-void
.end method

.method public setScenography(Lcom/sonymobile/scan3d/ScenoID;)V
    .locals 0

    .line 408
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mScenography:Lcom/sonymobile/scan3d/ScenoID;

    return-void
.end method

.method public setTextLimit(I)V
    .locals 0

    .line 590
    iput p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mTextLimit:I

    return-void
.end method

.method public setUseUntexturedShading(Z)V
    .locals 0

    .line 455
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUseUntexturedShading:Z

    return-void
.end method

.method public setViewerViewMatrix([F)V
    .locals 0

    .line 344
    invoke-virtual {p1}, [F->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [F

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mViewerViewMatrix:[F

    return-void
.end method

.method public syncFileSet()V
    .locals 2

    .line 481
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUri:Landroid/net/Uri;

    invoke-static {v0, v1}, Lcom/sonymobile/scan3d/storageservice/provider/Factory;->create(Landroid/content/Context;Landroid/net/Uri;)Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mFileSet:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    return-void
.end method

.method public usingUntexturedShading()Z
    .locals 1

    .line 459
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->mUseUntexturedShading:Z

    return v0
.end method
