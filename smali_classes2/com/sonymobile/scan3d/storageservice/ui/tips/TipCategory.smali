.class public final Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;
.super Ljava/lang/Object;
.source "TipCategory.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field private static final ATTR_ACTION_URL:Ljava/lang/String; = "actionUrl"

.field private static final ATTR_BG_COLOR:Ljava/lang/String; = "backgroundColor"

.field private static final ATTR_DESCRIPTION:Ljava/lang/String; = "description"

.field private static final ATTR_GOOGLE_PLAY:Ljava/lang/String; = "isGoogleDependant"

.field private static final ATTR_IMAGE:Ljava/lang/String; = "image"

.field private static final ATTR_IMAGE_SMALL:Ljava/lang/String; = "imageSmall"

.field private static final ATTR_SCREEN_EVENT:Ljava/lang/String; = "screenEvent"

.field private static final ATTR_TITLE:Ljava/lang/String; = "title"

.field private static final ATTR_WIZARD_TYPE:Ljava/lang/String; = "wizardType"

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_ABOUT_TECHNOLOGY:I = 0x0

.field public static final TYPE_ACTION:I = 0x3

.field public static final TYPE_LIST:I = 0x2

.field public static final TYPE_PAGER:I = 0x1


# instance fields
.field private mActionUrl:I

.field private mBackgroundColor:I

.field private mDescription:I

.field private mImage:I

.field private mImageSmall:I

.field private mIsGoogleDependant:Z

.field private mScreenEvent:I

.field private mTips:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation
.end field

.field private mTitle:I

.field private mWizardType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 141
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory$1;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory$1;-><init>()V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    .line 198
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;-><init>()V

    .line 199
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTitle:I

    .line 200
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mDescription:I

    .line 201
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 202
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImage:I

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImageSmall:I

    .line 204
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mBackgroundColor:I

    .line 205
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mActionUrl:I

    .line 206
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mScreenEvent:I

    .line 207
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mWizardType:I

    .line 208
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result p1

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mIsGoogleDependant:Z

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory$1;)V
    .locals 0

    .line 20
    invoke-direct {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method static newInstance(Landroid/content/res/XmlResourceParser;)Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;
    .locals 5

    .line 166
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    invoke-direct {v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;-><init>()V

    const-string v1, "title"

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 167
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTitle:I

    const-string v1, "description"

    .line 168
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mDescription:I

    const-string v1, "image"

    .line 169
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImage:I

    const-string v1, "imageSmall"

    .line 170
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImageSmall:I

    const-string v1, "backgroundColor"

    .line 171
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mBackgroundColor:I

    const-string v1, "actionUrl"

    .line 172
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mActionUrl:I

    const-string v1, "screenEvent"

    .line 173
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mScreenEvent:I

    const-string v1, "wizardType"

    const v4, 0x7f100397

    .line 174
    invoke-interface {p0, v3, v1, v4}, Landroid/content/res/XmlResourceParser;->getAttributeResourceValue(Ljava/lang/String;Ljava/lang/String;I)I

    move-result v1

    iput v1, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mWizardType:I

    const-string v1, "isGoogleDependant"

    .line 176
    invoke-interface {p0, v3, v1, v2}, Landroid/content/res/XmlResourceParser;->getAttributeBooleanValue(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    iput-boolean p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mIsGoogleDependant:Z

    .line 179
    iget p0, v0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mScreenEvent:I

    if-eqz p0, :cond_0

    return-object v0

    .line 180
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "No screen event set."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method addTip(Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;)V
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getActionUrl()I
    .locals 1

    .line 306
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mActionUrl:I

    return v0
.end method

.method public getBackgroundColor()I
    .locals 1

    .line 297
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mBackgroundColor:I

    return v0
.end method

.method public getDescription()I
    .locals 1

    .line 244
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mDescription:I

    return v0
.end method

.method public getImage()I
    .locals 1

    .line 279
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImage:I

    return v0
.end method

.method public getImageSmall()I
    .locals 1

    .line 288
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImageSmall:I

    return v0
.end method

.method public getScreenEvent()I
    .locals 1

    .line 226
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mScreenEvent:I

    return v0
.end method

.method public getTips()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation

    .line 253
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    return-object v0
.end method

.method getTipsForScanTypeOrPolicy(II)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;",
            ">;"
        }
    .end annotation

    .line 367
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 369
    iget-object v1, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;

    .line 370
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getScanTypes()Ljava/util/List;

    move-result-object v3

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 371
    invoke-virtual {v2}, Lcom/sonymobile/scan3d/storageservice/ui/tips/Tip;->getScanPolicies()Ljava/util/List;

    move-result-object v3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 372
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getTitle()I
    .locals 1

    .line 235
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTitle:I

    return v0
.end method

.method public getWizardType()I
    .locals 1

    .line 321
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mWizardType:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x1

    return v0

    :pswitch_0
    const/4 v0, 0x2

    return v0

    :pswitch_1
    const/4 v0, 0x3

    return v0

    :pswitch_2
    const/4 v0, 0x0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x7f100394
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public hasTips()Z
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method isGoogleDependent()Z
    .locals 1

    .line 313
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mIsGoogleDependant:Z

    return v0
.end method

.method revertTips()V
    .locals 1

    .line 270
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 346
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTitle:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 347
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mDescription:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 348
    iget-object p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mTips:Ljava/util/List;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 349
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImage:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 350
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mImageSmall:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 351
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mBackgroundColor:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 352
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mActionUrl:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 353
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mScreenEvent:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 354
    iget p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mWizardType:I

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    .line 355
    iget-boolean p2, p0, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;->mIsGoogleDependant:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeInt(I)V

    return-void
.end method
