.class public final Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
.super Ljava/lang/Object;
.source "Tip.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;
    }
.end annotation


# static fields
.field private static final ATTR_ACTION_TIP:Ljava/lang/String; = "actionOnClick"

.field private static final ATTR_BACKGROUND_COLOR:Ljava/lang/String; = "backgroundColor"

.field private static final ATTR_DESCRIPTION:Ljava/lang/String; = "description"

.field private static final ATTR_EXPIRE_DATE:Ljava/lang/String; = "expire"

.field private static final ATTR_IMAGE:Ljava/lang/String; = "image"

.field private static final ATTR_IS_REMOVABLE:Ljava/lang/String; = "removable"

.field private static final ATTR_KEPT_SCAN_ONLY:Ljava/lang/String; = "keptScanOnly"

.field private static final ATTR_LINK_TEXT:Ljava/lang/String; = "linkText"

.field private static final ATTR_POSITIVE_ACTION:Ljava/lang/String; = "dialogPositiveAction"

.field private static final ATTR_POSITIVE_BUTTON:Ljava/lang/String; = "dialogPositiveButton"

.field private static final ATTR_REQUIRES_GOOGLE_PLAY:Ljava/lang/String; = "requiresGooglePlay"

.field private static final ATTR_SCAN_POLICY:Ljava/lang/String; = "scanPolicy"

.field private static final ATTR_SCAN_TYPE:Ljava/lang/String; = "scanType"

.field private static final ATTR_SHORT_DESCRIPTION:Ljava/lang/String; = "shortDesc"

.field private static final ATTR_TITLE:Ljava/lang/String; = "title"

.field private static final ATTR_VIDEO:Ljava/lang/String; = "video"

.field private static final ATTR_VIDEO_SUBTITLES:Ljava/lang/String; = "subtitles"

.field private static final ATTR_YOUTUBE_URL:Ljava/lang/String; = "youtubeUrl"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation
.end field

.field private static final DELIMITER:Ljava/lang/String; = ","

.field public static final TYPE_DEFAULT:I = 0x0

.field public static final TYPE_IMAGE:I = 0x1

.field public static final TYPE_SEQUENCE:I = 0x4

.field public static final TYPE_VIDEO:I = 0x3

.field public static final TYPE_YOUTUBE:I = 0x2


# instance fields
.field private mActionOnClick:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mAdditionalVideo:Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

.field private mBackgroundColor:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field private mClips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;",
            ">;"
        }
    .end annotation
.end field

.field private mDescription:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mExcludeable:Z

.field private mExpiryDate:Ljava/lang/String;

.field private mGooglePlayRequired:Z

.field private mImage:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field private mKeptScanOnly:Z

.field private mLinkText:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mPositiveAction:I

.field private mPositiveButton:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mRemovable:Z

.field private mScanPolicies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mScanTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mShortDescription:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mTipVideoName:Ljava/lang/String;

.field private mTipVideoSubtitles:I

.field private mTitle:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private mYoutubeUrl:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 363
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 474
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 475
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mClips:Ljava/util/List;

    .line 476
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanTypes:Ljava/util/List;

    .line 477
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanPolicies:Ljava/util/List;

    const/4 v0, 0x1

    .line 478
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExcludeable:Z

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    .line 487
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;-><init>()V

    .line 488
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTitle:I

    .line 489
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mDescription:I

    .line 490
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mBackgroundColor:I

    .line 491
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mImage:I

    .line 492
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoSubtitles:I

    .line 493
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoName:Ljava/lang/String;

    .line 494
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mAdditionalVideo:Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    .line 495
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mYoutubeUrl:Ljava/lang/String;

    .line 496
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mClips:Ljava/util/List;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 497
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mShortDescription:I

    .line 498
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanTypes:Ljava/util/List;

    const-class v1, Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 499
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanPolicies:Ljava/util/List;

    const-class v1, Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readList(Ljava/util/List;Ljava/lang/ClassLoader;)V

    .line 500
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    move v0, v2

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mKeptScanOnly:Z

    .line 501
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveAction:I

    .line 502
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveButton:I

    .line 503
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v2, :cond_1

    move v0, v2

    goto :goto_1

    :cond_1
    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExcludeable:Z

    .line 504
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExpiryDate:Ljava/lang/String;

    .line 505
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mLinkText:I

    .line 506
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mActionOnClick:I

    .line 507
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    if-ne v0, v2, :cond_2

    move v0, v2

    goto :goto_2

    :cond_2
    move v0, v1

    :goto_2
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mGooglePlayRequired:Z

    .line 508
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    if-ne p1, v2, :cond_3

    move v1, v2

    :cond_3
    iput-boolean v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mRemovable:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 0

    .line 25
    invoke-static {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    move-result-object p0

    return-object p0
.end method

.method static newInstance(Landroid/content/res/XmlResourceParser;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 8

    .line 383
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;-><init>()V

    const-string v1, "title"

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 384
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTitle:I

    const-string v1, "description"

    .line 385
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mDescription:I

    const-string v1, "linkText"

    .line 386
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mLinkText:I

    const-string v1, "image"

    .line 387
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mImage:I

    const-string v1, "subtitles"

    .line 388
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoSubtitles:I

    const-string v1, "video"

    .line 389
    invoke-interface {p0, v3, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoName:Ljava/lang/String;

    const-string v1, "youtubeUrl"

    .line 390
    invoke-interface {p0, v3, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mYoutubeUrl:Ljava/lang/String;

    const-string v1, "shortDesc"

    .line 391
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mShortDescription:I

    const-string v1, "backgroundColor"

    .line 392
    invoke-interface {p0, v3, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 394
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mBackgroundColor:I

    :cond_0
    const-string v1, "scanType"

    .line 396
    invoke-interface {p0, v3, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string v4, ","

    .line 398
    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 399
    array-length v4, v1

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_1

    aget-object v6, v1, v5

    .line 400
    iget-object v7, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanTypes:Ljava/util/List;

    invoke-static {v6}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_1
    const-string v1, "scanPolicy"

    .line 403
    invoke-interface {p0, v3, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2

    const-string v4, ","

    .line 405
    invoke-virtual {v1, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 406
    array-length v4, v1

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_2

    aget-object v6, v1, v5

    .line 407
    iget-object v7, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanPolicies:Ljava/util/List;

    invoke-static {v6}, Ljava/lang/Integer;->decode(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v7, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_2
    const-string v1, "keptScanOnly"

    .line 410
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mKeptScanOnly:Z

    const-string v1, "dialogPositiveAction"

    .line 411
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveAction:I

    const-string v1, "dialogPositiveButton"

    .line 412
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveButton:I

    const-string v1, "expire"

    .line 413
    invoke-interface {p0, v3, v1}, Landroid/content/res/XmlResourceParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExpiryDate:Ljava/lang/String;

    const-string v1, "actionOnClick"

    .line 414
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mActionOnClick:I

    const-string v1, "requiresGooglePlay"

    .line 415
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mGooglePlayRequired:Z

    const-string v1, "removable"

    .line 417
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mRemovable:Z

    return-object v0
.end method

.method public static newInstance(Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 3

    .line 443
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$2;->$SwitchMap$com$sonymobile$scan3d$EnvironmentError$ErrorType:[I

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/EnvironmentError$ErrorType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 460
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown errors type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    const p0, 0x7f100378

    goto :goto_0

    :pswitch_1
    const p0, 0x7f100374

    goto :goto_0

    :pswitch_2
    const p0, 0x7f100377

    goto :goto_0

    :pswitch_3
    const p0, 0x7f100376

    goto :goto_0

    :pswitch_4
    const p0, 0x7f100375

    .line 462
    :goto_0
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;-><init>()V

    const v1, 0x7f1000cd

    .line 463
    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTitle:I

    .line 464
    iput p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mShortDescription:I

    const/4 p0, 0x0

    .line 465
    iput p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveAction:I

    const v1, 0x104000a

    .line 466
    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveButton:I

    .line 467
    iput-boolean p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExcludeable:Z

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static newInstance(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;)Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;
    .locals 2

    .line 429
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;-><init>()V

    .line 430
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->getShortDescription()I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mShortDescription:I

    .line 431
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->getPositiveAction()I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveAction:I

    .line 432
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip$Priority;->getPositiveButton()I

    move-result p0

    iput p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveButton:I

    return-object v0
.end method


# virtual methods
.method addClip(Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;)V
    .locals 1

    .line 517
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mClips:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getActionOnClick()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 556
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mActionOnClick:I

    return v0
.end method

.method public getAdditionalVideo()Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;
    .locals 1

    .line 656
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mAdditionalVideo:Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    return-object v0
.end method

.method public getBackgroundColor()I
    .locals 1
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 536
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mBackgroundColor:I

    return v0
.end method

.method public getClips()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Clip;",
            ">;"
        }
    .end annotation

    .line 665
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mClips:Ljava/util/List;

    return-object v0
.end method

.method public getDescription()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 612
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mDescription:I

    return v0
.end method

.method public getExpireDate()Ljava/lang/String;
    .locals 1

    .line 565
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExpiryDate:Ljava/lang/String;

    return-object v0
.end method

.method public getImage()I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 622
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mImage:I

    return v0
.end method

.method public getLinkText()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 546
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mLinkText:I

    return v0
.end method

.method public getPositiveAction()I
    .locals 1

    .line 741
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveAction:I

    return v0
.end method

.method public getPositiveButton()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 751
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveButton:I

    return v0
.end method

.method getScanPolicies()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 723
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanPolicies:Ljava/util/List;

    return-object v0
.end method

.method getScanTypes()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 714
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanTypes:Ljava/util/List;

    return-object v0
.end method

.method public getShortDescription()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 705
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mShortDescription:I

    return v0
.end method

.method public getSubtitles()I
    .locals 1
    .annotation build Landroidx/annotation/RawRes;
    .end annotation

    .line 638
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoSubtitles:I

    return v0
.end method

.method public getTitle()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 594
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTitle:I

    return v0
.end method

.method public getType()I
    .locals 1

    .line 675
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoName:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x3

    goto :goto_0

    .line 677
    :cond_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mYoutubeUrl:Ljava/lang/String;

    if-eqz v0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    .line 679
    :cond_1
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mImage:I

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    goto :goto_0

    .line 681
    :cond_2
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mClips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_3

    const/4 v0, 0x4

    goto :goto_0

    :cond_3
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getVideoName()Ljava/lang/String;
    .locals 1

    .line 630
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoName:Ljava/lang/String;

    return-object v0
.end method

.method public getYoutubeUrl()Ljava/lang/String;
    .locals 1

    .line 647
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mYoutubeUrl:Ljava/lang/String;

    return-object v0
.end method

.method public hasTextRepresentations()Z
    .locals 1

    .line 695
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mDescription:I

    if-nez v0, :cond_1

    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTitle:I

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

.method public isExcludeable()Z
    .locals 1

    .line 602
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExcludeable:Z

    return v0
.end method

.method isForKeptScanOnly()Z
    .locals 1

    .line 732
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mKeptScanOnly:Z

    return v0
.end method

.method public isGooglePlayRequired()Z
    .locals 1

    .line 575
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mGooglePlayRequired:Z

    return v0
.end method

.method public isRemovable()Z
    .locals 1

    .line 584
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mRemovable:Z

    return v0
.end method

.method setAdditionalVideo(Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;)V
    .locals 0

    .line 526
    iput-object p1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mAdditionalVideo:Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 761
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTitle:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 762
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mDescription:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 763
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mBackgroundColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 764
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mImage:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 765
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoSubtitles:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 766
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mTipVideoName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 767
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mAdditionalVideo:Lcom/sonymobile/scan3d/storageservice/ui/tips/Video;

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    .line 768
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mYoutubeUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 769
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mClips:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 770
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mShortDescription:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 771
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanTypes:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 772
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mScanPolicies:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeList(Ljava/util/List;)V

    .line 773
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mKeptScanOnly:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 774
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveAction:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 775
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mPositiveButton:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 776
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExcludeable:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 777
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mExpiryDate:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 778
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mLinkText:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 779
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mActionOnClick:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 780
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mGooglePlayRequired:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 781
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->mRemovable:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
