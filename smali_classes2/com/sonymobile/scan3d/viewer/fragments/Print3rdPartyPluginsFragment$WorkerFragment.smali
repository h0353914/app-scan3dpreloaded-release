.class public Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;
.super Landroidx/fragment/app/Fragment;
.source "Print3rdPartyPluginsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WorkerFragment"
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "com.sonymobile.scan3d.viewer.fragments.Print3rdPartyPluginsFragment$WorkerFragment"


# instance fields
.field private mMeshData:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

.field private mOrigContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field private final sExecutor:Ljava/util/concurrent/Executor;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 437
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 439
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->sExecutor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method private createTask()Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
    .locals 9

    .line 487
    new-instance v8, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mOrigContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mMeshData:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 488
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;->getFileSet()Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, v8

    move-object v1, p0

    invoke-direct/range {v0 .. v7}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment$1;-><init>(Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;ZZ)V

    return-object v8
.end method


# virtual methods
.method executeAsync(Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;)V
    .locals 0
    .param p4    # Lcom/sonymobile/scan3d/PrintSelection;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 471
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mMeshData:Lcom/sonymobile/scan3d/viewer/MeshHolderFragment;

    .line 472
    iput-object p4, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 473
    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mOrigContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 474
    iput-object p3, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->mPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 475
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->createTask()Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;

    move-result-object p1

    .line 476
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->sExecutor:Ljava/util/concurrent/Executor;

    const/4 p3, 0x0

    new-array p3, p3, [Ljava/lang/Void;

    invoke-virtual {p1, p2, p3}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 457
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 458
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/fragments/Print3rdPartyPluginsFragment$WorkerFragment;->setRetainInstance(Z)V

    return-void
.end method
