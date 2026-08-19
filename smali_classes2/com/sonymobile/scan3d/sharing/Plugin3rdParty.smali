.class public Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;
.super Ljava/lang/Object;
.source "Plugin3rdParty.java"

# interfaces
.implements Lcom/sonymobile/scan3d/sharing/NamedPlugin;


# static fields
.field private static final MAX_IMAGE_HEIGHT:Ljava/lang/Integer;

.field private static final MAX_IMAGE_WIDTH:Ljava/lang/Integer;

.field private static final MAX_TITLE_LENGTH:Ljava/lang/Integer;

.field private static final TAG:Ljava/lang/String;


# instance fields
.field private final mAppIcon:Landroid/graphics/drawable/Drawable;

.field private final mAppLabel:Ljava/lang/String;

.field private final mBackgroundColor:I

.field private final mCategory:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

.field private final mPackageManager:Landroid/content/pm/PackageManager;

.field private final mPreferredMimeType:Ljava/lang/String;

.field private final mPrivileged:Z

.field private final mReducedTextureSize:I

.field private final mResolveInfo:Landroid/content/pm/ResolveInfo;

.field private final mScanType:I

.field private final mSupportedMimeTypes:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 46
    const-class v0, Lcom/sonymobile/scan3d/sharing/Plugin;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->TAG:Ljava/lang/String;

    const/16 v0, 0x50

    .line 49
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->MAX_TITLE_LENGTH:Ljava/lang/Integer;

    const/16 v0, 0x1194

    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->MAX_IMAGE_WIDTH:Ljava/lang/Integer;

    const/16 v0, 0xc00

    .line 51
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->MAX_IMAGE_HEIGHT:Ljava/lang/Integer;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/content/pm/PackageManager;Landroid/content/pm/ResolveInfo;Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;I)V
    .locals 2

    .line 96
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 97
    iput-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPackageManager:Landroid/content/pm/PackageManager;

    .line 98
    iput-object p3, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    const/4 p3, 0x0

    .line 103
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/content/pm/PackageManager;->getApplicationIcon(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_1

    .line 104
    :try_start_1
    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    invoke-virtual {p2, v1}, Landroid/content/pm/PackageManager;->getApplicationLabel(Landroid/content/pm/ApplicationInfo;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception p2

    goto :goto_0

    :catch_1
    move-exception p2

    move-object v0, p3

    .line 106
    :goto_0
    invoke-virtual {p2}, Landroid/content/pm/PackageManager$NameNotFoundException;->printStackTrace()V

    .line 108
    :goto_1
    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->validateImageSize(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mAppIcon:Landroid/graphics/drawable/Drawable;

    .line 109
    invoke-direct {p0, p3}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->validateTitleLength(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mAppLabel:Ljava/lang/String;

    .line 110
    iput-object p4, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mCategory:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    .line 111
    iput p5, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mScanType:I

    .line 113
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mSupportedMimeTypes:Ljava/util/ArrayList;

    .line 114
    iget-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p2, p2, Landroid/content/pm/ResolveInfo;->filter:Landroid/content/IntentFilter;

    invoke-virtual {p2}, Landroid/content/IntentFilter;->typesIterator()Ljava/util/Iterator;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 116
    iget-object p3, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mSupportedMimeTypes:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p4, Lcom/sonymobile/scan3d/sharing/-$$Lambda$I1A8dniBuRdoMGKE4fgVMPvl9YM;

    invoke-direct {p4, p3}, Lcom/sonymobile/scan3d/sharing/-$$Lambda$I1A8dniBuRdoMGKE4fgVMPvl9YM;-><init>(Ljava/util/ArrayList;)V

    invoke-interface {p2, p4}, Ljava/util/Iterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    .line 119
    :cond_0
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getPaletteColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)I

    move-result p2

    iput p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mBackgroundColor:I

    .line 120
    iget-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p2, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p2, p2, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string p3, "com.sonymobile.scan3d.meta.preferred_mimetype"

    const-string p4, "no_mime_type_preferred"

    invoke-virtual {p2, p3, p4}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPreferredMimeType:Ljava/lang/String;

    .line 122
    iget-object p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p2, p2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p2, p2, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string p3, "com.sonymobile.scan3d.meta.reduced_texture"

    const/4 p4, 0x0

    invoke-virtual {p2, p3, p4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p2

    iput p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mReducedTextureSize:I

    .line 125
    sget-object p2, Lcom/sonymobile/scan3d/sharing/SharingConstants;->PRIVILEGED_PLUGINS:[Ljava/lang/String;

    array-length p3, p2

    move p5, p4

    :goto_2
    if-ge p5, p3, :cond_2

    aget-object v0, p2, p5

    .line 126
    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 127
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    iget-object p3, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p3, p3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p3, p3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 129
    invoke-static {p1, p3, p2}, Lcom/sonymobile/scan3d/security/TrustedCertificates;->isPackageTrusted(Landroid/content/Context;Ljava/lang/String;Ljava/lang/StringBuilder;)Z

    move-result p4

    .line 130
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    .line 131
    sget-object p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->TAG:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_1
    add-int/lit8 p5, p5, 0x1

    goto :goto_2

    .line 136
    :cond_2
    :goto_3
    iput-boolean p4, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPrivileged:Z

    return-void
.end method

.method private getPaletteColor(Landroid/content/Context;Landroid/graphics/drawable/Drawable;)I
    .locals 6

    const v0, 0x7f060097

    if-nez p2, :cond_0

    .line 162
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    return p1

    .line 164
    :cond_0
    instance-of v1, p2, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_1

    .line 165
    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    .line 166
    invoke-static {p2}, Landroidx/palette/graphics/Palette;->from(Landroid/graphics/Bitmap;)Landroidx/palette/graphics/Palette$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/palette/graphics/Palette$Builder;->generate()Landroidx/palette/graphics/Palette;

    move-result-object p2

    goto :goto_0

    .line 168
    :cond_1
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v2

    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 170
    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 171
    invoke-virtual {v2}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    const/4 v5, 0x0

    invoke-virtual {p2, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 172
    invoke-virtual {p2, v2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 173
    invoke-static {v1}, Landroidx/palette/graphics/Palette;->from(Landroid/graphics/Bitmap;)Landroidx/palette/graphics/Palette$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/palette/graphics/Palette$Builder;->generate()Landroidx/palette/graphics/Palette;

    move-result-object p2

    .line 174
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    .line 176
    :goto_0
    invoke-virtual {p1, v0}, Landroid/content/Context;->getColor(I)I

    move-result p1

    invoke-virtual {p2, p1}, Landroidx/palette/graphics/Palette;->getVibrantColor(I)I

    move-result p1

    return p1
.end method

.method private validateImageSize(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 154
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    sget-object v2, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->MAX_IMAGE_WIDTH:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-gt v1, v2, :cond_2

    .line 155
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    sget-object v2, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->MAX_IMAGE_HEIGHT:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_1

    goto :goto_0

    :cond_1
    return-object p1

    :cond_2
    :goto_0
    return-object v0
.end method

.method private validateTitleLength(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 143
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sget-object v2, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->MAX_TITLE_LENGTH:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-le v1, v2, :cond_1

    return-object v0

    :cond_1
    return-object p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 249
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_2

    return v1

    .line 250
    :cond_2
    check-cast p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;

    .line 251
    iget-object v2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mCategory:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    iget-object v3, p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mCategory:Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;

    invoke-virtual {v2, v3}, Lcom/sonymobile/scan3d/sharing/SharingConstants$Category;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget v2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mScanType:I

    iget v3, p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mScanType:I

    if-ne v2, v3, :cond_3

    iget-object v2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p1, p1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    .line 252
    invoke-virtual {v2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_0

    :cond_3
    move v0, v1

    :goto_0
    return v0
.end method

.method public getAppIcon()Landroid/graphics/drawable/Drawable;
    .locals 1

    .line 267
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mAppIcon:Landroid/graphics/drawable/Drawable;

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    .line 262
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mAppLabel:Ljava/lang/String;

    return-object v0
.end method

.method public getBackgroundColor()I
    .locals 1

    .line 198
    iget v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mBackgroundColor:I

    return v0
.end method

.method public getComponentName()Landroid/content/ComponentName;
    .locals 3

    .line 280
    new-instance v0, Landroid/content/ComponentName;

    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v1, v1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v1, v1, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object v2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public getImage()Landroid/graphics/drawable/Drawable;
    .locals 5

    .line 181
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "com.sonymobile.scan3d.meta.image"

    const/4 v2, -0x1

    .line 182
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x0

    if-eq v0, v2, :cond_0

    .line 185
    :try_start_0
    iget-object v2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v3, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 186
    invoke-virtual {v2, v3}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v2

    .line 187
    invoke-virtual {v2, v0, v1}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->validateImageSize(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 189
    sget-object v2, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get an icon for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " with exception "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 189
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    return-object v1
.end method

.method public getPreferredMimeType()Ljava/lang/String;
    .locals 1

    .line 237
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPreferredMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getSupportedMimeTypes()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 232
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mSupportedMimeTypes:Ljava/util/ArrayList;

    return-object v0
.end method

.method public bridge synthetic getSupportedMimeTypes()Ljava/util/List;
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getSupportedMimeTypes()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getTextureSize()I
    .locals 1

    .line 242
    iget v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mReducedTextureSize:I

    return v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 5

    .line 203
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v0, v0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v0, v0, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    const-string v1, "com.sonymobile.scan3d.meta.label"

    const/4 v2, -0x1

    .line 204
    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    const-string v1, "com.sonymobile.scan3d.meta.label"

    .line 206
    invoke-virtual {v0, v1, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->validateTitleLength(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 209
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPackageManager:Landroid/content/pm/PackageManager;

    iget-object v2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v2, v2, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    .line 210
    invoke-virtual {v0, v2}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;

    move-result-object v0

    .line 211
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->validateTitleLength(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 213
    sget-object v1, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to get a title for "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v4, v4, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v4, v4, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " with exception "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 213
    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x3

    .line 257
    new-array v0, v0, [Ljava/lang/Object;

    const v1, 0x101002d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mScanType:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget-object v1, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mResolveInfo:Landroid/content/pm/ResolveInfo;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    invoke-static {v0}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public isEnabled(Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;Landroid/content/Context;I)Z
    .locals 4

    const-string p2, "application/vnd.sony.scan3d"

    .line 296
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getPreferredMimeType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    const-string v0, "application/vnd.sony.scan3d"

    .line 298
    invoke-virtual {p0, v0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->supportsMime(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    move p2, v2

    goto :goto_1

    :cond_1
    :goto_0
    move p2, v1

    :goto_1
    const-string v0, "model/gltf-binary"

    .line 299
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getPreferredMimeType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v3, "model/gltf-binary"

    .line 301
    invoke-virtual {p0, v3}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->supportsMime(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    if-eqz v0, :cond_2

    goto :goto_2

    :cond_2
    move v0, v2

    goto :goto_3

    :cond_3
    :goto_2
    move v0, v1

    .line 306
    :goto_3
    sget-object v3, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty$1;->$SwitchMap$com$sonymobile$scan3d$viewer$sharing$Shareable$Type:[I

    invoke-virtual {p1}, Lcom/sonymobile/scan3d/viewer/sharing/Shareable$Type;->ordinal()I

    move-result p1

    aget p1, v3, p1

    packed-switch p1, :pswitch_data_0

    move p1, v2

    goto :goto_5

    :pswitch_0
    move p1, v0

    goto :goto_5

    :pswitch_1
    packed-switch p3, :pswitch_data_1

    move p1, p2

    goto :goto_5

    :pswitch_2
    if-nez v0, :cond_5

    if-eqz p2, :cond_4

    goto :goto_4

    :cond_4
    move p1, v2

    goto :goto_5

    :cond_5
    :goto_4
    move p1, v1

    .line 331
    :goto_5
    iget p2, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mScanType:I

    if-eq p3, p2, :cond_7

    const p3, 0x7fffffff

    if-ne p2, p3, :cond_6

    goto :goto_6

    :cond_6
    move v1, v2

    :cond_7
    :goto_6
    and-int/2addr p1, v1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x100
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public isPrivileged()Z
    .locals 1

    .line 222
    iget-boolean v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mPrivileged:Z

    return v0
.end method

.method isValid()Z
    .locals 1

    .line 276
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mAppIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getImage()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mAppLabel:Ljava/lang/String;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;)V
    .locals 1

    .line 227
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->getComponentName()Landroid/content/ComponentName;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/sonymobile/scan3d/storageservice/provider/FileTasks;->shareMesh(Landroid/content/Context;Lcom/sonymobile/scan3d/storageservice/provider/IFileSet;Landroid/content/ComponentName;)V

    return-void
.end method

.method public supportsMime(Ljava/lang/String;)Z
    .locals 1

    .line 291
    iget-object v0, p0, Lcom/sonymobile/scan3d/sharing/Plugin3rdParty;->mSupportedMimeTypes:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
