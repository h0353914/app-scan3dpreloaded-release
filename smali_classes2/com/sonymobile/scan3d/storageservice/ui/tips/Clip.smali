.class public final Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;
.super Ljava/lang/Object;
.source "Clip.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field private static final ATTR_LOOP:Ljava/lang/String; = "loop"

.field private static final ATTR_SOURCE:Ljava/lang/String; = "source"

.field private static final ATTR_TEXT:Ljava/lang/String; = "text"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mLoop:Z

.field private mSource:I

.field private mSourceText:Ljava/lang/String;

.field private mText:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
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
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSource:I

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mText:I

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mLoop:Z

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSourceText:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip$1;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static newInstance(Landroid/content/res/XmlResourceParser;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;
    .locals 4

    .line 74
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;-><init>()V

    const-string v1, "source"

    const/4 v2, 0x0

    .line 75
    invoke-interface {p0, v2, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSourceText:Ljava/lang/String;

    const-string v1, "source"

    const/4 v3, 0x0

    .line 76
    invoke-interface {p0, v2, v1, v3}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSource:I

    const-string v1, "text"

    .line 77
    invoke-interface {p0, v2, v1, v3}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mText:I

    const-string v1, "loop"

    .line 78
    invoke-interface {p0, v2, v1, v3}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mLoop:Z

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getSource()I
    .locals 1

    .line 105
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSource:I

    return v0
.end method

.method public getSourcePath()Ljava/lang/String;
    .locals 1

    .line 109
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSourceText:Ljava/lang/String;

    return-object v0
.end method

.method public getText()I
    .locals 1

    .line 118
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mText:I

    return v0
.end method

.method public shouldLoop()Z
    .locals 1

    .line 127
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mLoop:Z

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 141
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSource:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 142
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mText:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 143
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mLoop:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 144
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->mSourceText:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
