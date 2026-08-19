.class public Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
.super Landroid/os/AsyncTask;
.source "ComputePrintMeshTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;",
        ">;"
    }
.end annotation


# instance fields
.field private final mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mContext:Landroid/content/Context;

.field private final mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field private final mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field private final mZipFileUrl:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/sonymobile/scan3d/PrintSelection;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;ZZ)V
    .locals 0

    .line 35
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mContext:Landroid/content/Context;

    .line 37
    invoke-virtual {p2}, Lcom/sonymobile/scan3d/PrintSelection;->clone()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 38
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copy()Lcom/sonymobile/scan3d/viewer/ModelContainer;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 39
    new-instance p1, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 40
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copyMetadataFrom(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    const/4 p1, 0x0

    if-eqz p6, :cond_0

    .line 42
    new-instance p2, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 43
    new-instance p2, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 46
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copyMetadataFrom(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    .line 47
    iget-object p2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p2, p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copyMetadataFrom(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    goto :goto_0

    .line 49
    :cond_0
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 50
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    :goto_0
    if-eqz p5, :cond_1

    .line 53
    new-instance p1, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 56
    iget-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {p1, p3}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copyMetadataFrom(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V

    goto :goto_1

    .line 58
    :cond_1
    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 61
    :goto_1
    invoke-interface {p4}, Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;->getZipFileUrl()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mZipFileUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;
    .locals 9

    .line 76
    new-instance p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;

    invoke-direct {p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;-><init>()V

    .line 77
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v4, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v5, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    iget-object v6, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mZipFileUrl:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-static/range {v0 .. v7}, Lcom/sonymobile/scan3d/PrintExecution;->prepare(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;Ljava/lang/String;I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v0

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 80
    iget-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    sget-object v1, Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;->SUCCESS:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    .line 81
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintSelection;->clone()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object v6

    .line 82
    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintMaterial;->PORCELAIN_WHITE:Lcom/sonymobile/scan3d/utils/PrintMaterial;

    invoke-virtual {v6, v0}, Lcom/sonymobile/scan3d/PrintSelection;->setMaterial(Lcom/sonymobile/scan3d/utils/PrintMaterial;)V

    .line 83
    iget-object v1, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iget-object v3, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object v7, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mZipFileUrl:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-static/range {v1 .. v8}, Lcom/sonymobile/scan3d/PrintExecution;->prepare(Landroid/content/Context;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/PrintSelection;Ljava/lang/String;I)Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    move-result-object v0

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

    .line 87
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 88
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printEditContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 89
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->socleContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 90
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->altPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    .line 91
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintSelection:Lcom/sonymobile/scan3d/PrintSelection;

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->printSelection:Lcom/sonymobile/scan3d/PrintSelection;

    .line 92
    invoke-virtual {v0}, Lcom/sonymobile/scan3d/PrintSelection;->getTextOverride()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p1, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;->name:Ljava/lang/String;

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 21
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->doInBackground([Ljava/lang/Void;)Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;

    move-result-object p1

    return-object p1
.end method

.method protected onCancelled()V
    .locals 1

    .line 66
    invoke-super {p0}, Landroid/os/AsyncTask;->onCancelled()V

    .line 67
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 68
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 69
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mAltPrintModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mSocleModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    .line 71
    :cond_1
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;->mPrintEditModel:Lcom/sonymobile/scan3d/viewer/ModelContainer;

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->release()V

    :cond_2
    return-void
.end method
