.class public final Lcom/sonymobile/scan3d/storageservice/provider/Improvement;
.super Ljava/lang/Object;
.source "Improvement.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/provider/Improvement;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mFailState:I

.field private mFileSetId:J

.field private mId:J

.field private mImprovementType:Ljava/lang/String;

.field private mMessageId:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mParentId:J

.field private mS3Path:Ljava/lang/String;

.field private mScanType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mParentId:J

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mName:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mS3Path:Ljava/lang/String;

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mImprovementType:Ljava/lang/String;

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mId:J

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mMessageId:Ljava/lang/String;

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mScanType:I

    .line 102
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/provider/Improvement$1;)V
    .locals 0

    .line 18
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getFailState()I
    .locals 1

    .line 222
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    return v0
.end method

.method public getFileSetId()J
    .locals 2

    .line 147
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    return-wide v0
.end method

.method public getFileSetUri()Landroid/net/Uri;
    .locals 3

    .line 156
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getId()J
    .locals 2

    .line 111
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mId:J

    return-wide v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 138
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getParentUri()Landroid/net/Uri;
    .locals 3

    .line 129
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mParentId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getS3Path()Ljava/lang/String;
    .locals 1

    .line 165
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mS3Path:Ljava/lang/String;

    return-object v0
.end method

.method public getScanType()I
    .locals 1

    .line 174
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mScanType:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 3

    .line 120
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$ImprovementRecord;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public isDownloadable()Z
    .locals 4

    .line 193
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mS3Path:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFailed()Z
    .locals 2

    .line 213
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isImproved()Z
    .locals 4

    .line 203
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isWaiting()Z
    .locals 4

    .line 183
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mS3Path:Ljava/lang/String;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method setFailState(I)V
    .locals 0

    .line 303
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    return-void
.end method

.method setFileSetId(J)V
    .locals 0

    .line 249
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    return-void
.end method

.method setId(J)V
    .locals 0

    .line 231
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mId:J

    return-void
.end method

.method setMessageId(Ljava/lang/String;)V
    .locals 0

    .line 285
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mMessageId:Ljava/lang/String;

    return-void
.end method

.method setName(Ljava/lang/String;)V
    .locals 0

    .line 258
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mName:Ljava/lang/String;

    return-void
.end method

.method setParentId(J)V
    .locals 0

    .line 240
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mParentId:J

    return-void
.end method

.method setS3Path(Ljava/lang/String;)V
    .locals 0

    .line 294
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mS3Path:Ljava/lang/String;

    return-void
.end method

.method setScanType(I)V
    .locals 0

    .line 276
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mScanType:I

    return-void
.end method

.method setType(Ljava/lang/String;)V
    .locals 0

    .line 267
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mImprovementType:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 313
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mParentId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 314
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 315
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mS3Path:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 316
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mImprovementType:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 317
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 318
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFileSetId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 319
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mMessageId:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 320
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mScanType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 321
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/Improvement;->mFailState:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
