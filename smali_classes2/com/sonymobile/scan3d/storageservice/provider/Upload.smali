.class public final Lcom/sonymobile/scan3d/storageservice/provider/Upload;
.super Ljava/lang/Object;
.source "Upload.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Upload;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mId:J

.field private mState:I

.field private mUid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 35
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/Upload$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mId:J

    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    .line 63
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mUid:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/provider/Upload$1;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getId()J
    .locals 2

    .line 99
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mId:J

    return-wide v0
.end method

.method public getUid()Ljava/lang/String;
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mUid:Ljava/lang/String;

    return-object v0
.end method

.method public isActive()Z
    .locals 1

    .line 135
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isPending()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 144
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFinished()Z
    .locals 1

    .line 153
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isFailed()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->isUploaded()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public isPending()Z
    .locals 1

    .line 117
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRunning()Z
    .locals 2

    .line 126
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isUploaded()Z
    .locals 2

    .line 162
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method setId(J)V
    .locals 0

    .line 72
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mId:J

    return-void
.end method

.method setState(I)V
    .locals 0

    .line 90
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    return-void
.end method

.method setUid(Ljava/lang/String;)V
    .locals 0

    .line 81
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mUid:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 172
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 173
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mState:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 174
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;->mUid:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
