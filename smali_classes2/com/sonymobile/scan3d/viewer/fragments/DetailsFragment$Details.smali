.class final Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;
.super Ljava/lang/Object;
.source "DetailsFragment.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Details"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field fileSize:J

.field isImproved:Z

.field timestamp:J

.field triangleCount:I

.field vertexCount:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 52
    new-instance v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->timestamp:J

    .line 46
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->fileSize:J

    .line 47
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->triangleCount:I

    .line 48
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->vertexCount:I

    .line 49
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->isImproved:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2

    .line 71
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->timestamp:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 72
    iget-wide v0, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->fileSize:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 73
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->triangleCount:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 74
    iget p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->vertexCount:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 75
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/viewer/fragments/DetailsFragment$Details;->isImproved:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
