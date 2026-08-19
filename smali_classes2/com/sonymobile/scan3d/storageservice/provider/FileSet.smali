.class Lcom/sonymobile/scan3d/storageservice/provider/FileSet;
.super Ljava/lang/Object;
.source "FileSet.java"

# interfaces
.implements Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/provider/FileSet;",
            ">;"
        }
    .end annotation
.end field

.field private static final PATTERN:Ljava/lang/String; = "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"


# instance fields
.field private mCreated:Ljava/util/Date;

.field private mDownloadable:Z

.field private mEtag:Ljava/lang/String;

.field private mId:J

.field private mIdentifier:Ljava/lang/String;

.field private mIsImprovement:Z

.field private mIsRiggable:Z

.field private mLogTransferId:I

.field private mLogUrl:Ljava/lang/String;

.field private mName:Ljava/lang/String;

.field private mPreviewUrl:Ljava/lang/String;

.field private mPropFileUrl:Ljava/lang/String;

.field private mRiggedFileUrl:Ljava/lang/String;

.field private mRiggedPreviewUrl:Ljava/lang/String;

.field private mScanType:I

.field private mShareHash:Ljava/lang/String;

.field private mSharedMeshes:I

.field private mSyncState:I

.field private mTransferFlags:I

.field private mVisible:Z

.field private mZipFileUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 155
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 171
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 122
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    const/4 v0, 0x1

    .line 145
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 4

    .line 179
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 122
    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    const/4 v1, 0x1

    .line 145
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    .line 180
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mId:J

    .line 181
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    .line 182
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    .line 183
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    .line 184
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedPreviewUrl:Ljava/lang/String;

    .line 185
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPropFileUrl:Ljava/lang/String;

    .line 186
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mName:Ljava/lang/String;

    .line 187
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    .line 188
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mEtag:Ljava/lang/String;

    .line 189
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIdentifier:Ljava/lang/String;

    .line 190
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mCreated:Ljava/util/Date;

    .line 191
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    .line 192
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mShareHash:Ljava/lang/String;

    .line 193
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lez v2, :cond_0

    move v2, v1

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    iput-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mVisible:Z

    .line 194
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lez v2, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    move v2, v0

    :goto_1
    iput-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mDownloadable:Z

    .line 195
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mTransferFlags:I

    .line 196
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    .line 197
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogTransferId:I

    .line 198
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lez v2, :cond_2

    move v2, v1

    goto :goto_2

    :cond_2
    move v2, v0

    :goto_2
    iput-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsImprovement:Z

    .line 199
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    if-lez v2, :cond_3

    move v0, v1

    :cond_3
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    .line 200
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSharedMeshes:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/provider/FileSet$1;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private format(Ljava/util/Date;)Ljava/lang/String;
    .locals 3

    if-eqz p1, :cond_0

    .line 684
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private getCreatedString()Ljava/lang/String;
    .locals 1

    .line 452
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mCreated:Ljava/util/Date;

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private parse(Ljava/lang/String;)Ljava/util/Date;
    .locals 3

    .line 666
    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0, p1}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1
    :try_end_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 669
    :catch_0
    new-instance p1, Ljava/util/Date;

    invoke-direct {p1}, Ljava/util/Date;-><init>()V

    :goto_0
    return-object p1
.end method


# virtual methods
.method public deleteAllFiles(Landroid/content/Context;)Z
    .locals 3

    .line 442
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->isRemote()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 445
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIdentifier:Ljava/lang/String;

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->getResultsDirectory(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 446
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-static {p1, v2}, Lcom/sonymobile/scan3d/storageservice/utils/FsUtils;->deleteFiles(Ljava/io/File;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    move v1, v2

    :cond_1
    :goto_0
    return v1
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getCreated()Ljava/util/Date;
    .locals 1

    .line 335
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mCreated:Ljava/util/Date;

    return-object v0
.end method

.method public getFiles()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    .line 345
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 346
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->isRemote()Z

    move-result v1

    if-nez v1, :cond_3

    .line 347
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 348
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 349
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 350
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 352
    :cond_0
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedPreviewUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 353
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedPreviewUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    :cond_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPropFileUrl:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 356
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPropFileUrl:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 358
    :cond_2
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    if-eqz v1, :cond_3

    .line 359
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    return-object v0
.end method

.method public getId()J
    .locals 2

    .line 240
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mId:J

    return-wide v0
.end method

.method public getIdentifier()Ljava/lang/String;
    .locals 1

    .line 250
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIdentifier:Ljava/lang/String;

    return-object v0
.end method

.method public getLogUrl()Ljava/lang/String;
    .locals 1

    .line 340
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 245
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mName:Ljava/lang/String;

    return-object v0
.end method

.method public getPreviewUrl()Ljava/lang/String;
    .locals 1

    .line 295
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getPropFileUrl()Ljava/lang/String;
    .locals 1

    .line 310
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPropFileUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getRiggedFileUrl()Ljava/lang/String;
    .locals 1

    .line 300
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getRiggedPreviewUrl()Ljava/lang/String;
    .locals 1

    .line 305
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedPreviewUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getScanType()I
    .locals 1

    .line 367
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    return v0
.end method

.method public getShareHash()Ljava/lang/String;
    .locals 1

    .line 382
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mShareHash:Ljava/lang/String;

    return-object v0
.end method

.method public getSharedMeshes()I
    .locals 1

    .line 413
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSharedMeshes:I

    return v0
.end method

.method public getSyncState()I
    .locals 1

    .line 275
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    return v0
.end method

.method public getTransferFlags()I
    .locals 1

    .line 330
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mTransferFlags:I

    return v0
.end method

.method public getTransferId()I
    .locals 1

    .line 387
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogTransferId:I

    return v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 3

    .line 235
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/provider/Contract$FileRecord;->CONTENT_URI:Landroid/net/Uri;

    iget-wide v1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mId:J

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getZipFileUrl()Ljava/lang/String;
    .locals 1

    .line 255
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    return-object v0
.end method

.method public isDownloadable()Z
    .locals 1

    .line 377
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mDownloadable:Z

    return v0
.end method

.method public isImprovable(Landroid/content/Context;)Z
    .locals 1

    .line 397
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mTransferFlags:I

    and-int/lit8 v0, v0, 0x8

    if-eqz v0, :cond_1

    .line 398
    :cond_0
    invoke-static {p1}, Lcom/sonymobile/scan3d/storageservice/Config;->isPostProcessEnabled(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isImprovement()Z
    .locals 1

    .line 392
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsImprovement:Z

    return v0
.end method

.method public isRemote()Z
    .locals 3

    .line 261
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    const/4 v1, 0x0

    :cond_0
    return v1
.end method

.method public isRiggable()Z
    .locals 1

    .line 403
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    return v0
.end method

.method public isRigged()Z
    .locals 1

    .line 408
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isSynced()Z
    .locals 2

    .line 281
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public isValid()Z
    .locals 4

    .line 317
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->isRemote()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    goto :goto_0

    .line 321
    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 322
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 323
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    return v1
.end method

.method public isVisible()Z
    .locals 1

    .line 372
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mVisible:Z

    return v0
.end method

.method setCreated(Ljava/lang/String;)V
    .locals 0

    .line 597
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mCreated:Ljava/util/Date;

    return-void
.end method

.method setCreated(Ljava/util/Date;)V
    .locals 0

    .line 606
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mCreated:Ljava/util/Date;

    return-void
.end method

.method setDownloadable(Z)V
    .locals 0

    .line 488
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mDownloadable:Z

    return-void
.end method

.method setEtag(Ljava/lang/String;)V
    .locals 0

    .line 588
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mEtag:Ljava/lang/String;

    return-void
.end method

.method setId(J)V
    .locals 0

    .line 506
    iput-wide p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mId:J

    return-void
.end method

.method setIdentifier(Ljava/lang/String;)V
    .locals 0

    .line 515
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIdentifier:Ljava/lang/String;

    return-void
.end method

.method setIsImprovement(Z)V
    .locals 0

    .line 636
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsImprovement:Z

    return-void
.end method

.method setIsRiggable(Z)V
    .locals 0

    .line 645
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    return-void
.end method

.method setLogTransferId(I)V
    .locals 0

    .line 627
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogTransferId:I

    return-void
.end method

.method setLogUrl(Ljava/lang/String;)V
    .locals 0

    .line 497
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    return-void
.end method

.method setName(Ljava/lang/String;)V
    .locals 0

    .line 533
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mName:Ljava/lang/String;

    return-void
.end method

.method setPreviewUrl(Ljava/lang/String;)V
    .locals 0

    .line 552
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    return-void
.end method

.method setPropFileUrl(Ljava/lang/String;)V
    .locals 0

    .line 579
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPropFileUrl:Ljava/lang/String;

    return-void
.end method

.method setRiggedFileUrl(Ljava/lang/String;)V
    .locals 0

    .line 561
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    return-void
.end method

.method setRiggedPreviewUrl(Ljava/lang/String;)V
    .locals 0

    .line 570
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedPreviewUrl:Ljava/lang/String;

    return-void
.end method

.method setScanType(I)V
    .locals 1

    .line 615
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    .line 616
    iget p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    const/16 v0, 0x101

    if-eq p1, v0, :cond_0

    const/16 v0, 0x100

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    .line 617
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    :cond_0
    return-void
.end method

.method setShareHash(Ljava/lang/String;)V
    .locals 0

    .line 470
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mShareHash:Ljava/lang/String;

    return-void
.end method

.method setSharedMeshes(I)V
    .locals 0

    .line 654
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSharedMeshes:I

    return-void
.end method

.method setSyncState(I)V
    .locals 0

    .line 524
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    return-void
.end method

.method setTransferFlags(I)V
    .locals 0

    .line 461
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mTransferFlags:I

    return-void
.end method

.method setVisible(Z)V
    .locals 0

    .line 479
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mVisible:Z

    return-void
.end method

.method setZipFileUrl(Ljava/lang/String;)V
    .locals 0

    .line 542
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    return-void
.end method

.method public toContentValues()Landroid/content/ContentValues;
    .locals 3

    .line 418
    new-instance v0, Landroid/content/ContentValues;

    const/16 v1, 0xf

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const-string v1, "name"

    .line 419
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "identifier"

    .line 420
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIdentifier:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "created"

    .line 421
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->getCreatedString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "sync_state"

    .line 422
    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "eTag"

    .line 423
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mEtag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "thumb_url"

    .line 424
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "url"

    .line 425
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "log_url"

    .line 426
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "share_hash"

    .line 427
    iget-object v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mShareHash:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "downloadable"

    .line 428
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mDownloadable:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "visible"

    .line 429
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mVisible:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "scan_type"

    .line 430
    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "log_transfer_id"

    .line 431
    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogTransferId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "is_improvement"

    .line 432
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsImprovement:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "riggable"

    .line 433
    iget-boolean v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "shared_meshes"

    .line 434
    iget v2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSharedMeshes:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 210
    iget-wide v0, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 211
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mZipFileUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 212
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPreviewUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 213
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedFileUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 214
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mRiggedPreviewUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 215
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mPropFileUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 216
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 217
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSyncState:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 218
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mEtag:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 219
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIdentifier:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 220
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->getCreatedString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 221
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 222
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mShareHash:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 223
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mVisible:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 224
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mDownloadable:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 225
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mTransferFlags:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 226
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mScanType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 227
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mLogTransferId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 228
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsImprovement:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 229
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mIsRiggable:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 230
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/provider/FileSet;->mSharedMeshes:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
