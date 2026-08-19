.class public final enum Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;
.super Ljava/lang/Enum;
.source "AppShortcutsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/sonymobile/scan3d/AppShortcutsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Shortcut"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

.field public static final enum FACE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

.field public static final enum FOOD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

.field public static final enum FREEFORM_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

.field public static final enum HEAD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

.field public static final enum SELFIE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;


# instance fields
.field private final mIcon:I

.field private final mLongDesc:I

.field private final mPolicyMode:I

.field private final mShortDesc:I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 35
    new-instance v7, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const-string v1, "FACE_SCAN"

    const/4 v2, 0x0

    const v3, 0x7f1000de

    const v4, 0x7f10024e

    const v5, 0x7f080104

    const/4 v6, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;-><init>(Ljava/lang/String;IIIII)V

    sput-object v7, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FACE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    .line 40
    new-instance v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const-string v9, "FOOD_SCAN"

    const/4 v10, 0x1

    const v11, 0x7f1000e0

    const v12, 0x7f10024f

    const v13, 0x7f080104

    const/4 v14, 0x3

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FOOD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    .line 45
    new-instance v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const-string v2, "SELFIE_SCAN"

    const/4 v3, 0x2

    const v4, 0x7f1000e4

    const v5, 0x7f100252

    const v6, 0x7f080104

    const/4 v7, 0x4

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->SELFIE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    .line 50
    new-instance v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const-string v9, "HEAD_SCAN"

    const/4 v10, 0x3

    const v11, 0x7f1000e2

    const v12, 0x7f100251

    const/4 v14, 0x1

    move-object v8, v0

    invoke-direct/range {v8 .. v14}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->HEAD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    .line 55
    new-instance v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const-string v2, "FREEFORM_SCAN"

    const/4 v3, 0x4

    const v4, 0x7f1000da

    const v5, 0x7f100250

    const/4 v7, 0x2

    move-object v1, v0

    invoke-direct/range {v1 .. v7}, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;-><init>(Ljava/lang/String;IIIII)V

    sput-object v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FREEFORM_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const/4 v0, 0x5

    .line 34
    new-array v0, v0, [Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    sget-object v1, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FACE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FOOD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->SELFIE_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->HEAD_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->FREEFORM_SCAN:Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sput-object v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->$VALUES:[Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IIIII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIII)V"
        }
    .end annotation

    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 67
    iput p3, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mShortDesc:I

    .line 68
    iput p4, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mLongDesc:I

    .line 69
    iput p5, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mIcon:I

    .line 70
    iput p6, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mPolicyMode:I

    return-void
.end method

.method static synthetic access$000(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I
    .locals 0

    .line 34
    iget p0, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mPolicyMode:I

    return p0
.end method

.method static synthetic access$100(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I
    .locals 0

    .line 34
    iget p0, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mIcon:I

    return p0
.end method

.method static synthetic access$200(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I
    .locals 0

    .line 34
    iget p0, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mLongDesc:I

    return p0
.end method

.method static synthetic access$300(Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;)I
    .locals 0

    .line 34
    iget p0, p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->mShortDesc:I

    return p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;
    .locals 1

    .line 34
    const-class v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object p0
.end method

.method public static values()[Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;
    .locals 1

    .line 34
    sget-object v0, Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->$VALUES:[Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    invoke-virtual {v0}, [Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/sonymobile/scan3d/AppShortcutsManager$Shortcut;

    return-object v0
.end method
