.class public Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;
.super Ljava/lang/Object;
.source "CompareImprovedMeshViewer.java"


# instance fields
.field private mNativeHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 13
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->classInit()V

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/MeshRenderer;)V
    .locals 6

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->getHandle(Lcom/sonymobile/scan3d/viewer/ModelContainer;)J

    move-result-wide v0

    invoke-direct {p0, p2}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->getHandle(Lcom/sonymobile/scan3d/viewer/ModelContainer;)J

    move-result-wide v2

    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->getNativeHandle()J

    move-result-wide v4

    invoke-static/range {v0 .. v5}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->create(JJJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->mNativeHandle:J

    return-void
.end method

.method private static native classInit()V
.end method

.method private static native create(JJJ)J
.end method

.method private native destroy()V
.end method

.method private getHandle(Lcom/sonymobile/scan3d/viewer/ModelContainer;)J
    .locals 2

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    .line 25
    :cond_0
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method


# virtual methods
.method public release()V
    .locals 2

    .line 29
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->destroy()V

    const-wide/16 v0, 0x0

    .line 30
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/CompareImprovedMeshViewer;->mNativeHandle:J

    return-void
.end method

.method public native setSplitRatio(F)V
.end method

.method public native setTextured(F)V
.end method
