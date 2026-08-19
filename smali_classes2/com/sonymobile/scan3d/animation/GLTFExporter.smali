.class public Lcom/sonymobile/scan3d/animation/GLTFExporter;
.super Ljava/lang/Object;
.source "GLTFExporter.java"


# instance fields
.field private mNativeHandle:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    invoke-static {}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->nativeConstructor()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/animation/GLTFExporter;->mNativeHandle:J

    return-void
.end method

.method private static native nativeConstructor()J
.end method

.method private native nativeDestructor()J
.end method


# virtual methods
.method public native isReduceImpossible(I)Z
.end method

.method public load(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 77
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->load(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public native load(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public reduceSize(I)Z
    .locals 1

    const/4 v0, 0x4

    .line 121
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->reduceSize(II)Z

    move-result p1

    return p1
.end method

.method public native reduceSize(II)Z
.end method

.method public native reduceTextureSize(II)V
.end method

.method public release()V
    .locals 2

    .line 66
    invoke-direct {p0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->nativeDestructor()J

    const-wide/16 v0, 0x0

    .line 67
    iput-wide v0, p0, Lcom/sonymobile/scan3d/animation/GLTFExporter;->mNativeHandle:J

    return-void
.end method

.method public save(Ljava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    .line 148
    invoke-virtual {p0, p1, v0}, Lcom/sonymobile/scan3d/animation/GLTFExporter;->save(Ljava/lang/String;Z)Z

    move-result p1

    return p1
.end method

.method public native save(Ljava/lang/String;Z)Z
.end method

.method public native saveToZip(Ljava/lang/String;Ljava/lang/String;)Z
.end method
