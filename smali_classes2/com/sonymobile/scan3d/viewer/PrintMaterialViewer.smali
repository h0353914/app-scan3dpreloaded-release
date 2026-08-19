.class public Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;
.super Ljava/lang/Object;
.source "PrintMaterialViewer.java"


# instance fields
.field private mNativeHandle:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 15
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;->classInit()V

    return-void
.end method

.method public constructor <init>(Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/ModelContainer;Lcom/sonymobile/scan3d/viewer/MeshRenderer;)V
    .locals 6

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 26
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v2

    .line 27
    invoke-virtual {p3}, Lcom/sonymobile/scan3d/viewer/MeshRenderer;->getNativeHandle()J

    move-result-wide v4

    .line 26
    invoke-static/range {v0 .. v5}, Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;->create(JJJ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;->mNativeHandle:J

    return-void
.end method

.method private static native classInit()V
.end method

.method private static native create(JJJ)J
.end method

.method private native destroy()V
.end method

.method private native setMaterialImpl(I)V
.end method


# virtual methods
.method public release()V
    .locals 2

    .line 34
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;->destroy()V

    const-wide/16 v0, 0x0

    .line 35
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;->mNativeHandle:J

    return-void
.end method

.method public setMaterial(Lcom/sonymobile/scan3d/PrintMaterialType;)V
    .locals 0

    .line 43
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintMaterialType;->ordinal()I

    move-result p1

    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/viewer/PrintMaterialViewer;->setMaterialImpl(I)V

    return-void
.end method

.method public native setShadowRemoval(F)V
.end method
