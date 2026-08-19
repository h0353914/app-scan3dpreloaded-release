.class public final Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;
.super Ljava/lang/Object;
.source "Video.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field private static final ATTR_SOURCE:Ljava/lang/String; = "source"

.field private static final ATTR_TEXT:Ljava/lang/String; = "text"

.field private static final ATTR_URI:Ljava/lang/String; = "uri"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mText:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mVideoResourceId:I
    .annotation build Landroidx/annotation/AnyRes;
    .end annotation
.end field

.field private mYoutubeUrlResId:I
    .annotation build Landroidx/annotation/AnyRes;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 41
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mVideoResourceId:I

    .line 67
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mText:I

    .line 68
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    iput p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mYoutubeUrlResId:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/ui/tips/Video$1;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static newInstance(Landroid/content/res/XmlResourceParser;Z)Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;
    .locals 4

    .line 53
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;-><init>()V

    const-string v1, "source"

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 54
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mVideoResourceId:I

    const-string v1, "text"

    .line 55
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mText:I

    if-eqz p1, :cond_0

    const-string p1, "uri"

    .line 57
    invoke-interface {p0, v3, p1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result p0

    iput p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mYoutubeUrlResId:I

    :cond_0
    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getText()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mText:I

    return v0
.end method

.method public getUriResourceId()I
    .locals 1
    .annotation build Landroidx/annotation/AnyRes;
    .end annotation

    .line 88
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mYoutubeUrlResId:I

    return v0
.end method

.method public getVideoResourceId()I
    .locals 1
    .annotation build Landroidx/annotation/AnyRes;
    .end annotation

    .line 78
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mVideoResourceId:I

    return v0
.end method

.method isDisplayable()Z
    .locals 1

    .line 97
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mYoutubeUrlResId:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mVideoResourceId:I

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

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 114
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mVideoResourceId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 115
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mText:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 116
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;->mYoutubeUrlResId:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
