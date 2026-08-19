.class public Lcom/sonymobile/scan3d/viewer/ModelContainer;
.super Ljava/lang/Object;
.source "ModelContainer.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/viewer/ModelContainer;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "ModelContainer"

.field private static sValidHandles:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mNativeHandle:J

.field private mTemporaryReleaseStackException:Ljava/lang/Exception;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->sValidHandles:Ljava/util/Set;

    .line 33
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->classInit()V

    .line 44
    new-instance v0, Lcom/sonymobile/scan3d/viewer/ModelContainer$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    invoke-static {}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->create()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    .line 61
    sget-object v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->sValidHandles:Ljava/util/Set;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    .line 38
    sget-object p1, Lcom/sonymobile/scan3d/viewer/ModelContainer;->sValidHandles:Ljava/util/Set;

    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 39
    sget-object p1, Lcom/sonymobile/scan3d/viewer/ModelContainer;->TAG:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "invalid handle from parcel: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    .line 40
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    :cond_0
    return-void
.end method

.method private static native classInit()V
.end method

.method private native copyFrom(J)V
.end method

.method private native copyMetadataFrom(J)V
.end method

.method private static native create()J
.end method

.method private native destroy()V
.end method

.method private native nativeGetFaceCount()I
.end method

.method private native nativeGetScanPolicyMode()I
.end method

.method private native nativeGetScanType()I
.end method

.method private native nativeGetVertexCount()I
.end method


# virtual methods
.method public native clear()V
.end method

.method public declared-synchronized copy()Lcom/sonymobile/scan3d/viewer/ModelContainer;
    .locals 4

    monitor-enter p0

    .line 77
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    .line 83
    new-instance v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;-><init>()V

    .line 84
    iget-wide v1, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    invoke-direct {v0, v1, v2}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copyFrom(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 85
    monitor-exit p0

    return-object v0

    .line 78
    :cond_0
    :try_start_1
    sget-object v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->TAG:Ljava/lang/String;

    const-string v1, "copy() is called on a released ModelContainer. It was previously released here:"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    iget-object v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mTemporaryReleaseStackException:Ljava/lang/Exception;

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 81
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "NativeHandler is null!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public copyMetadataFrom(Lcom/sonymobile/scan3d/viewer/ModelContainer;)V
    .locals 2

    .line 89
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getNativeHandle()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->copyMetadataFrom(J)V

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public native exportGlb(Ljava/lang/String;[FI)Z
.end method

.method public native exportZip(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public native generatePreview(I)Landroid/graphics/Bitmap;
.end method

.method public getFaceCount()I
    .locals 1

    .line 120
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->nativeGetFaceCount()I

    move-result v0

    return v0
.end method

.method public declared-synchronized getNativeHandle()J
    .locals 2

    monitor-enter p0

    .line 130
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getScanPolicyMode()I
    .locals 1

    .line 112
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->nativeGetScanPolicyMode()I

    move-result v0

    return v0
.end method

.method public getScanType()I
    .locals 1

    .line 103
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->nativeGetScanType()I

    move-result v0

    return v0
.end method

.method public native getTransform()[F
.end method

.method public getVertexCount()I
    .locals 1

    .line 116
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->nativeGetVertexCount()I

    move-result v0

    return v0
.end method

.method public native importZip(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public is180Scan()Z
    .locals 3

    .line 152
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->getScanType()I

    move-result v0

    const/4 v1, 0x1

    const/16 v2, 0x100

    if-eq v0, v2, :cond_1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public native isEmpty()Z
.end method

.method public declared-synchronized release()V
    .locals 3

    monitor-enter p0

    .line 66
    :try_start_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/viewer/ModelContainer;->destroy()V

    .line 67
    sget-object v0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->sValidHandles:Ljava/util/Set;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    const-wide/16 v0, 0x0

    .line 68
    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    .line 69
    new-instance v0, Ljava/lang/Exception;

    invoke-direct {v0}, Ljava/lang/Exception;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mTemporaryReleaseStackException:Ljava/lang/Exception;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public native setTransform([F)V
.end method

.method public native tessellate(I)Z
.end method

.method public declared-synchronized writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    monitor-enter p0

    .line 148
    :try_start_0
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/ModelContainer;->mNativeHandle:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
