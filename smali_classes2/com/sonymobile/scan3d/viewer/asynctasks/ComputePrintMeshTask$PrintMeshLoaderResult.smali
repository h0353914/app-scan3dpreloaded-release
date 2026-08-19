.class public Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask$PrintMeshLoaderResult;
.super Ljava/lang/Object;
.source "ComputePrintMeshTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/asynctasks/ComputePrintMeshTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PrintMeshLoaderResult"
.end annotation


# instance fields
.field public altPrintContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field public errorType:Lcom/sonymobile/scan3d/viewer/PrintPreparationResult;

.field public name:Ljava/lang/String;

.field public printContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field public printEditContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field public printSelection:Lcom/sonymobile/scan3d/PrintSelection;

.field public socleContainer:Lcom/sonymobile/scan3d/viewer/ModelContainer;

.field public textLimit:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
