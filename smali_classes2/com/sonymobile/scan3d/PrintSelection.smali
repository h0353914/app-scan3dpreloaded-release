.class public final Lcom/sonymobile/scan3d/PrintSelection;
.super Ljava/lang/Object;
.source "PrintSelection.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ljava/lang/Cloneable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/PrintSelection;",
            ">;"
        }
    .end annotation
.end field

.field private static final EPSILON:D = 1.0E-5

.field private static final IDENTITY:[F

.field public static final SELECTION_KEY_PARCELABLE:Ljava/lang/String; = "com.sonymobile.scan3d.extra.PRINT_SELECTION"


# instance fields
.field private mAdjustColors:Z

.field private mInscription:Ljava/lang/String;

.field private mMaterial:Ljava/lang/String;

.field private mPrintType:Lcom/sonymobile/scan3d/PrintType;

.field private mRemoveShadows:F

.field private mScanType:I

.field private mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

.field private mSizeConstraintMinDim:F

.field private mTextOverride:Ljava/lang/String;

.field private mTextSize:F

.field private mTransform:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    .line 28
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/sonymobile/scan3d/PrintSelection;->IDENTITY:[F

    .line 92
    new-instance v0, Lcom/sonymobile/scan3d/PrintSelection$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/PrintSelection$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/PrintSelection;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
        0x0
        0x0
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    sget-object v0, Lcom/sonymobile/scan3d/utils/PrintSize;->SMALL:Lcom/sonymobile/scan3d/utils/PrintSize;

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 113
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    .line 114
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/PrintSize;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/PrintSize;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 115
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    .line 116
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    .line 117
    invoke-virtual {p1}, Landroid/os/Parcel;->readSerializable()Ljava/io/Serializable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/PrintType;

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    .line 118
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    .line 119
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    .line 120
    invoke-virtual {p1}, Landroid/os/Parcel;->createFloatArray()[F

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    .line 121
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    .line 122
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    .line 123
    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/PrintSelection$1;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/PrintSelection;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public clone()Lcom/sonymobile/scan3d/PrintSelection;
    .locals 2

    .line 128
    new-instance v0, Lcom/sonymobile/scan3d/PrintSelection;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/PrintSelection;-><init>()V

    .line 129
    iget-object v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    iput-object v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    .line 130
    iget-object v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    iput-object v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    .line 131
    iget v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    iput v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    .line 132
    iget-boolean v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    iput-boolean v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    .line 133
    iget-object v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    iput-object v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    .line 134
    iget-object v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    iput-object v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    .line 135
    iget-object v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    iput-object v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    .line 136
    iget-object v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->getTransform()[F

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-object v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    .line 137
    iget v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    iput v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    .line 138
    iget v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    iput v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    .line 139
    iget v1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    iput v1, v0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 20
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->clone()Lcom/sonymobile/scan3d/PrintSelection;

    move-result-object v0

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAdjustColors()Z
    .locals 1

    .line 187
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    return v0
.end method

.method public getInscription()Ljava/lang/String;
    .locals 1

    .line 227
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    return-object v0
.end method

.method public getMaterial()Lcom/sonymobile/scan3d/utils/PrintMaterial;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 150
    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/PrintMaterial;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMetricSize()F
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/PrintSize;->getSize()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getPrintType()Lcom/sonymobile/scan3d/PrintType;
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    return-object v0
.end method

.method public getRemoveShadows()F
    .locals 1

    .line 195
    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    return v0
.end method

.method public getSize()Lcom/sonymobile/scan3d/utils/PrintSize;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    return-object v0
.end method

.method public getSizeConstraintMinDim()F
    .locals 1

    .line 284
    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    return v0
.end method

.method public getTextOverride()Ljava/lang/String;
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    return-object v0
.end method

.method public getTextSize()F
    .locals 1

    .line 270
    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    return v0
.end method

.method public getTransform()[F
    .locals 2

    .line 244
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/sonymobile/scan3d/PrintSelection;->IDENTITY:[F

    .line 245
    :goto_0
    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([FI)[F

    move-result-object v0

    return-object v0
.end method

.method public isValid()Z
    .locals 1

    .line 315
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 316
    invoke-static {v0}, Lcom/sonymobile/scan3d/utils/PrintMaterial;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/utils/PrintMaterial;

    move-result-object v0

    invoke-virtual {v0}, Lcom/sonymobile/scan3d/utils/PrintMaterial;->getType()Lcom/sonymobile/scan3d/PrintMaterialType;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public matchesSelection(Lcom/sonymobile/scan3d/PrintSelection;)Z
    .locals 4

    if-eqz p1, :cond_0

    .line 294
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    iget-object v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    .line 295
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    iget-object v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    iget-boolean v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    iget v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    sub-float/2addr v0, v1

    .line 298
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    const-wide v2, 0x3ee4f8b588e368f1L    # 1.0E-5

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    iget-object v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    .line 299
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    iget-object v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    iget v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    if-ne v0, v1, :cond_0

    .line 302
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/PrintSelection;->getTransform()[F

    move-result-object v0

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/PrintSelection;->getTransform()[F

    move-result-object v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([F[F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    iget-object v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    .line 303
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    iget v1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    sub-float/2addr v0, v1

    .line 304
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    float-to-double v0, v0

    cmpg-double v0, v0, v2

    if-gez v0, :cond_0

    iget v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    iget p1, p1, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    sub-float/2addr v0, p1

    .line 305
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double v0, p1

    cmpg-double p1, v0, v2

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public resetTransform()V
    .locals 1

    const/4 v0, 0x0

    .line 262
    iput-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    return-void
.end method

.method public setColorAdjustments(ZF)V
    .locals 0

    .line 206
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    .line 207
    iput p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    return-void
.end method

.method public setInscription(Ljava/lang/String;)V
    .locals 0

    .line 231
    iput-object p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    return-void
.end method

.method public setMaterial(Lcom/sonymobile/scan3d/utils/PrintMaterial;)V
    .locals 0

    .line 157
    invoke-virtual {p1}, Lcom/sonymobile/scan3d/utils/PrintMaterial;->name()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    return-void
.end method

.method public setPrintType(Lcom/sonymobile/scan3d/PrintType;)V
    .locals 0

    .line 215
    iput-object p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    return-void
.end method

.method public setScanType(I)V
    .locals 0

    .line 235
    iput p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    return-void
.end method

.method public setSize(Lcom/sonymobile/scan3d/utils/PrintSize;)V
    .locals 0

    .line 179
    iput-object p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    return-void
.end method

.method public setSizeConstraintMinDim(F)V
    .locals 0

    .line 277
    iput p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    return-void
.end method

.method public setTextOverride(Ljava/lang/String;)V
    .locals 0

    .line 223
    iput-object p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    return-void
.end method

.method public setTextSize(F)V
    .locals 2

    const/4 v0, 0x0

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    move p1, v0

    .line 266
    :cond_0
    iput p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    return-void
.end method

.method public setTransform([F)V
    .locals 2
    .param p1    # [F
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 258
    array-length v0, p1

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Ljava/util/Arrays;->copyOfRange([FII)[F

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    return-void
.end method

.method public shouldRecomputeHeight()Z
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 327
    iget-object p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mMaterial:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 328
    iget-object p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSize:Lcom/sonymobile/scan3d/utils/PrintSize;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/utils/PrintSize;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 329
    iget p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mRemoveShadows:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 330
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mAdjustColors:Z

    int-to-byte p2, p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 331
    iget-object p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mPrintType:Lcom/sonymobile/scan3d/PrintType;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeSerializable(Ljava/io/Serializable;)V

    .line 332
    iget-object p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextOverride:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 333
    iget-object p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mInscription:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 334
    iget-object p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTransform:[F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloatArray([F)V

    .line 335
    iget p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mScanType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 336
    iget p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mSizeConstraintMinDim:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    .line 337
    iget p2, p0, Lcom/sonymobile/scan3d/PrintSelection;->mTextSize:F

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeFloat(F)V

    return-void
.end method
