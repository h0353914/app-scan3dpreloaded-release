.class public final enum Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;
.super Ljava/lang/Enum;
.source "SelectScanModeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ScanMode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

.field public static final enum ADV_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

.field public static final enum FACE_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

.field public static final enum FOOD_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

.field public static final enum HEAD_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

.field public static final enum SELFIE_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;


# instance fields
.field private final mDescription:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private final mImage:I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end field

.field private final mTitle:I
    .annotation build Landroidx/annotation/StringRes;
    .end annotation
.end field

.field private final mTutorial:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 72
    new-instance v7, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const-string v1, "FACE_SCAN"

    sget-object v3, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FACE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const/4 v2, 0x0

    const v4, 0x7f08012f

    const v5, 0x7f1000de

    const v6, 0x7f1000dd

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;-><init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;III)V

    sput-object v7, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->FACE_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    .line 79
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const-string v9, "FOOD_SCAN"

    sget-object v11, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->FOOD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const/4 v10, 0x1

    const v12, 0x7f080130

    const v13, 0x7f1000e0

    const v14, 0x7f1000df

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;-><init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;III)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->FOOD_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    .line 86
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const-string v2, "SELFIE_SCAN"

    sget-object v4, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->SELFIE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const/4 v3, 0x2

    const v5, 0x7f080133

    const v6, 0x7f1000e4

    const v7, 0x7f1000e3

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;-><init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;III)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->SELFIE_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    .line 93
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const-string v9, "HEAD_SCAN"

    sget-object v11, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->HEAD:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const/4 v10, 0x3

    const v12, 0x7f080132

    const v13, 0x7f1000e2

    const v14, 0x7f1000e1

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;-><init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;III)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->HEAD_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    .line 101
    new-instance v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const-string v2, "ADV_SCAN"

    sget-object v4, Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;->ADVANCE:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    const/4 v3, 0x4

    const v5, 0x7f080131

    const v6, 0x7f1000da

    const v7, 0x7f1000d9

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;-><init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;III)V

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->ADV_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const/4 v0, 0x5

    .line 67
    new-array v0, v0, [Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->FACE_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->FOOD_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->SELFIE_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->HEAD_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->ADV_SCAN:Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;III)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroidx/annotation/StringRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;",
            "III)V"
        }
    .end annotation

    .line 140
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 141
    iput-object p3, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mTutorial:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    .line 142
    iput p4, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mImage:I

    .line 143
    iput p5, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mTitle:I

    .line 144
    iput p6, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mDescription:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;
    .locals 1

    .line 67
    const-class v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;
    .locals 1

    .line 67
    sget-object v0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->$VALUES:[Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;

    return-object v0
.end method


# virtual methods
.method public getDescription()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 178
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mDescription:I

    return v0
.end method

.method public getImage()I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 158
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mImage:I

    return v0
.end method

.method public getTitle()I
    .locals 1
    .annotation build Landroidx/annotation/StringRes;
    .end annotation

    .line 168
    iget v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mTitle:I

    return v0
.end method

.method public getTutorial()Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;
    .locals 1

    .line 148
    iget-object v0, p0, Lcom/sonymobile/scan3d/storageservice/ui/fragment/SelectScanModeFragment$ScanMode;->mTutorial:Lcom/sonymobile/scan3d/storageservice/ui/gallery/wizard/ScanTutorial;

    return-object v0
.end method

.method public isEnabled(Landroid/content/Context;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public isTutorialEnabled(Landroid/content/Context;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
