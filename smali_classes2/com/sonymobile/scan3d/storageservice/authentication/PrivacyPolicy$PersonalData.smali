.class Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;
.super Ljava/lang/Object;
.source "PrivacyPolicy.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PersonalData"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final icon:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field public final text:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 67
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>(II)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    .line 98
    iput p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    return-void
.end method

.method constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    .line 122
    :cond_0
    instance-of v1, p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 125
    :cond_1
    check-cast p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;

    .line 126
    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    iget v3, p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    iget p1, p1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    if-ne v1, p1, :cond_2

    goto :goto_0

    :cond_2
    move v0, v2

    :goto_0
    return v0
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x2

    .line 114
    new-array v0, v0, [Ljava/lang/Object;

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 108
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->icon:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 109
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->text:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
