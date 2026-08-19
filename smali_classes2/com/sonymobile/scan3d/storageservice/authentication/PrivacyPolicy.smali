.class public Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;
.super Ljava/lang/Object;
.source "PrivacyPolicy.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mDescriptionResId:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mDisclaimerResId:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mPersonalData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;",
            ">;"
        }
    .end annotation
.end field

.field private mTitleResId:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 133
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mPersonalData:Ljava/util/List;

    .line 163
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mPersonalData:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 152
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>()V

    .line 153
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mTitleResId:I

    .line 154
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDescriptionResId:I

    .line 155
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDisclaimerResId:I

    .line 156
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mPersonalData:Ljava/util/List;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$1;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method addPersonalData(II)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 220
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mPersonalData:Ljava/util/List;

    new-instance v1, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;

    invoke-direct {v1, p1, p2}, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;-><init>(II)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method getDescription()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 210
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDescriptionResId:I

    return v0
.end method

.method getDisclaimer()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 239
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDisclaimerResId:I

    return v0
.end method

.method getPersonalData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy$PersonalData;",
            ">;"
        }
    .end annotation

    .line 229
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mPersonalData:Ljava/util/List;

    return-object v0
.end method

.method getTitle()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 200
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mTitleResId:I

    return v0
.end method

.method setDescription(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 181
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDescriptionResId:I

    return-void
.end method

.method setDisclaimer(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 190
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDisclaimerResId:I

    return-void
.end method

.method setTitle(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 172
    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mTitleResId:I

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 249
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mTitleResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 250
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDescriptionResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 251
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mDisclaimerResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 252
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/authentication/PrivacyPolicy;->mPersonalData:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    return-void
.end method
