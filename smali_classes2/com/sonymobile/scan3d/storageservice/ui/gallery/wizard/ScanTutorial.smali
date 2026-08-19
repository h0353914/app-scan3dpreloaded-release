.class public final enum Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;
.super Ljava/lang/Enum;
.source "ScanTutorial.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

.field public static final enum ADVANCE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

.field public static final enum FACE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

.field public static final enum FOOD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

.field public static final enum HEAD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

.field public static final enum SELFIE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;


# instance fields
.field private final mTutorialIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 27
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const-string v1, "FACE"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {v0, v1, v3, v2}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FACE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    .line 32
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const-string v1, "HEAD"

    const/4 v4, 0x2

    invoke-direct {v0, v1, v2, v4}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->HEAD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    .line 37
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const-string v1, "FOOD"

    const/4 v5, 0x3

    invoke-direct {v0, v1, v4, v5}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FOOD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    .line 42
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const-string v1, "ADVANCE"

    const/4 v6, 0x4

    invoke-direct {v0, v1, v5, v6}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->ADVANCE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    .line 47
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const-string v1, "SELFIE"

    invoke-direct {v0, v1, v6, v3}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->SELFIE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const/4 v0, 0x5

    .line 21
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FACE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    aput-object v1, v0, v3

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->HEAD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FOOD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    aput-object v1, v0, v4

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->ADVANCE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    aput-object v1, v0, v5

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->SELFIE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    aput-object v1, v0, v6

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 59
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 60
    iput p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->mTutorialIndex:I

    return-void
.end method

.method private getTutorialFlag()I
    .locals 2

    .line 157
    invoke-virtual {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->ordinal()I

    move-result v0

    const/4 v1, 0x1

    shl-int v0, v1, v0

    return v0
.end method

.method private isCompleted(Landroid/content/Context;I)Z
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 124
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 125
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 126
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p1

    .line 128
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->getTutorialFlag()I

    move-result v0

    and-int/2addr p1, v0

    if-eqz p1, :cond_0

    const/4 p2, 0x1

    :cond_0
    return p2
.end method

.method private setCompleted(Landroid/content/Context;I)Z
    .locals 4
    .param p2    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param

    .line 139
    invoke-static {p1}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 140
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 141
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    .line 142
    invoke-interface {v0, p1, p2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->getTutorialFlag()I

    move-result v3

    and-int/2addr v2, v3

    if-nez v2, :cond_0

    const/4 p2, 0x1

    .line 143
    :cond_0
    invoke-direct {p0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->getTutorialFlag()I

    move-result v2

    or-int/2addr v1, v2

    .line 145
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 146
    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    return p2
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;
    .locals 1

    .line 21
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;
    .locals 1

    .line 21
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    return-object v0
.end method


# virtual methods
.method public getTipCategory(Landroid/content/Context;)Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;
    .locals 1

    .line 70
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->mTutorialIndex:I

    invoke-static {p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/tips/TipParser;->getFirstTimeTutorial(Landroid/content/Context;I)Lcom/sonymobile/scan3d/storageservice/ui/tips/TipCategory;

    move-result-object p1

    return-object p1
.end method

.method public isSlideshowCompleted(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f1001d3

    .line 90
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isCompleted(Landroid/content/Context;I)Z

    move-result p1

    return p1
.end method

.method public isTrainingModeCompleted(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f1001d2

    .line 100
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isCompleted(Landroid/content/Context;I)Z

    move-result p1

    return p1
.end method

.method public isTutorialCompleted(Landroid/content/Context;)Z
    .locals 1

    .line 80
    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isSlideshowCompleted(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->isTrainingModeCompleted(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setSlideshowCompleted(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f1001d3

    .line 110
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setCompleted(Landroid/content/Context;I)Z

    move-result p1

    return p1
.end method

.method public setTrainingModeCompleted(Landroid/content/Context;)Z
    .locals 1

    const v0, 0x7f1001d2

    .line 120
    invoke-direct {p0, p1, v0}, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->setCompleted(Landroid/content/Context;I)Z

    move-result p1

    return p1
.end method
