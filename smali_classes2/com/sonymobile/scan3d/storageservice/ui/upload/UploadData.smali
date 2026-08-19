.class Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;
.super Ljava/lang/Object;
.source "UploadData.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

.field private final mIsValid:Z

.field private final mUpload:Lcom/sonymobile/scan3d/storageservice/provider/Upload;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 36
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    const-class v0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mUpload:Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mIsValid:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData$1;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method constructor <init>(Lcom/sonymobile/scan3d/storageservice/provider/Upload;ZLcom/sonymobile/scan3d/storageservice/ui/upload/Action;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mUpload:Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    .line 63
    iput-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mIsValid:Z

    .line 64
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method getAction()Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;
    .locals 1

    .line 93
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    return-object v0
.end method

.method getUpload()Lcom/sonymobile/scan3d/storageservice/provider/Upload;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mUpload:Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    return-object v0
.end method

.method isValid()Z
    .locals 1

    .line 102
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mIsValid:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 112
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mUpload:Lcom/sonymobile/scan3d/storageservice/provider/Upload;

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 113
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mAction:Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;

    invoke-virtual {p2}, Lcom/sonymobile/scan3d/storageservice/ui/upload/Action;->name()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 114
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/upload/UploadData;->mIsValid:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
