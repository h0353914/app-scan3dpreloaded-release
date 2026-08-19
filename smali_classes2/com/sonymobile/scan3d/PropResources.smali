.class public final enum Lcom/sonymobile/scan3d/PropResources;
.super Ljava/lang/Enum;
.source "PropResources.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/PropResources;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/PropResources;

.field public static final enum ANIME_HAIR:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum BOW:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum BUNNY_EARS:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum CAT_EARS:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum CAT_HAT:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum COWBOY_HAT:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum CROWN:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum CYBORG:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum GLASSES_DUBAI:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum GLASSES_NEW_YORK:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum GLASSES_PARIS:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum GLASSES_TOKYO:Lcom/sonymobile/scan3d/PropResources;

.field public static final enum PANDA_HAT:Lcom/sonymobile/scan3d/PropResources;

.field private static final TAG:Ljava/lang/String;

.field public static final TYPE_DRAWABLE:Ljava/lang/String; = "drawable"

.field public static final TYPE_STRING:Ljava/lang/String; = "string"


# instance fields
.field private final mContentName:Ljava/lang/String;

.field private final mImageName:Ljava/lang/String;

.field private final mResourcePath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 22
    new-instance v6, Lcom/sonymobile/scan3d/PropResources;

    const-string v1, "CYBORG"

    const-string v3, "props_content_cyborg"

    const-string v4, "prop_cyborg"

    const-string v5, "cyborg"

    const/4 v2, 0x0

    move-object v0, v6

    invoke-direct/range {v0 .. v5}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v6, Lcom/sonymobile/scan3d/PropResources;->CYBORG:Lcom/sonymobile/scan3d/PropResources;

    .line 27
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v8, "GLASSES_PARIS"

    const-string v10, "props_content_paris_glasses"

    const-string v11, "prop_glasses_paris"

    const-string v12, "parisGlasses"

    const/4 v9, 0x1

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->GLASSES_PARIS:Lcom/sonymobile/scan3d/PropResources;

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v2, "GLASSES_TOKYO"

    const-string v4, "props_content_tokyo_glasses"

    const-string v5, "prop_glasses_tokyo"

    const-string v6, "tokyoGlasses"

    const/4 v3, 0x2

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->GLASSES_TOKYO:Lcom/sonymobile/scan3d/PropResources;

    .line 37
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v8, "GLASSES_NEW_YORK"

    const-string v10, "props_content_new_york_glasses"

    const-string v11, "prop_glasses_newyork"

    const-string v12, "newyorkGlasses"

    const/4 v9, 0x3

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->GLASSES_NEW_YORK:Lcom/sonymobile/scan3d/PropResources;

    .line 42
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v2, "GLASSES_DUBAI"

    const-string v4, "props_content_dubai_glasses"

    const-string v5, "prop_glasses_dubai"

    const-string v6, "dubaiGlasses"

    const/4 v3, 0x4

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->GLASSES_DUBAI:Lcom/sonymobile/scan3d/PropResources;

    .line 47
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v8, "CROWN"

    const-string v10, "props_content_crown"

    const-string v11, "prop_crown"

    const-string v12, "crown"

    const/4 v9, 0x5

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->CROWN:Lcom/sonymobile/scan3d/PropResources;

    .line 52
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v2, "ANIME_HAIR"

    const-string v4, "props_content_anime_hair"

    const-string v5, "prop_anime_hair"

    const-string v6, "animeHair"

    const/4 v3, 0x6

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->ANIME_HAIR:Lcom/sonymobile/scan3d/PropResources;

    .line 57
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v8, "CAT_HAT"

    const-string v10, "props_content_cat_hat"

    const-string v11, "prop_cat_hat"

    const-string v12, "catHat"

    const/4 v9, 0x7

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->CAT_HAT:Lcom/sonymobile/scan3d/PropResources;

    .line 62
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v2, "PANDA_HAT"

    const-string v4, "props_content_panda_hat"

    const-string v5, "prop_panda_hat"

    const-string v6, "pandaHat"

    const/16 v3, 0x8

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->PANDA_HAT:Lcom/sonymobile/scan3d/PropResources;

    .line 67
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v8, "BUNNY_EARS"

    const-string v10, "props_content_bunny_ears"

    const-string v11, "prop_bunny_ears"

    const-string v12, "bunnyEars"

    const/16 v9, 0x9

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->BUNNY_EARS:Lcom/sonymobile/scan3d/PropResources;

    .line 72
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v2, "CAT_EARS"

    const-string v4, "props_content_cat_ears"

    const-string v5, "prop_cat_ears"

    const-string v6, "catEars"

    const/16 v3, 0xa

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->CAT_EARS:Lcom/sonymobile/scan3d/PropResources;

    .line 77
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v8, "COWBOY_HAT"

    const-string v10, "props_content_cowboy_hat"

    const-string v11, "prop_cowboy_hat"

    const-string v12, "cowboyHat"

    const/16 v9, 0xb

    move-object v7, v0

    invoke-direct/range {v7 .. v12}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->COWBOY_HAT:Lcom/sonymobile/scan3d/PropResources;

    .line 82
    new-instance v0, Lcom/sonymobile/scan3d/PropResources;

    const-string v2, "BOW"

    const-string v4, "props_content_bow"

    const-string v5, "prop_bow"

    const-string v6, "hairBowRed"

    const/16 v3, 0xc

    move-object v1, v0

    invoke-direct/range {v1 .. v6}, Lcom/sonymobile/scan3d/PropResources;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->BOW:Lcom/sonymobile/scan3d/PropResources;

    const/16 v0, 0xd

    .line 16
    new-array v0, v0, [Lcom/sonymobile/scan3d/PropResources;

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->CYBORG:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->GLASSES_PARIS:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->GLASSES_TOKYO:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->GLASSES_NEW_YORK:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->GLASSES_DUBAI:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->CROWN:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->ANIME_HAIR:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->CAT_HAT:Lcom/sonymobile/scan3d/PropResources;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->PANDA_HAT:Lcom/sonymobile/scan3d/PropResources;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->BUNNY_EARS:Lcom/sonymobile/scan3d/PropResources;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->CAT_EARS:Lcom/sonymobile/scan3d/PropResources;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->COWBOY_HAT:Lcom/sonymobile/scan3d/PropResources;

    const/16 v2, 0xb

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->BOW:Lcom/sonymobile/scan3d/PropResources;

    const/16 v2, 0xc

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->$VALUES:[Lcom/sonymobile/scan3d/PropResources;

    .line 97
    const-class v0, Lcom/sonymobile/scan3d/PropResources;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/sonymobile/scan3d/PropResources;->TAG:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 159
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 160
    iput-object p3, p0, Lcom/sonymobile/scan3d/PropResources;->mContentName:Ljava/lang/String;

    .line 161
    iput-object p4, p0, Lcom/sonymobile/scan3d/PropResources;->mImageName:Ljava/lang/String;

    .line 162
    iput-object p5, p0, Lcom/sonymobile/scan3d/PropResources;->mResourcePath:Ljava/lang/String;

    return-void
.end method

.method public static fromInt(Landroid/content/Context;I)Lcom/sonymobile/scan3d/PropResources;
    .locals 4

    const/4 v0, 0x0

    .line 107
    :try_start_0
    invoke-static {}, Lcom/sonymobile/scan3d/PropResources;->values()[Lcom/sonymobile/scan3d/PropResources;

    move-result-object v1

    aget-object v1, v1, p1
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 109
    :catch_0
    sget-object v1, Lcom/sonymobile/scan3d/PropResources;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Invalid content id "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v0

    :goto_0
    if-eqz v1, :cond_2

    .line 114
    invoke-virtual {v1, p0}, Lcom/sonymobile/scan3d/PropResources;->getNameId(Landroid/content/Context;)I

    move-result v2

    if-nez v2, :cond_0

    .line 115
    sget-object p0, Lcom/sonymobile/scan3d/PropResources;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to get name for resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 118
    :cond_0
    invoke-virtual {v1, p0}, Lcom/sonymobile/scan3d/PropResources;->getDrawable(Landroid/content/Context;)I

    move-result p0

    if-nez p0, :cond_1

    .line 119
    sget-object p0, Lcom/sonymobile/scan3d/PropResources;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to get drawable for resource "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    .line 123
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/sonymobile/scan3d/ZipResourceManager;->getZipResourceFile()Lcom/android/vending/expansion/zipfile/ZipResourceFile;

    move-result-object p0

    if-eqz p0, :cond_2

    .line 125
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, v1, Lcom/sonymobile/scan3d/PropResources;->mResourcePath:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".glb"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/android/vending/expansion/zipfile/ZipResourceFile;->getInputStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    if-nez p0, :cond_2

    .line 126
    sget-object p0, Lcom/sonymobile/scan3d/PropResources;->TAG:Ljava/lang/String;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "No asset "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, v1, Lcom/sonymobile/scan3d/PropResources;->mResourcePath:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".glb"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    .line 131
    :catch_1
    sget-object p0, Lcom/sonymobile/scan3d/PropResources;->TAG:Ljava/lang/String;

    const-string p1, "No props assets available."

    invoke-static {p0, p1}, Lcom/sonymobile/scan3d/logging/DebugLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_2
    return-object v1
.end method

.method private getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I
    .locals 1
    .annotation build Landroidx/annotation/IdRes;
    .end annotation

    .line 196
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 197
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p3, p2, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/PropResources;
    .locals 1

    .line 16
    const-class v0, Lcom/sonymobile/scan3d/PropResources;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/PropResources;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/PropResources;
    .locals 1

    .line 16
    sget-object v0, Lcom/sonymobile/scan3d/PropResources;->$VALUES:[Lcom/sonymobile/scan3d/PropResources;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/PropResources;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/PropResources;

    return-object v0
.end method


# virtual methods
.method public getContentPath()Ljava/lang/String;
    .locals 2

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/sonymobile/scan3d/PropResources;->mResourcePath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".glb"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDrawable(Landroid/content/Context;)I
    .locals 2
    .annotation build Landroidx/annotation/AnyRes;
    .end annotation

    const-string v0, "drawable"

    .line 184
    iget-object v1, p0, Lcom/sonymobile/scan3d/PropResources;->mImageName:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/PropResources;->getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getNameId(Landroid/content/Context;)I
    .locals 2
    .annotation build Landroidx/annotation/AnyRes;
    .end annotation

    const-string v0, "string"

    .line 173
    iget-object v1, p0, Lcom/sonymobile/scan3d/PropResources;->mContentName:Ljava/lang/String;

    invoke-direct {p0, p1, v0, v1}, Lcom/sonymobile/scan3d/PropResources;->getResource(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    return p1
.end method
