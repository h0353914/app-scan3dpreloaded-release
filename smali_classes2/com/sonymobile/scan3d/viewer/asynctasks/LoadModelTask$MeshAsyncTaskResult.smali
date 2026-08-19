.class public Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask$MeshAsyncTaskResult;
.super Ljava/lang/Object;
.source "LoadModelTask.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/asynctasks/LoadModelTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MeshAsyncTaskResult"
.end annotation


# instance fields
.field public fileset:Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;

.field public model:Lcom/sonymobile/scan3d/viewer/ModelContainer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
